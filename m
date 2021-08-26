Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513D13F8CC4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:13:26 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIwK-0007zy-C8
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImg-0005AG-Qp
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-0008Jq-AG
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2659385wmr.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EvoRcnyCFOrgqqPAPIvrI7CFDH0wKQC6sRUNatl+1mw=;
 b=JG+62Ba+k+kJDfMH+BPDA39RmhbrkeDgPBh6Reg6r7ww62BJ2H+VkqwC3cW5AH/Si9
 m22zHVctm9kD3hfXMSscUVH6CfpojO8L0hM4aoqEz34/glvsLolGA4P+2a+RZJff4oLo
 9ToyVAObbrCrsn0/latZeJLWj/A21ML731mMMp7l6IplGG80D4q6azHxEzFRYfuHTp8k
 w56Thej10oK+PzwFYsmtI1YRCGJdhwtSZp2IQYoLmMKZepq+ZOj7GZwCSoD1JrTiDqJv
 x66Scy37zO42daBLae/ljL/b3NNZlyn+Fx8AkdV1WIa4pLI+/KXX9TIU5zr1u64qGCwQ
 rOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvoRcnyCFOrgqqPAPIvrI7CFDH0wKQC6sRUNatl+1mw=;
 b=CclPbqSf4DJIZqOWZqceSCh/JuRfidGAKszaGp2EjjT1cWEHloL5yDrAWT7fO+7n2V
 GIjbi1G1WYSzqBF+x0hmmixwVUNNS7VTjh8JburhAdd04CvVwtBOW6SVwnLIEZ1IKur4
 DKVCbPD5U4n+5w/OjHzq5SEKM0iLOKKCZo284T1zIx4C4orocLPbZKqv4PobaH2HR6WO
 9xDMJu+vMSZG6XzuE2mlgCcVYZ+26NFiXzpAJV5eoxmdcHhKSFw74PMqoIqrWPuBHjbm
 HlNnTd+/GuQMmiW9wgkj0huCUPKATwgIQIlVeYEh1LxkZhZtlD2qvFueO09ljSvGJ+7d
 byTQ==
X-Gm-Message-State: AOAM533OwtKTmGBL6075VnFwo+/Qplc0+ttPC8ng+fFjEEZARS7Al+Jw
 +bLu/X0w26Av49kYRta+QH4w1JeODHavCA==
X-Google-Smtp-Source: ABdhPJy4PEYtKNNVhwS8nq4kmcjVX8aDZSOpV8vBTWC9ZSAJq+EoF3lQ62wezuTg9tTuT47XRAAodA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr4660745wmi.69.1629997397271;
 Thu, 26 Aug 2021 10:03:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/37] target/arm/kvm64: Ensure sve vls map is completely clear
Date: Thu, 26 Aug 2021 18:02:37 +0100
Message-Id: <20210826170307.27733-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

bitmap_clear() only clears the given range. While the given
range should be sufficient in this case we might as well be
100% sure all bits are zeroed by using bitmap_zero().

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823160647.34028-3-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 59982d470d3..e790d6c9a57 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -740,7 +740,7 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
     uint32_t vq = 0;
     int i, j;
 
-    bitmap_clear(map, 0, ARM_MAX_VQ);
+    bitmap_zero(map, ARM_MAX_VQ);
 
     /*
      * KVM ensures all host CPUs support the same set of vector lengths.
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56B39053D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:23:34 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYu2-00044O-Mx
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb1-0002M1-9y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYay-0004EY-Hd
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r12so32614590wrp.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cwgsg+L1+rwvtekTOuGS+A2/R5EzRdOMLrIsOUE5BhM=;
 b=TOnkGsx73kD/rvW39WpHrditrnVRaIx84ShdnmfykwjqGVR2aLn8q9Dfzms/kmeprc
 thxBGjSdh1MluRHyzIPJMSMz0YWyI/tkHIQYEeLQ7JrUdRDudACDFb0SI6MPHLj+QblC
 ovNGLdKQY0FikqnTrkIp06ClCE0pFiWUSP3KaCShPKYClE7yzZSi0gG0B70mKQF88qE5
 p9+XWm9pavXS74Wlr8thftQfxkOVzl0WSgzU+OXE7SGv78CrPo/LFYpTQbow9yo7MOJd
 95FXv6QlG4TYpMYraB67TUcmgDZBC+hTUiT0MRRgKOrjb9sdZtiZ8aPpTcsgBFewLkAY
 QB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwgsg+L1+rwvtekTOuGS+A2/R5EzRdOMLrIsOUE5BhM=;
 b=EtegqPdC9vpa4lf2h/WjFuWmzMLlPTThg8Az9c1B7ojYvuPAA9Q0M+w6bxey88cVmG
 HNAGkrNsBUWteKP81Q1c4DrzI3nz86ng/XuWVC3yvzgYLzfmMcGb2tmhV0hhQyXNZa0b
 NTtzE8p6AWqDRIrh8xL/pHU1DWKuoy/zwM29vqJtPPNLoHOuPaflkLkTV9LAJrPv5K8f
 c4i+rvuJi1Den2IcCHYriIs35Rz6zbregzt3kG8Pl6XOAtvTyge06vRKHnYnX6YN38/d
 nWRGi8q+jjNVA4HPkf3vvDNj7vkMxYxGP4wXd6qCqZesMjVWDy6V+KrD9pgz/+NhoA2c
 GS9w==
X-Gm-Message-State: AOAM533RGkDS9NkRwjG/Nmk0nISKWsCMJ6Jm6pFKruJ7owoLUGlMQjII
 KHk35lC/Dbekzh2F8DgmUnTIUqieGOd6LOhe
X-Google-Smtp-Source: ABdhPJzkejcYzPr5niZ/xSzFa7Kn/5f3u2nzMI2u6xTO9wJ2MJnclqRIQHcDaLTFKA27TXm+IwCJeQ==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr28044511wry.243.1621955027225; 
 Tue, 25 May 2021 08:03:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 021/114] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue, 25 May 2021 16:01:51 +0100
Message-Id: <20210525150324.32370-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Rebecca Cran <rebecca@nuviainc.com>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210512182337.18563-4-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c..f42803ecaf1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.20.1



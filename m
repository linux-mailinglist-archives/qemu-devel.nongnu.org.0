Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026E1C39D9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:50:41 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVaYS-0005Xz-8h
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHw-0000SJ-BX
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHv-00016o-IR
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g13so20678907wrb.8
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OQuyuhA5Gt5NXmOvC0CG9mRkAQzrDpARfPtObF83Cnw=;
 b=Z3kJ4k9bqgH9YtrIidRomrEhNiaf+Kw4S/jYqIxxcZdnFKqE7WBl/WatMcdTbP8fbd
 LhFjHka25R6y6Ivei1+TiUZLWOzRv3roPgKRHIoc08uDMLpSqdrVZld8fS+jKSpamMMu
 Rb3huL7l0jvHFKLW7Dt1CMITeisz++f3bbyuDrHkvYVYsu+jbTEw9+OGEFOarkx9QdxJ
 dN8fKGuKsvUmOQqwcl4pmN9NN0VWnqk0LXQ1NV71xifwIM9LaQwub3oVHp+TFn2lBE45
 oARMI6QSPuvdKj7mSs3bbpowPiHXK4wh0EEo2w8pTF4vgB//JoQP8MxDEZWi/yIFrVhU
 b0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQuyuhA5Gt5NXmOvC0CG9mRkAQzrDpARfPtObF83Cnw=;
 b=dq2gLyVLJvhVJmriBsJQIYWWNerYoomEVxQQntApxir30vCReHWaa9X2mszhGjpK43
 0W0MDPftXPP+3rexJBBp3P3d/2VupdLAswCPG+6pyRQjbp3on78Y5t6TnqYfcsTmp/tg
 6ntddVqkx9b9Y86Xx7v2HbAv8CQPXTnV8YQ/uzidDBn56ME+yWuLOLE+2f8zXjiN3ECj
 dez7++C3Ixnt8FdQXMEtoziamg/K1tVfP5BjGGUigk3Z/MnJLoCBaVARdnSL6sVD7PlQ
 gncl2H7AuVVu3E5FtxEPJ6J0g0XkXWdldEUmb7Mmz0glbV5hZUloATVSkWIWE4xzQYzy
 Pr7Q==
X-Gm-Message-State: AGi0PuYsQ447Uh3SKabeqbQaoV52XOYUfBile4ru0BIlQNl23fU55V96
 jJrLbj2SqBhOxdq9GLaDr1G9aoy1O3D8vg==
X-Google-Smtp-Source: APiQypLhuMKYmUv9IGwaEAXidgi+rQyEk719z7ISVar9MNQ6566oATfc6+cTi02gG0KtI0Xt/JQUrw==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr18628611wru.258.1588595613924; 
 Mon, 04 May 2020 05:33:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q4sm12253608wrx.9.2020.05.04.05.33.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:33:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/39] target/arm/translate-vfp.inc.c: Remove duplicate
 simd_r32 check
Date: Mon,  4 May 2020 13:32:50 +0100
Message-Id: <20200504123309.3808-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504123309.3808-1-peter.maydell@linaro.org>
References: <20200504123309.3808-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Somewhere along theline we accidentally added a duplicate
"using D16-D31 when they don't exist" check to do_vfm_dp()
(probably an artifact of a patchseries rebase). Remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200430181003.21682-2-peter.maydell@linaro.org
---
 target/arm/translate-vfp.inc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index b087bbd812e..e1a90175983 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1872,12 +1872,6 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
         return false;
     }
 
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
     if (!vfp_access_check(s)) {
         return true;
     }
-- 
2.20.1



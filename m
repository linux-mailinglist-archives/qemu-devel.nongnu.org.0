Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42F39A59A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:18:25 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq36-0006WJ-Lh
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0008NA-56
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkc-0006u6-4n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f17so3715950wmf.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KKCQOZ52SBIC3x4D3HG5fH/KCqqTkgeULQLDUNHuAc8=;
 b=Uj2xj4YX3tLganT1LMuBpOAy57/3kk/7d49U7R4Ty7RKZlCXoOcjM2pK4AdqpALHYJ
 b7y9RZBYoKoxdXus6AdBDjEdcSD2PuThJ4ZBjfmWVh8Qee4+aa7l7ATJo+uLHF93muHa
 pc+gdUG4axqMap+O3RHPH7rLPMAAFUBGDheTSHR8zaIl+RwDnJ/CrKfq/C4jQRo7ONvs
 srK2Vy9hRy4wIvs3Bbvdxg2CaSAtiiQ4eRT54Eu3E0fbR+LHxKn3g9WEFowBTahqOtQe
 bE4TIIaZ9CiuYW/Y6z2m1XsHHAfPIlbJgGvU1dpUc+mmSw3/XLTfw1+Dts1Fg2C9TTTt
 gwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKCQOZ52SBIC3x4D3HG5fH/KCqqTkgeULQLDUNHuAc8=;
 b=p4Xz9zYvQHi/eOByvGwt0q/XcdmTfjYTJzcAjvlAMbPm1sNuJWk8C2KWGY1ybRRT0Y
 kjAWtAG2v1D1cOlUT+f3+A2jMCmdQcfUgmRK/3+3JJLhtWG2BOoJOn43qtxvDdkF5cgq
 KTRn47mO/CK4qS7Ge1rFHNWJj0t1KTQKtieKK8P/OzJJ2rSBIKWM5MftJe+nzXXif4MQ
 AretnUZSaNgnX+O7NLQmJrI5P8E8I04RX416t1xyuMyljxeqtympEzIInrL5gMWg13F1
 d0FP4GhcWrG7I79RvxOH5FNEmaQZqufIwhdynlmSA0Q/Chc5UOcdV4D2dTZejPWBUkwg
 PlBA==
X-Gm-Message-State: AOAM532BQKENsZheCHnm0Xay8dmVuOTxA07BFxqmSEhKpDeExVLdy4PZ
 H4h7aCOIM55kgtwAtK+qgoJEiLWOQVAD+HRG
X-Google-Smtp-Source: ABdhPJyLa9eFOtKiKoVDAdSbwN/vX0tx+WSS8C+mt9f0DlJeR23eLeBO7q/9tkKDc1KKYcp0gcW+WQ==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr10842080wmg.44.1622735956701; 
 Thu, 03 Jun 2021 08:59:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/45] target/arm: use raise_exception_ra for MTE check failure
Date: Thu,  3 Jun 2021 16:58:33 +0100
Message-Id: <20210603155904.26021-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Jamie Iles <jamie@nuviainc.com>

Now that raise_exception_ra restores the state before raising the
exception we can use restore_exception_ra to perform the state restore +
exception raising without clobbering the syndrome.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
[PMM: Keep the one line of the comment that is still relevant]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a6fccc6e69e..166b9d260f8 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -563,20 +563,14 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
     switch (tcf) {
     case 1:
-        /*
-         * Tag check fail causes a synchronous exception.
-         *
-         * In restore_state_to_opc, we set the exception syndrome
-         * for the load or store operation.  Unwind first so we
-         * may overwrite that with the syndrome for the tag check.
-         */
-        cpu_restore_state(env_cpu(env), ra, true);
+        /* Tag check fail causes a synchronous exception. */
         env->exception.vaddress = dirty_ptr;
 
         is_write = FIELD_EX32(desc, MTEDESC, WRITE);
         syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
                                     is_write, 0x11);
-        raise_exception(env, EXCP_DATA_ABORT, syn, exception_target_el(env));
+        raise_exception_ra(env, EXCP_DATA_ABORT, syn,
+                           exception_target_el(env), ra);
         /* noreturn, but fall through to the assert anyway */
 
     case 0:
-- 
2.20.1



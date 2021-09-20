Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA641173E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:37:33 +0200 (CEST)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKQG-0002yk-CT
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9s-0002up-2A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9O-0000sW-E5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t8so23198511wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bGyQolpDC0WxJwUFe4Om+K2PK2F8NfHQfO1EqhthdEE=;
 b=x3Cohvf3+4jDkWBEvPxD01RHQPSO53gjUrAl/s/au509bfUdgiTAH3vs07Zny68Hu+
 3Cb3mqVfButG2AutqhEbxGRvZ4rNd7Fh0PIgWh67zMv1kHlkpQgVFi/Y/mODmAe8xbQf
 mEzcMXoykhVSAE1weAyPeMpmkWVlV/g+MLXFpoAjhQxmH3z3WFEeDBxg5CJV+gSvkkRS
 D+gmI4ImBwWi3VE7ZMTAnZKab2HfGWaWeprHOCwkQEo4FSOr0WrvfYSDW51DFIWnGsBh
 Nn6S7CUHRUjfZQbnzEIfRAtnFtReSTsEiY2ixLL5KwVG//9ZRoueRuvLJAAmqi8YeTDB
 xZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGyQolpDC0WxJwUFe4Om+K2PK2F8NfHQfO1EqhthdEE=;
 b=H6nxjZlrT6GX3ZGEOGpqF5FfF7FO/+cwbNPDmEEzV0nD/MEw3Kw20C/5aVdZFeU1U9
 CSTIsS+zjHoyMJdFChes1si+MpIC+I2b2y+ZOOtwZWpbPvsn3Pc85vl6dM8F3QOEKicI
 LoCYssE6WwaKGPW4xHnZnEqYL232vkFWIlhNODYhwk+uMFiRuMuBbqN3+6ZyaqdHxx5F
 LGMKFBbFOkdinSiMRFqLwRs2GpQ6gYtMsBM6SAv8LPqbZnPb4ifUkGungpZ0XEcVNM4b
 5huMyWBjacgYX2kwcYVyDv7Q8+Fa1Ju3PGMXjdIfru2W9S8GOrmna29JZtftC0jaljuo
 Hh8g==
X-Gm-Message-State: AOAM531FvcN5FmjyBf6o5y5gAqCBJAnxSfYcNJPE1Cei6/d7QUUbUrAs
 IaQslLZ/umM2RlxY6K/yJtmQ8RjcZdCbog==
X-Google-Smtp-Source: ABdhPJzLyHWhgMXu4N6mTcU1DshPccr4+DD51+sBCel4jpcTkM5tKKIBp4WkIFn+XQDVGpQuIjWXKw==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr28480670wrw.330.1632147601918; 
 Mon, 20 Sep 2021 07:20:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] target/arm: Avoid goto_tb if we're trying to exit to the
 main loop
Date: Mon, 20 Sep 2021 15:19:36 +0100
Message-Id: <20210920141947.5537-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Currently gen_jmp_tb() assumes that if it is called then the jump it
is handling is the only reason that we might be trying to end the TB,
so it will use goto_tb if it can.  This is usually the case: mostly
"we did something that means we must end the TB" happens on a
non-branch instruction.  However, there are cases where we decide
early in handling an instruction that we need to end the TB and
return to the main loop, and then the insn is a complex one that
involves gen_jmp_tb().  For instance, for M-profile FP instructions,
in gen_preserve_fp_state() which is called from vfp_access_check() we
want to force an exit to the main loop if lazy state preservation is
active and we are in icount mode.

Make gen_jmp_tb() look at the current value of is_jmp, and only use
goto_tb if the previous is_jmp was DISAS_NEXT or DISAS_TOO_MANY.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-2-peter.maydell@linaro.org
---
 target/arm/translate.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index caefb1e1a17..cf31e0237da 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2610,8 +2610,40 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_set_pc_im(s, dest);
         s->base.is_jmp = DISAS_JUMP;
-    } else {
+        return;
+    }
+    switch (s->base.is_jmp) {
+    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
+    case DISAS_NORETURN:
+        /*
+         * The normal case: just go to the destination TB.
+         * NB: NORETURN happens if we generate code like
+         *    gen_brcondi(l);
+         *    gen_jmp();
+         *    gen_set_label(l);
+         *    gen_jmp();
+         * on the second call to gen_jmp().
+         */
         gen_goto_tb(s, tbno, dest);
+        break;
+    case DISAS_UPDATE_NOCHAIN:
+    case DISAS_UPDATE_EXIT:
+        /*
+         * We already decided we're leaving the TB for some other reason.
+         * Avoid using goto_tb so we really do exit back to the main loop
+         * and don't chain to another TB.
+         */
+        gen_set_pc_im(s, dest);
+        gen_goto_ptr();
+        s->base.is_jmp = DISAS_NORETURN;
+        break;
+    default:
+        /*
+         * We shouldn't be emitting code for a jump and also have
+         * is_jmp set to one of the special cases like DISAS_SWI.
+         */
+        g_assert_not_reached();
     }
 }
 
-- 
2.20.1



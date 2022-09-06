Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8085AE742
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:09:12 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXOB-0000Uk-Ps
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVex-0003cS-7e
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0005Hl-DM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id s23so6612938wmj.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4KnyaNg03Q9A36I/gIWbI9OfpLPWp7gded3zO91Ecgk=;
 b=akLDEGLFHV2nNsOtdJC/YYgSU7Irayqy3+O659ai6EGeFHSkqGIM1WP4L60Vq6+VFp
 sAZLGILXi3JjuB4eSu9C41x+uLloXF2MUxubct0I98ILfEPc1fkhZWy4apT97wjbR9Ee
 uZS5c2j4biop7vZpgkLBpG1BHKw/Te+ly/LMKWdEMxyoaHrpSvhl7jsZSUiJfC1Vxxjm
 VQVN5hBn7qa7LNTpMOJ4kT45cbc+RELshwrJfJ3dr4FZFdEpNOomiLqdepHV6JCdly4G
 0NRiRnOlU0u7BCNuQ2Cs2hZfmQ3TZdJOCNfHiwf+zXCtGcFtY4l+Jf4WWWi7WAnbZv8v
 tLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4KnyaNg03Q9A36I/gIWbI9OfpLPWp7gded3zO91Ecgk=;
 b=JPN81uhNLLllPsUxLx/4dm43SCv+F6E8haQ+7lAgGc3uQukano+PtBOYpzZph+kPdX
 JBjsarkQW3FKFqu2d01+eL9MoGorGe6DZdCJDfn8/tnxP3wvlZovWZGQYEIBrf+Gjj5z
 wLh8Z+vfYcwuKA2kqw1Pc72C0gf56rYjr7e65Y/i7cmTurH6SSbd9NGqiJOjpucXyo4E
 uVW1SEsh2eS3QE4ANTFO0s0Aluagm+CTp/sFG8gV/J52HXoTF01QErt4ZpyctUNPpMAw
 Vd6XL7krQRdZ1dIQCNeceohC1mF8puJkPSWpqXid83GCEuJqOfCodi+hIkZBZTNpY1eC
 EpVg==
X-Gm-Message-State: ACgBeo2WYoyJhfptd8t0wlALfkjXrFUhR2J6PZUJl8t6UnICenbKi78M
 wDPoJs3dXukSbOnAp60y1XLBO4hSOG5ORQ79
X-Google-Smtp-Source: AA6agR4FeWrw+S33ge7kmR7yGmxKXAmWJ61i54pjkrpsVoUDuvFBdX/zwSFg1/AFyzu1rwqTbW+V3A==
X-Received: by 2002:a7b:cd11:0:b0:3a8:3f6c:9abf with SMTP id
 f17-20020a7bcd11000000b003a83f6c9abfmr13552375wmj.30.1662459491437; 
 Tue, 06 Sep 2022 03:18:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 21/26] target/s390x: Remove PER check from use_goto_tb
Date: Tue,  6 Sep 2022 11:17:42 +0100
Message-Id: <20220906101747.344559-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

While it is common for the PC update to happen in the
shadow of a goto_tb, it is not required to be there.
By moving it before the goto_tb, we can also place the
call to helper_per_branch there, and then afterward
chain to the next tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a2315ac73e..e6c7c2a6ae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -654,9 +654,6 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (per_enabled(s)) {
-        return false;
-    }
     return translator_use_goto_tb(&s->base, dest);
 }
 
@@ -1157,15 +1154,16 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
+
+    update_psw_addr_disp(s, disp);
+    per_branch_dest(s, psw_addr);
+
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
         tcg_gen_goto_tb(0);
-        update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
         return DISAS_NORETURN;
     } else {
-        update_psw_addr_disp(s, disp);
-        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
-- 
2.34.1



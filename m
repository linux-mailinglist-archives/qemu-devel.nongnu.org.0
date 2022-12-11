Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB66494E3
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OGE-0006rB-AQ; Sun, 11 Dec 2022 10:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OG1-0006XP-8n
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:50 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFl-0007Vy-L4
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:39 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 s30-20020a056830439e00b0067052c70922so5834780otv.11
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/skUfQCFQZ4X+J8MZM9bNAFhJbunyBxd+pVFGi7o9I=;
 b=kfNIvMO0w13rzx/eQcX17mX5HHmvtv7BCqbTd4I+NrKPlKCEmnJ8xc3/Yt6Wa0qZRd
 4PxdEWHXmeUPLqatdzve5iT9MflW9+4kAKMwCcDV5JtOaT2k4os1jr92hoY31nCsyXGA
 MVNAogGJqkL9IPbINw0cHfOgTAYE3NDrTtXI+UbxdOaNAw2jBAg5qMpGFGLtuAL4QUR3
 Nakp7xf0jOJ1IKY5+HwcQmAjDdsl/fm53m5lb4ZZdGeHajoFDU1L6f/25s1lVN0MAvaH
 VCQpekzXoD6h88e2shd9DooHEIutDTM9t7GwvGXiZBRYUf706ckGCeC8VNJuLhXv7USI
 TVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/skUfQCFQZ4X+J8MZM9bNAFhJbunyBxd+pVFGi7o9I=;
 b=jNke7+1KKbt51NOytGGC+DHYaI3mfMH2XGAPlfK3Rti8jN7YD5Y+/Q/yBwo4LIqI6D
 diCrOnXCsIr2pHtnrNXELJSLv/PhIjrYWgmTzWRQNNnrQGsVZ29dguNgR2WLj4OT0hJ9
 M7hT2lpPtTreOFQ0rSx2NeGWXSTxu/tT6aQkiM5z2/b5SUPKGZHBspcdYr1pO6ZMCS0/
 vjbxBkRBk+ppXPgtpGYD20dN/C4DUkZqmmwJe31bUmaZl+g1Nky2pxlO8iv2hizdXMko
 Yd2yJwkJ043L37nJsoAFtPAct3Lgz8ucLolA7WlfnR/ubbirmJI7THqO8TTWPE577rHy
 g+Bw==
X-Gm-Message-State: ANoB5pmkrHXxfLuufLr20BQkz3zzUt/b/jZUsLdqA2hdGTQcImh8FlJR
 iS/ihxbEfRx6nkMmKJJa7ZgYcsWct4zaEXGAbzU=
X-Google-Smtp-Source: AA0mqf6VoNaH0p4D7V0w7q2+Yguj6GS4xaG0EXBQRaL4sk5vScoPnnbZA8IrWDvLHx3RSCVOF7+zDQ==
X-Received: by 2002:a9d:6405:0:b0:661:dfeb:ea34 with SMTP id
 h5-20020a9d6405000000b00661dfebea34mr5728580otl.25.1670772511975; 
 Sun, 11 Dec 2022 07:28:31 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 23/27] target/s390x: Remove PER check from use_goto_tb
Date: Sun, 11 Dec 2022 09:27:58 -0600
Message-Id: <20221211152802.923900-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While it is common for the PC update to happen in the
shadow of a goto_tb, it is not required to be there.
By moving it before the goto_tb, we can also place the
call to helper_per_branch there, and then afterward
chain to the next tb.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 6006db3db2..268de1359b 100644
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



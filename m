Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D76630F8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRx-0003Ly-0S; Mon, 09 Jan 2023 15:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRu-0003KV-Cz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:50 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRs-0007Nn-Ah
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:49 -0500
Received: by mail-pj1-x1036.google.com with SMTP id dw9so8511990pjb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgQOHiO8qTwsgUx9kJDYlFOqQZeKGAhI8ggOyt7Pfe4=;
 b=odaz2PCyxp6C8xixvGh8SkRqDEy2tCgzTQgw61zcwKrgiH528N1riDhhSLDS+Xq5CI
 9VbeTUGkn3oN+Zj3UbU7Vvx7BtwTLnbFq0/Js/R38Whet1Qvb7Gkz6E18BRnHBrj3seW
 KXKOicXDZkt7JEzD/SUY/576Zo87HS5CpMGOzgmU1jz9mr7I/OQ+q7lhZa6KcNebId61
 WLwalf/qFNIiMk+GP/3ABUBH6K2+TJNcFj2sbkBT/Zw5WMo0iJcb9fB7ViBp6MNE//F5
 REawlbXyQsvKpbCTVON1ITFUPYOG/FLtJO+s07lZfiU36lpXxW8q/We5/7mrjHCZB2vB
 4cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgQOHiO8qTwsgUx9kJDYlFOqQZeKGAhI8ggOyt7Pfe4=;
 b=H7cmKg9nF57vwDKrGsUyrBH6VNBliJDSX8BjsibzypbxPsaVerY7wlPKuixVL4JNhR
 KR68LQorEfkFBW20XK8Y7RGfXfGKOLh29weCgciQvHtFLNc5zuE2+oJPrDLRPkqq2Lnc
 FINmjdcmguxVo4QMb46qIPOPunnFFN1+QAJRVXan6c00u5Q0CRpxXZkkMjWvn96tOqgd
 CBaRBbBc+xTH/WCFJI/r0uyi7Mu75mR9E9Z4dI8Lm3U5uvJqKVmvz+412XDyvU4U/2M+
 GsTLS4kIuHCc+SwDXlmeGV7zBm3IXI+oG7mrfeXryEAdWUA11rO6JlJTPc8CFntNE80g
 v3AQ==
X-Gm-Message-State: AFqh2kqX5hUCVA4QexCBP1o5Y2RhAR9UR0VwJPxP7pk8ZQYOeh1S4dH6
 iRCaYhcJvey0fs8Y1bEg+31c2nY9n09pCeWE
X-Google-Smtp-Source: AMrXdXuDNpeouKAWKzOZAPLkYC+uS4lfvJoSFPqSRdZn/fEcEGQzUQUKN/ZacWDfxTLhl4qYR4MsOw==
X-Received: by 2002:a17:90b:b11:b0:226:482:760f with SMTP id
 bf17-20020a17090b0b1100b002260482760fmr46026809pjb.10.1673294926992; 
 Mon, 09 Jan 2023 12:08:46 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 23/27] target/s390x: Remove PER check from use_goto_tb
Date: Mon,  9 Jan 2023 12:08:15 -0800
Message-Id: <20230109200819.3916395-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index 3b7591790d..3d9a79af42 100644
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



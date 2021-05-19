Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016238956E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:33:21 +0200 (CEST)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR0S-0006Ib-E4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyB-0003OB-Kd
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:30:59 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyA-0005Va-0S
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:30:59 -0400
Received: by mail-oi1-x22a.google.com with SMTP id h9so14023128oih.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkpdcvdsMOsMLR49VnhnztK5w7qTf2fMwT/yaQmjNjQ=;
 b=PGYfwyeE5W/Maowyoxk7yRgI+MyA0LH3O1jgGh5lukm01XKYxrWo3pJFEXAqy7Vyyr
 o6UaQpPX3VIsH90aimDOiHdaY1n/RFxzeP5EbB2/XT5LwiZHcS148v6SGVvr8Rb3DyIP
 Nr0FdzYx2lizBJ7ojdTf52gCGJa2iGyActDiUrvBAwvNZ83WRjdDocOsgxdh86n6gyY6
 NnqKi3UvgMd9m8UTPid5f3R8AsPas2+c7oiAWx/VX3/qCIPqSji1bX7LTWzE+1OtcbTJ
 atCY6DLWhyaLLpEdMYbtr/7MUzWPKnNJ+HLGS83F/9CHca7e2Lt9QKGaEZY3g+hECOkR
 GgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkpdcvdsMOsMLR49VnhnztK5w7qTf2fMwT/yaQmjNjQ=;
 b=VsyTXiyx67csLNkQhmrqmr21gKhwumRxpdJ2L5HyrrgaPROD+U9TO1lEIjlkvtkWdn
 9N7a9Gouwc0OpNLBqZk966TUFzEf+YED54EQoKSmTatBgRwnF7Em6pX2JcHb4VhaO2ih
 H03CwtfVaWC8JI+O6xgHyQ3Nb2iGubjnX+TbM/Y2rlnUTZmrwsDbkbV92c9yFkicbY28
 eKslVHOyz2wXKRwrucLsGeoALcTZv98uTab4X2U3vX4+zoB4n6Csrt5NQ95oMQRmoaPJ
 mL7LhCyhZflUMc39lEt+kB/g5V47k+sCg0jFUL5uf83l6b1+xttSgb+QFS+xRXSQss4N
 LOOA==
X-Gm-Message-State: AOAM532Tx8Y31WuRHrpco1TafITR9wrZRix/PVngOUoT4XxJhmwI+SGN
 kOvSBpIv4OLv+hYQejZsWAhhhrcw6yI5CDZf
X-Google-Smtp-Source: ABdhPJwWMWBvGrhdT1LxbLyYWz6iwEL4OuOLOG9vDv6s+OLAgyrbj8HzMlNb3K6q3J3+1IqbGJMlaw==
X-Received: by 2002:aca:f5c5:: with SMTP id t188mr384221oih.25.1621449055902; 
 Wed, 19 May 2021 11:30:55 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/50] target/i386: Unify code paths for IRET
Date: Wed, 19 May 2021 13:30:03 -0500
Message-Id: <20210519183050.875453-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vm86 mode, we use the same helper as real-mode, but with
an extra check for IOPL.  All non-exceptional paths set EFLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-4-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 61b30117a3..0a15662949 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6577,22 +6577,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         goto do_lret;
     case 0xcf: /* iret */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
-        if (!s->pe) {
-            /* real mode */
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
-            set_cc_op(s, CC_OP_EFLAGS);
-        } else if (s->vm86) {
-            if (s->iopl != 3) {
+        if (!s->pe || s->vm86) {
+            /* real mode or vm86 mode */
+            if (s->vm86 && s->iopl != 3) {
                 gen_exception_gpf(s);
-            } else {
-                gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
-                set_cc_op(s, CC_OP_EFLAGS);
+                break;
             }
+            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
         } else {
             gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
-            set_cc_op(s, CC_OP_EFLAGS);
         }
+        set_cc_op(s, CC_OP_EFLAGS);
         gen_eob(s);
         break;
     case 0xe8: /* call im */
-- 
2.25.1



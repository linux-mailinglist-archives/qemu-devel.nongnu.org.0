Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417E380CAF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:17:00 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZYh-00084Q-A0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVd-00056i-Pp
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:49 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVc-0006tl-C6
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:49 -0400
Received: by mail-qt1-x82f.google.com with SMTP id v4so13605046qtp.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQciwROGGXidJ4lmjtXTMfMW/YRQn24y/Lt7jypAFlU=;
 b=ucC9np7MNAzCdVyZbJaaaOFRDOYAffF9OY6GRVhSuxtv4KIq9HDzMDyzGWodeegbJ+
 +T9NvOxWDIsdpeFk1m6YB9pI7UNKNb7fKZ4Ks7VhTOLSPKzvZswKZMIWfb84amXvZyl1
 b1CvkFdMGmINNWMDaDI3Fqxk5xAd1kUzc4VwZ8VuCFfUQUG+ji4PDEV+xWVygoxj1Eh3
 7rzqGVfGrqtBhUiHlYrdsT2RlWAZ041OzBFcLsS1OoR+Let0mESHV9rIFNRfn8TRZ5zm
 kxeqEfYc+uLMeT8cF7QvLLAVxMZ8k5cefdHyq9fWD80bOVXjCu811/FncJdzg1mZqQJw
 gplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQciwROGGXidJ4lmjtXTMfMW/YRQn24y/Lt7jypAFlU=;
 b=erJJgu59ETvzTnuRC2zVNiMMxyNtRzgBecAc+9UAheHCYo/asa/Zttp2C3SGSqWF6a
 RMYlnR+E2Y9X2GISaQ+DtiCbEUbsQ9nuJXRija1AYwDSwQbXg2s0FoIHuQt0od9+fjrB
 27679vokCbZ+3oEp3hMLQIJUkvQgGs/dUrJHIP5AeBCilFU7rqyR5EJW/mqv5nZd7hi3
 aOJsHlxObIireTXFxnynXRnLCCS3Q9at5M5m6CMId91YVoWdddRojdrLG7YBfy4fem6/
 QtNtljTm1VtJFmB5qS6/F7XXftIEzuHpN7mBfl49E0KFhV/cztM4ipgdeUaRJAMjivcF
 Iq/Q==
X-Gm-Message-State: AOAM532tLESjZR6CUaklV/GfcQo2vxZi2REif74bJdriwfmLyR9PDpVO
 aeVX8nHVzvBVR0VtNWEe5FgzSwmfPLikmv2xi9Q=
X-Google-Smtp-Source: ABdhPJxWlvdk/i8wY3MJ5D8YuG/qf+GNb35+QFYJnOs//LfAXGPNmm6iXB5eDefrL+NKJMEnM+YrJg==
X-Received: by 2002:a05:622a:1114:: with SMTP id
 e20mr27309901qty.324.1621005227229; 
 Fri, 14 May 2021 08:13:47 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/50] target/i386: Unify code paths for IRET
Date: Fri, 14 May 2021 10:12:55 -0500
Message-Id: <20210514151342.384376-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vm86 mode, we use the same helper as real-mode, but with
an extra check for IOPL.  All non-exceptional paths set EFLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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



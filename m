Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445959CC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:58:25 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHJI-00044i-B5
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-00069a-G7
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:51 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvF-0007GG-6f
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso12808988pjh.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=O05wWIZNEG/mOSoZy79SV4w8GiH9QrYOqHtGfeY48U0=;
 b=GDdaeDiCyDRQbJSwUTgSAjRv8lF5aFCSQTZmzhx5Xg8UxjJMQXwHRXJ9IXsgRx8+rP
 KfVgtsvpqaKSvUis3FTEmBeQ6p+Sg2j54Lqw4dZk1VVHO0o18nMkrI4mUXmNW+RY+y1i
 t77OoVCJmsSZ1iSMSXv1YAWMg7kXsCnoXVIhrP/BN7ZVitzJ0knfQ006lkxt7WVQvX8n
 zd2MV5tibyWLaAbqMwVWgHWTrE6ves3JCRqLSf78fEgz6ZW7M5ho5zhCm738gaL5FN4+
 Sf1l4AvCwZTsT/mh7N4htDY5oZtL6MIvShZF66RjnQ9ibwePUopbiej3aePdGpFfgLxM
 Iqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=O05wWIZNEG/mOSoZy79SV4w8GiH9QrYOqHtGfeY48U0=;
 b=29QdaICprervrsqMyT2adsvi7lS83bEDncwzkiwrLpRpmWv4RmeJC4v7ABzZbf0VUS
 nD+3wwj49BXE84ygRzxe8OmOE0r7IFq5N1BB+tF7xi/oKpCxhynvvgdxtSCtK86W1Gmn
 kPuIYF/sAdL0eMWtGLXL9AL/Lb1Qp3L5v8IK9tXYeUdSKDCsiIU1FtimCsrP85Vy6FsL
 MxR0tVwjfKZ/YDWYsd/AECLBAwIN2tZ6votINl+Vcw8JBB6nLrPCl+EFsYKUbcXMhbMU
 4USScfqsbCjXvJKXstIrIUuZapbF0R2MS+6HQ8ELsCKwWnq87WSs+JMm2YjTVL4JwXP1
 RA0w==
X-Gm-Message-State: ACgBeo2j1sG0Avhv9ag4HMYeKpDdDXYNGtQuaQoFgrpecrQtP605tSNw
 cD2cDSa5UR+OImLaWkkOoAJQkXmC+43fGw==
X-Google-Smtp-Source: AA6agR5ZIMYDejlIQKPhWO7YUIfMPEMnDuE9STmmuooIDyub+lCnM1crMZYEMtLaVkqgxsxe0jANng==
X-Received: by 2002:a17:90a:4fc2:b0:1fb:3486:7b3d with SMTP id
 q60-20020a17090a4fc200b001fb34867b3dmr635982pjh.49.1661211211714; 
 Mon, 22 Aug 2022 16:33:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] target/i386: USe DISAS_EOB_ONLY
Date: Mon, 22 Aug 2022 16:33:05 -0700
Message-Id: <20220822233318.1728621-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Replace lone calls to gen_eob() with the new enumerator.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 73e4330fc0..1dc3ff67ae 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6687,7 +6687,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* add stack offset */
             gen_stack_update(s, val + (2 << dflag));
         }
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xcb: /* lret */
         val = 0;
@@ -6705,7 +6705,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(s->pc - s->cs_base));
         }
         set_cc_op(s, CC_OP_EFLAGS);
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xe8: /* call im */
         {
@@ -7291,7 +7291,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_set_label(l1);
             gen_jmp_im(s, tval);
             gen_set_label(l2);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x130: /* wrmsr */
@@ -7332,7 +7332,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x135: /* sysexit */
@@ -7343,7 +7343,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
 #ifdef TARGET_X86_64
@@ -8426,7 +8426,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0x1b8: /* SSE4.2 popcnt */
         if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-- 
2.34.1



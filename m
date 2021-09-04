Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0164400DAB
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:12:27 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMflq-0001sg-Bu
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWx-0007pM-Dx
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWv-000870-UU
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2206321wme.1
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5rx4TkBW8G8gScO08U1pK8zY4A0mljSOlfasCw3q/k=;
 b=AuyheoyuZazP4kI2PH8GHsJRYkHleeKG5b2oDvmrET7f/peL3y/JDPbzr/c6/ZHve+
 dWfdDDhXm16yxcu0kWFxbkX99rCJcObxiNEzMnimVStG6Jgkj8dwY1hYJahtaHUXYria
 A+TvaIOl7aln4AGDI9S4DKdBCNpyZ90pgCQkuC8ioZXOchRLYUs0pW74Iq10fmB7Ktu7
 u0tkVp50ob3vmiO6GxmV9wEOaO6z+gKnQqfLkisgeXbuY2C16o+Z4/sDb1Nkt42ySn72
 Y85UkcQP20Fitb5Cw4tJsr9Ke6xBNpOZNKOJMHtk/sviaCkfosg6wU7SibopghwoFsDe
 mSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J5rx4TkBW8G8gScO08U1pK8zY4A0mljSOlfasCw3q/k=;
 b=QexdWhb+K4v1YJNvGv97ltNdyOEpNPoonG2CiK47NRI5Bf5Ynjsn+8mJIlUck7Sf/c
 hiOLqsJ4zjIlpy+f2GI7kWhl2bj1lLjuqTyG/l1Gcbr2dy13RfZUpOjNkBWLoPgj//sz
 CU9Wu29RnT5WiXwM4FZYSucrlxcMrNGLyJ+Lciq0O/FNYR8QydwUMuWqdbyHsFh7hs5i
 gCmV7VMBplAegNXfMq3lg8w5zSJJcXELWN4T9OdQxMOb6VTjI4yqvDWSPP2upaOEUnK2
 8B7aFCU/qsumSd0wtKubFxr7nesEnj3+0RXQlD8b4IXK8iDY5+Afm7GBLg4KHeOV2OYZ
 p+dg==
X-Gm-Message-State: AOAM531qRmqs7261zdvsfPd8Lr2H3iiP24dhw/+e0cIcbsF7YN7DIP57
 fZBAnyw7vXs7TtBofL8dgB/G8ovDctw=
X-Google-Smtp-Source: ABdhPJzfbV1iNt4JR0a3EEC74iv9yplAJJVQRC/qbvTDtKD94HACq9TPHfWMSaS+Wzg81836JdUZwA==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr4932773wmi.123.1630799820464; 
 Sat, 04 Sep 2021 16:57:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n5sm3160143wmd.29.2021.09.04.16.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] target/nios2: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:33 +0200
Message-Id: <20210904235542.1092641-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef80..947bb09bc1e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     ncc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
-
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1



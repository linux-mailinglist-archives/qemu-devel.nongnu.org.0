Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4456945A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:30:06 +0200 (CEST)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Caz-00010i-8H
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMH-0000fd-2w; Wed, 06 Jul 2022 16:10:53 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMF-0003Xh-CU; Wed, 06 Jul 2022 16:10:48 -0400
Received: by mail-ua1-x934.google.com with SMTP id j6so4861636uae.5;
 Wed, 06 Jul 2022 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlWnQE+P7hmr5neI/eBPoJIOUflT3VnXHq8f/DkV+TI=;
 b=chWkE9Qpe2zYZmL+EhDwX1Ztyk/sCHFj1t61Qg+ReXrzNp8xBy1z9PnfBgMC7TsW9+
 VuljuYkTMrEgdcxuaOgvDI2ezGhYlAdZgeoBODcn2sC7s9vnrMKdQyvrchdL7GPMg3Bd
 tYsX1NVTqxanFVzarJhnFjlGHEDMVp6rzRe9CmC/QqM0KFYt4Sh9AEztBRpIgANEe+A1
 lIT5EF0wPI/VDX1o/YkY0ccYZvSynsVz42snlF5ucIIJaG9W6eeTk4IPmg7qcr10Lshl
 ZZUSjuhjuBRZgf9iMnzSUkYp3N/iYQ69vM575Bs8TDo+Moy1BQZcqo4zTWKra2e19Nz7
 oppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlWnQE+P7hmr5neI/eBPoJIOUflT3VnXHq8f/DkV+TI=;
 b=aLaK9y6dITJm8jCarv3GacSdIxqBQMDFGeHZ1MbyjD24yBWb7WiF0ZQdx00Tnrx75H
 qQuq9ITSo6iVOSccrqiQHG7PbOzQlO+dTGYG9Ajx9MgiwIYqOE7C1bEWfLBrg0mlsqZc
 1Rl94a9t2vMlfJFulIbVQpbnLUDfKf22j8lQYx1Uu3CBn3AtuHwbYBdwN+URvSimifsR
 cPyWJMT4yqqfCf4afstDKk9AZHw/tJbV8doMuDH4SSZefqVVjo86JtG6IBYxSuHjRRwS
 uzdbfFMRk65sfYt7/37x3uU8S633Ruvz5DxDAJpzOv5VyQLH+0AnCIYqOX2fKZvY1xiA
 sekg==
X-Gm-Message-State: AJIora+s4sPlhVPjL8pk/EuX6hoYe57Vz+HW9N87I0VPghz3zOBbUzt3
 gTLNQiZDCG4QWFnsiKHHTMNmf0Sr/sc=
X-Google-Smtp-Source: AGRyM1vOaaJWsNbiSxarF4OMRY9w6x7yLh9k+hTTGk1O4xK+5THi/GXwO5KTExsuzCPVz69bt8xuYA==
X-Received: by 2002:ab0:70c5:0:b0:382:3b0:599a with SMTP id
 r5-20020ab070c5000000b0038203b0599amr20518182ual.122.1657138246366; 
 Wed, 06 Jul 2022 13:10:46 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 28/34] target/ppc: Add flag for ISA v2.06 BCDA instructions
Date: Wed,  6 Jul 2022 17:09:40 -0300
Message-Id: <20220706200946.471114-29-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Adds an insns_flags2 for the BCD assist instructions introduced in
Power ISA 2.06. These instructions are not listed in the manuals for
e5500[1] and e6500[2], so the flag is only added for POWER7/8/9/10
models.

[1] https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf
[2] https://www.nxp.com/docs/en/reference-manual/E6500RM.pdf

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220629162904.105060-9-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h      |  5 ++++-
 target/ppc/cpu_init.c | 10 ++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b38c651af4..7aaff9dcc5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2289,6 +2289,8 @@ enum {
     PPC2_ISA310        = 0x0000000000100000ULL,
     /*   lwsync instruction                                                  */
     PPC2_MEM_LWSYNC    = 0x0000000000200000ULL,
+    /* ISA 2.06 BCD assist instructions                                      */
+    PPC2_BCDA_ISA206   = 0x0000000000400000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2297,7 +2299,8 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC | \
+                        PPC2_BCDA_ISA206)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c16cb8dbe7..bdfb1a5c6f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5985,7 +5985,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
+                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6159,7 +6159,8 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC |
+                        PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6379,7 +6380,8 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC |
+                        PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6597,7 +6599,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
                         PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310 |
-                        PPC2_MEM_LWSYNC;
+                        PPC2_MEM_LWSYNC | PPC2_BCDA_ISA206;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
-- 
2.36.1



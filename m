Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919155355D4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:49:56 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLMh-0006r7-IS
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBq-0000ju-Nd; Thu, 26 May 2022 17:38:42 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBo-00085L-Nc; Thu, 26 May 2022 17:38:42 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f2c296d320so3735402fac.8; 
 Thu, 26 May 2022 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEG1c2405JUlm6OoEGtqQDpIyJt6yubMZhrta9vUA28=;
 b=OiV/69O2rhTYhMRyTp7AAWSm+Ay2msRi9U0v/96iQkk6Kn1KOA/WWNPRGDfmExy6S8
 zuB7mZr4taHwMXk0+Hi99DS5j5JMsmkjh0TZdg5hCB6T3+CEtTv92GwZJLm3bbabqM4o
 Ic4Ia5dI47U2txmfZaEpzkq2z90PuxhF+DgQguG+MalsYxTf4SVFs9bDIvg4y8RtLKyk
 7ciPD7JCDrsDK+MtyrvOFeBjyloAD9Wy+gJomGZrjzE2m9qv8VEUhMTPNMrKjXOEFeoQ
 /fucmcTkQEJGqd8+dOpU6hvAy7hRwvRCoy22/iygc3sTwP4VjQPewM3YbiCe7TyENEs2
 JY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEG1c2405JUlm6OoEGtqQDpIyJt6yubMZhrta9vUA28=;
 b=752AIvBV61R1QT36qRYe0h5rKauNHPE4vhUtesMDLIN8R90s7DQEuD0qezOKaAXyAR
 lKApsg5D36rnBHFXhwCJrs8qxietnffJ+hwVMhfgWytNTZzVGHET/p6WOROr4IF/iRjo
 Kzfn+kc0R/ufOASfrINBXw4rpq7Gu/1kArZcnX5/ZDILCJRZTc/Mb6FsBReX70UaNlCe
 3BAor4BW9OfQgp8mqk+uyoYBLwJ+z+129upWNDTZhLJfBp0KVqkqDUb2X+9We4twxXOd
 hgIeqwysPkufN3tR1gDBl+pRDKzpI1IkCw8PiLq1cwCk31QefYV9Gp6L6lYiOLnkwxfb
 SCVw==
X-Gm-Message-State: AOAM5335ie4GoIRRxejBcAihN82KQN8VJRA72T4nfTWUpoGoWZa50RA2
 4zCmsCS/JhGx9sb4Q/wTNuPndXivYkk=
X-Google-Smtp-Source: ABdhPJwQQ32y3b/F9SkYaXC1rhMqBmjW3A/tRgrq8kcklEHGKNT8CLwdQfWT9jhdCviTFCYzNd1Isw==
X-Received: by 2002:a05:6870:5708:b0:db:2ef8:f220 with SMTP id
 k8-20020a056870570800b000db2ef8f220mr2484001oap.198.1653601118930; 
 Thu, 26 May 2022 14:38:38 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 03/34] spapr: Use address from elf parser for kernel address
Date: Thu, 26 May 2022 18:37:44 -0300
Message-Id: <20220526213815.92701-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.

QEMU loads the kernel at 0x400000 by default which works most of
the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
(position independent code). This works for a little endian zImage too.

However a big endian zImage is compiled without -pie, is 32bit, linked to
0x4000000 so current QEMU ends up loading it at
0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.

This uses the kernel address returned from load_elf().
If the default kernel_addr is used, there is no change in behavior (as
translate_kernel_address() takes care of this), which is:
LE/BE vmlinux and LE zImage boot, BE zImage does not.
If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
prints a warning and BE zImage boots.

Note #1: SLOF (x-vof=off) still cannot boot a big endian zImage as
SLOF enables MSR_SF for everything loaded by QEMU and this leads to early
crash of 32bit zImage.

Note #2: BE/LE vmlinux images set MSR_SF in early boot so these just work;
a LE zImage restores MSR_SF after every CI call and we are lucky enough
not to crash before the first CI call.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Tested-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220504065536.3534488-1-aik@ozlabs.ru>
[danielhb: use PRIx64 instead of lx in warn_report]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d112b85b4f..fd4942e881 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2975,14 +2975,16 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     if (kernel_filename) {
+        uint64_t loaded_addr = 0;
+
         spapr->kernel_size = load_elf(kernel_filename, NULL,
                                       translate_kernel_address, spapr,
-                                      NULL, NULL, NULL, NULL, 1,
+                                      NULL, &loaded_addr, NULL, NULL, 1,
                                       PPC_ELF_MACHINE, 0, 0);
         if (spapr->kernel_size == ELF_LOAD_WRONG_ENDIAN) {
             spapr->kernel_size = load_elf(kernel_filename, NULL,
                                           translate_kernel_address, spapr,
-                                          NULL, NULL, NULL, NULL, 0,
+                                          NULL, &loaded_addr, NULL, NULL, 0,
                                           PPC_ELF_MACHINE, 0, 0);
             spapr->kernel_le = spapr->kernel_size > 0;
         }
@@ -2992,6 +2994,13 @@ static void spapr_machine_init(MachineState *machine)
             exit(1);
         }
 
+        if (spapr->kernel_addr != loaded_addr) {
+            warn_report("spapr: kernel_addr changed from 0x%"PRIx64
+                        " to 0x%"PRIx64,
+                        spapr->kernel_addr, loaded_addr);
+            spapr->kernel_addr = loaded_addr;
+        }
+
         /* load initrd */
         if (initrd_filename) {
             /* Try to locate the initrd in the gap between the kernel
-- 
2.36.1



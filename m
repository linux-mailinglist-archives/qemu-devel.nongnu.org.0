Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A61596176
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:51:57 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0jM-0007MF-Uz
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T1-0005Er-NL; Tue, 16 Aug 2022 13:35:10 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sz-0002PA-RB; Tue, 16 Aug 2022 13:35:03 -0400
Received: by mail-vk1-xa36.google.com with SMTP id q191so5529650vkb.6;
 Tue, 16 Aug 2022 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=i2cJpoN25K0b0XQelFh0866ucJSPtG9XYEjczJikJbc=;
 b=OYA5Fzn8+UlUuEQRdq/LuNFUW7Pw9qm9GoyCMRffFCzCcEJKiVFLBAzMNxs31ycsky
 mFXgOV5MJSgMs8DiNFmo44hhhy/6a5RxXKZAAyDU3sOxgFBq4vjcbw1PUCDRR4six0wb
 Mq/X4cPxsZvgIU4FTH4hAcW5faSX6Ph1r50afG/TH3tl7eI9sN5n8sX3dON7pc1XXFyb
 vH3ho7erQ2x5xWJDbfjLcBTh+c/Qj2Kx0uAqCaKxf/aPnk8ei5xsCukLlUb96GLudS7P
 1KCDpNP/oRGSI+WTIQcP4VKui+eOjM77t+fGbNA1xWjJXhhIXNoxnXrBqT4jAY/hh0vH
 FIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=i2cJpoN25K0b0XQelFh0866ucJSPtG9XYEjczJikJbc=;
 b=7NnIvuioALEHtCOQlgBCuPcicsHAd1sujd5gu+MDslsJSQ6RnT5maw65npniBjaadW
 I/AOi5wYzbMcntGENa6GrTC5vMbM6QwsWWzphFtqdPR6G24KL7CXQV/S3c7IRDXFjuca
 W0s+Dovdkx3pU32bwxZ0z/agvIa97moSvCHCWIbUJmyXpjpHpQS8wH1wBmTZtBGXc5Af
 h/b0/tyc/1uJlBuYUvfEDLR+8kFmISfAVePotLYhFGEec1awKFmbgZJ+WtG+hn9UKhN0
 ew1qs5LMcCAszWtrCN9ktSAKyLeeeAaZcDDpvTs0ju5rybXsvuhj/8vnJO5Y/uVfSvWi
 5Ijg==
X-Gm-Message-State: ACgBeo1qEALvebRapU/EYfjZJNhd1C6I3HQp/063gK971396eShzOoVQ
 jWdVnzu/U0/rAfCtwNhRIRqEYAtnRUg3vA==
X-Google-Smtp-Source: AA6agR4p4TRchuNF113T/T8X90pWNf43Tr+eflg8MU04ayBrVCCfTXZ07i1ytwDCdtUSn0bxPGSDFA==
X-Received: by 2002:a1f:2012:0:b0:377:1f9e:57c6 with SMTP id
 g18-20020a1f2012000000b003771f9e57c6mr9340907vkg.16.1660671300360; 
 Tue, 16 Aug 2022 10:35:00 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 10/20] hw/ppc: set machine->fdt in spapr machine
Date: Tue, 16 Aug 2022 14:34:18 -0300
Message-Id: <20220816173428.157304-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
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

The pSeries machine never bothered with the common machine->fdt
attribute. We do all the FDT related work using spapr->fdt_blob.

We're going to introduce HMP commands to read and save the FDT, which
will rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in the two places where we manipulate the FDT:
spapr_machine_reset() and CAS.

spapr->fdt_blob is left untouched for now. To replace it with
machine->fdt, since we're migrating spapr->fdt_blob, we would need to
migrate machine->fdt as well. This is something that we would like to to
do keep our code simpler but it's a work we'll do another day.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 6 ++++++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..7031cf964a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..a53bfd76f4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for 'dumpdtb' and 'info fdt'
+     * QMP/HMP commands.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.37.2



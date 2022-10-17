Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E36017D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:39:51 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVxj-0001vD-Aw
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgV-0004v9-LZ; Mon, 17 Oct 2022 15:22:02 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:36825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgT-00033t-CR; Mon, 17 Oct 2022 15:21:58 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-136b5dd6655so14417780fac.3; 
 Mon, 17 Oct 2022 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aT3WPPjxMZjXCOZjcHpYoYx3tnrOwGNLqWOQmP0vItg=;
 b=QoSKS05b4AZfA4Ihip/aIN5TnkkMtYDBOg75UcX8Ed2vq70RkyNvqyeXI+8Hsbhwmj
 frowyxv9zT00y7tFNj/+TIOyOq4yV4SWxL7dVqSvDEU7AnLvpBqhZciNosJRCddzp8Rw
 RCvcXNaddNqIR2aEna6fM5seyLRgadaDFd//UUmbAI4NZ/Kfe0Wmfff5zK7qD2EZrv/V
 6FYOiRtkgCtO8C+AJyjBZyNnQKQisBIfqLb7ieYUDA1y14EQxnzhOk18soPbPjGGsQap
 hKa8Z0MQbAKJ7T+79VO0Bpe7I+at7R44zqrhlqDTXlEC84qUpNWl5LPQQCeum3zY5L2J
 IM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aT3WPPjxMZjXCOZjcHpYoYx3tnrOwGNLqWOQmP0vItg=;
 b=mGQ8vQGipWmlPIzz4hZFcRq6D3XChqGakMumGlrtgy3KebnSIUxcs/YjS5DsSWsMNr
 kfmNdm5SYuiQcmRgPsUiBfYOSZ2WUP+/Eywb3Cvw/3M7nNyTxRfzVMzZ2bxW+x6v/FXu
 nl7qndXbp0JSM0gvhHau3ao9M65nQOTv5KwYAxARIsNZuziZrE0BR6i51U+UGdvd8BL2
 gxg/Fe/xRYbH8+r1p07qpHNmMCYWIBLJts8erTq1ttbWwZm1AjSykT4RDbtmeT1r8DRK
 3YTENaVxZOtN1nhgLXqw49HJ5W/8xJ6ptVVkEpRdxyZx8+MZFpS/MpcTMw1aPkgJuLWU
 tirA==
X-Gm-Message-State: ACrzQf2kYQTOEqC6/SjGR+DN8t55yAEgnjjvmbUOz4AkBQGtgvyCyPHs
 GteDVpaAWhUzaBJoEkHemPhsfR1dB+o=
X-Google-Smtp-Source: AMsMyM5LGoz9esGrJAFw58RhodbMCPNUuC3YxUYGZssv/+7mgIg6VjVWWpAAI02Q68jT+mMxTnIk+A==
X-Received: by 2002:a05:6870:3388:b0:136:4f44:78a6 with SMTP id
 w8-20020a056870338800b001364f4478a6mr16770206oae.125.1666034515407; 
 Mon, 17 Oct 2022 12:21:55 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 36/38] hw/ppc: set machine->fdt in spapr machine
Date: Mon, 17 Oct 2022 16:20:07 -0300
Message-Id: <20221017192009.92404-37-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We're going to introduce a QMP/HMP command to dump the FDT, which will
rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in two places where we manipulate the FDT:
spapr_machine_reset() and CAS. There are other places where the FDT is
manipulated in the pSeries machines, most notably the hotplug/unplug
path. For now we'll acknowledge that we won't have the most accurate
representation of the FDT, depending on the current machine state, when
using this QMP/HMP fdt command. Making the internal FDT representation
always match the actual FDT representation that the guest is using is a
problem for another day.

spapr->fdt_blob is left untouched for now. To replace it with
machine->fdt, since we're migrating spapr->fdt_blob, we would need to
migrate machine->fdt as well. This is something that we would like to to
do keep our code simpler but it's also a work we'll leave for later.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220926173855.1159396-14-danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 3 +++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8bbaf4f8a4..f79ac85ca1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,9 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..891206e893 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for the 'dumpdtb' QMP/HMP
+     * command.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.37.3



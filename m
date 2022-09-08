Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE45B2746
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:59:08 +0200 (CEST)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNg3-0007F2-QD
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOl-0005Rh-J1; Thu, 08 Sep 2022 15:41:15 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOj-0007Dz-SU; Thu, 08 Sep 2022 15:41:15 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127d10b4f19so21411104fac.9; 
 Thu, 08 Sep 2022 12:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gdxoRd7OeTBWEhsO7aIWLhTwjTOt7R/kxNuYrJctnJw=;
 b=anIhY5rOf+t3cAMMEhM+5R7tldN0abyDAQZV85R17WEP3hhhza+jdkVl72mrT3OlwU
 Y/dm0gFaoHeLflHf4jUHWLAMqsazGi/Nc2kuRJfA4YBSFd6FxC1HtXaD34ouM9o9/cIG
 9njAC2o2B9ZwrZFCuwdcdmWuoPstA+jTgZLr8QCIMi7ZaV0o3OlGWNF/L3AobF6XcYVo
 w1Y8OAWzdwxJFDxmLX5xUXXsZsfjGSk4LmCUXiyNU74M7YSWGwRaPENOWnDxIEfz06ds
 ZExAASJzh7dCU2bY/YRKmQgoGQKdLWp4XnicZ/lh/GQX1sPFhBI3E4E9BWLSIYS2GmQu
 wKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gdxoRd7OeTBWEhsO7aIWLhTwjTOt7R/kxNuYrJctnJw=;
 b=ljhejY8dROyBgKPJz0OxlKmNvERdvQBORngWP7lWNGskT7eS0F4qbsys+9y7J9UmgD
 oUj/6FA1i0W8W/ivhMN546ZhX9W6CmsQQXkvzYp4dwO7RHURk9KAGEpGdYPsbaZnsMuc
 8wWYeU0lOu5dwIa609UhHm7TdoAoyoLYNpdi8uQOMtTLXEFv0tKdx8tZ/VoVssIkf/zO
 jCU+2iv15vTPHMXqJ0ghumh9Q+t9FylbI471wDGwAtwl4Uw8k1aDvp4WpY/yIq0z1rhm
 N1bJDUcmkV+XJgHjIH8XkqNAyERKiuSaWQG+3j8QmLM8CsO7mK5r+haeIgI5ePTdPFCc
 bGfg==
X-Gm-Message-State: ACgBeo04ZYVPJ/2Teq7WKeOXYf1YVpF9mNQa9ISLCDIS0zZqV4l+icnc
 NAL48r2LwKafFnSSprB3cJiQz6tuCvpF7Q==
X-Google-Smtp-Source: AA6agR4Nc37wS+zgfnxKy6XIMW7MQAUuAQrB3Ckrbfs1SVFmDDroyBqhq/LGU2EI4Yjz2AaemxnhUw==
X-Received: by 2002:a05:6870:3450:b0:11e:b695:c13f with SMTP id
 i16-20020a056870345000b0011eb695c13fmr2945149oah.130.1662666071126; 
 Thu, 08 Sep 2022 12:41:11 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v7 10/14] hw/ppc: set machine->fdt in spapr machine
Date: Thu,  8 Sep 2022 16:40:36 -0300
Message-Id: <20220908194040.518400-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 3 +++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fb790b61e4..170bbfd199 100644
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
2.37.2



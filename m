Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AB30798A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:22:20 +0100 (CET)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l597j-0005i9-J2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593Y-0001FH-E7; Thu, 28 Jan 2021 10:18:05 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:41166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593S-0003TF-Ol; Thu, 28 Jan 2021 10:18:00 -0500
Received: by mail-qt1-x82e.google.com with SMTP id t14so4270773qto.8;
 Thu, 28 Jan 2021 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZ5seEbSS5exNcttANlInxArUOCK6rcMzRK2ZFJq80Y=;
 b=Ek3x9m5g8vQya6kJs6K0ZLokYfo3xl8E/ED++b1wrt8/BwRcs+0I8L80GLfDxIWSm4
 ihi57ZtRmrWvXusm1NY83r02y3lp7PJigNwAXL5iazRmb55VIM/pL/fdLDiPHTsw+ibX
 tD+PIjn/alDkOAIx+W8xiMQdxty7IqBmuVVu3Ocil57DwUBxo7aIYaxzb3HRqrCEZ2/I
 OgACC7abUs+VZDn7+PUys8Du/DeRpoYP7IJh+W590Svyb/PhhPF3IdiyZxVK6ebjFWsN
 IdJx6yjcrrfFemMGZi+exFRzTtKn316WwIXhxL7Amt2RxMWEOXXiUBraOyM/gghCJQHn
 V88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZ5seEbSS5exNcttANlInxArUOCK6rcMzRK2ZFJq80Y=;
 b=SSjFcNz/5aWrLgGvjmFFvEBi4V3mPmUuErZIuv/JHIysS3sX0iq+128fh19rAOVKHA
 oV740OunrdHSAkRtrCGRHNiQ4jNefxL/SfTcNcekZDMhaTg1pBo/K1FpeexZFR2uXLx1
 rYoryP4Tq8JlEjOSpsOTcCJ7HaEifQD7cqxmV7zNNNv0UmZfrNpX3Dhr68uQCFLN7AIA
 pmdcTWKAh28tN6TgkMMMwZoQ2xcBUXcSS1wQO/yDSknQhPaS+KGM+orBuV2hjkz+jMVF
 gZj3vnJZvYc5TIipOkU3C1B4I/0+3z5WHJxuPm+E2gznhZaN7oPKCH0x/zX3/Zd9LA/r
 TFKg==
X-Gm-Message-State: AOAM531kgffVFQldbakxSjDdlBN9em9/atgMUR4HBJ3j7ntqfKJFZJE3
 zCUZIJrkVOuPyIOmOhM8i9EueHP+Lss/Gw==
X-Google-Smtp-Source: ABdhPJzyuQwQQ/Utkpu1OFmdPZTWUpK9i9PM21fINI4ODIUROBYXqLbaMCytT9eMW+PjkPi33QT0fg==
X-Received: by 2002:ac8:6799:: with SMTP id b25mr14668449qtp.100.1611847073348; 
 Thu, 28 Jan 2021 07:17:53 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id g131sm810855qkb.91.2021.01.28.07.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:17:52 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] spapr_numa.c: fix ibm,
 max-associativity-domains calculation
Date: Thu, 28 Jan 2021 12:17:31 -0300
Message-Id: <20210128151731.1333664-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128151731.1333664-1-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current logic for calculating 'maxdomain' making it a sum of
numa_state->num_nodes with spapr->gpu_numa_id. spapr->gpu_numa_id is
used as a index to determine the next available NUMA id that a
given NVGPU can use.

The problem is that the initial value of gpu_numa_id, for any topology
that has more than one NUMA node, is equal to numa_state->num_nodes.
This means that our maxdomain will always be, at least, twice the
amount of existing NUMA nodes. This means that a guest with 4 NUMA
nodes will end up with the following max-associativity-domains:

rtas/ibm,max-associativity-domains
                 00000004 00000008 00000008 00000008 00000008

This overtuning of maxdomains doesn't go unnoticed in the guest, being
detected in SLUB during boot:

 dmesg | grep SLUB
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=8

SLUB is detecting 8 total nodes, with 4 nodes being online.

This patch fixes ibm,max-associativity-domains by considering the amount
of NVGPUs NUMA nodes presented in the guest, instead of
spapr->gpu_numa_id.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index f71105c783..f4d6abce87 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -60,6 +60,19 @@ unsigned int spapr_numa_initial_nvgpu_NUMA_id(MachineState *machine)
     return MAX(1, machine->numa_state->num_nodes);
 }
 
+/*
+ * Note: if called before spapr_phb_pci_collect_nvgpu() finishes collecting
+ * all NVGPUs, this function will not give the right number of NVGPUs NUMA
+ * nodes.
+ */
+static
+unsigned int spapr_numa_get_number_nvgpus_nodes(SpaprMachineState *spapr)
+{
+    MachineState *ms = MACHINE(spapr);
+
+    return spapr->gpu_numa_id - spapr_numa_initial_nvgpu_NUMA_id(ms);
+}
+
 /*
  * This function will translate the user distances into
  * what the kernel understand as possible values: 10
@@ -311,6 +324,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+    uint32_t number_nvgpus_nodes = spapr_numa_get_number_nvgpus_nodes(spapr);
     uint32_t refpoints[] = {
         cpu_to_be32(0x4),
         cpu_to_be32(0x3),
@@ -318,7 +332,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
         cpu_to_be32(0x1),
     };
     uint32_t nr_refpoints = ARRAY_SIZE(refpoints);
-    uint32_t maxdomain = ms->numa_state->num_nodes + spapr->gpu_numa_id;
+    uint32_t maxdomain = ms->numa_state->num_nodes + number_nvgpus_nodes;
     uint32_t maxdomains[] = {
         cpu_to_be32(4),
         cpu_to_be32(maxdomain),
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C2307989
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:22:19 +0100 (CET)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l597i-0005h8-Ij
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593U-0001Cl-Fa; Thu, 28 Jan 2021 10:17:58 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593O-0003Sx-93; Thu, 28 Jan 2021 10:17:56 -0500
Received: by mail-qt1-x82c.google.com with SMTP id z9so4285008qtv.6;
 Thu, 28 Jan 2021 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZnPREoSLA2mBWqQq37aioqdTP1auiz0Zy+GVHBK248=;
 b=aoJr90I4MkK8kM3yW1zNZCoB1bk98P6AAjk2/B6IDxGy99Zm+7POD06Xnv6i4bpPAr
 KrgnTOGSnai4aJzJr/05H5ZQjXNtoTSrCJ1Z8DbuBJ6+zHMcdslzMoxiRS8vH6YPd51j
 VAxLyqGaHqKadzhBzeromtJXa8bQ+BUZWAgMX95bQquWUtRZCRkLXXHT8K/OYqJr+yMC
 lj2a9pShgX6oml7XrKmpNzfAWGuLcmYqB6jdEsJRhSixfGbZ9E/qruTUtVYS+BbcVnzx
 EPqJ+WhYikuh5dH4aBaDLBDs+mO6BAmbYUjOHYEjX5y/+EehhL/8Ht5zYLYnE/l4ORZ2
 zsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZnPREoSLA2mBWqQq37aioqdTP1auiz0Zy+GVHBK248=;
 b=HwYpmnhb3Ee53GumCGDREMEjP3E4BvQ5LA8IkGNQfIoJXvw00VWkWn4pz5dvpOO8KY
 CO7E8QTNCiB/qKndapu0urV+OU7hhhcOYE0GGyx3GrQeWzjCy1IBpomz0zJZdysrLsOx
 lvNd4SIr0wDCMKpX97ChBERDfWS/MX3k//nJhaQIKP6Lztl0NtToGWLTCW6NKJJ8+MUq
 zFZ1/eOGanYHfI5RXrgiAClar+f9dicXZZsuXJNrSEvH28VyIUanJFSrBkO54kGjiDWS
 qIfGs5GlbOoOIXYQXv3CYIv3ntALCjFZBNV3541jmsrF9ZF57NQSZ0f456P/X4+tdQZa
 1yqA==
X-Gm-Message-State: AOAM531XvGtcQSvIDEL+foBTJcHQQO+ewZ+ywNcmQnnnMF8vJFIWm1qY
 BYVUUD/z4wpiyvGZ9xKm4KwZlvK9hP6rlQ==
X-Google-Smtp-Source: ABdhPJwVntXjeUHXtBa64ObquL/Gd8thYITFqTB9m5UCSgBtK6oifrGz4bSwj5i5pLLckn3+aE2Muw==
X-Received: by 2002:ac8:5e50:: with SMTP id i16mr4010599qtx.5.1611847068942;
 Thu, 28 Jan 2021 07:17:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id g131sm810855qkb.91.2021.01.28.07.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:17:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] spapr: move spapr_machine_using_legacy_numa() to
 spapr_numa.c
Date: Thu, 28 Jan 2021 12:17:29 -0300
Message-Id: <20210128151731.1333664-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128151731.1333664-1-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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

This function is used only in spapr_numa.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 9 ---------
 hw/ppc/spapr_numa.c    | 9 +++++++++
 include/hw/ppc/spapr.h | 1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6c47466fc2..2d60c6f594 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -295,15 +295,6 @@ static hwaddr spapr_node0_size(MachineState *machine)
     return machine->ram_size;
 }
 
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
-{
-    MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
-
-    return smc->pre_5_2_numa_associativity ||
-           machine->numa_state->num_nodes <= 1;
-}
-
 static void add_str(GString *s, const gchar *s1)
 {
     g_string_append_len(s, s1, strlen(s1) + 1);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index b50796bbe3..261810525b 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,6 +19,15 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
+static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
+{
+    MachineState *machine = MACHINE(spapr);
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+
+    return smc->pre_5_2_numa_associativity ||
+           machine->numa_state->num_nodes <= 1;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index c27c7ce515..ccbeeca1de 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -851,7 +851,6 @@ int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
 void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
 
 /* DRC callbacks. */
 void spapr_core_release(DeviceState *dev);
-- 
2.26.2



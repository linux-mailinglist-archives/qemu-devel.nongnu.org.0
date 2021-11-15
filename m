Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C304509DC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:42:27 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf3q-0001Pc-6M
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezf-0001cE-LV
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezd-0005CM-P5
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCwWAShbLLF34Yk6WLQ61NBEjpxVbqCjQ2ekK/tHKoY=;
 b=gcf+kcrqvqiV4MZ6CBPcRVH7lxMDUpe7ko5jI/aOeJblDUy4yt3/hNQ+qVPsXW8VGYULGy
 Yb4YEQ1TlnFWpeBC3VaJBBVFSUk5MkGBO4b5s+FMzqDAWrYawGaYg1/4oVYT6XlVFtMbts
 UK9US+v5b9ZC4SdLntDDvjj4dJBPC9Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-adZwQZmiM6uaLfHa1UBwWQ-1; Mon, 15 Nov 2021 11:37:57 -0500
X-MC-Unique: adZwQZmiM6uaLfHa1UBwWQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 bx28-20020a0564020b5c00b003e7c42443dbso2542703edb.15
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FCwWAShbLLF34Yk6WLQ61NBEjpxVbqCjQ2ekK/tHKoY=;
 b=KnBQx4r/un434L4xc9NdqoIR+jWDxcfKAayT0l/vre/5G+sErcLTLCHC+oT9q1XvRg
 il2jYoo8fapdLLhJZKowWOM5Olbz+Mo19hTOaFMPk0NUinNE9q5ezVF1U6j5qE9ZmA3+
 AXBQJtz9yFHL+hBm44C4T5+LexGDbqI9FxMr2RL3tRLdc30+lJQkDLpN4/mJ9puh/7//
 0xy7mJcw/8qPIdutPOfXnM/o7DwcmnQCvVqNTLsn5TNkxj3sXBs87FUcnl1/jCPs4xfd
 KoOJFCGanZ5uaUocR03TT1Nc5rMHVTAiFbxaXp7Bx9vGAqKwZ26f1ZPvBkXVXwl+BG/F
 6EXw==
X-Gm-Message-State: AOAM5331TgL/5udqIOXKbw8CRTi9F4HLVdptnbudiZczs/bmk6tsXsTk
 tiNAIgjEgC43Q+mMfa25BVqAWM3JMf+PEedS+ta22LOmog+IZi7V+grGS0shvWs0IPXZgVnyzRA
 9mU1+xqZGYkNMbjITf8wMhR8Py+MxjejnQ2oA0z5BYfIDyTIet6ETYpNONoci
X-Received: by 2002:a17:906:5209:: with SMTP id
 g9mr361636ejm.145.1636994275599; 
 Mon, 15 Nov 2021 08:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5ancvOD9dTU5uTlIRrPknkYR4ttpSyKCmmTboHNGKhVPcuGdNTR79FFBd7LJdZ6W/Q1TPZQ==
X-Received: by 2002:a17:906:5209:: with SMTP id
 g9mr361603ejm.145.1636994275405; 
 Mon, 15 Nov 2021 08:37:55 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id x19sm1349838edd.61.2021.11.15.08.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:54 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] hw/mem/pc-dimm: Restrict NUMA-specific code to NUMA
 machines
Message-ID: <20211115163607.177432-6-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When trying to use the pc-dimm device on a non-NUMA machine, we get:

  $ qemu-system-arm -M none -cpu max -S \
      -object memory-backend-file,id=mem1,size=1M,mem-path=/tmp/1m \
      -device pc-dimm,id=dimm1,memdev=mem1
  Segmentation fault (core dumped)

  (gdb) bt
  #0  pc_dimm_realize (dev=0x555556da3e90, errp=0x7fffffffcd10) at hw/mem/pc-dimm.c:184
  #1  0x0000555555fe1f8f in device_set_realized (obj=0x555556da3e90, value=true, errp=0x7fffffffce18) at hw/core/qdev.c:531
  #2  0x0000555555feb4a9 in property_set_bool (obj=0x555556da3e90, v=0x555556e54420, name=0x5555563c3c41 "realized", opaque=0x555556a704f0, errp=0x7fffffffce18) at qom/object.c:2257

To avoid that crash, restrict the pc-dimm NUMA check to machines
supporting NUMA, and do not allow the use of 'node' property on
non-NUMA machines.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211106145016.611332-1-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/pc-dimm.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index a3a2560301..48b913aba6 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -181,7 +181,21 @@ static void pc_dimm_realize(DeviceState *dev, Error **errp)
     PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MachineState *ms = MACHINE(qdev_get_machine());
-    int nb_numa_nodes = ms->numa_state->num_nodes;
+
+    if (ms->numa_state) {
+        int nb_numa_nodes = ms->numa_state->num_nodes;
+
+        if (((nb_numa_nodes > 0) && (dimm->node >= nb_numa_nodes)) ||
+            (!nb_numa_nodes && dimm->node)) {
+            error_setg(errp, "'DIMM property " PC_DIMM_NODE_PROP " has value %"
+                       PRIu32 "' which exceeds the number of numa nodes: %d",
+                       dimm->node, nb_numa_nodes ? nb_numa_nodes : 1);
+            return;
+        }
+    } else if (dimm->node > 0) {
+        error_setg(errp, "machine doesn't support NUMA");
+        return;
+    }
 
     if (!dimm->hostmem) {
         error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property is not set");
@@ -191,13 +205,6 @@ static void pc_dimm_realize(DeviceState *dev, Error **errp)
                    object_get_canonical_path_component(OBJECT(dimm->hostmem)));
         return;
     }
-    if (((nb_numa_nodes > 0) && (dimm->node >= nb_numa_nodes)) ||
-        (!nb_numa_nodes && dimm->node)) {
-        error_setg(errp, "'DIMM property " PC_DIMM_NODE_PROP " has value %"
-                   PRIu32 "' which exceeds the number of numa nodes: %d",
-                   dimm->node, nb_numa_nodes ? nb_numa_nodes : 1);
-        return;
-    }
 
     if (ddc->realize) {
         ddc->realize(dimm, errp);
-- 
MST



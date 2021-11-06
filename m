Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1042446E63
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 15:51:51 +0100 (CET)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjN2q-0001lb-Ov
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 10:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjN1S-00010Q-TR
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:50:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjN1Q-0004EA-F2
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:50:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d24so18448411wra.0
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kn+y1hq+hUjbJEQcDRwwymFls4YQ8OTVmun+DYza6+o=;
 b=H6dFdrhXK6PG0BEwof8S2b6mvEAF6MpcBzvD4unCV3Z5KuxPgn9TyytF/kxKJ+0w6S
 m083RgFeMgHNi8mFkOkVWMYGwNUIM2ZiuIzaYONRqmmfTKOYSRlQ5tTU2KS/3orzDO88
 fm9KQeBtV1IXf5Ba+l4iRWrMxo4pClAQS4BiweYWwowupka1uKnRZ+IwmcpdbF3Erhnr
 cer+E0l9NIrxsSI5w1N2Od/AWvcFNbnTv4JFLG1TsE3EMcRgSHg2db7AF/uffIAXg7Si
 2Hl3zE6BduBZkqw5M0qKYNu52H/oFoHJptvMVrGrcT11UBOVIu2fkOoP1ZCppuvXwLZK
 V47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Kn+y1hq+hUjbJEQcDRwwymFls4YQ8OTVmun+DYza6+o=;
 b=0XecZm7qA/BFsnOW9AykR0Z/PeMSJ/nWToPtBqylg4YZYOQl8FeadoGH+oNzi57KNY
 SaFuugoEzeoa1B5/sIDwdUs3rOIpYKl9MJNDDn7d3SCHi2/JUA7EwXcbdtM7FUGe5g4K
 qam3wH5MirMeFvZewJL4p/ntKdiiFEdfAJcS6Vyh36BN65mmPUIJtBwqczPLaN8dFNtX
 MW0CIlYUTOGr6fg0yEnFPpNCKprcI3J2K/pzOC9pUqygHnFJmahe1lZq/WiL/s0dJ8xY
 X+C8+k+Pf/acmvCj4YsQwUIxQ1x/y+4EJJHyGmLcCi8ipNM2PTK9Fx71mL2zVaDbubqL
 r/2g==
X-Gm-Message-State: AOAM531SWyWw7P3N5eHDV9dU9Zevhj5yJScifVKQqG0VpYUWwJgPJigz
 DdtAyEGJfPh/kwiFQM42WF0w1vj1wU8=
X-Google-Smtp-Source: ABdhPJyKKS2D4ZW4Q6lEvN3LhO7Dym03izg0sX+dFA09lhdSly7LonpjURZdrbYIFi+7ySxTzPWAIw==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr64147609wro.395.1636210218636; 
 Sat, 06 Nov 2021 07:50:18 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v3sm11162727wrg.23.2021.11.06.07.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 07:50:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2] hw/mem/pc-dimm: Restrict NUMA-specific code to
 NUMA machines
Date: Sat,  6 Nov 2021 15:50:16 +0100
Message-Id: <20211106145016.611332-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
v2: Follow Igor suggestion

Supersedes: <20210524171352.3796151-1-f4bug@amsat.org>
---
 hw/mem/pc-dimm.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index a3a2560301c..48b913aba67 100644
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
2.31.1



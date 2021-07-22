Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6A3D2046
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:02:01 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Uae-0005nB-FT
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m6UYz-0004yl-Dw
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:00:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m6UYx-00055f-MB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:00:17 -0400
Received: by mail-ej1-x631.google.com with SMTP id nd37so7323473ejc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IGTYSTa0Yt7UAFuKfRz3+Me6hKFXv+RTIU7c2lPa24=;
 b=qVhgvExzpaxdoZe/eI5mw347e3p7d+P6ivQhP/DQcpq45ZsVQGYg2eW2iKla1WunXW
 3m8Bo2mf3498ebfUOE4uTfiKPNXuDFfPZlhG28Je5r2rVUfIyImmycJVzwoXGtvOGndk
 j3F9tj8lIIEwghhLrwaVNoWpXmPgwkaB86YJzYXtPOCTznZx8AxvAI7hIbJiDqpkop1G
 cpsWwHqldv+dqvOGHXfc7cMXMv7g7SaIiAqxLMKdPOV8xAhjwYYwn4gnYUuR9JyNY0P8
 /XpEY5gykU+C+b+BkFG8zy03fpQiwhim5gD0jhx64LUbVCOiflmRVyoWIYf6cS2Eiwx4
 d56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+IGTYSTa0Yt7UAFuKfRz3+Me6hKFXv+RTIU7c2lPa24=;
 b=tIbdQ2y2kw0PEcq49C7JV5WlXtu6+FqCJgkcjXQ/mf6S9dQwqvMySY4IFoUVmoPTlR
 X6kQ9ruV7Xmqa9edon89+F/9LylWEs5ny2b1wLKpeNmMfyqPPaLpLvrBOJgBw8RyLPyl
 qpkVU8zgrwhYmWV4pwi9QXCDMiJtwBEO2Nymd56MFgnUd2QOIsVHobxdqGYjLjtcjeK9
 JcU4ZqEDWehFWG1/WCoEiaM8tCMf6r/a6v/4UrGIlnuFv0mot586kRtdeWXKeXmIH4XT
 Cfs6aGC35GqmAese9AK1UVOw/l7eQ3DaO6agbQTbeQpexdMnf42mr3/wUkMtclYYFNZf
 8QdA==
X-Gm-Message-State: AOAM533ErmSb17QvJ5ohPFxjQSVCmylIuGv2Y7ynGUGlplbc0hLHmFy2
 ev/cjF4WTORwUjkI4wFOuDALnVCf2as=
X-Google-Smtp-Source: ABdhPJyHPKKfLv7c9OQciErU6oNOJ4/PVqSLqYWT/34ANUSiAtLlj9UM/L4nN/e7+gDO8FP7Jd33SA==
X-Received: by 2002:a17:906:69d7:: with SMTP id
 g23mr41420166ejs.195.1626944411727; 
 Thu, 22 Jul 2021 02:00:11 -0700 (PDT)
Received: from mapfelba.lan ([5.29.30.36])
 by smtp.gmail.com with ESMTPSA id ec38sm12205283edb.15.2021.07.22.02.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:00:11 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
X-Google-Original-From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
Date: Thu, 22 Jul 2021 12:00:09 +0300
Message-Id: <20210722090009.383575-1-marcel@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: marcel@redhat.com, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
As opposed to native PCIe hotplug, some guests will not assign
IO range to pcie-root-ports not supporting native hotplug,
resulting into a regression.

Fix it by setting the "reserve-io" hint capability of the
pcie-root-ports so the firmware will allocate the IO range instead.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index ec9907917e..20099a8ae3 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
         (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
 
 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
+#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
 
 struct GenPCIERootPort {
     /*< private >*/
@@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
 static void gen_rp_realize(DeviceState *dev, Error **errp)
 {
     PCIDevice *d = PCI_DEVICE(dev);
+    PCIESlot *s = PCIE_SLOT(d);
     GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
     Error *local_err = NULL;
@@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
+    }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
                                               grp->res_reserve, errp);
 
-- 
2.31.1



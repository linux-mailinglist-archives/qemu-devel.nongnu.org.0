Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945313C798B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:20:20 +0200 (CEST)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QlH-0001xN-HA
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcO-000800-I6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcM-0008Ad-Vw
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LX+oDa7Ni38sjuf/A7aYFuvPqrITohA/75NP3/6hdW8=;
 b=SqzKHaPD2Hq6kn2V0Cd2hCSZUtC4RSLx/XVo8LAsDj9GuE0CfU+9lLDgAiBEtpK52dndn5
 sNu37yyop0KQ3+4YgjulHM6PJl4QzFiXcW9Gs1/WVnIbyvE9l+ZX/AXSXngvSUz77lzH6E
 TXe3DKvPc81sFGjTGL59l6jHTH+Nza4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398--2N1GXkdNsmtCd2Pfi66SQ-1; Tue, 13 Jul 2021 18:11:04 -0400
X-MC-Unique: -2N1GXkdNsmtCd2Pfi66SQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so965271wmc.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LX+oDa7Ni38sjuf/A7aYFuvPqrITohA/75NP3/6hdW8=;
 b=eABkNS7YPr3fwRBSB1hd57ilxqg3ukBTHce+z1u/tUjdlXWy8dAephP3aMi6gRo+pw
 uBQU8hLMch1t65f45WvQU4C9AVtQo+tMZ10m9z/hUBStaCiAelyFCwlD337id/qrtVsD
 LvgeuUVYRyxeIAzPb2i0P4YTVJDhvmmqy4wG5MMbydpIaytpJVWyDrb+Sx5+6WXT9pc0
 BnVrEMBJTVQwDNyO/Lsw4GqE+bTYPl7z4NMwpLYATH6uIV2QhUQf/2IL93KcHSu2CZOM
 vOLru2fK3s5fXpJL3OTizZbVpDs9M61gKMTLW2MVwdgc55z1OjnuInZBm1Qx1kAhNc26
 IKjA==
X-Gm-Message-State: AOAM532aVo3oaWg0QBute6d5GiI/ZHeQyM65Czuwp0gLXo7mb/oEb3J4
 OuFhSkkUbASCmLWNOLw8JeLcZ0SVmv4SPlRnuYvZh/l9L3bg9mYlVKkCyeNH3I6whj9iLd7IwNm
 USE+9JyTnAQGb/PuX85NWV5tvwCzG2JHx22gLwyVVOPLoMe+IJDTr8aIEP0E/
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr8698486wrw.228.1626214263232; 
 Tue, 13 Jul 2021 15:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZQ06Err8txTdsvxvq8tqB+wRHHi2MrpmlVivPHBhf1rraYuN3WvT7yxuZ5GRWtiJvFTnpAA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr8698468wrw.228.1626214263072; 
 Tue, 13 Jul 2021 15:11:03 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id d8sm140342wra.41.2021.07.13.15.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:02 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] hw/i386: Add a default_bus_bypass_iommu pc machine option
Message-ID: <20210713220946.212562-18-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Xingang Wang <wangxingang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu pc machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by default
and can be enabled with:
$QEMU -machine q35,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-5-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  1 +
 hw/i386/pc.c         | 20 ++++++++++++++++++++
 hw/pci-host/q35.c    |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 87294f2632..fd741119fa 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
     /* NUMA information: */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7e03848792..f784a9a91f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1523,6 +1523,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->default_bus_bypass_iommu;
+}
+
+static void pc_machine_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                                    Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->default_bus_bypass_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1622,6 +1637,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->default_bus_bypass_iommu = false;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1746,6 +1762,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+        pc_machine_get_default_bus_bypass_iommu,
+        pc_machine_set_default_bus_bypass_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 0f37cf056a..ab5a47aff5 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -65,6 +65,8 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->bypass_iommu =
+        PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
-- 
MST



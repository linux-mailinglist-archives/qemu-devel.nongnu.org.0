Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1458F4BACF4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 23:56:44 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKphb-0007XD-5a
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 17:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf2-0005K7-RP
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:04 -0500
Received: from [2a00:1450:4864:20::62b] (port=37764
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf1-0003wx-0J
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:04 -0500
Received: by mail-ej1-x62b.google.com with SMTP id bg10so10704781ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhtn+Z5Nrnw2Yi/2S9qOoxlDL8t9OmWsXOw8nKk+Z7k=;
 b=h4PvnpAb5bcrmGVCBcxbKp2n6Nllu+YADmBWYBlvvI8bxRcB++Y2GsbWjL+uCS8dQL
 JyCu0mppJNeEaRKqhLU4PtxMJFHlplysrLqBCykT3dtyF0wUqKLvgn4ZXIjq9QMO8qGS
 DvRCk+LtJa10LeNzucTeNP9dWgiocJBwOS4FFC1lf3qjVlNnSLfELRMwoBlej1Rwjb4A
 +I6eFn30wm1EAoM8YMPoy2AlmNLaDdsjMS1QmPh95YxVVH3GHQxg37S+IgeXOcHKvcGq
 u7TVB9Lzrfb/Af13NUeWdDBJI+rbWJ4/eOYQFdaLMRJQ68VJPrPPhRh62ZutSd1e17vV
 DjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhtn+Z5Nrnw2Yi/2S9qOoxlDL8t9OmWsXOw8nKk+Z7k=;
 b=pGaU63O0GfK3dlNkPOIMl1lKoLKnBbAlotOXY46OjccIYbzQ8seDG76VQuM3pXotI+
 ETGxCoD9/Gf1MLmd5x7mN0xRZXg6yoaeE07nuuamtXVIiKiRsP5s/Zno81Z5p/+58cM9
 z0InbGGgGiXwlubND4ic9mPx/6M54efhEEwbOikb/fY+/dhmB+wZ+InsU4x9HNTRoAYR
 /FipQhd8HecsmBEHcgg9zuhGGGqLCGdMdFf1E1HqxXVq8M6UInssaq96yUsZ0S49ne/H
 vur/+Mwg+QS0vKvu0NwPwjKkavmVndZLrvbG+HRlztURZeo1kAZSUUy3kn6LYKu6BS5C
 ltjA==
X-Gm-Message-State: AOAM5332conh7wybG05TtwBC+ikYorfWWN2xx30HH/Tb7o33nEbWaeJK
 hhUoAQmfKdHa0mlEehhTUyEoQAl66LrmjQ==
X-Google-Smtp-Source: ABdhPJxzVjgpmWttgIiTKYpfhpbUaISrDVRwQq4sTms6WZ4nQYo8LJ2ecMNNkf0y8n3JbJ01N6n32w==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id
 t12-20020a17090616cc00b006cee607ff02mr3960511ejd.418.1645138440308; 
 Thu, 17 Feb 2022 14:54:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id mb23sm1598871ejb.62.2022.02.17.14.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:53:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/vfio/pci-quirks: Resolve redundant property getters
Date: Thu, 17 Feb 2022 23:53:49 +0100
Message-Id: <20220217225351.140095-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QOM API already provides getters for uint64 and uint32 values, so reuse
them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 0cf69a8c6d..f0147a050a 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1565,22 +1565,6 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
     return 0;
 }
 
-static void vfio_pci_nvlink2_get_tgt(Object *obj, Visitor *v,
-                                     const char *name,
-                                     void *opaque, Error **errp)
-{
-    uint64_t tgt = (uintptr_t) opaque;
-    visit_type_uint64(v, name, &tgt, errp);
-}
-
-static void vfio_pci_nvlink2_get_link_speed(Object *obj, Visitor *v,
-                                                 const char *name,
-                                                 void *opaque, Error **errp)
-{
-    uint32_t link_speed = (uint32_t)(uintptr_t) opaque;
-    visit_type_uint32(v, name, &link_speed, errp);
-}
-
 int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
 {
     int ret;
@@ -1618,9 +1602,9 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
                                nv2reg->size, p);
     QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
 
-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
-                        (void *) (uintptr_t) cap->tgt);
+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
+                                   (uint64_t *) &cap->tgt,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
                                           nv2reg->size);
 free_exit:
@@ -1679,15 +1663,15 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
         QLIST_INSERT_HEAD(&vdev->bars[0].quirks, quirk, next);
     }
 
-    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
-                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
-                        (void *) (uintptr_t) captgt->tgt);
+    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
+                                   (uint64_t *) &captgt->tgt,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvlink2_setup_quirk_ssatgt(vdev->vbasedev.name, captgt->tgt,
                                               atsdreg->size);
 
-    object_property_add(OBJECT(vdev), "nvlink2-link-speed", "uint32",
-                        vfio_pci_nvlink2_get_link_speed, NULL, NULL,
-                        (void *) (uintptr_t) capspeed->link_speed);
+    object_property_add_uint32_ptr(OBJECT(vdev), "nvlink2-link-speed",
+                                   &capspeed->link_speed,
+                                   OBJ_PROP_FLAG_READ);
     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
                                               capspeed->link_speed);
 free_exit:
-- 
2.35.1



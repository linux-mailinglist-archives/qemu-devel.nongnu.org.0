Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2C4C9892
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:56:11 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBPe-0001hi-1V
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBMC-0007XC-Dw; Tue, 01 Mar 2022 17:52:36 -0500
Received: from [2a00:1450:4864:20::632] (port=35475
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBMA-0002lc-TE; Tue, 01 Mar 2022 17:52:36 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk11so8801ejb.2;
 Tue, 01 Mar 2022 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLCP9fOms1Iq6K5s6PskQ79a0pB6waadfOIyDp5Ofh8=;
 b=eTAqnDlfmiwcn/MAlWJMk+lAS2ZCYCILpAHoTyBanq93np7f8zTkmUdm3x7RIxuC92
 YyxRl8fkmv+Zx//iJq9kHO8Sef8moIiOM39Fa/9oC81fX9/5zBkuGhGzbmx6INk6n2uW
 gT6nxGCW8VGLl/V25F1WhXc64Sf93p45ye4ZpOc9MJ5FuIlzKevqcq35zPLPXWU25w5c
 RDQQBgolAbXEZ6GOLD+lor57jkII6qDtcdPNJ1yYz8XkEi9QlAoLfM60nx6cjcRCR70j
 yV9Q09WQpLWGfU9v5rQcEtQ8FPoabmcuk7OZ0JYXby2OKKD0HhdXXxuPPWrDu4mDtJUB
 d6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLCP9fOms1Iq6K5s6PskQ79a0pB6waadfOIyDp5Ofh8=;
 b=o7QSrGBNaAw18ec1ErYTvwinblI9/ky2b5yl3XDSd1fiq75lwHJHFmslt54imcLAEF
 7iUxLH86QlidMDSYebEJhEjBOsbVhkI/uQIEqFcP1qXTAY/CDWG2lXIeMyo9Ca3eZ6NQ
 IoqdLx+Gvans+aq0M9P9glz6AnSopEFMeImGVuNlS67tNDmF3Zc6H5SNXZxiOz+De6Ko
 anPW4FBAIF4cVNJ1IQ/pKALSTl0ceFvPytkfiO2yWeNCYpydgZP3p9kTXvh88QOm1UZp
 5w0gRdcVQHCf+1l2m+Kh99N6H21eYBRoGtWFGuoHu4Qm+UpCJLoik6cCwwiItdz0/N3G
 Ak+A==
X-Gm-Message-State: AOAM532ofUXgqTttyj/q3bCooxpPsntumk5SWbaePF52WdF3zUGGhoEt
 fX5Sa0FANOKCBSmukiA8ZoPT6lgTf94=
X-Google-Smtp-Source: ABdhPJyGqzBWaJld93n84XMJprxNIV/p4rx1o2/esVKml15AyA2vIPMmIrGp1lox9TUFO6zxvIkOCQ==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id
 x17-20020a170906299100b006cf6b24e92fmr20345046eje.748.1646175152648; 
 Tue, 01 Mar 2022 14:52:32 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402271200b0041110d6b80asm7806711edd.39.2022.03.01.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:52:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 1/2] hw/vfio/pci-quirks: Resolve redundant property
 getters
Date: Tue,  1 Mar 2022 23:52:19 +0100
Message-Id: <20220301225220.239065-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301225220.239065-1-shentey@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QOM API already provides getters for uint64 and uint32 values, so reuse
them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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



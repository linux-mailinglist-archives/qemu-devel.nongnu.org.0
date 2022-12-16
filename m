Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C225364F3BC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUI-00063j-C7; Fri, 16 Dec 2022 16:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITp-0005wB-Rm
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITk-0000bF-4s
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:56 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1997399wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3rFihcTTz1hAU/VaIjhHsYjodDtMKZcW8ITB9PAuu1c=;
 b=PFbu/AWxefFZWrt3MHagX9W+kOp45Pnaov3xhECDCAJU0JAnW83gdL8kBtNx/7p+nT
 KtqfJf1p5f6S5CT+slh0cdnqII66FPZaQTFolIpiHvlOjrGV8sNCS3Fvmq9BEHbz24LL
 3xDzT6BsUfRUbskfCeYNWUVmHtTFh8Ze0SMgzcVVQCd2EXZhCSMp2Sisqeg5iZ2ZrjUx
 7PHw5lepF3xowz4vwpJlYPVhoCxjA4s2YikasLWFh2lXSCc5ic42oehQJMGex82QAlJ/
 8f442VVd4S3SwgeZUbPqrPXESvvYmrl0+L0cJlZJO4b/rCuSt3J2DyQY8oSQxQUS4V5p
 ZNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rFihcTTz1hAU/VaIjhHsYjodDtMKZcW8ITB9PAuu1c=;
 b=wKiZCite+EIoQae3PISdvvnh1TVev371b+0sacwwAP5fGyvVlfdb/uribC7hjLO1mb
 ww/u1fzb+mZ6m6SbmUjcjYMeHf02qTJYxt9Cl9EGTYdMW34SjdRdTGmPWqCIVYx/qT28
 TTH5VlLaPug21Mh2GDT2ztKGxgnjURaKKwd6Ito3jkOhjADDFvomspr53xcmiKU3WLu+
 Ew+Zhtzbc3h0WEE8pxDnezkTskN5OZlKoNoGK0d5xcD7Rx+AbbQwvxE4nvWFB6z8+j4A
 A8gBa3sa1BEkP0CyesyKF7skHA7QAE1/zrBOsh1XMwhiIhkUjt210uw3qSfpkklmzgU4
 80Uw==
X-Gm-Message-State: ANoB5plNZ8z/XoIHamK7nhAL1J9I0VK9hmsi3kB2tJ+As4OFVN18DkjC
 ujiUbPaEHA5nFpSoS3fTGXnXxJ0fvsjS2PXq
X-Google-Smtp-Source: AA0mqf4tcfHbw0rk4xiTsHnYYmb4LMHWHLP6kmFrNuvRvNV0c9+HeRkDtxFmVqC+S/fR5xG6IvZ0pQ==
X-Received: by 2002:a05:600c:4fd4:b0:3cf:75dc:12d3 with SMTP id
 o20-20020a05600c4fd400b003cf75dc12d3mr26962038wmq.23.1671226970864; 
 Fri, 16 Dec 2022 13:42:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] qdev: Remove qdev_reset_all() and qbus_reset_all()
Date: Fri, 16 Dec 2022 21:42:13 +0000
Message-Id: <20221216214244.1391647-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove the qdev_reset_all() and qbus_reset_all() functions, now we
have moved all the callers over to the new device_cold_reset() and
bus_cold_reset() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h | 26 --------------------
 hw/core/qdev.c         | 54 ------------------------------------------
 hw/core/trace-events   |  5 ----
 3 files changed, 85 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 785dd5a56ef..c7eda169d78 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -743,32 +743,6 @@ int qdev_walk_children(DeviceState *dev,
                        qdev_walkerfn *post_devfn, qbus_walkerfn *post_busfn,
                        void *opaque);
 
-/**
- * @qdev_reset_all:
- * Reset @dev. See @qbus_reset_all() for more details.
- *
- * Note: This function is deprecated and will be removed when it becomes unused.
- * Please use device_cold_reset() now.
- */
-void qdev_reset_all(DeviceState *dev);
-void qdev_reset_all_fn(void *opaque);
-
-/**
- * @qbus_reset_all:
- * @bus: Bus to be reset.
- *
- * Reset @bus and perform a bus-level ("hard") reset of all devices connected
- * to it, including recursive processing of all buses below @bus itself.  A
- * hard reset means that qbus_reset_all will reset all state of the device.
- * For PCI devices, for example, this will include the base address registers
- * or configuration space.
- *
- * Note: This function is deprecated and will be removed when it becomes unused.
- * Please use bus_cold_reset() now.
- */
-void qbus_reset_all(BusState *bus);
-void qbus_reset_all_fn(void *opaque);
-
 /**
  * device_cold_reset:
  * Reset device @dev and perform a recursive processing using the resettable
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index c0b77a62954..c5ea0adc713 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -250,60 +250,6 @@ void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
     dev->alias_required_for_version = required_for_version;
 }
 
-static int qdev_prereset(DeviceState *dev, void *opaque)
-{
-    trace_qdev_reset_tree(dev, object_get_typename(OBJECT(dev)));
-    return 0;
-}
-
-static int qbus_prereset(BusState *bus, void *opaque)
-{
-    trace_qbus_reset_tree(bus, object_get_typename(OBJECT(bus)));
-    return 0;
-}
-
-static int qdev_reset_one(DeviceState *dev, void *opaque)
-{
-    device_legacy_reset(dev);
-
-    return 0;
-}
-
-static int qbus_reset_one(BusState *bus, void *opaque)
-{
-    BusClass *bc = BUS_GET_CLASS(bus);
-    trace_qbus_reset(bus, object_get_typename(OBJECT(bus)));
-    if (bc->reset) {
-        bc->reset(bus);
-    }
-    return 0;
-}
-
-void qdev_reset_all(DeviceState *dev)
-{
-    trace_qdev_reset_all(dev, object_get_typename(OBJECT(dev)));
-    qdev_walk_children(dev, qdev_prereset, qbus_prereset,
-                       qdev_reset_one, qbus_reset_one, NULL);
-}
-
-void qdev_reset_all_fn(void *opaque)
-{
-    qdev_reset_all(DEVICE(opaque));
-}
-
-void qbus_reset_all(BusState *bus)
-{
-    trace_qbus_reset_all(bus, object_get_typename(OBJECT(bus)));
-    qbus_walk_children(bus, qdev_prereset, qbus_prereset,
-                       qdev_reset_one, qbus_reset_one, NULL);
-}
-
-void qbus_reset_all_fn(void *opaque)
-{
-    BusState *bus = opaque;
-    qbus_reset_all(bus);
-}
-
 void device_cold_reset(DeviceState *dev)
 {
     resettable_reset(OBJECT(dev), RESET_TYPE_COLD);
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 9b3ecce3b2f..6da317247f4 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -3,11 +3,6 @@ loader_write_rom(const char *name, uint64_t gpa, uint64_t size, bool isrom) "%s:
 
 # qdev.c
 qdev_reset(void *obj, const char *objtype) "obj=%p(%s)"
-qdev_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
-qdev_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
-qbus_reset(void *obj, const char *objtype) "obj=%p(%s)"
-qbus_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
-qbus_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
 qdev_update_parent_bus(void *obj, const char *objtype, void *oldp, const char *oldptype, void *newp, const char *newptype) "obj=%p(%s) old_parent=%p(%s) new_parent=%p(%s)"
 
 # resettable.c
-- 
2.25.1



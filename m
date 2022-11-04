Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C617619CE0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMt-0000km-Lu; Fri, 04 Nov 2022 12:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzM6-0006lq-VV
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLt-0000i3-63
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so3499150wmb.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvsbSFL9/X7+hG+QCwobd7oX/Vj9erH1J5f0aYS/jDg=;
 b=mhw6QbusoIMNJKftAzbRjxbwF66YGlRfvYgnJWtAqu8XoAjznJ1Wx5eTqlXv10X2X3
 bVoHZ+9sVlA6b3y9DRByq1HJHvuy17SzWSxSX64KQBMrt4ZaChS1QDgkNCTrR9fcYRoZ
 tGSM6IvPK5K2RJfUg+s2gS1QzvdM8u7jyFjL/Br2PAIzV5Bw8pw9f41CDhJQ46nIy5uR
 iSRZwRBXa4w2eIMZi9EnlUKSY9cg9diSlnSOvMpvMI4EogiW9u+UHQIK1aazOoQMYn/f
 s1mHpbjYs1g88fbt9oMWQJLKXRzmE1rZjVJYTmkjr2OB2TYtX0INHTrecPA8YiMZkE4P
 elXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvsbSFL9/X7+hG+QCwobd7oX/Vj9erH1J5f0aYS/jDg=;
 b=vw/BF2gIcpTCyFq9cDFH6QyMNX02gaH7o/zMJb5lnYbo/bjatWrJAEfIP7tblhkai6
 wAuaSZgQTJhquWuiTI1bvkcsJe5rHtldlaGhQ/yt1UO+sseVt+a8iBA6gbh7P4UbylUY
 E/yPaoCleF1jrEfvBEqDpkR6yVpUdjUqwrISw25l1jt8u3SruRjC3OrcSoISxfTsqib1
 jp/7gxVQCIlUh1uI7Jyr9Cjsr8G9vPbxhtTaUbtnoMMre3Gabe6teKJuWo+KBeqbI2NP
 ifeVbIWScSkndzA1lZYlHH9njzNrooC0MCFPR0YM6izIJWbFuTkI2y81IwmnwAwmxg0B
 4IKw==
X-Gm-Message-State: ACrzQf0GnvfLEPT7p6V6opJaWKbUPTSwLLs5ESTB39r0F0kgmmigmZhl
 L5OZ0HsxmIFfcg5mZ9r08OzD4hMQwbZ+2g==
X-Google-Smtp-Source: AMsMyM6xBxj486S2wdyYugmEtRlzDi3x7014+zTkgAM0FtxobC6dMfknOA9Bf/AWxdmhCYCiYGyhRw==
X-Received: by 2002:a1c:25c1:0:b0:3cf:4dc4:5a97 with SMTP id
 l184-20020a1c25c1000000b003cf4dc45a97mr31960218wml.147.1667578527696; 
 Fri, 04 Nov 2022 09:15:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 8/9] qdev: Remove qdev_reset_all() and qbus_reset_all()
Date: Fri,  4 Nov 2022 16:15:12 +0000
Message-Id: <20221104161513.2455862-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove the qdev_reset_all() and qbus_reset_all() functions, now we
have moved all the callers over to the new device_cold_reset() and
bus_cold_reset() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h | 26 --------------------
 hw/core/qdev.c         | 54 ------------------------------------------
 hw/core/trace-events   |  4 ----
 3 files changed, 84 deletions(-)

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
index 0806d8fcaaa..3b0f04c5c6d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -237,60 +237,6 @@ void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
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
index 9b3ecce3b2f..d6ab5c74b90 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -3,11 +3,7 @@ loader_write_rom(const char *name, uint64_t gpa, uint64_t size, bool isrom) "%s:
 
 # qdev.c
 qdev_reset(void *obj, const char *objtype) "obj=%p(%s)"
-qdev_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
-qdev_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
 qbus_reset(void *obj, const char *objtype) "obj=%p(%s)"
-qbus_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
-qbus_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
 qdev_update_parent_bus(void *obj, const char *objtype, void *oldp, const char *oldptype, void *newp, const char *newptype) "obj=%p(%s) old_parent=%p(%s) new_parent=%p(%s)"
 
 # resettable.c
-- 
2.25.1



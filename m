Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D86C890D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 00:12:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqY8-0002dE-Qy; Fri, 24 Mar 2023 19:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vS0eZAgKCrgusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXl-0002T4-H1
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:58 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vS0eZAgKCrgusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXj-00084w-21
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:57 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 oa14-20020a17090b1bce00b0023d1b58d3baso965054pjb.4
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c7vfaFT4Oek7HuFVtedcNGRSplu1piUpBKnOxQHG9tg=;
 b=rn0ERyM5nNKsTUF2oqwD2DLd5e4feuF5RZzaH3N5oJRVIPXemP5V5oStdIgmXOCcJp
 VTFu4aeSchnu0xlDg0Ta2uyHFv95TiePa3pn9m/6c5xIg63vbprCYIaiLUE7hCsvpcMd
 Xf2EhWeX1OIE4N6Xdpun+BHVUkscWt1CxbyoeQNPTw7935fxxNuvhA6uXv+DBJ4PGaGM
 oB1h1WN8nEhNxwYLgsSLEga1Km7Erw3/raDndMocKfyjliuCforN+91NuXk7SSuydkUZ
 bBdOtA+4NIbJW2Hg0Lyshsupt8pkasoqiQGAUSgNGYT1FfgRHYLh+jnlZvGZVYDaSgM5
 cnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c7vfaFT4Oek7HuFVtedcNGRSplu1piUpBKnOxQHG9tg=;
 b=p3EaYVFKO4ShCKHimgOcSz8qZg4bTauvIo/7NBswwHNV4iq3FQ5TLOaW+l6kjh7pLz
 Yt6HJf42+XUgOlcWV8+bQL2waUJab+ci7JpvjdTWczTlVkUJAUPHyKjfiaURmkBW7OF3
 ZVXzkdT1tnBzXxqThhvJ3CBCpj2ybeG72hqjYdAL96PAC+K2PKazBR2xnSN2QlFuHKhz
 E6RQ4qkj5sAWV6YPfmC/ZMxzPScxSb4xK5G5OMl3bXrkn8oavlerUYj0PgGOsrgQC7CL
 y61F7kzbR2Mw0LSXE/KaR9rJEGwJJNX8hu94P5MFsWzoqNki4T2CYSZsYu/YZyERCm50
 l7eg==
X-Gm-Message-State: AAQBX9fxabvkHCOkVd2ABurkogHFbnrN9nKgfDxcwB0hIWcz5SqMClvn
 Swi6TqHg8QGqy8LsaAOEvR44ONOGSD4huw==
X-Google-Smtp-Source: AKy350ZpuSfkom0ozNEOBUZN86Lp7RDqYadSYc677zIoAwTslb/1PI553xTIlbSpSXwbVTU4wg+vva4qm3ef9A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1781:b0:593:fcfb:208b with SMTP
 id s1-20020a056a00178100b00593fcfb208bmr2437285pfg.3.1679699389209; Fri, 24
 Mar 2023 16:09:49 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:09:03 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-7-wuhaotsh@google.com>
Subject: [PATCH v2 6/7] hw/ipmi: Add an IPMI external host device
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3vS0eZAgKCrgusfYmrqfemmejc.amkocks-bctcjlmlels.mpe@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The IPMI external host device works for Baseband Management Controller
(BMC) emulations. It works as a representation of a host class that
connects to a given BMC.  It can connect to a real host hardware or a
emulated or simulated host device. In particular it can connect to a
host QEMU instance with device ipmi-bmc-extern.

For more details of IPMI host device in BMC emulation, see
docs/specs/ipmi.rst.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 configs/devices/arm-softmmu/default.mak |   2 +
 hw/ipmi/Kconfig                         |   4 +
 hw/ipmi/ipmi_extern.c                   |  18 ++-
 hw/ipmi/ipmi_host_extern.c              | 170 ++++++++++++++++++++++++
 hw/ipmi/meson.build                     |   1 +
 include/hw/ipmi/ipmi.h                  |   4 +
 6 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 hw/ipmi/ipmi_host_extern.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c..76e902bc4b 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -25,6 +25,8 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_IPMI=y
+CONFIG_IPMI_HOST=y
 CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
diff --git a/hw/ipmi/Kconfig b/hw/ipmi/Kconfig
index 9befd4f422..d767948b79 100644
--- a/hw/ipmi/Kconfig
+++ b/hw/ipmi/Kconfig
@@ -11,6 +11,10 @@ config IPMI_EXTERN
     default y
     depends on IPMI
 
+config IPMI_HOST
+    bool
+    depends on IPMI
+
 config ISA_IPMI_KCS
     bool
     depends on ISA_BUS
diff --git a/hw/ipmi/ipmi_extern.c b/hw/ipmi/ipmi_extern.c
index 185d20c337..b9466a4d58 100644
--- a/hw/ipmi/ipmi_extern.c
+++ b/hw/ipmi/ipmi_extern.c
@@ -145,11 +145,25 @@ void ipmi_extern_handle_command(IPMIExtern *ibe,
     if (err) {
         IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
         unsigned char rsp[3];
+
         rsp[0] = cmd[0] | 0x04;
         rsp[1] = cmd[1];
         rsp[2] = err;
-        ibe->waiting_rsp = false;
-        k->handle_msg(s, msg_id, rsp, 3);
+
+        if (ibe->bmc_side) {
+            /* For BMC Side, send out an error message. */
+            addchar(ibe, msg_id);
+            for (i = 0; i < 3; ++i) {
+                addchar(ibe, rsp[i]);
+            }
+            csum = ipmb_checksum(&msg_id, 1, 0);
+            addchar(ibe, -ipmb_checksum(rsp, 3, csum));
+            continue_send(ibe);
+        } else {
+            /* For Core side, handle an error message. */
+            ibe->waiting_rsp = false;
+            k->handle_msg(s, msg_id, rsp, 3);
+        }
         goto out;
     }
 
diff --git a/hw/ipmi/ipmi_host_extern.c b/hw/ipmi/ipmi_host_extern.c
new file mode 100644
index 0000000000..c70f968eef
--- /dev/null
+++ b/hw/ipmi/ipmi_host_extern.c
@@ -0,0 +1,170 @@
+/*
+ * IPMI Host external connection
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+/*
+ * This is designed to connect to a host QEMU VM that runs ipmi_bmc_extern.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "chardev/char-fe.h"
+#include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_extern.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "qom/object.h"
+
+#define TYPE_IPMI_HOST_EXTERN "ipmi-host-extern"
+OBJECT_DECLARE_SIMPLE_TYPE(IPMIHostExtern, IPMI_HOST_EXTERN)
+
+typedef struct IPMIHostExtern {
+    IPMICore parent;
+
+    IPMIExtern conn;
+
+    IPMIInterface *responder;
+
+    uint8_t capability;
+} IPMIHostExtern;
+
+/*
+ * Handle a command (typically IPMI response) from IPMI interface
+ * and send it out to the external host.
+ */
+static void ipmi_host_extern_handle_command(IPMICore *h, uint8_t *cmd,
+        unsigned cmd_len, unsigned max_cmd_len, uint8_t msg_id)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(h);
+
+    ipmi_extern_handle_command(&ihe->conn, cmd, cmd_len, max_cmd_len, msg_id);
+}
+
+/* This function handles a control command from the host. */
+static void ipmi_host_extern_handle_hw_op(IPMICore *ic, uint8_t cmd,
+                                          uint8_t operand)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(ic);
+
+    switch (cmd) {
+    case VM_CMD_VERSION:
+        /* The host informs us the protocol version. */
+        if (unlikely(operand != VM_PROTOCOL_VERSION)) {
+            ipmi_debug("Host protocol version %u is different from our version"
+                    " %u\n", operand, VM_PROTOCOL_VERSION);
+        }
+        break;
+
+    case VM_CMD_RESET:
+        /* The host tells us a reset has happened. */
+        break;
+
+    case VM_CMD_CAPABILITIES:
+        /* The host tells us its capability. */
+        ihe->capability = operand;
+        break;
+
+    default:
+        /* The host shouldn't send us this command. Just ignore if they do. */
+        ipmi_debug("Host cmd type %02x is invalid.\n", cmd);
+        break;
+    }
+}
+
+static void ipmi_host_extern_realize(DeviceState *dev, Error **errp)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(dev);
+    IPMIInterfaceClientClass *rk;
+
+    if (ihe->responder == NULL) {
+        error_setg(errp, "IPMI host extern requires responder attribute");
+        return;
+    }
+    rk = IPMI_INTERFACE_CLIENT_GET_CLASS(ihe->responder);
+    rk->set_ipmi_handler(ihe->responder, IPMI_CORE(ihe));
+    ihe->conn.core->intf = ihe->responder;
+
+    if (!qdev_realize(DEVICE(&ihe->conn), NULL, errp)) {
+        return;
+    }
+}
+
+static int ipmi_host_extern_post_migrate(void *opaque, int version_id)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(opaque);
+
+    return ipmi_extern_post_migrate(&ihe->conn, version_id);
+}
+
+static const VMStateDescription vmstate_ipmi_host_extern = {
+    .name = TYPE_IPMI_HOST_EXTERN,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = ipmi_host_extern_post_migrate,
+    .fields      = (VMStateField[]) {
+        VMSTATE_UINT8(capability, IPMIHostExtern),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ipmi_host_extern_init(Object *obj)
+{
+    IPMICore *ic = IPMI_CORE(obj);
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
+
+    object_initialize_child(obj, "extern", &ihe->conn,
+                            TYPE_IPMI_EXTERN);
+    ihe->conn.core = ic;
+    ihe->conn.bmc_side = true;
+    vmstate_register(NULL, 0, &vmstate_ipmi_host_extern, ihe);
+}
+
+static Property ipmi_host_extern_properties[] = {
+    DEFINE_PROP_CHR("chardev", IPMIHostExtern, conn.chr),
+    DEFINE_PROP_LINK("responder", IPMIHostExtern, responder,
+                     TYPE_IPMI_INTERFACE, IPMIInterface *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ipmi_host_extern_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
+
+    device_class_set_props(dc, ipmi_host_extern_properties);
+
+    ck->handle_command = ipmi_host_extern_handle_command;
+    ck->handle_hw_op = ipmi_host_extern_handle_hw_op;
+    dc->hotpluggable = false;
+    dc->realize = ipmi_host_extern_realize;
+}
+
+static const TypeInfo ipmi_host_extern_type = {
+    .name          = TYPE_IPMI_HOST_EXTERN,
+    .parent        = TYPE_IPMI_CORE,
+    .instance_size = sizeof(IPMIHostExtern),
+    .instance_init = ipmi_host_extern_init,
+    .class_init    = ipmi_host_extern_class_init,
+};
+
+static void ipmi_host_extern_register_types(void)
+{
+    type_register_static(&ipmi_host_extern_type);
+}
+
+type_init(ipmi_host_extern_register_types)
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index edd0bf9af9..b1dd4710dc 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -7,5 +7,6 @@ ipmi_ss.add(when: 'CONFIG_PCI_IPMI_KCS', if_true: files('pci_ipmi_kcs.c'))
 ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 5ead2467f5..487d57f3ed 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -197,8 +197,12 @@ OBJECT_DECLARE_TYPE(IPMIInterfaceClient, IPMIInterfaceClientClass,
 typedef struct IPMIInterfaceClientClass IPMIInterfaceClientClass;
 typedef struct IPMIInterfaceClient IPMIInterfaceClient;
 
+struct IPMICore;
 struct IPMIInterfaceClientClass {
     IPMIInterfaceClass parent;
+
+    /* Set the IPMI handler. */
+    void (*set_ipmi_handler)(struct IPMIInterface *s, struct IPMICore *ic);
 };
 
 /*
-- 
2.40.0.348.gf938b09366-goog



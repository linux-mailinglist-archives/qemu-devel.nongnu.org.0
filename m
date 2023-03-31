Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C356D149A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:04:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39H-0003Cm-P9; Thu, 30 Mar 2023 21:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38DAmZAcKChM37547w1z77z4x.v759x5D-wxEx4676z6D.7Az@flex--komlodi.bounces.google.com>)
 id 1pi39E-0003BT-3l
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:44 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38DAmZAcKChM37547w1z77z4x.v759x5D-wxEx4676z6D.7Az@flex--komlodi.bounces.google.com>)
 id 1pi39A-0006a0-I3
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:43 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 b8-20020aa78708000000b005eaa50faa35so9796300pfo.20
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224496;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FNR2btRSIHAM/N5/5N+KWrRsj2p1b78b3jBEVu2PZkE=;
 b=rRJvJWsA7IpV0J2JTMOgpanZ5Cnowjtu2dxn/zXBYSRWrktM0N4pTCzwN6rLeawlEZ
 9OF7/0LzSy1qoTlZknwZP1/scLTIZkhvYgVUDja92bG0Xlv3omTi0Pk7nNH9xoKzvSEa
 Ye7tjZd9RBOl7FkuQ6yokoQA02BwLHwGPlE0cuoOFqLfF2dRo7mAGNLK1GULOFaaQZiv
 xA0gWmYhURI3Ltht0V+DYjVG3gd5bDrbXQ9L7BicLDRGvCCUsDRoHaDgKt5AEl5eTnxi
 R+ikwmXBsdN67XMpQ8LDHrP9JI8+TYt+V1slvEznySL35mEHK/F64311c+ObiYpoO+2v
 UFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224496;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FNR2btRSIHAM/N5/5N+KWrRsj2p1b78b3jBEVu2PZkE=;
 b=uuqWPDrXC9yTT4QH8WLV1TrKFkUu4g0S1EdZ2eSXT6sW7uJ21BKriLv96pGsfV8aYg
 /kVMJVH5z41gRVp8sKoXPX75d4uvLw/IMyLoetRxcN0kV+gKiRvsAaEo3uqsM5r7sSQJ
 DbLDgIOyRZZwud/66tRZ/gZ5EHe8q1/d05KmY4ri+oqpgw+wwPF+KFMlmUhnOYGOB3pB
 eSBMqmX3kR47RjEJzvbI6wAjQfhw2cIsURxICy+q/RlRKxJtaN24VtQjcwP/UnGJTjRg
 gNziAUpTmKu9I+YmjFZey2wP+nN0nWIpuwt0xLdG87r4pgrhdNtwEElF3+fqkm3ywE2y
 yhLg==
X-Gm-Message-State: AAQBX9f2F0x4xH02JlHjE6Ajgbk9MQDhqk1r56p6EHSingAdOBk2Hs10
 56sW4nU9iWyw4yUnHPrIvBJLqorMrOtjrf1hevm7WrVYF3GvLxKaK10wdSUkypj2p3bPNqFTp8D
 PD1lPuDk4sHQjXzpGdFzjDWlN0vYojy1eUgj8EpLH63WCRakPYClmmRf69z1Fn2Y=
X-Google-Smtp-Source: AKy350ZHuxry7XcXr9tMRg9AAzkgGFVCoPZbpzvdTgPOcPt+XhhDW5Ijij3yDc5jpfkNR33SvyVqfNdHRobe
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:902:dac9:b0:1a2:1c7:1c1f with SMTP id
 q9-20020a170902dac900b001a201c71c1fmr9786511plx.7.1680224496709; Thu, 30 Mar
 2023 18:01:36 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:17 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-3-komlodi@google.com>
Subject: [PATCH 02/16] hw/i3c: Add bus support
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=38DAmZAcKChM37547w1z77z4x.v759x5D-wxEx4676z6D.7Az@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds an I3C bus and a target class.
The bus supports:
- I3C data transmission and reception
- CCCs (including ENTDAA)
- IBIs
- legacy I2C transactions

General usage of the bus is similar to I2C. Users are expected to
initialize a bus via i3c_init_bus, and use the bus returned from the
init function to do transactions on the bus.

In order to handle IBIs, the controller provides callbacks to handle
receiving an IBI from a target, receiving (optional) additional IBI
bytes from a target, and handling when a target is done with its IBI.

Similarly, target creation is done via i3c_target_create_simple and
users use the provided I3CTarget to handle transactions.
The target has functions provided that it can use to invoke an IBI and
send additional bytes.

Along with the expected, send, recv, and event callbacks that is
expected of an I3C target, which are similar to I2C, there is a separate
callback for CCC handling.
This is to help encapsulate CCC handling and keep it separate from
target-specific read/write functionality.

To avoid repition for required CCCs among I3C targets, there is some
class-level CCC handling added. The CCC is then passed to the target in
case it needs to handle it in some way.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i3c/core.c        | 629 +++++++++++++++++++++++++++++++++++++++++++
 hw/i3c/meson.build   |   1 +
 hw/i3c/trace-events  |  16 ++
 include/hw/i3c/i3c.h | 275 +++++++++++++++++++
 4 files changed, 921 insertions(+)
 create mode 100644 hw/i3c/core.c
 create mode 100644 include/hw/i3c/i3c.h

diff --git a/hw/i3c/core.c b/hw/i3c/core.c
new file mode 100644
index 0000000000..758dd7141f
--- /dev/null
+++ b/hw/i3c/core.c
@@ -0,0 +1,629 @@
+/*
+ * QEMU I3C bus interface.
+ *
+ * Copyright 2023 Google LLC
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
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/i3c/i3c.h"
+#include "hw/qdev-properties.h"
+
+static Property i3c_props[] = {
+    DEFINE_PROP_UINT8("static-address", struct I3CTarget, static_address, 0),
+    DEFINE_PROP_UINT8("dcr", struct I3CTarget, dcr, 0),
+    DEFINE_PROP_UINT8("bcr", struct I3CTarget, bcr, 0),
+    DEFINE_PROP_UINT64("pid", struct I3CTarget, pid, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const TypeInfo i3c_bus_info = {
+    .name = TYPE_I3C_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(I3CBus),
+    .class_size = sizeof(I3CBusClass),
+};
+
+I3CBus *i3c_init_bus(DeviceState *parent, const char *name)
+{
+    return i3c_init_bus_type(TYPE_I3C_BUS, parent, name);
+}
+
+I3CBus *i3c_init_bus_type(const char *type, DeviceState *parent,
+                          const char *name)
+{
+    I3CBus *bus;
+
+    bus = I3C_BUS(qbus_new(type, parent, name));
+    QLIST_INIT(&bus->current_devs);
+    bus->broadcast = false;
+    bus->in_entdaa = false;
+    bus->in_ccc = false;
+
+    /* I2C init. */
+    g_autofree gchar *i2c_bus_name = g_strdup_printf("%s-legacy-i2c", name);
+    bus->i2c_bus = i2c_init_bus(parent, i2c_bus_name);
+
+    return bus;
+}
+
+bool i3c_bus_busy(I3CBus *bus)
+{
+    return !QLIST_EMPTY(&bus->current_devs);
+}
+
+bool i3c_target_match(I3CBus *bus, I3CTarget *target, uint8_t address)
+{
+    /* Once a target has a dynamic address, it only responds to that. */
+    uint8_t targ_addr = target->address ? target->address :
+                                          target->static_address;
+
+    if (bus->in_entdaa) {
+        if (address != I3C_BROADCAST) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: I3C Address 0x%.2x sent during "
+                          "ENTDAA instead of a broadcast address\n",
+                          object_get_canonical_path(OBJECT(bus)), address);
+                return false;
+        }
+
+        /*
+         * Targets should only ACK ENTDAA broadcasts if they have no dynamic
+         * address.
+         */
+        if (target->address == 0) {
+            I3CNode *node = g_new(struct I3CNode, 1);
+            node->target = target;
+            QLIST_INSERT_HEAD(&bus->current_devs, node, next);
+        }
+        return target->address == 0;
+    }
+
+    if ((targ_addr == address) || bus->broadcast) {
+        I3CNode *node = g_new(struct I3CNode, 1);
+        node->target = target;
+        QLIST_INSERT_HEAD(&bus->current_devs, node, next);
+        return true;
+    }
+
+    return false;
+}
+
+bool i3c_scan_bus(I3CBus *bus, uint8_t address)
+{
+    BusChild *child;
+    I3CNode *node, *next;
+
+    /* Clear out any devices from a previous (re-)START. */
+    QLIST_FOREACH_SAFE(node, &bus->current_devs, next, next) {
+        QLIST_REMOVE(node, next);
+        g_free(node);
+    }
+
+    QTAILQ_FOREACH(child, &bus->qbus.children, sibling) {
+        DeviceState *qdev = child->child;
+        I3CTarget *target = I3C_TARGET(qdev);
+
+        if (i3c_target_match(bus, target, address)) {
+            return true;
+        }
+    }
+
+    /* No one on the bus could respond. */
+    return false;
+}
+
+/* Class-level event handling, since we do some CCCs at the class level. */
+static int i3c_target_event(I3CTarget *t, enum I3CEvent event)
+{
+    I3CTargetClass *tc = I3C_TARGET_GET_CLASS(t);
+    trace_i3c_target_event(t->address, event);
+
+    if (event == I3C_STOP) {
+        t->curr_ccc = 0;
+        t->ccc_byte_offset = 0;
+        t->in_ccc = false;
+    }
+    return tc->event(t, event);
+}
+
+/*
+ * Sends a START or repeated START and the address for an I3C transaction.
+ *
+ * This function returns 0 if a device on the bus was able to respond to the
+ * address, and non-zero otherwise.
+ * A non-zero return represents a NACK.
+ */
+static int i3c_do_start_transfer(I3CBus *bus, uint8_t address,
+                                 enum I3CEvent event)
+{
+    I3CTargetClass *tc;
+    I3CNode *node;
+
+    if (address == I3C_BROADCAST) {
+        bus->broadcast = true;
+        /* If we're not in ENTDAA, a broadcast is the start of a new CCC. */
+        if (!bus->in_entdaa) {
+            bus->in_ccc = false;
+        }
+    } else {
+        bus->broadcast = false;
+    }
+
+    /* No one responded to the address, NACK it. */
+    if (!i3c_scan_bus(bus, address)) {
+        return -1;
+    }
+
+    QLIST_FOREACH(node, &bus->current_devs, next) {
+        I3CTarget *t = node->target;
+
+        tc = I3C_TARGET_GET_CLASS(t);
+        if (tc->event) {
+            int rv = i3c_target_event(t, event);
+            if (rv && !bus->broadcast) {
+                return rv;
+            }
+        }
+    }
+
+    return 0;
+}
+
+int i3c_start_transfer(I3CBus *bus, uint8_t address, bool is_recv)
+{
+    trace_i3c_start_transfer(address, is_recv);
+    return i3c_do_start_transfer(bus, address, is_recv
+                                               ? I3C_START_RECV
+                                               : I3C_START_SEND);
+}
+
+int i3c_start_recv(I3CBus *bus, uint8_t address)
+{
+    trace_i3c_start_transfer(address, true);
+    return i3c_do_start_transfer(bus, address, I3C_START_RECV);
+}
+
+int i3c_start_send(I3CBus *bus, uint8_t address)
+{
+    trace_i3c_start_transfer(address, false);
+    return i3c_do_start_transfer(bus, address, I3C_START_SEND);
+}
+
+void i3c_end_transfer(I3CBus *bus)
+{
+    I3CTargetClass *tc;
+    I3CNode *node, *next;
+
+    trace_i3c_end_transfer();
+
+    /*
+     * If we're in ENTDAA, we need to notify all devices when ENTDAA is done.
+     * This is because everyone initially participates due to the broadcast,
+     * but gradually drops out as they get assigned addresses.
+     * Since the current_devs list only stores who's currently participating,
+     * and not everyone who previously participated, we send the STOP to all
+     * children.
+     */
+    if (bus->in_entdaa) {
+        BusChild *child;
+
+        QTAILQ_FOREACH(child, &bus->qbus.children, sibling) {
+            DeviceState *qdev = child->child;
+            I3CTarget *t = I3C_TARGET(qdev);
+            tc = I3C_TARGET_GET_CLASS(t);
+            if (tc->event) {
+                i3c_target_event(t, I3C_STOP);
+            }
+        }
+    } else {
+        QLIST_FOREACH_SAFE(node, &bus->current_devs, next, next) {
+            I3CTarget *t = node->target;
+            tc = I3C_TARGET_GET_CLASS(t);
+            if (tc->event) {
+                i3c_target_event(t, I3C_STOP);
+            }
+            QLIST_REMOVE(node, next);
+            g_free(node);
+        }
+    }
+    bus->broadcast = false;
+    bus->in_entdaa = false;
+    bus->in_ccc = false;
+}
+
+/*
+ * Any CCCs that are universal across all I3C devices should be handled here.
+ * Once they're handled, we pass the CCC up to the I3C target to do anything
+ * else it may want with the bytes.
+ */
+static int i3c_target_handle_ccc_write(I3CTarget *t, const uint8_t *data,
+                                       uint32_t num_to_send, uint32_t *num_sent)
+{
+    I3CTargetClass *tc = I3C_TARGET_GET_CLASS(t);
+    *num_sent = 0;
+
+    /* Is this the start of a new CCC? */
+    if (!t->in_ccc) {
+        t->curr_ccc = *data;
+        t->in_ccc = true;
+        *num_sent = 1;
+        trace_i3c_target_handle_ccc(t->address, t->curr_ccc);
+    }
+
+    switch (t->curr_ccc) {
+    case I3C_CCC_ENTDAA:
+        /*
+         * This is the last byte of ENTDAA, the controller is assigning us an
+         * address.
+         */
+        if (t->ccc_byte_offset == 8) {
+            t->address = *data;
+            t->in_ccc = false;
+            t->curr_ccc = 0;
+            t->ccc_byte_offset = 0;
+            *num_sent = 1;
+        }
+        break;
+    case I3C_CCCD_SETDASA:
+        t->address = t->static_address;
+        break;
+    case I3C_CCC_SETAASA:
+        t->address = t->static_address;
+        break;
+    case I3C_CCC_RSTDAA:
+        t->address = 0;
+        break;
+    case I3C_CCCD_SETNEWDA:
+        /* If this isn't the CCC byte, it's our new address. */
+        if (*num_sent == 0) {
+            t->address = *data;
+            *num_sent = 1;
+        }
+        break;
+    /* Ignore other CCCs it's better to handle on a device-by-device basis. */
+    default:
+        break;
+    }
+    return tc->handle_ccc_write(t, data, num_to_send, num_sent);
+}
+
+int i3c_send_byte(I3CBus *bus, uint8_t data)
+{
+    /*
+     * Ignored, the caller can determine how many were sent based on if this was
+     * ACKed/NACKed.
+     */
+    uint32_t num_sent;
+    return i3c_send(bus, &data, 1, &num_sent);
+}
+
+int i3c_send(I3CBus *bus, const uint8_t *data, uint32_t num_to_send,
+             uint32_t *num_sent)
+{
+    I3CTargetClass *tc;
+    I3CTarget *t;
+    I3CNode *node;
+    int ret = 0;
+
+    /* If this message is a broadcast and no CCC has been found, grab it. */
+    if (bus->broadcast && !bus->in_ccc) {
+        bus->ccc = *data;
+        bus->in_ccc = true;
+        /*
+         * We need to keep track if we're currently in ENTDAA.
+         * On any other CCC, the CCC is over on a RESTART or STOP, but ENTDAA
+         * is only over on a STOP.
+         */
+        if (bus->ccc == I3C_CCC_ENTDAA) {
+            bus->in_entdaa = true;
+        }
+    }
+
+    QLIST_FOREACH(node, &bus->current_devs, next) {
+        t = node->target;
+        tc = I3C_TARGET_GET_CLASS(t);
+        if (bus->in_ccc) {
+            if (!tc->handle_ccc_write) {
+                ret = -1;
+                continue;
+            }
+            ret = i3c_target_handle_ccc_write(t, data, num_to_send, num_sent);
+            /* Targets should only NACK on a direct CCC. */
+            if (ret && !CCC_IS_DIRECT(bus->ccc)) {
+                ret = 0;
+            }
+        } else {
+            if (tc->send) {
+                ret = ret || tc->send(t, data, num_to_send, num_sent);
+            } else {
+                ret = -1;
+            }
+        }
+    }
+
+    trace_i3c_send(*num_sent, num_to_send, ret == 0);
+
+    return ret ? -1 : 0;
+}
+
+static int i3c_target_handle_ccc_read(I3CTarget *t, uint8_t *data,
+                                      uint32_t num_to_read, uint32_t *num_read)
+{
+    I3CTargetClass *tc = I3C_TARGET_GET_CLASS(t);
+    uint8_t read_count = 0;
+
+    switch (t->curr_ccc) {
+    case I3C_CCC_ENTDAA:
+        /* Return the 6-byte PID, followed by BCR then DCR. */
+        while (t->ccc_byte_offset < 6) {
+            if (read_count >= num_to_read) {
+                break;
+            }
+            data[read_count] = (t->pid >> (t->ccc_byte_offset * 8)) & 0xff;
+            t->ccc_byte_offset++;
+            read_count++;
+        }
+        if (read_count < num_to_read) {
+            data[read_count] = t->bcr;
+            t->ccc_byte_offset++;
+            read_count++;
+        }
+        if (read_count < num_to_read) {
+            data[read_count] = t->dcr;
+            t->ccc_byte_offset++;
+            read_count++;
+        }
+        *num_read = read_count;
+        break;
+    case I3C_CCCD_GETPID:
+        while (t->ccc_byte_offset < 6) {
+            if (read_count >= num_to_read) {
+                break;
+            }
+            data[read_count] = (t->pid >> (t->ccc_byte_offset * 8)) & 0xff;
+            t->ccc_byte_offset++;
+            read_count++;
+        }
+        *num_read = read_count;
+        break;
+    case I3C_CCCD_GETBCR:
+        *data = t->bcr;
+        *num_read = 1;
+        break;
+    case I3C_CCCD_GETDCR:
+        *data = t->dcr;
+        *num_read = 1;
+        break;
+    default:
+        /* Unhandled on the I3CTarget class level. */
+        break;
+    }
+
+    return tc->handle_ccc_read(t, data, num_to_read, num_read);
+}
+
+int i3c_recv_byte(I3CBus *bus, uint8_t *data)
+{
+     /*
+      * Ignored, the caller can determine how many bytes were read based on if
+      * this is ACKed/NACKed.
+      */
+    uint32_t num_read;
+    return i3c_recv(bus, data, 1, &num_read);
+}
+
+int i3c_recv(I3CBus *bus, uint8_t *data, uint32_t num_to_read,
+             uint32_t *num_read)
+{
+    int ret = 0;
+    I3CTargetClass *tc;
+    I3CTarget *t;
+
+    *data = 0xff;
+    if (!QLIST_EMPTY(&bus->current_devs)) {
+        tc = I3C_TARGET_GET_CLASS(QLIST_FIRST(&bus->current_devs)->target);
+        t = QLIST_FIRST(&bus->current_devs)->target;
+        if (bus->in_ccc) {
+            if (!tc->handle_ccc_read) {
+                return -1;
+            }
+            ret = i3c_target_handle_ccc_read(t, data, num_to_read, num_read);
+        } else {
+            if (tc->recv) {
+                /*
+                 * Targets cannot NACK on a direct transfer, so the data
+                 * is returned directly.
+                 */
+                *num_read = tc->recv(t, data, num_to_read);
+            }
+        }
+    }
+
+    trace_i3c_recv(*num_read, num_to_read, ret == 0);
+
+    return ret;
+}
+
+void i3c_nack(I3CBus *bus)
+{
+    I3CTargetClass *tc;
+    I3CNode *node;
+
+    if (QLIST_EMPTY(&bus->current_devs)) {
+        return;
+    }
+
+    QLIST_FOREACH(node, &bus->current_devs, next) {
+        tc = I3C_TARGET_GET_CLASS(node->target);
+        if (tc->event) {
+            i3c_target_event(node->target, I3C_NACK);
+        }
+    }
+}
+
+int i3c_target_send_ibi(I3CTarget *t, uint8_t addr, bool is_recv)
+{
+    I3CBus *bus = I3C_BUS(t->qdev.parent_bus);
+    I3CBusClass *bc = I3C_BUS_GET_CLASS(bus);
+    trace_i3c_target_send_ibi(addr, is_recv);
+    return bc->ibi_handle(bus, t, addr, is_recv);
+}
+
+int i3c_target_send_ibi_bytes(I3CTarget *t, uint8_t data)
+{
+    I3CBus *bus = I3C_BUS(t->qdev.parent_bus);
+    I3CBusClass *bc = I3C_BUS_GET_CLASS(bus);
+    trace_i3c_target_send_ibi_bytes(data);
+    return bc->ibi_recv(bus, data);
+}
+
+int i3c_target_ibi_finish(I3CTarget *t, uint8_t data)
+{
+    I3CBus *bus = I3C_BUS(t->qdev.parent_bus);
+    I3CBusClass *bc = I3C_BUS_GET_CLASS(bus);
+    trace_i3c_target_ibi_finish();
+    return bc->ibi_finish(bus);
+}
+
+static bool i3c_addr_is_rsvd(uint8_t addr)
+{
+    const bool is_rsvd[255] = {
+        [0x00] = true,
+        [0x01] = true,
+        [0x02] = true,
+        [0x3e] = true,
+        [0x5e] = true,
+        [0x6e] = true,
+        [0x76] = true,
+        [0x7a] = true,
+        [0x7c] = true,
+        [0x7e] = true,
+        [0x7f] = true,
+    };
+
+    return is_rsvd[addr];
+}
+
+I3CTarget *i3c_target_new(const char *name, uint8_t addr, uint8_t dcr,
+                          uint8_t bcr, uint64_t pid)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(name);
+    qdev_prop_set_uint8(dev, "static-address", addr);
+    qdev_prop_set_uint8(dev, "dcr", dcr);
+    qdev_prop_set_uint8(dev, "bcr", bcr);
+    qdev_prop_set_uint64(dev, "pid", pid);
+
+    if (i3c_addr_is_rsvd(addr)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: I3C target created with reserved "
+                      "address 0x%.2x\n",
+                      object_get_canonical_path(OBJECT(dev)), addr);
+    }
+    return I3C_TARGET(dev);
+}
+
+bool i3c_target_realize_and_unref(I3CTarget *dev, I3CBus *bus, Error **errp)
+{
+    return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
+}
+
+I3CTarget *i3c_target_create_simple(I3CBus *bus, const char *name, uint8_t addr,
+                                    uint8_t dcr, uint8_t bcr, uint64_t pid)
+{
+    I3CTarget *dev = i3c_target_new(name, addr, dcr, bcr, pid);
+    dev->address = 0;
+    i3c_target_realize_and_unref(dev, bus, &error_abort);
+
+    return dev;
+}
+
+/* Legacy I2C functions. */
+void legacy_i2c_nack(I3CBus *bus)
+{
+    trace_legacy_i2c_nack();
+    i2c_nack(bus->i2c_bus);
+}
+
+uint8_t legacy_i2c_recv(I3CBus *bus)
+{
+    uint8_t byte = i2c_recv(bus->i2c_bus);
+    trace_legacy_i2c_recv(byte);
+    return byte;
+}
+
+int legacy_i2c_send(I3CBus *bus, uint8_t data)
+{
+    trace_legacy_i2c_send(data);
+    return i2c_send(bus->i2c_bus, data);
+}
+
+int legacy_i2c_start_transfer(I3CBus *bus, uint8_t address, bool is_recv)
+{
+    trace_legacy_i2c_start_transfer(address, is_recv);
+    return i2c_start_transfer(bus->i2c_bus, address, is_recv);
+}
+
+int legacy_i2c_start_recv(I3CBus *bus, uint8_t address)
+{
+    trace_legacy_i2c_start_transfer(address, true);
+    return i2c_start_transfer(bus->i2c_bus, address, /*is_recv=*/true);
+}
+
+int legacy_i2c_start_send(I3CBus *bus, uint8_t address)
+{
+    trace_legacy_i2c_start_transfer(address, false);
+    return i2c_start_transfer(bus->i2c_bus, address, /*is_recv=*/false);
+}
+
+void legacy_i2c_end_transfer(I3CBus *bus)
+{
+    trace_legacy_i2c_end_transfer();
+    i2c_end_transfer(bus->i2c_bus);
+}
+
+I2CSlave *legacy_i2c_device_create_simple(I3CBus *bus, const char *name,
+                                          uint8_t addr)
+{
+    I2CSlave *dev = i2c_slave_new(name, addr);
+
+    i2c_slave_realize_and_unref(dev, bus->i2c_bus, &error_abort);
+    return dev;
+}
+
+static void i3c_target_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+    set_bit(DEVICE_CATEGORY_MISC, k->categories);
+    k->bus_type = TYPE_I3C_BUS;
+    device_class_set_props(k, i3c_props);
+}
+
+static const TypeInfo i3c_target_type_info = {
+    .name = TYPE_I3C_TARGET,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(I3CTarget),
+    .abstract = true,
+    .class_size = sizeof(I3CTargetClass),
+    .class_init = i3c_target_class_init,
+};
+
+static void i3c_register_types(void)
+{
+    type_register_static(&i3c_bus_info);
+    type_register_static(&i3c_target_type_info);
+}
+
+type_init(i3c_register_types)
diff --git a/hw/i3c/meson.build b/hw/i3c/meson.build
index c0c38b4c12..3599f1a396 100644
--- a/hw/i3c/meson.build
+++ b/hw/i3c/meson.build
@@ -1,3 +1,4 @@
 i3c_ss = ss.source_set()
+i3c_ss.add(when: 'CONFIG_I3C', if_true: files('core.c'))
 i3c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i3c.c'))
 softmmu_ss.add_all(when: 'CONFIG_I3C', if_true: i3c_ss)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index 3ead84eb45..cdf7cb07f6 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -5,3 +5,19 @@ aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%" PRIx64 "
 aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
+
+# core.c
+i3c_target_event(uint8_t address, uint8_t event) "I3C target 0x%" PRIx8 " event 0x%" PRIx8
+i3c_target_handle_ccc(uint8_t address, uint8_t ccc) "I3C target 0x%" PRIx8 " handling CCC 0x%" PRIx8
+i3c_target_send_ibi(uint8_t address, bool is_recv) "I3C target IBI address 0x%" PRIx8 " RnW=%d"
+i3c_target_send_ibi_bytes(uint8_t byte) "I3C target IBI byte 0x%" PRIx8
+i3c_target_ibi_finish(void) "I3C target IBI finish"
+i3c_start_transfer(uint8_t address, bool is_recv) "I3C START with address 0x%" PRIx8 " is_recv=%d"
+i3c_end_transfer(void) "I3C transfer done"
+i3c_send(uint32_t num_sent, uint32_t num_to_send, bool ack) "I3C send %" PRId32 "/%" PRId32 " bytes, ack=%d"
+i3c_recv(uint32_t num_read, uint32_t num_to_read, bool ack) "I3C recv %" PRId32 "/%" PRId32 " bytes, ack=%d"
+legacy_i2c_nack(void) "Legacy I2C NACK"
+legacy_i2c_recv(uint8_t byte) "Legacy I2C recv 0x%" PRIx8
+legacy_i2c_send(uint8_t byte) "Legacy I2C send 0x%" PRIx8
+legacy_i2c_start_transfer(uint8_t address, bool is_recv) "Legacy I2C START with address 0x%" PRIx8 " is_recv=%d"
+legacy_i2c_end_transfer(void) "Legacy I2C STOP"
diff --git a/include/hw/i3c/i3c.h b/include/hw/i3c/i3c.h
new file mode 100644
index 0000000000..dab74a0e93
--- /dev/null
+++ b/include/hw/i3c/i3c.h
@@ -0,0 +1,275 @@
+/*
+ * QEMU I3C bus interface.
+ *
+ * Copyright 2023 Google LLC
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
+#ifndef QEMU_INCLUDE_HW_I3C_I3C_H_
+#define QEMU_INCLUDE_HW_I3C_I3C_H_
+
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+#include "hw/i2c/i2c.h"
+
+#define TYPE_I3C_TARGET "i3c-target"
+OBJECT_DECLARE_TYPE(I3CTarget, I3CTargetClass, I3C_TARGET)
+
+typedef enum I3CEvent {
+    I3C_START_RECV,
+    I3C_START_SEND,
+    I3C_STOP,
+    I3C_NACK,
+} I3CEvent;
+
+typedef enum I3CCCC {
+    /* Broadcast CCCs */
+    I3C_CCC_ENEC      = 0x00,
+    I3C_CCC_DISEC     = 0x01,
+    I3C_CCC_ENTAS0    = 0x02,
+    I3C_CCC_ENTAS1    = 0x03,
+    I3C_CCC_ENTAS2    = 0x04,
+    I3C_CCC_ENTAS3    = 0x05,
+    I3C_CCC_RSTDAA    = 0x06,
+    I3C_CCC_ENTDAA    = 0x07,
+    I3C_CCC_DEFTGTS   = 0x08,
+    I3C_CCC_SETMWL    = 0x09,
+    I3C_CCC_SETMRL    = 0x0a,
+    I3C_CCC_ENTTM     = 0x0b,
+    I3C_CCC_SETBUSCON = 0x0c,
+    I3C_CCC_ENDXFER   = 0x12,
+    I3C_CCC_ENTHDR0   = 0x20,
+    I3C_CCC_ENTHDR1   = 0x21,
+    I3C_CCC_ENTHDR2   = 0x22,
+    I3C_CCC_ENTHDR3   = 0x23,
+    I3C_CCC_ENTHDR4   = 0x24,
+    I3C_CCC_ENTHDR5   = 0x25,
+    I3C_CCC_ENTHDR6   = 0x26,
+    I3C_CCC_ENTHDR7   = 0x27,
+    I3C_CCC_SETXTIME  = 0x28,
+    I3C_CCC_SETAASA   = 0x29,
+    I3C_CCC_RSTACT    = 0x2a,
+    I3C_CCC_DEFGRPA   = 0x2b,
+    I3C_CCC_RSTGRPA   = 0x2c,
+    I3C_CCC_MLANE     = 0x2d,
+    /* Direct CCCs */
+    I3C_CCCD_ENEC       = 0x80,
+    I3C_CCCD_DISEC      = 0x81,
+    I3C_CCCD_ENTAS0     = 0x82,
+    I3C_CCCD_ENTAS1     = 0x83,
+    I3C_CCCD_ENTAS2     = 0x84,
+    I3C_CCCD_ENTAS3     = 0x85,
+    I3C_CCCD_SETDASA    = 0x87,
+    I3C_CCCD_SETNEWDA   = 0x88,
+    I3C_CCCD_SETMWL     = 0x89,
+    I3C_CCCD_SETMRL     = 0x8a,
+    I3C_CCCD_GETMWL     = 0x8b,
+    I3C_CCCD_GETMRL     = 0x8c,
+    I3C_CCCD_GETPID     = 0x8d,
+    I3C_CCCD_GETBCR     = 0x8e,
+    I3C_CCCD_GETDCR     = 0x8f,
+    I3C_CCCD_GETSTATUS  = 0x90,
+    I3C_CCCD_GETACCCR   = 0x91,
+    I3C_CCCD_ENDXFER    = 0x92,
+    I3C_CCCD_SETBRGTGT  = 0x93,
+    I3C_CCCD_GETMXDS    = 0x94,
+    I3C_CCCD_GETCAPS    = 0x95,
+    I3C_CCCD_SETROUTE   = 0x96,
+    I3C_CCCD_SETXTIME   = 0x98,
+    I3C_CCCD_GETXTIME   = 0x99,
+    I3C_CCCD_RSTACT     = 0x9a,
+    I3C_CCCD_SETGRPA    = 0x9b,
+    I3C_CCCD_RSTGRPA    = 0x9c,
+    I3C_CCCD_MLANE      = 0x9d,
+} I3CCCC;
+
+#define CCC_IS_DIRECT(_ccc) (_ccc & 0x80)
+
+#define I3C_BROADCAST 0x7e
+#define I3C_HJ_ADDR 0x02
+#define I3C_ENTDAA_SIZE 8
+
+struct I3CTargetClass {
+    DeviceClass parent;
+
+    /*
+     * Controller to target. Returns 0 for success, non-zero for NAK or other
+     * error.
+     */
+    int (*send)(I3CTarget *s, const uint8_t *data, uint32_t num_to_send,
+                uint32_t *num_sent);
+    /*
+     * Target to controller. I3C targets are able to terminate reads early, so
+     * this returns the number of bytes read from the target.
+     */
+    uint32_t (*recv)(I3CTarget *s, uint8_t *data, uint32_t num_to_read);
+    /* Notify the target of a bus state change. */
+    int (*event)(I3CTarget *s, enum I3CEvent event);
+    /*
+     * Handle a read CCC transmitted from a controller.
+     * CCCs are I3C commands that I3C targets support.
+     * The target can NACK the CCC if it does not support it.
+     */
+    int (*handle_ccc_read)(I3CTarget *s, uint8_t *data, uint32_t num_to_read,
+                           uint32_t *num_read);
+    /*
+     * Handle a write CCC transmitted from a controller.
+     * CCCs are I3C commands that I3C targets support.
+     * The target can NACK the CCC if it does not support it.
+     */
+    int (*handle_ccc_write)(I3CTarget *s, const uint8_t *data,
+                            uint32_t num_to_send, uint32_t *num_sent);
+};
+
+struct I3CTarget {
+    DeviceState qdev;
+
+    uint8_t address;
+    uint8_t static_address;
+    uint8_t dcr;
+    uint8_t bcr;
+    uint64_t pid;
+
+    /* CCC State tracking. */
+    I3CCCC curr_ccc;
+    uint8_t ccc_byte_offset;
+    bool in_ccc;
+};
+
+struct I3CNode {
+    I3CTarget *target;
+    QLIST_ENTRY(I3CNode) next;
+};
+
+typedef struct I3CNode I3CNode;
+
+typedef QLIST_HEAD(I3CNodeList, I3CNode) I3CNodeList;
+
+#define TYPE_I3C_BUS "i3c-bus"
+OBJECT_DECLARE_TYPE(I3CBus, I3CBusClass, I3C_BUS)
+
+struct I3CBus {
+    BusState qbus;
+
+    /* Legacy I2C. */
+    I2CBus *i2c_bus;
+
+    I3CNodeList current_devs;
+    bool broadcast;
+    uint8_t ccc;
+    bool in_ccc;
+    bool in_entdaa;
+    uint8_t saved_address;
+};
+
+struct I3CBusClass {
+    DeviceClass parent;
+
+    /* Handle an incoming IBI request from a target */
+    int (*ibi_handle) (I3CBus *bus, I3CTarget *target, uint8_t addr,
+                       bool is_recv);
+    /* Receive data from an IBI request */
+    int (*ibi_recv) (I3CBus *bus, uint8_t data);
+    /* Do anything that needs to be done, since the IBI is finished. */
+    int (*ibi_finish) (I3CBus *bus);
+};
+
+I3CBus *i3c_init_bus(DeviceState *parent, const char *name);
+I3CBus *i3c_init_bus_type(const char *type, DeviceState *parent,
+                          const char *name);
+void i3c_set_target_address(I3CTarget *dev, uint8_t address);
+bool i3c_bus_busy(I3CBus *bus);
+
+/*
+ * Start a transfer on an I3C bus.
+ * If is_recv is known at compile-time (i.e. a device will always be sending or
+ * will always be receiving at a certain point), prefer to use i3c_start_recv or
+ * i3c_start_send instead.
+ *
+ * Returns 0 on success, non-zero on an error.
+ */
+int i3c_start_transfer(I3CBus *bus, uint8_t address, bool is_recv);
+
+/*
+ * Start a receive transfer on an I3C bus.
+ *
+ * Returns 0 on success, non-zero on an error
+ */
+int i3c_start_recv(I3CBus *bus, uint8_t address);
+
+/*
+ * Start a send transfer on an I3C bus.
+ *
+ * Returns 0 on success, non-zero on an error
+ */
+int i3c_start_send(I3CBus *bus, uint8_t address);
+
+void i3c_end_transfer(I3CBus *bus);
+void i3c_nack(I3CBus *bus);
+int i3c_send_byte(I3CBus *bus, uint8_t data);
+int i3c_send(I3CBus *bus, const uint8_t *data, uint32_t num_to_send,
+             uint32_t *num_sent);
+/*
+ * I3C receives can only NACK on a CCC. The target should NACK a CCC it does not
+ * support.
+ */
+int i3c_recv_byte(I3CBus *bus, uint8_t *data);
+int i3c_recv(I3CBus *bus, uint8_t *data, uint32_t num_to_read,
+             uint32_t *num_read);
+bool i3c_scan_bus(I3CBus *bus, uint8_t address);
+int i3c_do_entdaa(I3CBus *bus, uint8_t address, uint64_t *pid, uint8_t *bcr,
+                  uint8_t *dcr);
+int i3c_start_device_transfer(I3CTarget *dev, int send_length);
+bool i3c_target_match(I3CBus *bus, I3CTarget *target, uint8_t address);
+int i3c_target_send_ibi(I3CTarget *t, uint8_t addr, bool is_recv);
+int i3c_target_send_ibi_bytes(I3CTarget *t, uint8_t data);
+int i3c_target_ibi_finish(I3CTarget *t, uint8_t data);
+
+/*
+ * Legacy I2C functions.
+ *
+ * These are wrapper for I2C functions that take in an I3C bus instead of an I2C
+ * bus. Internally they use the I2C bus (and devices attached to it) that's a
+ * part of the I3C bus
+ */
+void legacy_i2c_nack(I3CBus *bus);
+uint8_t legacy_i2c_recv(I3CBus *bus);
+int legacy_i2c_send(I3CBus *bus, uint8_t data);
+int legacy_i2c_start_transfer(I3CBus *bus, uint8_t address, bool is_recv);
+int legacy_i2c_start_recv(I3CBus *bus, uint8_t address);
+int legacy_i2c_start_send(I3CBus *bus, uint8_t address);
+void legacy_i2c_end_transfer(I3CBus *bus);
+I2CSlave *legacy_i2c_device_create_simple(I3CBus *bus, const char *name,
+                                          uint8_t addr);
+
+/**
+ * Create an I3C Target.
+ *
+ * The target returned from this function still needs to be realized.
+ */
+I3CTarget *i3c_target_new(const char *name, uint8_t addr, uint8_t dcr,
+                          uint8_t bcr, uint64_t pid);
+
+/**
+ * Create and realize an I3C target.
+ *
+ * Create the target, initialize it, put it on the specified I3C bus, and
+ * realize it.
+ */
+I3CTarget *i3c_target_create_simple(I3CBus *bus, const char *name,
+                                    uint8_t addr, uint8_t dcr, uint8_t bcr,
+                                    uint64_t pid);
+
+/* Realize and drop the reference count on an I3C target. */
+bool i3c_target_realize_and_unref(I3CTarget *dev, I3CBus *bus, Error **errp);
+
+#endif  /* QEMU_INCLUDE_HW_I3C_I3C_H_ */
-- 
2.40.0.348.gf938b09366-goog



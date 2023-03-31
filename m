Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBC6D14A0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39U-0003Gj-V7; Thu, 30 Mar 2023 21:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3AzEmZAcKCiYMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com>)
 id 1pi39S-0003GF-OM
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:58 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3AzEmZAcKCiYMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com>)
 id 1pi39Q-0006cW-Hb
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:58 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e186-20020a2537c3000000b00b72501acf50so20660617yba.20
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224515;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o2ENwSuVAXUNhtrBnxjBNDFE8Q8MI8xhRWexpQ+m/VQ=;
 b=N5LcqOzWJp6EynDhdv+u/sdMJ6BJZvIOauwPeElfFxTnQRAxflbOovdUDYOI75r2l2
 7cLzlAmvqguUbhU9JZfT2pqXdRtXpi88Glpj3Z5yPXkJSkGRwugL+dlYUz4L427Jwy9s
 /UwtGzKHiwxjNUe23+38/Re9lMP8eKFV/xFmcp+9aUspu8YKboJTBPArbSGALDyU6+0r
 Zcd60GSVLF4gcqJp76gJGhRtdmFqfyngrLT9SQxTSVD5IKqgzaQ/tDdepPwqrD577mvJ
 gzMdjxUkADpk9Kk3Lq6Ga28k3jbhLioycUt3QtpCNh41Z2xwl+Eoxwgv6hbL7qN1iHD8
 4mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224515;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2ENwSuVAXUNhtrBnxjBNDFE8Q8MI8xhRWexpQ+m/VQ=;
 b=auIg8NBpsM6uDxhj41p4bug5gHR3zASH3s4JFRXEtWJwpC3Lnj2KudFIVElMAIhQ9x
 0Qa+5Ld5mwObrA3AJ1yBh/+S85Ql0f2Udl/5j8oC/6jiFUcbG1YPp32Huv3VkAAXr8Iu
 ROPnU98UOjCnHrpQ37s/5vN7oYXkW0QcyP/qAfABML98N43EcZ9trUx9Mqj2lk6rB5v7
 UMEAG2MpVwE+vIG+DewakaHGoGkq+KshAWLLMp+gIz1t+z3i681XXhUodp8pFWYAv5wO
 V5VwhovPW+37eBu+3lHP1ZnZ7A31bSdmxndOcbL4ZQatiuNMxVOMRr/bkw6CIYdsj8Bg
 oyaw==
X-Gm-Message-State: AAQBX9eBEQQudTr/hLEAcaOOwBd5poiQFWloqIlYlmZfdLE2HTYSOtuD
 Cgm31PBwmgmsETdchhWo4FJ/yugMPv7z+Dgy/EwXwe8xH21MDcAWFDDLIhEZGzOQ6uuFAllFUfx
 57Hsk3hJeFbvy+v8xeuL31ROHvDcAd819+4YnUXd1IbVfnGbUjYEn6b7+yNoyMyQ=
X-Google-Smtp-Source: AKy350bdsrlNSZS4Xoln6FeN51C/WR5SV4oVGQOLfeyBJ1jBN3HN/g29TxyIZJXLXi8mkmvscgcLLSjkptus
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6902:1004:b0:b75:968e:f282 with SMTP
 id w4-20020a056902100400b00b75968ef282mr16619608ybt.11.1680224515023; Thu, 30
 Mar 2023 18:01:55 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:28 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-14-komlodi@google.com>
Subject: [PATCH 13/16] hw/i3c: Add Mock target
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3AzEmZAcKCiYMQONQFKIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--komlodi.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

Adds a simple i3c device to be used for testing in lieu of a real
device.

The mock target supports the following features:
- A buffer that users can read and write to.
- CCC support for commonly used CCCs when probing devices on an I3C bus.
- IBI sending upon receiving a user-defined byte.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/Kconfig               |  10 ++
 hw/i3c/meson.build           |   1 +
 hw/i3c/mock-target.c         | 312 +++++++++++++++++++++++++++++++++++
 hw/i3c/trace-events          |   9 +
 include/hw/i3c/mock-target.h |  60 +++++++
 5 files changed, 392 insertions(+)
 create mode 100644 hw/i3c/mock-target.c
 create mode 100644 include/hw/i3c/mock-target.h

diff --git a/hw/i3c/Kconfig b/hw/i3c/Kconfig
index e07fe445c6..f97f4066a9 100644
--- a/hw/i3c/Kconfig
+++ b/hw/i3c/Kconfig
@@ -1,2 +1,12 @@
 config I3C
     bool
+
+config I3C_DEVICES
+    # Device group for i3c devices which can reasonably be user-plugged to any
+    # board's i3c bus.
+    bool
+
+config MOCK_TARGET
+    bool
+    select I3C
+    default y if I3C_DEVICES
diff --git a/hw/i3c/meson.build b/hw/i3c/meson.build
index 3599f1a396..0f6268063e 100644
--- a/hw/i3c/meson.build
+++ b/hw/i3c/meson.build
@@ -1,4 +1,5 @@
 i3c_ss = ss.source_set()
 i3c_ss.add(when: 'CONFIG_I3C', if_true: files('core.c'))
 i3c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i3c.c'))
+i3c_ss.add(when: 'CONFIG_MOCK_TARGET', if_true: files('mock-target.c'))
 softmmu_ss.add_all(when: 'CONFIG_I3C', if_true: i3c_ss)
diff --git a/hw/i3c/mock-target.c b/hw/i3c/mock-target.c
new file mode 100644
index 0000000000..388d21d5ca
--- /dev/null
+++ b/hw/i3c/mock-target.c
@@ -0,0 +1,312 @@
+/*
+ * Mock I3C Device
+ *
+ * Copyright (c) 2023 Google LLC
+ *
+ * The mock I3C device can be thought of as a simple EEPROM. It has a buffer,
+ * and the pointer in the buffer is reset to 0 on an I3C STOP.
+ * To write to the buffer, issue a private write and send data.
+ * To read from the buffer, issue a private read.
+ *
+ * The mock target also supports sending target interrupt IBIs.
+ * To issue an IBI, set the 'ibi-magic-num' property to a non-zero number, and
+ * send that number in a private transaction. The mock target will issue an IBI
+ * after 1 second.
+ *
+ * It also supports a handful of CCCs that are typically used when probing I3C
+ * devices.
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
+#include "trace.h"
+#include "hw/i3c/i3c.h"
+#include "hw/i3c/mock-target.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+
+#ifndef MOCK_TARGET_DEBUG
+#define MOCK_TARGET_DEBUG 0
+#endif
+
+#define DB_PRINTF(...) do { \
+        if (MOCK_TARGET_DEBUG) { \
+            qemu_log("%s: ", __func__); \
+            qemu_log(__VA_ARGS__); \
+        } \
+    } while (0)
+
+#define IBI_DELAY_NS (1 * 1000 * 1000)
+
+static uint32_t mock_target_rx(I3CTarget *i3c, uint8_t *data,
+                               uint32_t num_to_read)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+    uint32_t i;
+
+    /* Bounds check. */
+    if (s->p_buf == s->cfg.buf_size) {
+        return 0;
+    }
+
+    for (i = 0; i < num_to_read; i++) {
+        data[i] = s->buf[s->p_buf];
+        trace_mock_target_rx(data[i]);
+        s->p_buf++;
+        if (s->p_buf == s->cfg.buf_size) {
+            break;
+        }
+    }
+
+    /* Return the number of bytes we're sending to the controller. */
+    return i;
+}
+
+static void mock_target_ibi_timer_start(MockTargetState *s)
+{
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod(&s->qtimer, now + IBI_DELAY_NS);
+}
+
+static int mock_target_tx(I3CTarget *i3c, const uint8_t *data,
+                          uint32_t num_to_send, uint32_t *num_sent)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+    int ret;
+    uint32_t to_write;
+
+    if (s->cfg.ibi_magic && num_to_send == 1 && s->cfg.ibi_magic == *data) {
+        mock_target_ibi_timer_start(s);
+        return 0;
+    }
+
+    /* Bounds check. */
+    if (num_to_send + s->p_buf > s->cfg.buf_size) {
+        to_write = s->cfg.buf_size - s->p_buf;
+        ret = -1;
+    } else {
+        to_write = num_to_send;
+        ret = 0;
+    }
+    for (uint32_t i = 0; i < to_write; i++) {
+        trace_mock_target_tx(data[i]);
+        s->buf[s->p_buf] = data[i];
+        s->p_buf++;
+    }
+    return ret;
+}
+
+static int mock_target_event(I3CTarget *i3c, enum I3CEvent event)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+
+    trace_mock_target_event(event);
+    if (event == I3C_STOP) {
+        s->in_ccc = false;
+        s->curr_ccc = 0;
+        s->ccc_byte_offset = 0;
+        s->p_buf = 0;
+    }
+
+    return 0;
+}
+
+static int mock_target_handle_ccc_read(I3CTarget *i3c, uint8_t *data,
+                                       uint32_t num_to_read, uint32_t *num_read)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+
+    switch (s->curr_ccc) {
+    case I3C_CCCD_GETMXDS:
+        /* Default data rate for I3C. */
+        while (s->ccc_byte_offset < num_to_read) {
+            if (s->ccc_byte_offset >= 2) {
+                break;
+            }
+            data[s->ccc_byte_offset] = 0;
+            *num_read = s->ccc_byte_offset;
+            s->ccc_byte_offset++;
+        }
+        break;
+    case I3C_CCCD_GETCAPS:
+        /* Support I3C version 1.1.x, no other features. */
+        while (s->ccc_byte_offset < num_to_read) {
+            if (s->ccc_byte_offset >= 2) {
+                break;
+            }
+            if (s->ccc_byte_offset == 0) {
+                data[s->ccc_byte_offset] = 0;
+            } else {
+                data[s->ccc_byte_offset] = 0x01;
+            }
+            *num_read = s->ccc_byte_offset;
+            s->ccc_byte_offset++;
+        }
+        break;
+    case I3C_CCCD_GETMWL:
+    case I3C_CCCD_GETMRL:
+        /* MWL/MRL is MSB first. */
+        while (s->ccc_byte_offset < num_to_read) {
+            if (s->ccc_byte_offset >= 2) {
+                break;
+            }
+            data[s->ccc_byte_offset] = (s->cfg.buf_size &
+                                        (0xff00 >> (s->ccc_byte_offset * 8))) >>
+                                        (8 - (s->ccc_byte_offset * 8));
+            s->ccc_byte_offset++;
+            *num_read = num_to_read;
+        }
+        break;
+    case I3C_CCC_ENTDAA:
+    case I3C_CCCD_GETPID:
+    case I3C_CCCD_GETBCR:
+    case I3C_CCCD_GETDCR:
+        /* Nothing to do. */
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Unhandled CCC 0x%.2x\n", s->curr_ccc);
+        return -1;
+    }
+
+    trace_mock_target_handle_ccc_read(*num_read, num_to_read);
+    return 0;
+}
+
+static int mock_target_handle_ccc_write(I3CTarget *i3c, const uint8_t *data,
+                                        uint32_t num_to_send,
+                                        uint32_t *num_sent)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+
+    if (!s->curr_ccc) {
+        s->in_ccc = true;
+        s->curr_ccc = *data;
+        trace_mock_target_new_ccc(s->curr_ccc);
+    }
+
+    *num_sent = 1;
+    switch (s->curr_ccc) {
+    case I3C_CCC_ENEC:
+        s->can_ibi = true;
+        break;
+    case I3C_CCC_DISEC:
+        s->can_ibi = false;
+        break;
+    case I3C_CCC_ENTDAA:
+    case I3C_CCC_SETAASA:
+    case I3C_CCC_RSTDAA:
+    case I3C_CCCD_SETDASA:
+    case I3C_CCCD_GETPID:
+    case I3C_CCCD_GETBCR:
+    case I3C_CCCD_GETDCR:
+    case I3C_CCCD_GETMWL:
+    case I3C_CCCD_GETMRL:
+    case I3C_CCCD_GETMXDS:
+    case I3C_CCCD_GETCAPS:
+        /* Nothing to do. */
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Unhandled CCC 0x%.2x\n", s->curr_ccc);
+        return -1;
+    }
+
+    trace_mock_target_handle_ccc_read(*num_sent, num_to_send);
+    return 0;
+}
+
+static void mock_target_do_ibi(MockTargetState *s)
+{
+    if (!s->can_ibi) {
+        DB_PRINTF("IBIs disabled by controller");
+        return;
+    }
+
+    trace_mock_target_do_ibi(s->i3c.address, true);
+    int nack = i3c_target_send_ibi(&s->i3c, s->i3c.address, /*is_recv=*/true);
+    /* Getting NACKed isn't necessarily an error, just print it out. */
+    if (nack) {
+        DB_PRINTF("NACKed from controller when sending target interrupt.\n");
+    }
+}
+
+static void mock_target_timer_elapsed(void *opaque)
+{
+    MockTargetState *s = MOCK_TARGET(opaque);
+    timer_del(&s->qtimer);
+    mock_target_do_ibi(s);
+}
+
+static void mock_target_reset(I3CTarget *i3c)
+{
+    MockTargetState *s = MOCK_TARGET(i3c);
+    s->can_ibi = false;
+}
+
+static void mock_target_realize(DeviceState *dev, Error **errp)
+{
+    MockTargetState *s = MOCK_TARGET(dev);
+    s->buf = g_new0(uint8_t, s->cfg.buf_size);
+    mock_target_reset(&s->i3c);
+}
+
+static void mock_target_init(Object *obj)
+{
+    MockTargetState *s = MOCK_TARGET(obj);
+    s->can_ibi = false;
+
+    /* For IBIs. */
+    timer_init_ns(&s->qtimer, QEMU_CLOCK_VIRTUAL, mock_target_timer_elapsed, s);
+}
+
+static Property remote_i3c_props[] = {
+    /* The size of the internal buffer. */
+    DEFINE_PROP_UINT32("buf-size", MockTargetState, cfg.buf_size, 0x100),
+    /*
+     * If the mock target receives this number, it will issue an IBI after
+     * 1 second. Disabled if the IBI magic number is 0.
+     */
+    DEFINE_PROP_UINT8("ibi-magic-num", MockTargetState, cfg.ibi_magic, 0x00),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mock_target_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I3CTargetClass *k = I3C_TARGET_CLASS(klass);
+
+    dc->realize = mock_target_realize;
+    k->event = mock_target_event;
+    k->recv = mock_target_rx;
+    k->send = mock_target_tx;
+    k->handle_ccc_read = mock_target_handle_ccc_read;
+    k->handle_ccc_write = mock_target_handle_ccc_write;
+
+    device_class_set_props(dc, remote_i3c_props);
+}
+
+static const TypeInfo mock_target_info = {
+    .name          = TYPE_MOCK_TARGET,
+    .parent        = TYPE_I3C_TARGET,
+    .instance_size = sizeof(MockTargetState),
+    .instance_init = mock_target_init,
+    .class_init    = mock_target_class_init,
+};
+
+static void mock_target_register_types(void)
+{
+    type_register_static(&mock_target_info);
+}
+
+type_init(mock_target_register_types)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index 71e3059f8d..74c5a5dd6e 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -34,3 +34,12 @@ legacy_i2c_recv(uint8_t byte) "Legacy I2C recv 0x%" PRIx8
 legacy_i2c_send(uint8_t byte) "Legacy I2C send 0x%" PRIx8
 legacy_i2c_start_transfer(uint8_t address, bool is_recv) "Legacy I2C START with address 0x%" PRIx8 " is_recv=%d"
 legacy_i2c_end_transfer(void) "Legacy I2C STOP"
+
+# mock-target.c
+mock_target_rx(uint8_t byte) "I3C mock target read 0x%" PRIx8
+mock_target_tx(uint8_t byte) "I3C mock target write 0x%" PRIx8
+mock_target_event(uint8_t event) "I3C mock target event 0x%" PRIx8
+mock_target_handle_ccc_read(uint32_t num_read, uint32_t num_to_read) "I3C mock target read %" PRId32 "/%" PRId32 " bytes"
+mock_target_new_ccc(uint8_t ccc) "I3C mock target handle CCC 0x%" PRIx8
+mock_target_handle_ccc_write(uint32_t num_sent, uint32_t num_to_send) "I3C mock target send %" PRId32 "/%" PRId32 " bytes"
+mock_target_do_ibi(uint8_t address, bool is_recv) "I3C mock target IBI with address 0x%" PRIx8 " RnW=%d"
diff --git a/include/hw/i3c/mock-target.h b/include/hw/i3c/mock-target.h
new file mode 100644
index 0000000000..87df0e014b
--- /dev/null
+++ b/include/hw/i3c/mock-target.h
@@ -0,0 +1,60 @@
+#ifndef MOCK_TARGET_H_
+#define MOCK_TARGET_H_
+
+/*
+ * Mock I3C Device
+ *
+ * Copyright (c) 2023 Google LLC
+ *
+ * The mock I3C device can be thought of as a simple EEPROM. It has a buffer,
+ * and the pointer in the buffer is reset to 0 on an I3C STOP.
+ * To write to the buffer, issue a private write and send data.
+ * To read from the buffer, issue a private read.
+ *
+ * The mock target also supports sending target interrupt IBIs.
+ * To issue an IBI, set the 'ibi-magic-num' property to a non-zero number, and
+ * send that number in a private transaction. The mock target will issue an IBI
+ * after 1 second.
+ *
+ * It also supports a handful of CCCs that are typically used when probing I3C
+ * devices.
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
+#include "qemu/timer.h"
+#include "hw/i3c/i3c.h"
+
+#define TYPE_MOCK_TARGET "mock-target"
+OBJECT_DECLARE_SIMPLE_TYPE(MockTargetState, MOCK_TARGET)
+
+struct MockTargetState {
+    I3CTarget i3c;
+
+    /* General device state */
+    bool can_ibi;
+    QEMUTimer qtimer;
+    size_t p_buf;
+    uint8_t *buf;
+
+    /* For Handing CCCs. */
+    bool in_ccc;
+    I3CCCC curr_ccc;
+    uint8_t ccc_byte_offset;
+
+    struct {
+        uint32_t buf_size;
+        uint8_t ibi_magic;
+    } cfg;
+};
+
+#endif
-- 
2.40.0.348.gf938b09366-goog



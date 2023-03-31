Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0A6D149F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39W-0003IZ-MC; Thu, 30 Mar 2023 21:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BDEmZAcKCicNRPORGLJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--komlodi.bounces.google.com>)
 id 1pi39V-0003Gk-0I
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:02:01 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BDEmZAcKCicNRPORGLJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--komlodi.bounces.google.com>)
 id 1pi39S-0006ch-8s
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:02:00 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 kp6-20020a170903280600b001a2945a7fdeso1175561plb.18
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224516;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8JwBrM+TQ4UJZK9/xq307nM32tJrEu/DqbElWjwaj4E=;
 b=kI4haCV0UE5dEZGmlgFJnlNrdKk9UQxtoZxnKjisK7cPyZWUGskvlr0gEZweD5H0pW
 JoOOznxAN2sv6UpcyBCW7lfusIE12NkSgMiCjU1Q+7rfcvja3Bu070lytwqUjez2GWSA
 PuOfuBoFH5g7wc+KeMC40pahOV0eETa/8Z27Zoy+PldfqmjFEBD+j/xGbGJim1tJnmBc
 dKFSMVoMarHIkleqI40cHCYQ1RKO5PzbnKFf91/b31GaB/o9g06TvIlC+ekrUdCZxdc+
 uLAvmCLbYa0BKiz7vL2oNMnePL7A5989VaJ7r0/v8pAZrrc+VMCbf0B/PLVseyKxH4Ci
 ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224516;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JwBrM+TQ4UJZK9/xq307nM32tJrEu/DqbElWjwaj4E=;
 b=y+Sa6sM02YhCaRdFeP0SW7kidRQH/bOcqZS18SVeeUtd2jmn0eTLh7GskqZW9+xSub
 lxiArfGqSAoc4DeizHP9d7jgusBSrizUOOmK+2mnNXvJozo7g0M1nirZ8t0E0qtlbBlr
 X8XRu63nvzTPVFHYVZqYpk7TYTDv/3+1N2CHx+FixkMp19AarGJbiD/5fjI2MY8Q08ey
 wQX1AoDeZb8kNrm1wKQdYi3eK1uBQRmC6UYEdHNvFo460ui6Nj+Lo1uWK2zzIi6c706w
 8WrBk2Nb83qsvxr6/esC54e7T+DBCN5Q8AH5YRKX5FvCYDApOan9j0JZNNrErsXvSYI1
 Nm1g==
X-Gm-Message-State: AAQBX9eWaHeM9YVPug2gtn8rs9jA+dAO36G2WN6IaUQ96RlLHeIYzT3W
 7rVR6FWs0WG/NqqTwUS2wcbmyjeltX6pGX6p7pWW5z3HyMEAwIwUJDBXWQBkzf3N/6n0Kxl0drP
 ElNOYxyYodyBAeIc1PBzMX2YAvdgpLXgzaK1XJcuJeQOWGm6g8T0s0plsb/odnCQ=
X-Google-Smtp-Source: AKy350bQxS7ySuj8jT8fr/jhdVGyEca0kBEcwWa8RVBS2SfMfhJjKthrHXITVB9qTwOAR7WfWa77KPEPsLxo
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:1883:b0:625:cff9:8b8d with SMTP
 id x3-20020a056a00188300b00625cff98b8dmr12750020pfh.2.1680224516547; Thu, 30
 Mar 2023 18:01:56 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:29 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-15-komlodi@google.com>
Subject: [PATCH 14/16] hw/i3c: remote_i3c: Add model
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3BDEmZAcKCicNRPORGLJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
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

Adds a model to communicate to remote I3C devices over chardev. This
allows QEMU to communicate to I3C targets that exist outside of QEMU.

The remote I3C protocol is as follows:
On an I3C private and CCC TX (controller -> target)
- 1-byte opcode
- 4-byte number of bytes in the packet as a LE uint32
- n-byte payload

On an I3C private and CCC RX (target -> controller)
Controller to target:
- 1-byte opcode
- 4-byte number of bytes to read as a LE uint32
Remote target response:
- 4-byte number of bytes in the packet as a LE uint32
- n-byte payload

IBI (target -> controller, initiated by target)
- 1-byte opcode
- 1-byte IBI address
- 1-byte RnW boolean
- 4-byte length of IBI payload from target as a LE uint32 (can be 0)
- n-byte IBI payload

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
---
 hw/i3c/Kconfig              |   5 +
 hw/i3c/meson.build          |   1 +
 hw/i3c/remote-i3c.c         | 469 ++++++++++++++++++++++++++++++++++++
 hw/i3c/trace-events         |   7 +
 include/hw/i3c/remote-i3c.h |  72 ++++++
 5 files changed, 554 insertions(+)
 create mode 100644 hw/i3c/remote-i3c.c
 create mode 100644 include/hw/i3c/remote-i3c.h

diff --git a/hw/i3c/Kconfig b/hw/i3c/Kconfig
index f97f4066a9..09b83578f3 100644
--- a/hw/i3c/Kconfig
+++ b/hw/i3c/Kconfig
@@ -10,3 +10,8 @@ config MOCK_TARGET
     bool
     select I3C
     default y if I3C_DEVICES
+
+config REMOTE_I3C
+    bool
+    select I3C
+    default y if I3C_DEVICES
diff --git a/hw/i3c/meson.build b/hw/i3c/meson.build
index 0f6268063e..5bc900de5b 100644
--- a/hw/i3c/meson.build
+++ b/hw/i3c/meson.build
@@ -2,4 +2,5 @@ i3c_ss = ss.source_set()
 i3c_ss.add(when: 'CONFIG_I3C', if_true: files('core.c'))
 i3c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i3c.c'))
 i3c_ss.add(when: 'CONFIG_MOCK_TARGET', if_true: files('mock-target.c'))
+i3c_ss.add(when: 'CONFIG_REMOTE_I3C', if_true: files('remote-i3c.c'))
 softmmu_ss.add_all(when: 'CONFIG_I3C', if_true: i3c_ss)
diff --git a/hw/i3c/remote-i3c.c b/hw/i3c/remote-i3c.c
new file mode 100644
index 0000000000..20a45e58d9
--- /dev/null
+++ b/hw/i3c/remote-i3c.c
@@ -0,0 +1,469 @@
+/*
+ * Remote I3C Device
+ *
+ * Copyright (c) 2023 Google LLC
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
+#include "qemu/bswap.h"
+#include "qemu/log.h"
+#include "qemu/fifo8.h"
+#include "chardev/char-fe.h"
+#include "trace.h"
+#include "hw/i3c/i3c.h"
+#include "hw/i3c/remote-i3c.h"
+#include "hw/qdev-properties-system.h"
+
+typedef enum {
+    IBI_RX_STATE_DONE = 0,
+    IBI_RX_STATE_READ_ADDR = 1,
+    IBI_RX_STATE_READ_RNW = 2,
+    IBI_RX_STATE_READ_SIZE = 3,
+    IBI_RX_STATE_READ_DATA = 4,
+} IBIRXState;
+
+typedef struct {
+    uint8_t addr;
+    bool is_recv;
+    uint32_t num_bytes;
+    uint8_t *data;
+} IBIData;
+
+typedef struct {
+    I3CTarget parent_obj;
+    CharBackend chr;
+    /* For ease of debugging. */
+
+    struct {
+        char *name;
+        uint32_t buf_size;
+    } cfg;
+
+    /* Intermediate buffer to store IBI data received over socket. */
+    IBIData ibi_data;
+    Fifo8 tx_fifo;
+    Fifo8 rx_fifo;
+    uint8_t current_cmd;
+    IBIRXState ibi_rx_state;
+    /*
+     * To keep track of where we are in reading in data that's longer than
+     * 1-byte.
+     */
+    uint32_t ibi_bytes_rxed;
+} RemoteI3C;
+
+static uint32_t remote_i3c_recv(I3CTarget *t, uint8_t *data,
+                                uint32_t num_to_read)
+{
+    RemoteI3C *i3c = REMOTE_I3C(t);
+    uint8_t type = REMOTE_I3C_RECV;
+    uint32_t num_read;
+
+    qemu_chr_fe_write_all(&i3c->chr, &type, 1);
+    uint32_t num_to_read_le = cpu_to_le32(num_to_read);
+    qemu_chr_fe_write_all(&i3c->chr, (uint8_t *)&num_to_read_le,
+                          sizeof(num_to_read_le));
+    /*
+     * The response will first contain the size of the packet, as a LE uint32.
+     */
+    qemu_chr_fe_read_all(&i3c->chr, (uint8_t *)&num_read, sizeof(num_read));
+
+    num_read = le32_to_cpu(num_read);
+    qemu_chr_fe_read_all(&i3c->chr, data, num_read);
+    trace_remote_i3c_recv(i3c->cfg.name, num_read, num_to_read);
+    return num_read;
+}
+
+static inline bool remote_i3c_tx_in_progress(RemoteI3C *i3c)
+{
+    return !fifo8_is_empty(&i3c->tx_fifo);
+}
+
+static int remote_i3c_chr_send_bytes(RemoteI3C *i3c)
+{
+    uint32_t i;
+    uint32_t num_bytes = fifo8_num_used(&i3c->tx_fifo);
+    g_autofree uint8_t *buf = g_new0(uint8_t, num_bytes);
+
+    qemu_chr_fe_write_all(&i3c->chr, &i3c->current_cmd,
+                          sizeof(i3c->current_cmd));
+
+    /* The FIFO data is stored in a ring buffer, move it into a linear one. */
+    for (i = 0; i < num_bytes; i++) {
+        buf[i] = fifo8_pop(&i3c->tx_fifo);
+    }
+
+    uint32_t num_bytes_le = cpu_to_le32(num_bytes);
+    qemu_chr_fe_write_all(&i3c->chr, (uint8_t *)&num_bytes_le, 4);
+    qemu_chr_fe_write_all(&i3c->chr, buf, num_bytes);
+    trace_remote_i3c_send(i3c->cfg.name, num_bytes, i3c->current_cmd ==
+                                                   REMOTE_I3C_HANDLE_CCC_WRITE);
+
+    return 0;
+}
+
+static bool remote_i3c_tx_fifo_push(RemoteI3C *i3c, const uint8_t *data,
+                                    uint32_t num_to_send, uint32_t *num_sent)
+{
+    uint32_t num_to_push = num_to_send;
+    bool ack = true;
+
+    /*
+     * For performance reasons, we buffer data being sent from the controller to
+     * us.
+     * If this FIFO has data in it, we transmit it when we receive an I3C
+     * STOP or START.
+     */
+    if (fifo8_num_free(&i3c->tx_fifo) < num_to_send) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: TX FIFO buffer full.\n",
+                      object_get_canonical_path(OBJECT(i3c)), i3c->cfg.name);
+        num_to_push = fifo8_num_free(&i3c->tx_fifo);
+        ack = false;
+    }
+
+    *num_sent = num_to_push;
+    for (uint32_t i = 0; i < num_to_push; i++) {
+        fifo8_push(&i3c->tx_fifo, data[i]);
+    }
+
+    return ack;
+}
+
+static int remote_i3c_send(I3CTarget *t, const uint8_t *data,
+                           uint32_t num_to_send, uint32_t *num_sent)
+{
+    RemoteI3C *i3c = REMOTE_I3C(t);
+    i3c->current_cmd = REMOTE_I3C_SEND;
+    if (!remote_i3c_tx_fifo_push(i3c, data, num_to_send, num_sent)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static int remote_i3c_handle_ccc_read(I3CTarget *t, uint8_t *data,
+                                      uint32_t num_to_read, uint32_t *num_read)
+{
+    RemoteI3C *i3c = REMOTE_I3C(t);
+    uint8_t type = REMOTE_I3C_HANDLE_CCC_READ;
+
+    qemu_chr_fe_write_all(&i3c->chr, &type, 1);
+    /*
+     * The response will first contain the size of the packet, as a LE uint32.
+     */
+    qemu_chr_fe_read_all(&i3c->chr, (uint8_t *)num_read, 4);
+    *num_read = le32_to_cpu(*num_read);
+    qemu_chr_fe_read_all(&i3c->chr, data, *num_read);
+    trace_remote_i3c_ccc_read(i3c->cfg.name, *num_read, num_to_read);
+
+    return 0;
+}
+
+static int remote_i3c_handle_ccc_write(I3CTarget *t, const uint8_t *data,
+                                       uint32_t num_to_send, uint32_t *num_sent)
+{
+    RemoteI3C *i3c = REMOTE_I3C(t);
+    i3c->current_cmd = REMOTE_I3C_HANDLE_CCC_WRITE;
+    if (!remote_i3c_tx_fifo_push(i3c, data, num_to_send, num_sent)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static int remote_i3c_event(I3CTarget *t, enum I3CEvent event)
+{
+    RemoteI3C *i3c = REMOTE_I3C(t);
+    uint8_t type;
+    trace_remote_i3c_event(i3c->cfg.name, event);
+    switch (event) {
+    case I3C_START_RECV:
+        type = REMOTE_I3C_START_RECV;
+        break;
+    case I3C_START_SEND:
+        type = REMOTE_I3C_START_SEND;
+        break;
+    case I3C_STOP:
+        type = REMOTE_I3C_STOP;
+        break;
+    case I3C_NACK:
+        type = REMOTE_I3C_NACK;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Unknown I3C event %d\n",
+                      object_get_canonical_path(OBJECT(i3c)), i3c->cfg.name,
+                                                event);
+        return -1;
+    }
+
+    /*
+     * If we have a transfer buffered, send it out before we tell the remote
+     * target about the next event.
+     */
+    if (remote_i3c_tx_in_progress(i3c)) {
+        remote_i3c_chr_send_bytes(i3c);
+    }
+
+    qemu_chr_fe_write_all(&i3c->chr, &type, 1);
+    return 0;
+}
+
+static void remote_i3c_chr_event(void *opaque, QEMUChrEvent evt)
+{
+    switch (evt) {
+    case CHR_EVENT_OPENED:
+    case CHR_EVENT_CLOSED:
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /*
+         * Ignore events.
+         * Our behavior stays the same regardless of what happens.
+         */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void remote_i3c_rx_ibi(RemoteI3C *i3c, const uint8_t *buf, int size)
+{
+    uint32_t p_buf = 0;
+    while (p_buf < size) {
+        switch (i3c->ibi_rx_state) {
+        /* This is the start of a new IBI request. */
+        case IBI_RX_STATE_DONE:
+            i3c->ibi_rx_state = IBI_RX_STATE_READ_ADDR;
+            p_buf++;
+            break;
+        case IBI_RX_STATE_READ_ADDR:
+            i3c->ibi_data.addr = buf[p_buf];
+            p_buf++;
+            i3c->ibi_rx_state = IBI_RX_STATE_READ_RNW;
+            break;
+        case IBI_RX_STATE_READ_RNW:
+            i3c->ibi_data.is_recv = buf[p_buf];
+            p_buf++;
+            i3c->ibi_rx_state = IBI_RX_STATE_READ_SIZE;
+            break;
+        case IBI_RX_STATE_READ_SIZE:
+            i3c->ibi_data.num_bytes |= ((uint32_t)buf[p_buf] <<
+                                        (8 * i3c->ibi_bytes_rxed));
+            i3c->ibi_bytes_rxed++;
+            p_buf++;
+            /*
+             * If we're done reading the num_bytes portion, move on to reading
+             * data.
+             */
+            if (i3c->ibi_bytes_rxed == sizeof(i3c->ibi_data.num_bytes)) {
+                i3c->ibi_data.num_bytes = le32_to_cpu(i3c->ibi_data.num_bytes);
+                i3c->ibi_bytes_rxed = 0;
+                i3c->ibi_rx_state = IBI_RX_STATE_READ_DATA;
+                /* If there's no data to read, we're done. */
+                if (i3c->ibi_data.num_bytes == 0) {
+                    /*
+                     * Sanity check to see if the remote target is doing
+                     * something wonky. This would only happen if it sends
+                     * another IBI before the first one has been ACKed/NACKed
+                     * by the controller.
+                     * We'll try to recover by just exiting early and discarding
+                     * the leftover bytes.
+                     */
+                    if (p_buf < size) {
+                        qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Remote target "
+                                      "sent trailing bytes at the end of the "
+                                      "IBI request.",
+                            object_get_canonical_path(OBJECT(i3c)),
+                                                      i3c->cfg.name);
+                        return;
+                    }
+                    i3c->ibi_rx_state = IBI_RX_STATE_DONE;
+                } else {
+                    /*
+                     * We have IBI bytes to read, allocate memory for it.
+                     * Freed when we're done sending the IBI to the controller.
+                     */
+                    i3c->ibi_data.data = g_new0(uint8_t,
+                                                i3c->ibi_data.num_bytes);
+                }
+            }
+            break;
+        case IBI_RX_STATE_READ_DATA:
+            i3c->ibi_data.data[i3c->ibi_bytes_rxed] = buf[p_buf];
+            i3c->ibi_bytes_rxed++;
+            p_buf++;
+            if (i3c->ibi_bytes_rxed == i3c->ibi_data.num_bytes) {
+                /*
+                 * Sanity check to see if the remote target is doing something
+                 * wonky. This would only happen if it sends another IBI before
+                 * the first one has been ACKed/NACKed by the controller.
+                 * We'll try to recover by just exiting early and discarding the
+                 * leftover bytes.
+                 */
+                if (p_buf < size) {
+                    qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Remote target "
+                                  "sent trailing bytes at the end of the "
+                                  "IBI request.",
+                        object_get_canonical_path(OBJECT(i3c)), i3c->cfg.name);
+                    return;
+                }
+                i3c->ibi_rx_state = IBI_RX_STATE_DONE;
+            }
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Remote target IBI state "
+                          "machine reached unknown state 0x%x\n",
+                          object_get_canonical_path(OBJECT(i3c)), i3c->cfg.name,
+                          i3c->ibi_rx_state);
+            g_assert_not_reached();
+        }
+    }
+}
+
+static void remote_i3c_ibi_rx_state_reset(RemoteI3C *i3c)
+{
+    if (i3c->ibi_data.num_bytes) {
+        free(i3c->ibi_data.data);
+    }
+    i3c->ibi_data.addr = 0;
+    i3c->ibi_data.is_recv = 0;
+    i3c->ibi_data.num_bytes = 0;
+    i3c->ibi_bytes_rxed = 0;
+    i3c->ibi_rx_state = IBI_RX_STATE_DONE;
+}
+
+static void remote_i3c_do_ibi(RemoteI3C *i3c)
+{
+    uint32_t i;
+    uint8_t resp = REMOTE_I3C_IBI_ACK;
+
+    trace_remote_i3c_do_ibi(i3c->cfg.name, i3c->ibi_data.addr,
+                            i3c->ibi_data.is_recv);
+    if (i3c_target_send_ibi(&i3c->parent_obj, i3c->ibi_data.addr,
+                        i3c->ibi_data.is_recv)) {
+        resp = REMOTE_I3C_IBI_NACK;
+    } else {
+        for (i = 0; i < i3c->ibi_data.num_bytes; i++) {
+            if (i3c_target_send_ibi_bytes(&i3c->parent_obj,
+                                          i3c->ibi_data.data[i])) {
+                resp = REMOTE_I3C_IBI_DATA_NACK;
+                break;
+            }
+        }
+    }
+
+    if (i3c_target_ibi_finish(&i3c->parent_obj, 0x00)) {
+        resp = REMOTE_I3C_IBI_NACK;
+    }
+    qemu_chr_fe_write_all(&i3c->chr, &resp, sizeof(resp));
+    remote_i3c_ibi_rx_state_reset(i3c);
+}
+
+static int remote_i3c_chr_can_receive(void *opaque)
+{
+    return 1;
+}
+
+static void remote_i3c_chr_receive(void *opaque, const uint8_t *buf, int size)
+{
+    RemoteI3C *i3c = REMOTE_I3C(opaque);
+
+    /*
+     * The only things we expect to receive unprompted are:
+     * - An ACK of a previous transfer
+     * - A NACK of a previous transfer
+     * - An IBI requested by the remote target.
+     * - Bytes for an IBI request.
+     */
+    /* If we're in the middle of handling an IBI request, parse it here. */
+    if (i3c->ibi_rx_state != IBI_RX_STATE_DONE) {
+        remote_i3c_rx_ibi(i3c, buf, size);
+        /* If we finished reading the IBI, do it. */
+        if (i3c->ibi_rx_state == IBI_RX_STATE_DONE) {
+            remote_i3c_do_ibi(i3c);
+         }
+         return;
+    }
+
+    switch (buf[0]) {
+    case REMOTE_I3C_RX_ACK:
+        break;
+    case REMOTE_I3C_RX_NACK:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Received NACK from remote "
+                      "target\n", object_get_canonical_path(OBJECT(i3c)),
+                      i3c->cfg.name);
+        break;
+    case REMOTE_I3C_IBI:
+        remote_i3c_rx_ibi(i3c, buf, size);
+        /* If we finished reading the IBI, do it. */
+        if (i3c->ibi_rx_state == IBI_RX_STATE_DONE) {
+            remote_i3c_do_ibi(i3c);
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s-%s: Unknown response 0x%x\n",
+                      object_get_canonical_path(OBJECT(i3c)), i3c->cfg.name,
+                      buf[0]);
+        break;
+    }
+}
+
+static void remote_i3c_realize(DeviceState *dev, Error **errp)
+{
+    RemoteI3C *i3c = REMOTE_I3C(dev);
+
+    fifo8_create(&i3c->tx_fifo, i3c->cfg.buf_size);
+    fifo8_create(&i3c->rx_fifo, i3c->cfg.buf_size);
+    i3c->ibi_data.data = g_new0(uint8_t, i3c->cfg.buf_size);
+    remote_i3c_ibi_rx_state_reset(i3c);
+
+    qemu_chr_fe_set_handlers(&i3c->chr, remote_i3c_chr_can_receive,
+                             remote_i3c_chr_receive, remote_i3c_chr_event,
+                             NULL, OBJECT(i3c), NULL, true);
+}
+
+static Property remote_i3c_props[] = {
+    DEFINE_PROP_CHR("chardev", RemoteI3C, chr),
+    DEFINE_PROP_UINT32("buf-size", RemoteI3C, cfg.buf_size, 0x10000),
+    DEFINE_PROP_STRING("device-name", RemoteI3C, cfg.name),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void remote_i3c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I3CTargetClass *k = I3C_TARGET_CLASS(klass);
+
+    k->recv = &remote_i3c_recv;
+    k->send = &remote_i3c_send;
+    k->event = &remote_i3c_event;
+    k->handle_ccc_read = &remote_i3c_handle_ccc_read;
+    k->handle_ccc_write = &remote_i3c_handle_ccc_write;
+    device_class_set_props(dc, remote_i3c_props);
+    dc->realize = remote_i3c_realize;
+}
+
+static const TypeInfo remote_i3c_type = {
+    .name = TYPE_REMOTE_I3C,
+    .parent = TYPE_I3C_TARGET,
+    .instance_size = sizeof(RemoteI3C),
+    .class_size = sizeof(I3CTargetClass),
+    .class_init = remote_i3c_class_init,
+};
+
+static void remote_i3c_register(void)
+{
+    type_register_static(&remote_i3c_type);
+}
+
+type_init(remote_i3c_register)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index 74c5a5dd6e..ff5efac784 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -43,3 +43,10 @@ mock_target_handle_ccc_read(uint32_t num_read, uint32_t num_to_read) "I3C mock t
 mock_target_new_ccc(uint8_t ccc) "I3C mock target handle CCC 0x%" PRIx8
 mock_target_handle_ccc_write(uint32_t num_sent, uint32_t num_to_send) "I3C mock target send %" PRId32 "/%" PRId32 " bytes"
 mock_target_do_ibi(uint8_t address, bool is_recv) "I3C mock target IBI with address 0x%" PRIx8 " RnW=%d"
+
+# remote-i3c.c
+remote_i3c_recv(const char *name, uint32_t num_read, uint32_t num_to_read) "Remote I3C '%s' read %" PRId32 "/%" PRId32 " bytes"
+remote_i3c_send(const char *name, uint32_t num_sent, bool is_ccc) "Remote I3C '%s' send %" PRId32 " bytes, is_ccc=%d"
+remote_i3c_ccc_read(const char *name, uint32_t num_read, uint32_t num_to_read) "Remote I3C '%s' CCC read %" PRId32 "/%" PRId32 " bytes"
+remote_i3c_event(const char *name, uint8_t event) "Remote I3C '%s' event 0x%" PRIx8
+remote_i3c_do_ibi(const char *name, uint8_t addr, bool is_recv) "Remote I3C '%s' IBI with addr 0x%" PRIx8 " RnW=%d"
diff --git a/include/hw/i3c/remote-i3c.h b/include/hw/i3c/remote-i3c.h
new file mode 100644
index 0000000000..822b358098
--- /dev/null
+++ b/include/hw/i3c/remote-i3c.h
@@ -0,0 +1,72 @@
+/*
+ * Remote I3C Device
+ *
+ * Copyright (c) 2023 Google LLC
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
+ * The remote I3C protocol is as follows:
+ * On an I3C private and CCC TX (controller -> target)
+ * - 1-byte opcode
+ * - 4-byte number of bytes in the packet as a LE uint32
+ * - n-byte payload
+ *
+ * On an I3C private and CCC RX (target -> controller)
+ * Controller to target:
+ * - 1-byte opcode
+ * - 4-byte number of bytes to read as a LE uint32
+ * Remote target response:
+ * - 4-byte number of bytes in the packet as a LE uint32
+ * - n-byte payload
+ *
+ * IBI (target -> controller, initiated by target)
+ * - 1-byte opcode
+ * - 1-byte IBI address
+ * - 1-byte RnW boolean
+ * - 4-byte length of IBI payload from target as a LE uint32 (can be 0)
+ * - n-byte IBI payload
+ */
+
+#ifndef REMOTE_I3C_H_
+#define REMOTE_I3C_H_
+
+#define TYPE_REMOTE_I3C "remote-i3c"
+#define REMOTE_I3C(obj) OBJECT_CHECK(RemoteI3C, (obj), TYPE_REMOTE_I3C)
+
+/* 1-byte IBI addr, 1-byte is recv, 4-byte data len. */
+#define REMOTE_I3C_IBI_HDR_LEN 6
+
+/* Stored in a uint8_t */
+typedef enum {
+    /* Sent from us to remote target. */
+    REMOTE_I3C_START_RECV = 1,
+    REMOTE_I3C_START_SEND = 2,
+    REMOTE_I3C_STOP = 3,
+    REMOTE_I3C_NACK = 4,
+    REMOTE_I3C_RECV = 5,
+    REMOTE_I3C_SEND = 6,
+    REMOTE_I3C_HANDLE_CCC_WRITE = 7,
+    REMOTE_I3C_HANDLE_CCC_READ = 8,
+    REMOTE_I3C_IBI = 9,
+    /* Sent from remote target to us. */
+    REMOTE_I3C_IBI_ACK = 0xc0,
+    REMOTE_I3C_IBI_NACK = 0xc1,
+    REMOTE_I3C_IBI_DATA_NACK = 0xc2,
+} RemoteI3CCommand;
+
+typedef enum {
+    REMOTE_I3C_RX_ACK = 0,
+    REMOTE_I3C_RX_NACK = 1,
+} RemoteI3CRXEvent;
+
+#endif
-- 
2.40.0.348.gf938b09366-goog



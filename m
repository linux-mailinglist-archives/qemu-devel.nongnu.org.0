Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB525255635
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 10:17:27 +0200 (CEST)
Received: from localhost ([::1]:35938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBZZe-0007X6-SR
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 04:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBZRa-0000lm-1C
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:09:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26296
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBZRS-0003SL-MG
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598602138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfX8++UP0VaXTlvY6Xl3dnABweKyPnmkj4qOIGoSEoA=;
 b=POyo0nKUrAh06bOGLfiemnx0MvHw/IT8Z0WUV3RSr/BKOQv1fnjguh7QdLx937+TxHXvM1
 UsPrhN+O+WDcRFd7SfgAlm4rMOZT7SMAkIUca0Dun7b7qWBDeObXVWaGQ/HHL1CDfF7L6p
 GUVaWfRpEZc+rUWLcXxx9jLdHLJOMD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-HL-uh63bP_2FGzjoR6RnhQ-1; Fri, 28 Aug 2020 04:08:55 -0400
X-MC-Unique: HL-uh63bP_2FGzjoR6RnhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5412810082F9;
 Fri, 28 Aug 2020 08:08:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E12E57A1E4;
 Fri, 28 Aug 2020 08:08:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A9A431E63; Fri, 28 Aug 2020 10:08:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] hw/usb: Add U2F key passthru mode
Date: Fri, 28 Aug 2020 10:08:36 +0200
Message-Id: <20200828080845.28287-10-kraxel@redhat.com>
In-Reply-To: <20200828080845.28287-1-kraxel@redhat.com>
References: <20200828080845.28287-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 03:48:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: César Belley <cesar.belley@lse.epita.fr>

This patch adds the U2F key pass-through mode.

The pass-through mode consists of passing all requests made from the
guest to the physical security key connected to the host machine and
vice versa.

In addition, the dedicated pass-through allows to have a U2F security key
shared on several guests which is not possible with a simple host device
assignment pass-through.

The pass-through mode is associated with a device inheriting from
u2f-key base.

To work, it needs the path to a U2F hidraw, obtained from the Qemu
command line, and passed by the user:

    qemu -usb -device u2f-passthru,hidraw=/dev/hidrawX

Autoscan and U2F compatibility checking features are given at the end
of the patch series.

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
Message-id: 20200826114209.28821-6-cesar.belley@lse.epita.fr
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/u2f-passthru.c | 423 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 423 insertions(+)
 create mode 100644 hw/usb/u2f-passthru.c

diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
new file mode 100644
index 000000000000..52b44670775d
--- /dev/null
+++ b/hw/usb/u2f-passthru.c
@@ -0,0 +1,423 @@
+/*
+ * U2F USB Passthru device.
+ *
+ * Copyright (c) 2020 César Belley <cesar.belley@lse.epita.fr>
+ * Written by César Belley <cesar.belley@lse.epita.fr>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb.h"
+#include "migration/vmstate.h"
+
+#include "u2f.h"
+
+#define NONCE_SIZE 8
+#define BROADCAST_CID 0xFFFFFFFF
+#define TRANSACTION_TIMEOUT 120000
+
+struct transaction {
+    uint32_t cid;
+    uint16_t resp_bcnt;
+    uint16_t resp_size;
+
+    /* Nonce for broadcast isolation */
+    uint8_t nonce[NONCE_SIZE];
+};
+
+typedef struct U2FPassthruState U2FPassthruState;
+
+#define CURRENT_TRANSACTIONS_NUM 4
+
+struct U2FPassthruState {
+    U2FKeyState base;
+
+    /* Host device */
+    char *hidraw;
+    int hidraw_fd;
+
+    /* Current Transactions */
+    struct transaction current_transactions[CURRENT_TRANSACTIONS_NUM];
+    uint8_t current_transactions_start;
+    uint8_t current_transactions_end;
+    uint8_t current_transactions_num;
+
+    /* Transaction time checking */
+    int64_t last_transaction_time;
+    QEMUTimer timer;
+};
+
+#define TYPE_U2F_PASSTHRU "u2f-passthru"
+#define PASSTHRU_U2F_KEY(obj) \
+    OBJECT_CHECK(U2FPassthruState, (obj), TYPE_U2F_PASSTHRU)
+
+/* Init packet sizes */
+#define PACKET_INIT_HEADER_SIZE 7
+#define PACKET_INIT_DATA_SIZE (U2FHID_PACKET_SIZE - PACKET_INIT_HEADER_SIZE)
+
+/* Cont packet sizes */
+#define PACKET_CONT_HEADER_SIZE 5
+#define PACKET_CONT_DATA_SIZE (U2FHID_PACKET_SIZE - PACKET_CONT_HEADER_SIZE)
+
+struct packet_init {
+    uint32_t cid;
+    uint8_t cmd;
+    uint8_t bcnth;
+    uint8_t bcntl;
+    uint8_t data[PACKET_INIT_DATA_SIZE];
+} QEMU_PACKED;
+
+static inline uint32_t packet_get_cid(const void *packet)
+{
+    return *((uint32_t *)packet);
+}
+
+static inline bool packet_is_init(const void *packet)
+{
+    return ((uint8_t *)packet)[4] & (1 << 7);
+}
+
+static inline uint16_t packet_init_get_bcnt(
+        const struct packet_init *packet_init)
+{
+    uint16_t bcnt = 0;
+    bcnt |= packet_init->bcnth << 8;
+    bcnt |= packet_init->bcntl;
+
+    return bcnt;
+}
+
+static void u2f_passthru_reset(U2FPassthruState *key)
+{
+    timer_del(&key->timer);
+    qemu_set_fd_handler(key->hidraw_fd, NULL, NULL, key);
+    key->last_transaction_time = 0;
+    key->current_transactions_start = 0;
+    key->current_transactions_end = 0;
+    key->current_transactions_num = 0;
+}
+
+static void u2f_timeout_check(void *opaque)
+{
+    U2FPassthruState *key = opaque;
+    int64_t time = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+
+    if (time > key->last_transaction_time + TRANSACTION_TIMEOUT) {
+        u2f_passthru_reset(key);
+    } else {
+        timer_mod(&key->timer, time + TRANSACTION_TIMEOUT / 4);
+    }
+}
+
+static int u2f_transaction_get_index(U2FPassthruState *key, uint32_t cid)
+{
+    for (int i = 0; i < key->current_transactions_num; ++i) {
+        int index = (key->current_transactions_start + i)
+            % CURRENT_TRANSACTIONS_NUM;
+        if (cid == key->current_transactions[index].cid) {
+            return index;
+        }
+    }
+    return -1;
+}
+
+static struct transaction *u2f_transaction_get(U2FPassthruState *key,
+                                               uint32_t cid)
+{
+    int index = u2f_transaction_get_index(key, cid);
+    if (index < 0) {
+        return NULL;
+    }
+    return &key->current_transactions[index];
+}
+
+static struct transaction *u2f_transaction_get_from_nonce(U2FPassthruState *key,
+                                const uint8_t nonce[NONCE_SIZE])
+{
+    for (int i = 0; i < key->current_transactions_num; ++i) {
+        int index = (key->current_transactions_start + i)
+            % CURRENT_TRANSACTIONS_NUM;
+        if (key->current_transactions[index].cid == BROADCAST_CID
+            && memcmp(nonce, key->current_transactions[index].nonce,
+                      NONCE_SIZE) == 0) {
+            return &key->current_transactions[index];
+        }
+    }
+    return NULL;
+}
+
+static void u2f_transaction_close(U2FPassthruState *key, uint32_t cid)
+{
+    int index, next_index;
+    index = u2f_transaction_get_index(key, cid);
+    if (index < 0) {
+        return;
+    }
+    next_index = (index + 1) % CURRENT_TRANSACTIONS_NUM;
+
+    /* Rearrange to ensure the oldest is at the start position */
+    while (next_index != key->current_transactions_end) {
+        memcpy(&key->current_transactions[index],
+               &key->current_transactions[next_index],
+               sizeof(struct transaction));
+
+        index = next_index;
+        next_index = (index + 1) % CURRENT_TRANSACTIONS_NUM;
+    }
+
+    key->current_transactions_end = index;
+    --key->current_transactions_num;
+
+    if (key->current_transactions_num == 0) {
+        u2f_passthru_reset(key);
+    }
+}
+
+static void u2f_transaction_add(U2FPassthruState *key, uint32_t cid,
+                                const uint8_t nonce[NONCE_SIZE])
+{
+    uint8_t index;
+    struct transaction *transaction;
+
+    if (key->current_transactions_num >= CURRENT_TRANSACTIONS_NUM) {
+        /* Close the oldest transaction */
+        index = key->current_transactions_start;
+        transaction = &key->current_transactions[index];
+        u2f_transaction_close(key, transaction->cid);
+    }
+
+    /* Index */
+    index = key->current_transactions_end;
+    key->current_transactions_end = (index + 1) % CURRENT_TRANSACTIONS_NUM;
+    ++key->current_transactions_num;
+
+    /* Transaction */
+    transaction = &key->current_transactions[index];
+    transaction->cid = cid;
+    transaction->resp_bcnt = 0;
+    transaction->resp_size = 0;
+
+    /* Nonce */
+    if (nonce != NULL) {
+        memcpy(transaction->nonce, nonce, NONCE_SIZE);
+    }
+}
+
+static void u2f_passthru_read(void *opaque);
+
+static void u2f_transaction_start(U2FPassthruState *key,
+                                  const struct packet_init *packet_init)
+{
+    int64_t time;
+
+    /* Transaction */
+    if (packet_init->cid == BROADCAST_CID) {
+        u2f_transaction_add(key, packet_init->cid, packet_init->data);
+    } else {
+        u2f_transaction_add(key, packet_init->cid, NULL);
+    }
+
+    /* Time */
+    time = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    if (key->last_transaction_time == 0) {
+        qemu_set_fd_handler(key->hidraw_fd, u2f_passthru_read, NULL, key);
+        timer_init_ms(&key->timer, QEMU_CLOCK_VIRTUAL, u2f_timeout_check, key);
+        timer_mod(&key->timer, time + TRANSACTION_TIMEOUT / 4);
+    }
+    key->last_transaction_time = time;
+}
+
+static void u2f_passthru_recv_from_host(U2FPassthruState *key,
+                                    const uint8_t packet[U2FHID_PACKET_SIZE])
+{
+    struct transaction *transaction;
+    uint32_t cid;
+
+    /* Retrieve transaction */
+    cid = packet_get_cid(packet);
+    if (cid == BROADCAST_CID) {
+        struct packet_init *packet_init;
+        if (!packet_is_init(packet)) {
+            return;
+        }
+        packet_init = (struct packet_init *)packet;
+        transaction = u2f_transaction_get_from_nonce(key, packet_init->data);
+    } else {
+        transaction = u2f_transaction_get(key, cid);
+    }
+
+    /* Ignore no started transaction */
+    if (transaction == NULL) {
+        return;
+    }
+
+    if (packet_is_init(packet)) {
+        struct packet_init *packet_init = (struct packet_init *)packet;
+        transaction->resp_bcnt = packet_init_get_bcnt(packet_init);
+        transaction->resp_size = PACKET_INIT_DATA_SIZE;
+
+        if (packet_init->cid == BROADCAST_CID) {
+            /* Nonce checking for legitimate response */
+            if (memcmp(transaction->nonce, packet_init->data, NONCE_SIZE)
+                != 0) {
+                return;
+            }
+        }
+    } else {
+        transaction->resp_size += PACKET_CONT_DATA_SIZE;
+    }
+
+    /* Transaction end check */
+    if (transaction->resp_size >= transaction->resp_bcnt) {
+        u2f_transaction_close(key, cid);
+    }
+    u2f_send_to_guest(&key->base, packet);
+}
+
+static void u2f_passthru_read(void *opaque)
+{
+    U2FPassthruState *key = opaque;
+    U2FKeyState *base = &key->base;
+    uint8_t packet[2 * U2FHID_PACKET_SIZE];
+    int ret;
+
+    /* Full size base queue check */
+    if (base->pending_in_num >= U2FHID_PENDING_IN_NUM) {
+        return;
+    }
+
+    ret = read(key->hidraw_fd, packet, sizeof(packet));
+    if (ret < 0) {
+        /* Detach */
+        if (base->dev.attached) {
+            usb_device_detach(&base->dev);
+            u2f_passthru_reset(key);
+        }
+        return;
+    }
+    if (ret != U2FHID_PACKET_SIZE) {
+        return;
+    }
+    u2f_passthru_recv_from_host(key, packet);
+}
+
+static void u2f_passthru_recv_from_guest(U2FKeyState *base,
+                                    const uint8_t packet[U2FHID_PACKET_SIZE])
+{
+    U2FPassthruState *key = PASSTHRU_U2F_KEY(base);
+    uint8_t host_packet[U2FHID_PACKET_SIZE + 1];
+    ssize_t written;
+
+    if (packet_is_init(packet)) {
+        u2f_transaction_start(key, (struct packet_init *)packet);
+    }
+
+    host_packet[0] = 0;
+    memcpy(host_packet + 1, packet, U2FHID_PACKET_SIZE);
+
+    written = write(key->hidraw_fd, host_packet, sizeof(host_packet));
+    if (written != sizeof(host_packet)) {
+        error_report("%s: Bad written size (req 0x%zu, val 0x%zd)",
+                     TYPE_U2F_PASSTHRU, sizeof(host_packet), written);
+    }
+}
+
+static void u2f_passthru_unrealize(U2FKeyState *base)
+{
+    U2FPassthruState *key = PASSTHRU_U2F_KEY(base);
+
+    u2f_passthru_reset(key);
+    qemu_close(key->hidraw_fd);
+}
+
+static void u2f_passthru_realize(U2FKeyState *base, Error **errp)
+{
+    U2FPassthruState *key = PASSTHRU_U2F_KEY(base);
+    int fd;
+
+    if (key->hidraw == NULL) {
+        error_setg(errp, "%s: Missing hidraw", TYPE_U2F_PASSTHRU);
+        return;
+    }
+
+    fd = qemu_open(key->hidraw, O_RDWR);
+    if (fd < 0) {
+        error_setg(errp, "%s: Failed to open %s", TYPE_U2F_PASSTHRU,
+                   key->hidraw);
+        return;
+    }
+    key->hidraw_fd = fd;
+    u2f_passthru_reset(key);
+}
+
+static int u2f_passthru_post_load(void *opaque, int version_id)
+{
+    U2FPassthruState *key = opaque;
+    u2f_passthru_reset(key);
+    return 0;
+}
+
+static const VMStateDescription u2f_passthru_vmstate = {
+    .name = "u2f-key-passthru",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = u2f_passthru_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_U2F_KEY(base, U2FPassthruState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property u2f_passthru_properties[] = {
+    DEFINE_PROP_STRING("hidraw", U2FPassthruState, hidraw),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void u2f_passthru_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    U2FKeyClass *kc = U2F_KEY_CLASS(klass);
+
+    kc->realize = u2f_passthru_realize;
+    kc->unrealize = u2f_passthru_unrealize;
+    kc->recv_from_guest = u2f_passthru_recv_from_guest;
+    dc->desc = "QEMU U2F passthrough key";
+    dc->vmsd = &u2f_passthru_vmstate;
+    device_class_set_props(dc, u2f_passthru_properties);
+}
+
+static const TypeInfo u2f_key_passthru_info = {
+    .name = TYPE_U2F_PASSTHRU,
+    .parent = TYPE_U2F_KEY,
+    .instance_size = sizeof(U2FPassthruState),
+    .class_init = u2f_passthru_class_init
+};
+
+static void u2f_key_passthru_register_types(void)
+{
+    type_register_static(&u2f_key_passthru_info);
+}
+
+type_init(u2f_key_passthru_register_types)
-- 
2.27.0



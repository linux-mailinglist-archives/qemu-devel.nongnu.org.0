Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC51553B99
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:27:04 +0200 (CEST)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kSl-0008CG-8v
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7171ca9011=irischenlj@fb.com>)
 id 1o3kQg-0005yd-U0; Tue, 21 Jun 2022 16:24:54 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7171ca9011=irischenlj@fb.com>)
 id 1o3kQd-00065o-Qc; Tue, 21 Jun 2022 16:24:54 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LIbKbZ031674;
 Tue, 21 Jun 2022 13:24:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=IgXc0k+4f0L+/XD3WHCLdKypOU6paufXJWT/J1Pqojc=;
 b=VsOd+9RUxicZ/9BaZNcJUZjeUBkiHRU5XGzyZDL9HgJ0uHfvpJC2db91GPJl7hkSClDN
 jYdZR22qL6jjniQrzQrgNwez6I8H93dtBWiAQwfVHOap6GR8TnjOl4hQkN5Mja8OROTi
 DR3RT6+rQZ0io745ocGqVJkVhnUWzQ31JGw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gukdwrq6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 13:24:35 -0700
Received: from localhost (2620:10d:c0a8:1b::d) by mail.thefacebook.com
 (2620:10d:c0a8:83::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 13:24:34 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>, Iris Chen
 <irischenlj@gmail.com>
Subject: [PATCH v4] hw: m25p80: add WP# pin and SRWD bit for write protection
Date: Tue, 21 Jun 2022 13:24:27 -0700
Message-ID: <20220621202427.2680413-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::d]
X-Proofpoint-GUID: 3kPgsaAF_VLiiBqptI0oC3sJPR2T_QVB
X-Proofpoint-ORIG-GUID: 3kPgsaAF_VLiiBqptI0oC3sJPR2T_QVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_09,2022-06-21_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7171ca9011=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Iris Chen <irischenlj@gmail.com>

Signed-off-by: Iris Chen <irischenlj@gmail.com>
---
Fixed .needed for subsection and suggestions from Francisco 

 hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 81ba3da4df..3045dda53b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -472,11 +472,13 @@ struct Flash {
     uint8_t spansion_cr2v;
     uint8_t spansion_cr3v;
     uint8_t spansion_cr4v;
+    bool wp_level;
     bool write_enable;
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
     bool aai_enable;
+    bool status_register_write_disabled;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
+        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
+
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
@@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case WRSR:
-        if (s->write_enable) {
-            switch (get_man(s)) {
-            case MAN_SPANSION:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_DATA;
-                break;
-            case MAN_MACRONIX:
-                s->needed_bytes = 2;
-                s->state = STATE_COLLECTING_VAR_LEN_DATA;
-                break;
-            default:
-                s->needed_bytes = 1;
-                s->state = STATE_COLLECTING_DATA;
-            }
-            s->pos = 0;
+        /*
+         * If WP# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->wp_level == 0 && s->status_register_write_disabled)
+            || !s->write_enable) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: Status register write is disabled!\n");
+            break;
+        }
+
+        switch (get_man(s)) {
+        case MAN_SPANSION:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_DATA;
+            break;
+        case MAN_MACRONIX:
+            s->needed_bytes = 2;
+            s->state = STATE_COLLECTING_VAR_LEN_DATA;
+            break;
+        default:
+            s->needed_bytes = 1;
+            s->state = STATE_COLLECTING_DATA;
         }
+        s->pos = 0;
         break;
 
     case WRDI:
@@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
+        s->data[0] |= (!!s->status_register_write_disabled) << 7;
+
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
@@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
+{
+    Flash *s = M25P80(opaque);
+    /* WP# is just a single pin. */
+    assert(n == 0);
+    s->wp_level = !!level;
+}
+
 static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 {
     Flash *s = M25P80(ss);
@@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
+
+    qdev_init_gpio_in_named(DEVICE(s),
+                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
 }
 
 static void m25p80_reset(DeviceState *d)
 {
     Flash *s = M25P80(d);
 
+    s->wp_level = true;
+    s->status_register_write_disabled = false;
+
     reset_memory(s);
 }
 
@@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
     }
 };
 
+static bool m25p80_wp_level_srwd_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return !s->wp_level || s->status_register_write_disabled;
+}
+
+static const VMStateDescription vmstate_m25p80_write_protect = {
+    .name = "m25p80/write_protect",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_wp_level_srwd_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(wp_level, Flash),
+        VMSTATE_BOOL(status_register_write_disabled, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
         &vmstate_m25p80_aai_enable,
+        &vmstate_m25p80_write_protect,
         NULL
     }
 };
-- 
2.30.2



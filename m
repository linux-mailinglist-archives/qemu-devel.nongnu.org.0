Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FC2E118E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 03:03:29 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krtUu-0003p0-B4
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 21:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krtSF-00028g-PQ; Tue, 22 Dec 2020 21:00:43 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krtSD-0001sK-MC; Tue, 22 Dec 2020 21:00:43 -0500
Received: by mail-pg1-x536.google.com with SMTP id e2so9604600pgi.5;
 Tue, 22 Dec 2020 18:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ap+gQoQQoaEiCEIrHfmV4b4YrxBq6H4j0FWgoGB0cIw=;
 b=vPYhD9imazn4nGf8dQnLPF35tFRlbXZZk+uT37NQDHIfkolaYP0X5vOhYO9J+eVenl
 A2tTMznXi9PsKgoJhThAbAnoiXT7UZBGiu1eTiZA9wf1qyoYUOTrmef1hkWOJyFcvs1R
 T2Y/VfecSbJ5eM0J8WRQig300OoU5cDnxO0kIAhqDDDrzeKH2WqAFW6om1pzSjQy0QDj
 2IwdaMRcaA9eosWVkZN8GOjH6emDLoFouCafp26y8ZxGIPaiZt1msFQJKAY9r4+aaw24
 6IaaNKxm6ZdSfwbvghUR36kiGUO9aiVFKvYHUtJvHrQuLpwZBAzzGdPQoQ2NXFsNTK3S
 cBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ap+gQoQQoaEiCEIrHfmV4b4YrxBq6H4j0FWgoGB0cIw=;
 b=l9xfN9TQQohIKEL/nr+2AIbTGLTX1nhTPrXzDaPGucTMzKvGKPW3Zqikk+ATtSsXL2
 d59WHHpZrC0vl+fSzCEQ8LWi+boneE+aHc2gSHl9n692LnnSQFd5KzwVQ7RL02jcVA6T
 gKc/iasdMgy0mcrlumikHfh+nE7Uidrajj4sDatXtZUhQFxJkV4jSZh8pfkOjrKhAsYG
 DVZ692GniOjVMRityHSoks5kIfMbbg6DOp7T08YdffXNcPZ02xz0UI0UHyfkrQL/Vaxp
 S+Wa/viwbufLdnETyEUrx0Hjq6r8g7HGJ9nkuizC5q+0MSJaEnQk0NoCGiZJ5c82lkGP
 eXXw==
X-Gm-Message-State: AOAM532pXs98WpuiP0sHR30fz9PdJugd0LWAusMBLplLNRsbNhfOVq0f
 gItX7Wr9u8y3F7/qIys966U=
X-Google-Smtp-Source: ABdhPJxB3USN0zUrWA5Ggd3JsMMSAXcGhCETBSpk/RQize+D582aGC3iSk6C/pyw3bU5gdQg4gn8aA==
X-Received: by 2002:a62:fc4a:0:b029:19e:3b99:d584 with SMTP id
 e71-20020a62fc4a0000b029019e3b99d584mr21760567pfh.59.1608688839965; 
 Tue, 22 Dec 2020 18:00:39 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id w24sm21644011pfn.100.2020.12.22.18.00.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 18:00:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
Date: Wed, 23 Dec 2020 10:00:25 +0800
Message-Id: <1608688825-81519-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
References: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Auto Address Increment (AAI) Word-Program is a special command of
SST flashes. AAI-WP allows multiple bytes of data to be programmed
without re-issuing the next sequential address location.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v5:
- remove the guest error logging when address wrap is detected in AAI
- change to return s->aai_enable in m25p80_aai_enable_needed()

Changes in v4:
- simplify is_valid_aai_cmd()
- use a subsection for s->aai_enable vm state

Changes in v3:
- initialize aai_enable to false in reset_memory()

Changes in v2:
- add aai_enable into the vmstate
- validate AAI command before decoding a new command
- log guest errors during AAI_WP command handling
- report AAI status in the status register
- abort AAI programming when address is wrapped
- make sure AAI programming starts from the even address

 hw/block/m25p80.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 29598b4..c64852f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -359,6 +359,7 @@ typedef enum {
     QPP_4 = 0x34,
     RDID_90 = 0x90,
     RDID_AB = 0xab,
+    AAI_WP = 0xad,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -455,6 +456,7 @@ struct Flash {
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
+    bool aai_enable;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -670,6 +672,11 @@ static void complete_collecting_data(Flash *s)
     case PP4_4:
         s->state = STATE_PAGE_PROGRAM;
         break;
+    case AAI_WP:
+        /* AAI programming starts from the even address */
+        s->cur_addr &= ~BIT(0);
+        s->state = STATE_PAGE_PROGRAM;
+        break;
     case READ:
     case READ4:
     case FAST_READ:
@@ -768,6 +775,7 @@ static void reset_memory(Flash *s)
     s->write_enable = false;
     s->reset_enable = false;
     s->quad_enable = false;
+    s->aai_enable = false;
 
     switch (get_man(s)) {
     case MAN_NUMONYX:
@@ -973,6 +981,11 @@ static void decode_qio_read_cmd(Flash *s)
     s->state = STATE_COLLECTING_DATA;
 }
 
+static bool is_valid_aai_cmd(uint32_t cmd)
+{
+    return cmd == AAI_WP || cmd == WRDI || cmd == RDSR;
+}
+
 static void decode_new_cmd(Flash *s, uint32_t value)
 {
     int i;
@@ -984,6 +997,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->reset_enable = false;
     }
 
+    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "M25P80: Invalid cmd within AAI programming sequence");
+    }
+
     switch (value) {
 
     case ERASE_4K:
@@ -1103,6 +1121,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case WRDI:
         s->write_enable = false;
+        if (get_man(s) == MAN_SST) {
+            s->aai_enable = false;
+        }
         break;
     case WREN:
         s->write_enable = true;
@@ -1113,6 +1134,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         if (get_man(s) == MAN_MACRONIX) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
+        if (get_man(s) == MAN_SST) {
+            s->data[0] |= (!!s->aai_enable) << 6;
+        }
+
         s->pos = 0;
         s->len = 1;
         s->data_read_loop = true;
@@ -1260,6 +1285,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case RSTQIO:
         s->quad_enable = false;
         break;
+    case AAI_WP:
+        if (get_man(s) == MAN_SST) {
+            if (s->write_enable) {
+                if (s->aai_enable) {
+                    s->state = STATE_PAGE_PROGRAM;
+                } else {
+                    s->aai_enable = true;
+                    s->needed_bytes = get_addr_length(s);
+                    s->state = STATE_COLLECTING_DATA;
+                }
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "M25P80: AAI_WP with write protect\n");
+            }
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
+        }
+        break;
     default:
         s->pos = 0;
         s->len = 1;
@@ -1305,6 +1348,17 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
         trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
+
+        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {
+            /*
+             * There is no wrap mode during AAI programming once the highest
+             * unprotected memory address is reached. The Write-Enable-Latch
+             * bit is automatically reset, and AAI programming mode aborts.
+             */
+            s->write_enable = false;
+            s->aai_enable = false;
+        }
+
         break;
 
     case STATE_READ:
@@ -1450,6 +1504,24 @@ static const VMStateDescription vmstate_m25p80_data_read_loop = {
     }
 };
 
+static bool m25p80_aai_enable_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return s->aai_enable;
+}
+
+static const VMStateDescription vmstate_m25p80_aai_enable = {
+    .name = "m25p80/aai_enable",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m25p80_aai_enable_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(aai_enable, Flash),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m25p80 = {
     .name = "m25p80",
     .version_id = 0,
@@ -1480,6 +1552,7 @@ static const VMStateDescription vmstate_m25p80 = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
+        &vmstate_m25p80_aai_enable,
         NULL
     }
 };
-- 
2.7.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B548B2E0637
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 07:47:58 +0100 (CET)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krbSf-0004uH-Lc
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 01:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbQT-0003WA-3O; Tue, 22 Dec 2020 01:45:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbQR-0001R9-9C; Tue, 22 Dec 2020 01:45:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l23so812456pjg.1;
 Mon, 21 Dec 2020 22:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kqPvXhz/A/DxnVk+PjX5F8M/kQ6CJq8rH4sJ3oLIvWY=;
 b=Cqstny1jv6fVL6Bpe4+QkdLZcTgW0sOGgwxVwMAAASxEcMDGfT1UJluicpNs2RWkBl
 fiG4YOJWM1lAr/X9X/DCDXTuwnHGpDf4DDMyM2dZfxWwFFLjeIA5AlyKwvAam5xFzsp8
 l7mGZvcnbzaNspDYCGDN3b1ZzyzCEVdZwI+jU6d8NVVgS6G9pnwlP2MTQc6HJSoqZ9Mt
 Hd6EAVT3WMNZ5ddgGqM1FCIVimZ1JmNqYH9siaSv37AfDemLZ4TGkk/UkDefwfUJoan7
 av4/Ehn/HiUpDPI324nweIdXMrmIVgUa9b0UPqsntVerZbgc1h48zNKD+Ow6LVVFMrxF
 MUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kqPvXhz/A/DxnVk+PjX5F8M/kQ6CJq8rH4sJ3oLIvWY=;
 b=neajaAuxlwGG18iVbVV+QqaMjp5rAhSJ+aHY1R5IqVC5MkW/WlNcZxVbAKdczbztwK
 DO8w7T1ZS7QySYRphVN7Pdi50BGCmFmqTNS20ZDm5KnsYTwAojBJBo2bYkOkfnYMebQL
 /oGBxweGhLxj0sYOtEyX5HGoqGwJm0nr9wmHVWg3C7eR80cYR4ri9TW5gY4zJ0MVvbmh
 ZsMQK+5gybt7/iuA1aBVBX/AnKhRhIPenVTUDuZ/Hg/BcncR/RdYh0nJQ5TRT2Mmt5Lh
 fNk3yBNogWxyIzoYdihkalAH7+o10cE0cVFwC8p2yzzAbNxSk157fXGmX/gaGj5YtV4u
 yqZQ==
X-Gm-Message-State: AOAM531nbXizlYzAvD2hZMZLU3jwXYLPG7RoauJpUIGzc6B7UJ7Lgoh2
 NlW1Fmmx87wEOA7Rm6sC3Jw=
X-Google-Smtp-Source: ABdhPJxHqVOuwwHCGGZt36bD//s3b4/Oq1DlluDsypg2T8nJYOo5f7uONKAJQo3q0wTPpeo/XbzC3A==
X-Received: by 2002:a17:90a:6acf:: with SMTP id
 b15mr19129704pjm.17.1608619535052; 
 Mon, 21 Dec 2020 22:45:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id w9sm18311492pfj.128.2020.12.21.22.45.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 22:45:34 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
Date: Tue, 22 Dec 2020 14:45:20 +0800
Message-Id: <1608619520-62782-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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

 hw/block/m25p80.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 236e1b4..d37b4d8 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -359,6 +359,7 @@ typedef enum {
     QPP_4 = 0x34,
     RDID_90 = 0x90,
     RDID_AB = 0xab,
+    AAI_WP = 0xad,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -449,6 +450,7 @@ struct Flash {
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
+    bool aai_enable;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -664,6 +666,11 @@ static void complete_collecting_data(Flash *s)
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
@@ -762,6 +769,7 @@ static void reset_memory(Flash *s)
     s->write_enable = false;
     s->reset_enable = false;
     s->quad_enable = false;
+    s->aai_enable = false;
 
     switch (get_man(s)) {
     case MAN_NUMONYX:
@@ -932,6 +940,11 @@ static void decode_qio_read_cmd(Flash *s)
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
@@ -943,6 +956,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->reset_enable = false;
     }
 
+    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "M25P80: Invalid cmd within AAI programming sequence");
+    }
+
     switch (value) {
 
     case ERASE_4K:
@@ -1008,6 +1026,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case WRDI:
         s->write_enable = false;
+        if (get_man(s) == MAN_SST) {
+            s->aai_enable = false;
+        }
         break;
     case WREN:
         s->write_enable = true;
@@ -1018,6 +1039,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
@@ -1160,6 +1185,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
@@ -1205,6 +1248,19 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: AAI highest memory address reached");
+            s->write_enable = false;
+            s->aai_enable = false;
+        }
+
         break;
 
     case STATE_READ:
@@ -1350,6 +1406,24 @@ static const VMStateDescription vmstate_m25p80_data_read_loop = {
     }
 };
 
+static bool m25p80_aai_enable_needed(void *opaque)
+{
+    Flash *s = (Flash *)opaque;
+
+    return get_man(s) == MAN_SST;
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
@@ -1380,6 +1454,7 @@ static const VMStateDescription vmstate_m25p80 = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_m25p80_data_read_loop,
+        &vmstate_m25p80_aai_enable,
         NULL
     }
 };
-- 
2.7.4



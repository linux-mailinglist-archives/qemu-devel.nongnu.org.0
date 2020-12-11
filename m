Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5822D7034
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:31:22 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbxZ-0003Uu-Mf
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbup-0001M9-Im; Fri, 11 Dec 2020 01:28:31 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:34256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbuk-0003k0-Ku; Fri, 11 Dec 2020 01:28:29 -0500
Received: by mail-il1-x143.google.com with SMTP id x15so7782709ilq.1;
 Thu, 10 Dec 2020 22:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DrYtpmEqQRGjcYI7tSVPI9IsuM2ba09ZLw/2J0ZlN/g=;
 b=r35iLdkxNHDT3ROpFXPirqkTOHiFmP3qWsKRuQbDFmASAeF1JHqAAVaF9tKOn2Ac6x
 F69cEnmm5RDThgRlgRfKWohSQWWbjA3x2uH3Smu7j+FLXCfycurXCKWgRYsfYjxO3w+H
 +0qHM7DacN1+55WbXMH7zWw5toB5kr/I41srUGPk36RImtgUhsEs/SLKRmiYnFrX+Qpl
 BG03NibF/EtcIsORJ5su9eqAZqk2dWfIXdoIgtqSrMVU1R63kAhprYfuLi4Z9JEyEqkI
 OSn+doIIpaB7NQZ4qG+YNGj8NfKwIcq0JvGLx/CKq4Km39/EKXC3a+rBJBYXtVh7gujb
 oW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DrYtpmEqQRGjcYI7tSVPI9IsuM2ba09ZLw/2J0ZlN/g=;
 b=Uq5UIwEOrPwy1CPLOfRNtcwPqnBFF+/Hw6XJ4l5KmjkUdpxUKGB/GAQUoZqdR1CodD
 EqmUt41lJmOt0G2w5kq+HbLz2h8EnSIxZzmQ8oPXrrCbPg9AF5GQtR2LuqXZcrq0PRoq
 VpKjf8ujBIWCnpVo+GzBVjfgM9rr++4F53wiPy23BFOJ5L5NIZ6sU+hcDTBe6WxUhAV1
 Eys/QBP4pEHG79Ts+1BzF68IQuV5jJmQTMYAewM9nYDYiMwLevSUt5eXtrm+CnYoWSuQ
 o3AQ2H0aC2dLwVh0NSD/y5nMl0SsQy6+nSwRRi5tIp/bvQ9XmNTclH0A1xMr4i1cVQcP
 Jnyg==
X-Gm-Message-State: AOAM533yYk+ggD53xlky6jDh9bk7TAzhB3r6+M5yJflktGD7U6J+gDqy
 ThO3qkn+2yXXOoFOfLADC4k=
X-Google-Smtp-Source: ABdhPJyDkBuXteOtPh19+tVyBnNBckqnTaT2hfzJxjvcfB4RZvKAfPeT1391bEfTsnFRezxniZ1zSw==
X-Received: by 2002:a92:4913:: with SMTP id w19mr13902445ila.192.1607668105064; 
 Thu, 10 Dec 2020 22:28:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id e25sm3672262iom.40.2020.12.10.22.28.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 22:28:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
Date: Fri, 11 Dec 2020 14:28:11 +0800
Message-Id: <1607668091-33396-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607668091-33396-1-git-send-email-bmeng.cn@gmail.com>
References: <1607668091-33396-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x143.google.com
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

Changes in v2:
- add aai_enable into the vmstate
- validate AAI command before decoding a new command
- log guest errors during AAI_WP command handling
- report AAI status in the status register
- abort AAI programming when address is wrapped
- make sure AAI programming starts from the even address

 hw/block/m25p80.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 236e1b4..3517c6f 100644
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
@@ -932,6 +939,15 @@ static void decode_qio_read_cmd(Flash *s)
     s->state = STATE_COLLECTING_DATA;
 }
 
+static bool is_valid_aai_cmd(uint32_t value)
+{
+    if (value == AAI_WP || value == WRDI || value == RDSR) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
 static void decode_new_cmd(Flash *s, uint32_t value)
 {
     int i;
@@ -943,6 +959,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->reset_enable = false;
     }
 
+    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "M25P80: Invalid cmd within AAI programming sequence");
+    }
+
     switch (value) {
 
     case ERASE_4K:
@@ -1008,6 +1029,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case WRDI:
         s->write_enable = false;
+        if (get_man(s) == MAN_SST) {
+            s->aai_enable = false;
+        }
         break;
     case WREN:
         s->write_enable = true;
@@ -1018,6 +1042,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
@@ -1160,6 +1188,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
@@ -1205,6 +1251,19 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
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
@@ -1372,6 +1431,7 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT32(volatile_cfg, Flash),
         VMSTATE_UINT32(enh_volatile_cfg, Flash),
         VMSTATE_BOOL(quad_enable, Flash),
+        VMSTATE_BOOL(aai_enable, Flash),
         VMSTATE_UINT8(spansion_cr1nv, Flash),
         VMSTATE_UINT8(spansion_cr2nv, Flash),
         VMSTATE_UINT8(spansion_cr3nv, Flash),
-- 
2.7.4



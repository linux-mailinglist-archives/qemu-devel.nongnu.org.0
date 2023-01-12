Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA09666F63
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuLZ-0003AD-23; Thu, 12 Jan 2023 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLV-000395-ST
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:06 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLS-0004JD-T6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:05 -0500
Received: by mail-pl1-x629.google.com with SMTP id jn22so19689521plb.13
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJN77zwPvAoL5fKaRITq8kHJIrpvuKeac52ZNvXGbKM=;
 b=L7GU7ew/c1v0TPdz11GRu6lpnPuVG+jFvTH6dxgVe0qk/yMMwHMHG2RJsgI3OMaBEP
 ReCWHZKopFxOjgxpdpak1mEy2bqy1/l7P6qiw1/L2NBTEBCJ8iTrPwm1xnLh4eaoWgtD
 tsFvrb20sO2lt2dqX5qxyArLlk4aoe8d5XG9MNoKTK73ndmgJVlptBUlBj+4TiN7Mc+Q
 7uh2rARkIgiP8mthV1OgM/UgucY9QAho92pS5PPQj8zpNt288KXwwYQhDKQisCTO6AR1
 qz6QKJzx+W753dGrCZZc/+wGhR9sXHBzuQ9ocYvZMrDwz2VcJJlHT01e1+fKqncpPoXQ
 Cqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJN77zwPvAoL5fKaRITq8kHJIrpvuKeac52ZNvXGbKM=;
 b=1XhAcqGtlEoQBiCRJls2d2zBFs3jyqGh54sHEKJOSBxGU3vlvTdMloB/8ijTTrZkIf
 F/WvsOQnUUROswG+J5GkGWgeiTVJX7X+rXKO0tScxnG36og9knK6bhlAsogQjmtRO65r
 8VspB10Oja5wrDKcLzGZXibbGBkbFa3Tg38xs/uJdF7mbJBzNTBtnFpXBPQJRzCBrTrI
 2dcic7SRtghFjmTOqQpfLzUFs3Xqw0sk2gaEAg9lX17SJXMgmRONOO+WC3BeJWILXjhq
 P44k9y7R6IAqELnC6F9ojuACHRItf+hT+nzIZRbH/yO2QrwRIJkDtPfd39OTOeylKOr3
 LMYg==
X-Gm-Message-State: AFqh2krRKql8eFXJiKpv/hrcvYnlFdRkvVgL0VsRHosPanp96MBmyv0P
 iom+y67yKN9ZNzrk1wmtt0WYUw==
X-Google-Smtp-Source: AMrXdXsvt/TZu7nY9T8pk3jHToqMzqaYZp7qhvQComqw5mfWQj+Z+qvPcsjEStiSRd1MijgPBpMV0Q==
X-Received: by 2002:a17:90b:3886:b0:227:252c:7d26 with SMTP id
 mu6-20020a17090b388600b00227252c7d26mr6457894pjb.8.1673517481368; 
 Thu, 12 Jan 2023 01:58:01 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 01/31] e1000e: Fix the code style
Date: Thu, 12 Jan 2023 18:57:13 +0900
Message-Id: <20230112095743.20123-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

igb implementation first starts off by copying e1000e code. Correct the
code style before that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c         |  41 ++++++++--------
 hw/net/e1000e.c        |  72 ++++++++++++++--------------
 hw/net/e1000e_core.c   | 103 ++++++++++++++++++++++-------------------
 hw/net/e1000e_core.h   |  66 +++++++++++++-------------
 hw/net/e1000x_common.h |  44 +++++++++---------
 5 files changed, 168 insertions(+), 158 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e26e0a64c1..ac6ce0af21 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -808,10 +808,11 @@ receive_filter(E1000State *s, const uint8_t *buf, int size)
     if (e1000x_is_vlan_packet(buf, le16_to_cpu(s->mac_reg[VET])) &&
         e1000x_vlan_rx_filter_enabled(s->mac_reg)) {
         uint16_t vid = lduw_be_p(buf + 14);
-        uint32_t vfta = ldl_le_p((uint32_t*)(s->mac_reg + VFTA) +
+        uint32_t vfta = ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
                                  ((vid >> 5) & 0x7f));
-        if ((vfta & (1 << (vid & 0x1f))) == 0)
+        if ((vfta & (1 << (vid & 0x1f))) == 0) {
             return 0;
+        }
     }
 
     if (!isbcast && !ismcast && (rctl & E1000_RCTL_UPE)) { /* promiscuous ucast */
@@ -1220,16 +1221,16 @@ static const readops macreg_readops[] = {
     [TDFPC]   = mac_low13_read,
     [AIT]     = mac_low16_read,
 
-    [CRCERRS ... MPC]   = &mac_readreg,
-    [IP6AT ... IP6AT+3] = &mac_readreg,    [IP4AT ... IP4AT+6] = &mac_readreg,
-    [FFLT ... FFLT+6]   = &mac_low11_read,
-    [RA ... RA+31]      = &mac_readreg,
-    [WUPM ... WUPM+31]  = &mac_readreg,
-    [MTA ... MTA+127]   = &mac_readreg,
-    [VFTA ... VFTA+127] = &mac_readreg,
-    [FFMT ... FFMT+254] = &mac_low4_read,
-    [FFVT ... FFVT+254] = &mac_readreg,
-    [PBM ... PBM+16383] = &mac_readreg,
+    [CRCERRS ... MPC]     = &mac_readreg,
+    [IP6AT ... IP6AT + 3] = &mac_readreg,    [IP4AT ... IP4AT + 6] = &mac_readreg,
+    [FFLT ... FFLT + 6]   = &mac_low11_read,
+    [RA ... RA + 31]      = &mac_readreg,
+    [WUPM ... WUPM + 31]  = &mac_readreg,
+    [MTA ... MTA + 127]   = &mac_readreg,
+    [VFTA ... VFTA + 127] = &mac_readreg,
+    [FFMT ... FFMT + 254] = &mac_low4_read,
+    [FFVT ... FFVT + 254] = &mac_readreg,
+    [PBM ... PBM + 16383] = &mac_readreg,
 };
 enum { NREADOPS = ARRAY_SIZE(macreg_readops) };
 
@@ -1252,14 +1253,14 @@ static const writeops macreg_writeops[] = {
     [RDTR]   = set_16bit,  [RADV]   = set_16bit,      [TADV] = set_16bit,
     [ITR]    = set_16bit,
 
-    [IP6AT ... IP6AT+3] = &mac_writereg, [IP4AT ... IP4AT+6] = &mac_writereg,
-    [FFLT ... FFLT+6]   = &mac_writereg,
-    [RA ... RA+31]      = &mac_writereg,
-    [WUPM ... WUPM+31]  = &mac_writereg,
-    [MTA ... MTA+127]   = &mac_writereg,
-    [VFTA ... VFTA+127] = &mac_writereg,
-    [FFMT ... FFMT+254] = &mac_writereg, [FFVT ... FFVT+254] = &mac_writereg,
-    [PBM ... PBM+16383] = &mac_writereg,
+    [IP6AT ... IP6AT + 3] = &mac_writereg, [IP4AT ... IP4AT + 6] = &mac_writereg,
+    [FFLT ... FFLT + 6]   = &mac_writereg,
+    [RA ... RA + 31]      = &mac_writereg,
+    [WUPM ... WUPM + 31]  = &mac_writereg,
+    [MTA ... MTA + 127]   = &mac_writereg,
+    [VFTA ... VFTA + 127] = &mac_writereg,
+    [FFMT ... FFMT + 254] = &mac_writereg, [FFVT ... FFVT + 254] = &mac_writereg,
+    [PBM ... PBM + 16383] = &mac_writereg,
 };
 
 enum { NWRITEOPS = ARRAY_SIZE(macreg_writeops) };
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 7523e9f5d2..8635ca16c6 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -1,37 +1,37 @@
 /*
-* QEMU INTEL 82574 GbE NIC emulation
-*
-* Software developer's manuals:
-* http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
-*
-* Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
-* Developed by Daynix Computing LTD (http://www.daynix.com)
-*
-* Authors:
-* Dmitry Fleytman <dmitry@daynix.com>
-* Leonid Bloch <leonid@daynix.com>
-* Yan Vugenfirer <yan@daynix.com>
-*
-* Based on work done by:
-* Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
-* Copyright (c) 2008 Qumranet
-* Based on work done by:
-* Copyright (c) 2007 Dan Aloni
-* Copyright (c) 2004 Antony T Curtis
-*
-* This library is free software; you can redistribute it and/or
-* modify it under the terms of the GNU Lesser General Public
-* License as published by the Free Software Foundation; either
-* version 2.1 of the License, or (at your option) any later version.
-*
-* This library is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-* Lesser General Public License for more details.
-*
-* You should have received a copy of the GNU Lesser General Public
-* License along with this library; if not, see <http://www.gnu.org/licenses/>.
-*/
+ * QEMU INTEL 82574 GbE NIC emulation
+ *
+ * Software developer's manuals:
+ * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ *
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Dmitry Fleytman <dmitry@daynix.com>
+ * Leonid Bloch <leonid@daynix.com>
+ * Yan Vugenfirer <yan@daynix.com>
+ *
+ * Based on work done by:
+ * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
+ * Copyright (c) 2008 Qumranet
+ * Based on work done by:
+ * Copyright (c) 2007 Dan Aloni
+ * Copyright (c) 2004 Antony T Curtis
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
@@ -239,9 +239,9 @@ static NetClientInfo net_e1000e_info = {
 };
 
 /*
-* EEPROM (NVM) contents documented in Table 36, section 6.1
-* and generally 6.1.2 Software accessed words.
-*/
+ * EEPROM (NVM) contents documented in Table 36, section 6.1
+ * and generally 6.1.2 Software accessed words.
+ */
 static const uint16_t e1000e_eeprom_template[64] = {
   /*        Address        |    Compat.    | ImVer |   Compat.     */
     0x0000, 0x0000, 0x0000, 0x0420, 0xf746, 0x2010, 0xffff, 0xffff,
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index fc9cdb4528..c4be782558 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1,37 +1,37 @@
 /*
-* Core code for QEMU e1000e emulation
-*
-* Software developer's manuals:
-* http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
-*
-* Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
-* Developed by Daynix Computing LTD (http://www.daynix.com)
-*
-* Authors:
-* Dmitry Fleytman <dmitry@daynix.com>
-* Leonid Bloch <leonid@daynix.com>
-* Yan Vugenfirer <yan@daynix.com>
-*
-* Based on work done by:
-* Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
-* Copyright (c) 2008 Qumranet
-* Based on work done by:
-* Copyright (c) 2007 Dan Aloni
-* Copyright (c) 2004 Antony T Curtis
-*
-* This library is free software; you can redistribute it and/or
-* modify it under the terms of the GNU Lesser General Public
-* License as published by the Free Software Foundation; either
-* version 2.1 of the License, or (at your option) any later version.
-*
-* This library is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-* Lesser General Public License for more details.
-*
-* You should have received a copy of the GNU Lesser General Public
-* License along with this library; if not, see <http://www.gnu.org/licenses/>.
-*/
+ * Core code for QEMU e1000e emulation
+ *
+ * Software developer's manuals:
+ * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ *
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Dmitry Fleytman <dmitry@daynix.com>
+ * Leonid Bloch <leonid@daynix.com>
+ * Yan Vugenfirer <yan@daynix.com>
+ *
+ * Based on work done by:
+ * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
+ * Copyright (c) 2008 Qumranet
+ * Based on work done by:
+ * Copyright (c) 2007 Dan Aloni
+ * Copyright (c) 2004 Antony T Curtis
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
@@ -49,8 +49,9 @@
 
 #include "trace.h"
 
-#define E1000E_MIN_XITR     (500) /* No more then 7813 interrupts per
-                                     second according to spec 10.2.4.2 */
+/* No more then 7813 interrupts per second according to spec 10.2.4.2 */
+#define E1000E_MIN_XITR     (500)
+
 #define E1000E_MAX_TX_FRAGS (64)
 
 static inline void
@@ -282,14 +283,18 @@ e1000e_intrmgr_delay_rx_causes(E1000ECore *core, uint32_t *causes)
     core->delayed_causes |= *causes & delayable_causes;
     *causes &= ~delayable_causes;
 
-    /* Check if delayed RX interrupts disabled by client
-       or if there are causes that cannot be delayed */
+    /*
+     * Check if delayed RX interrupts disabled by client
+     * or if there are causes that cannot be delayed
+     */
     if ((rdtr == 0) || (*causes != 0)) {
         return false;
     }
 
-    /* Check if delayed RX ACK interrupts disabled by client
-       and there is an ACK packet received */
+    /*
+     * Check if delayed RX ACK interrupts disabled by client
+     * and there is an ACK packet received
+     */
     if ((raid == 0) && (core->delayed_causes & E1000_ICR_ACK)) {
         return false;
     }
@@ -2515,7 +2520,8 @@ e1000e_set_icr(E1000ECore *core, int index, uint32_t val)
     }
 
     icr = core->mac[ICR] & ~val;
-    /* Windows driver expects that the "receive overrun" bit and other
+    /*
+     * Windows driver expects that the "receive overrun" bit and other
      * ones to be cleared when the "Other" bit (#24) is cleared.
      */
     icr = (val & E1000_ICR_OTHER) ? (icr & ~E1000_ICR_OTHER_CAUSES) : icr;
@@ -3269,10 +3275,12 @@ enum { E1000E_NWRITEOPS = ARRAY_SIZE(e1000e_macreg_writeops) };
 
 enum { MAC_ACCESS_PARTIAL = 1 };
 
-/* The array below combines alias offsets of the index values for the
+/*
+ * The array below combines alias offsets of the index values for the
  * MAC registers that have aliases, with the indication of not fully
  * implemented registers (lowest bit). This combination is possible
- * because all of the offsets are even. */
+ * because all of the offsets are even.
+ */
 static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
     /* Alias index offsets */
     [FCRTL_A] = 0x07fe, [FCRTH_A] = 0x0802,
@@ -3536,10 +3544,10 @@ void e1000e_core_pre_save(E1000ECore *core)
     NetClientState *nc = qemu_get_queue(core->owner_nic);
 
     /*
-    * If link is down and auto-negotiation is supported and ongoing,
-    * complete auto-negotiation immediately. This allows us to look
-    * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
-    */
+     * If link is down and auto-negotiation is supported and ongoing,
+     * complete auto-negotiation immediately. This allows us to look
+     * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
+     */
     if (nc->link_down && e1000e_have_autoneg(core)) {
         core->phy[0][PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
         e1000e_update_flowctl_status(core);
@@ -3557,7 +3565,8 @@ e1000e_core_post_load(E1000ECore *core)
 {
     NetClientState *nc = qemu_get_queue(core->owner_nic);
 
-    /* nc.link_down can't be migrated, so infer link_down according
+    /*
+     * nc.link_down can't be migrated, so infer link_down according
      * to link status bit in core.mac[STATUS].
      */
     nc->link_down = (core->mac[STATUS] & E1000_STATUS_LU) == 0;
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index 4ddb4d2c39..b8f38c47a0 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -1,37 +1,37 @@
 /*
-* Core code for QEMU e1000e emulation
-*
-* Software developer's manuals:
-* http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
-*
-* Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
-* Developed by Daynix Computing LTD (http://www.daynix.com)
-*
-* Authors:
-* Dmitry Fleytman <dmitry@daynix.com>
-* Leonid Bloch <leonid@daynix.com>
-* Yan Vugenfirer <yan@daynix.com>
-*
-* Based on work done by:
-* Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
-* Copyright (c) 2008 Qumranet
-* Based on work done by:
-* Copyright (c) 2007 Dan Aloni
-* Copyright (c) 2004 Antony T Curtis
-*
-* This library is free software; you can redistribute it and/or
-* modify it under the terms of the GNU Lesser General Public
-* License as published by the Free Software Foundation; either
-* version 2.1 of the License, or (at your option) any later version.
-*
-* This library is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-* Lesser General Public License for more details.
-*
-* You should have received a copy of the GNU Lesser General Public
-* License along with this library; if not, see <http://www.gnu.org/licenses/>.
-*/
+ * Core code for QEMU e1000e emulation
+ *
+ * Software developer's manuals:
+ * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ *
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Dmitry Fleytman <dmitry@daynix.com>
+ * Leonid Bloch <leonid@daynix.com>
+ * Yan Vugenfirer <yan@daynix.com>
+ *
+ * Based on work done by:
+ * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
+ * Copyright (c) 2008 Qumranet
+ * Based on work done by:
+ * Copyright (c) 2007 Dan Aloni
+ * Copyright (c) 2004 Antony T Curtis
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #ifndef HW_NET_E1000E_CORE_H
 #define HW_NET_E1000E_CORE_H
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index b7742775c4..bc1ee75b04 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -1,26 +1,26 @@
 /*
-* QEMU e1000(e) emulation - shared code
-*
-* Copyright (c) 2008 Qumranet
-*
-* Based on work done by:
-* Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
-* Copyright (c) 2007 Dan Aloni
-* Copyright (c) 2004 Antony T Curtis
-*
-* This library is free software; you can redistribute it and/or
-* modify it under the terms of the GNU Lesser General Public
-* License as published by the Free Software Foundation; either
-* version 2.1 of the License, or (at your option) any later version.
-*
-* This library is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-* Lesser General Public License for more details.
-*
-* You should have received a copy of the GNU Lesser General Public
-* License along with this library; if not, see <http://www.gnu.org/licenses/>.
-*/
+ * QEMU e1000(e) emulation - shared code
+ *
+ * Copyright (c) 2008 Qumranet
+ *
+ * Based on work done by:
+ * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
+ * Copyright (c) 2007 Dan Aloni
+ * Copyright (c) 2004 Antony T Curtis
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #ifndef HW_NET_E1000X_COMMON_H
 #define HW_NET_E1000X_COMMON_H
-- 
2.39.0



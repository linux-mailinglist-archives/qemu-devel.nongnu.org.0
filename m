Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E74630C44
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 06:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGjI-0005Ex-54; Sat, 19 Nov 2022 00:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1owGjE-0005Ef-Vq
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:49:25 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1owGjC-0001iF-Sm
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:49:24 -0500
Received: by mail-pf1-x429.google.com with SMTP id 130so6789682pfu.8
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 21:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQdSQ3NJA9adF5qxPgsTMB61hnyUYqMfvqu1YZe7jos=;
 b=hjPsL6qWcRZfw6FcYM4p2HuoByODOvwP5whSvOl51exQxuqxbAnqPVwJA/gT8Phazh
 7UbycRjimpxy3tWe5Ga9HeFHKN42IapOQUUrVltRZZofHRtzhqTFZRImjW2Y46sQomR0
 6iXe24zDM1vAvk7iB4mcllwvVJ4LkR4EOEwqTQFYB+vZRRwhSZbKxIuKglXwL16BBMxd
 ZrTB8OAVJ5K2UAA6Fc27xFE1i7/tS1d09Q4ZIGbrxJh6HQkOB7704QkJ+VIrH1PS0tSJ
 f4ee4q2bHHnCMBlj/f52sM5azDBH9RN2x9H8omDR1uoVNiGjGAsCvj4qp0A44zuy753l
 01Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQdSQ3NJA9adF5qxPgsTMB61hnyUYqMfvqu1YZe7jos=;
 b=2xtGbgZ1Wblk/BhBQg7W3FiBocQrqdUdBnLADZE3YkoCySY93sAHFf2MsVtpaotfHP
 82qQ6YKcCmp24l1murHqedxoxUJgRVFzgaJBG1kUaIw6cLuO4fMX18Q3IzEhPp6DWRhg
 nri6DBDZOqMWRzKWPCaGlP3q1AOU7bFflTRguo3+GhvOLqqdoFvqvSUzd1LDKA9tVZFV
 TI22eJDcOJLnBzY//LdRl0a3bYdneb524cQGvJGZwkC9xxTa8DwwE02CGa09J2ihkvHt
 VTzG6jdUSa8Oph3oVTyXAp6L9VESWF0My+kUQLQLCcxKFzHKu3F9WNRz4KOsrQHVGIeO
 aZbg==
X-Gm-Message-State: ANoB5pmaFJgUHitGIW2fByFzoCbXL0+8dNq/hh9xjmFqgMXD3RFew0XF
 U4ynUXRICtMHKkMGpqJMttljyvcKhmPvrA==
X-Google-Smtp-Source: AA0mqf5YxG6+21wHGAu/2r9IlBwy2LMJk7ArSh+Gjfe/djsngYub2Kml9R7mGTo2hoEdLeOiWrgIlw==
X-Received: by 2002:a63:1522:0:b0:46f:6017:de59 with SMTP id
 v34-20020a631522000000b0046f6017de59mr9379341pgl.160.1668836959904; 
 Fri, 18 Nov 2022 21:49:19 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a1709026b0700b00186a2dd3ffdsm4771695plk.15.2022.11.18.21.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 21:49:19 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000: Mask registers when writing
Date: Sat, 19 Nov 2022 14:49:13 +0900
Message-Id: <20221119054913.103803-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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

When a register has effective bits fewer than their width, the old code
inconsistently masked when writing or reading. Make the code consistent
by always masking when writing, and remove some code duplication.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c | 84 +++++++++++++++++++-------------------------------
 1 file changed, 31 insertions(+), 53 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e26e0a64c1..d14507260d 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1060,30 +1060,6 @@ mac_readreg(E1000State *s, int index)
     return s->mac_reg[index];
 }
 
-static uint32_t
-mac_low4_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0xf;
-}
-
-static uint32_t
-mac_low11_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0x7ff;
-}
-
-static uint32_t
-mac_low13_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0x1fff;
-}
-
-static uint32_t
-mac_low16_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0xffff;
-}
-
 static uint32_t
 mac_icr_read(E1000State *s, int index)
 {
@@ -1136,11 +1112,17 @@ set_rdt(E1000State *s, int index, uint32_t val)
     }
 }
 
-static void
-set_16bit(E1000State *s, int index, uint32_t val)
-{
-    s->mac_reg[index] = val & 0xffff;
-}
+#define LOW_BITS_SET_FUNC(num)                             \
+    static void                                            \
+    set_##num##bit(E1000State *s, int index, uint32_t val) \
+    {                                                      \
+        s->mac_reg[index] = val & (BIT(num) - 1);          \
+    }
+
+LOW_BITS_SET_FUNC(4)
+LOW_BITS_SET_FUNC(11)
+LOW_BITS_SET_FUNC(13)
+LOW_BITS_SET_FUNC(16)
 
 static void
 set_dlen(E1000State *s, int index, uint32_t val)
@@ -1194,7 +1176,9 @@ static const readops macreg_readops[] = {
     getreg(XONRXC),   getreg(XONTXC),   getreg(XOFFRXC),  getreg(XOFFTXC),
     getreg(RFC),      getreg(RJC),      getreg(RNBC),     getreg(TSCTFC),
     getreg(MGTPRC),   getreg(MGTPDC),   getreg(MGTPTC),   getreg(GORCL),
-    getreg(GOTCL),
+    getreg(GOTCL),    getreg(RDFH),     getreg(RDFT),     getreg(RDFHS),
+    getreg(RDFTS),    getreg(RDFPC),    getreg(TDFH),     getreg(TDFT),
+    getreg(TDFHS),    getreg(TDFTS),    getreg(TDFPC),    getreg(AIT),
 
     [TOTH]    = mac_read_clr8,      [TORH]    = mac_read_clr8,
     [GOTCH]   = mac_read_clr8,      [GORCH]   = mac_read_clr8,
@@ -1212,22 +1196,15 @@ static const readops macreg_readops[] = {
     [MPTC]    = mac_read_clr4,
     [ICR]     = mac_icr_read,       [EECD]    = get_eecd,
     [EERD]    = flash_eerd_read,
-    [RDFH]    = mac_low13_read,     [RDFT]    = mac_low13_read,
-    [RDFHS]   = mac_low13_read,     [RDFTS]   = mac_low13_read,
-    [RDFPC]   = mac_low13_read,
-    [TDFH]    = mac_low11_read,     [TDFT]    = mac_low11_read,
-    [TDFHS]   = mac_low13_read,     [TDFTS]   = mac_low13_read,
-    [TDFPC]   = mac_low13_read,
-    [AIT]     = mac_low16_read,
 
     [CRCERRS ... MPC]   = &mac_readreg,
     [IP6AT ... IP6AT+3] = &mac_readreg,    [IP4AT ... IP4AT+6] = &mac_readreg,
-    [FFLT ... FFLT+6]   = &mac_low11_read,
+    [FFLT ... FFLT+6]   = &mac_readreg,
     [RA ... RA+31]      = &mac_readreg,
     [WUPM ... WUPM+31]  = &mac_readreg,
     [MTA ... MTA+127]   = &mac_readreg,
     [VFTA ... VFTA+127] = &mac_readreg,
-    [FFMT ... FFMT+254] = &mac_low4_read,
+    [FFMT ... FFMT+254] = &mac_readreg,
     [FFVT ... FFVT+254] = &mac_readreg,
     [PBM ... PBM+16383] = &mac_readreg,
 };
@@ -1239,26 +1216,27 @@ static const writeops macreg_writeops[] = {
     putreg(PBA),      putreg(EERD),     putreg(SWSM),     putreg(WUFC),
     putreg(TDBAL),    putreg(TDBAH),    putreg(TXDCTL),   putreg(RDBAH),
     putreg(RDBAL),    putreg(LEDCTL),   putreg(VET),      putreg(FCRUC),
-    putreg(TDFH),     putreg(TDFT),     putreg(TDFHS),    putreg(TDFTS),
-    putreg(TDFPC),    putreg(RDFH),     putreg(RDFT),     putreg(RDFHS),
-    putreg(RDFTS),    putreg(RDFPC),    putreg(IPAV),     putreg(WUC),
-    putreg(WUS),      putreg(AIT),
-
-    [TDLEN]  = set_dlen,   [RDLEN]  = set_dlen,       [TCTL] = set_tctl,
-    [TDT]    = set_tctl,   [MDIC]   = set_mdic,       [ICS]  = set_ics,
-    [TDH]    = set_16bit,  [RDH]    = set_16bit,      [RDT]  = set_rdt,
-    [IMC]    = set_imc,    [IMS]    = set_ims,        [ICR]  = set_icr,
-    [EECD]   = set_eecd,   [RCTL]   = set_rx_control, [CTRL] = set_ctrl,
-    [RDTR]   = set_16bit,  [RADV]   = set_16bit,      [TADV] = set_16bit,
-    [ITR]    = set_16bit,
+    putreg(IPAV),     putreg(WUC),
+    putreg(WUS),
+
+    [TDLEN]  = set_dlen,   [RDLEN]  = set_dlen,       [TCTL]  = set_tctl,
+    [TDT]    = set_tctl,   [MDIC]   = set_mdic,       [ICS]   = set_ics,
+    [TDH]    = set_16bit,  [RDH]    = set_16bit,      [RDT]   = set_rdt,
+    [IMC]    = set_imc,    [IMS]    = set_ims,        [ICR]   = set_icr,
+    [EECD]   = set_eecd,   [RCTL]   = set_rx_control, [CTRL]  = set_ctrl,
+    [RDTR]   = set_16bit,  [RADV]   = set_16bit,      [TADV]  = set_16bit,
+    [ITR]    = set_16bit,  [TDFH]   = set_11bit,      [TDFT]  = set_11bit,
+    [TDFHS]  = set_13bit,  [TDFTS]  = set_13bit,      [TDFPC] = set_13bit,
+    [RDFH]   = set_13bit,  [RDFT]   = set_13bit,      [RDFHS] = set_13bit,
+    [RDFTS]  = set_13bit,  [RDFPC]  = set_13bit,      [AIT]   = set_16bit,
 
     [IP6AT ... IP6AT+3] = &mac_writereg, [IP4AT ... IP4AT+6] = &mac_writereg,
-    [FFLT ... FFLT+6]   = &mac_writereg,
+    [FFLT ... FFLT+6]   = &set_11bit,
     [RA ... RA+31]      = &mac_writereg,
     [WUPM ... WUPM+31]  = &mac_writereg,
     [MTA ... MTA+127]   = &mac_writereg,
     [VFTA ... VFTA+127] = &mac_writereg,
-    [FFMT ... FFMT+254] = &mac_writereg, [FFVT ... FFVT+254] = &mac_writereg,
+    [FFMT ... FFMT+254] = &set_4bit, [FFVT ... FFVT+254] = &mac_writereg,
     [PBM ... PBM+16383] = &mac_writereg,
 };
 
-- 
2.38.1



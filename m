Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D7685DFE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3v2-0006SC-Fd; Tue, 31 Jan 2023 22:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3up-0006DQ-03
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:07 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3un-0000Oi-7P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:06 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so722390pjb.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaQBmuAwUG3bfNy5ZDg+YwZ/WikcZ/GlFG+7O8mJJRU=;
 b=WB/b0K2dtIZ0FKMldq41mKMEtJkj5EgjOvMOKTOrdEPpX3/Jt5WQJjN5wZVmqW9QmY
 AXacua6aI+pnqS0lRNTUFMjY5G4CLnrl1c/x4ugfcP+76BHhyaqycVFQ/E4ejTI0jq8G
 tUFqswE04eyU4si9y64eZOvkAFnEZhKKM3RjAZ4UtKIGpBupjyn/Xj2yWkUNMpH+qtsg
 pknN2N1jK1MEt9VBN2RLxbI6yLqT3v1YRxNrqLl4Wc/63cvnWr151x0PNUh5xfwkM/l7
 PsTSX+lCFoksebyEB3T4BnsLsKwl8ICQbMEkQ3EzYnxIMvUcE+YzOrgbADACKXc0TpPO
 IU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaQBmuAwUG3bfNy5ZDg+YwZ/WikcZ/GlFG+7O8mJJRU=;
 b=6R32aA/cBxpnwAxiry4ZlO6781ULmjDGeB8dugXkXPKMLxS5knSWOqCc//9415/5aq
 aMJKwGf2gbAqXQ/difDE+3WkSEa4rbNuy4LecepGMKjyfw9fOBgjkzXq6O1ftMpx/5sn
 17sJpRhz/VJ0QoFna7np6AClf3AEPAHcm7E+ScxkAH6xlD/+o6FA2ZOC6HGSS7NLFQmr
 PR0HN4XZ8zHGgjV2mv/OUS6hqz6QELX+HoHuSpZ6ujMO3Hqmc3NsrrYmHM9yoNMvjQQx
 8SaIx4luqRo9Dyoly3G/S4IquS7m4CoABIRIP25adMxyKbuhB/9fLHTF9LIUC7suc6Q4
 S5bQ==
X-Gm-Message-State: AO0yUKXuZy1EzeGpv3zhL7Y4ksvzplOLKT3Ud5PMstDJuu01pGri9Q25
 ta5keJv8fbwCLw0upUw63ASd70d9IuC8Ghw5
X-Google-Smtp-Source: AK7set+fexlQKjzGH7banz5DIphCfO0t+f9lrBHO4c4ewiuDgQeFY6RaXrhBdtyNCyyEkqmGM7NdOA==
X-Received: by 2002:a17:902:ecc1:b0:196:11c2:2fb3 with SMTP id
 a1-20020a170902ecc100b0019611c22fb3mr1576735plh.36.1675222563642; 
 Tue, 31 Jan 2023 19:36:03 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 05/29] e1000: Mask registers when writing
Date: Wed,  1 Feb 2023 12:35:15 +0900
Message-Id: <20230201033539.30049-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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
index 9619a2e481..0925a99511 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1062,30 +1062,6 @@ mac_readreg(E1000State *s, int index)
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
@@ -1138,11 +1114,17 @@ set_rdt(E1000State *s, int index, uint32_t val)
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
@@ -1196,7 +1178,9 @@ static const readops macreg_readops[] = {
     getreg(XONRXC),   getreg(XONTXC),   getreg(XOFFRXC),  getreg(XOFFTXC),
     getreg(RFC),      getreg(RJC),      getreg(RNBC),     getreg(TSCTFC),
     getreg(MGTPRC),   getreg(MGTPDC),   getreg(MGTPTC),   getreg(GORCL),
-    getreg(GOTCL),
+    getreg(GOTCL),    getreg(RDFH),     getreg(RDFT),     getreg(RDFHS),
+    getreg(RDFTS),    getreg(RDFPC),    getreg(TDFH),     getreg(TDFT),
+    getreg(TDFHS),    getreg(TDFTS),    getreg(TDFPC),    getreg(AIT),
 
     [TOTH]    = mac_read_clr8,      [TORH]    = mac_read_clr8,
     [GOTCH]   = mac_read_clr8,      [GORCH]   = mac_read_clr8,
@@ -1214,22 +1198,15 @@ static const readops macreg_readops[] = {
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
 
     [CRCERRS ... MPC]     = &mac_readreg,
     [IP6AT ... IP6AT + 3] = &mac_readreg,    [IP4AT ... IP4AT + 6] = &mac_readreg,
-    [FFLT ... FFLT + 6]   = &mac_low11_read,
+    [FFLT ... FFLT + 6]   = &mac_readreg,
     [RA ... RA + 31]      = &mac_readreg,
     [WUPM ... WUPM + 31]  = &mac_readreg,
     [MTA ... MTA + 127]   = &mac_readreg,
     [VFTA ... VFTA + 127] = &mac_readreg,
-    [FFMT ... FFMT + 254] = &mac_low4_read,
+    [FFMT ... FFMT + 254] = &mac_readreg,
     [FFVT ... FFVT + 254] = &mac_readreg,
     [PBM ... PBM + 16383] = &mac_readreg,
 };
@@ -1241,26 +1218,27 @@ static const writeops macreg_writeops[] = {
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
 
     [IP6AT ... IP6AT + 3] = &mac_writereg, [IP4AT ... IP4AT + 6] = &mac_writereg,
-    [FFLT ... FFLT + 6]   = &mac_writereg,
+    [FFLT ... FFLT + 6]   = &set_11bit,
     [RA ... RA + 31]      = &mac_writereg,
     [WUPM ... WUPM + 31]  = &mac_writereg,
     [MTA ... MTA + 127]   = &mac_writereg,
     [VFTA ... VFTA + 127] = &mac_writereg,
-    [FFMT ... FFMT + 254] = &mac_writereg, [FFVT ... FFVT + 254] = &mac_writereg,
+    [FFMT ... FFMT + 254] = &set_4bit,     [FFVT ... FFVT + 254] = &mac_writereg,
     [PBM ... PBM + 16383] = &mac_writereg,
 };
 
-- 
2.39.1



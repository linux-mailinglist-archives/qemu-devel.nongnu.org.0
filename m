Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A086678F45
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAyj-0002K8-Of; Mon, 23 Jan 2023 23:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyh-0002Jv-SP
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:12 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyg-0002N8-4u
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:11 -0500
Received: by mail-pl1-x632.google.com with SMTP id v23so13609082plo.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n5oQQgVkIpxn8nbwvHbUnnlMSNPxf1WiQ2d9LLeBryk=;
 b=ZS7EKryOx/LPDfpcGNbIokwKRm0BiGmuu6qkagd7p9Oqvw53F7a6JViPpCCbhIA8iO
 0cKN+pNTWSkDHG71bepa9//LNXv7iINZmq2TjL56bo/RmdITLJ5CIU5bg0GVLsYy+KJA
 S7C8rVFm6NHV6DEHIGeJ+5QpQYHUEcIio9aDmbhgC+uZsdfMlJHIiCX4jymb6zWiulrP
 sABiiEwovBKKZpqrCeA/tua0oZFYv01gIXEJ/dG0W7R3VjKoOfGzb/6Bx+OXOebifLs2
 OoDwQ5EnH2wFgb/3x89HOHZqDyO+ipGFuW2rDD+DiD9CUziOa8wqjBkwzMnAdd34W05x
 udJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n5oQQgVkIpxn8nbwvHbUnnlMSNPxf1WiQ2d9LLeBryk=;
 b=nl7q0iTOF4ANaQP0OGTPnWpkL/QA5tWRP+/vPTdK3W5M8JoqyTybPkg5sP9az9ljX/
 eAOlqND6cQsOS4zWkTUwbqt3xbs7ioPh1Nrt7ANdE34ZVzKcuLlTScuw5PGHO46htU1l
 DLCoh514bAlHm5OiKHos6bJQaHsWorf4xuhZHNIHNa0zhTzw591/z0rX6ce7fD1vqRO9
 OV27yOpy+YytLmRj88g1ReH5i8YIG5rQ2TkjKA0n+H4idvqXWX0EgknGtUQGdZPNgSOq
 qIfXC0G7By1zztVtXFdtMgpUySAcJrDfdYQmxV3arHtsJ/vfEeyIV5BFfnyKsB7sP7+x
 oMrw==
X-Gm-Message-State: AFqh2kolJS8DlEBlhOjxRnqUZ+oGjhPfCMycZRJsjqJGbkUQLSLN3Xgt
 S0GdhzhR7IPm2ftnwb4qiBRIzw==
X-Google-Smtp-Source: AMrXdXszJkFXH7fSx33ipEiARfh2vqUVnLsa5ziiy/9BasNmpaJgjpJTLbRjqO7zdOc0PGEOl7PYcQ==
X-Received: by 2002:a17:902:aa05:b0:194:52ed:7a2b with SMTP id
 be5-20020a170902aa0500b0019452ed7a2bmr27773289plb.39.1674534728896; 
 Mon, 23 Jan 2023 20:32:08 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 05/26] e1000: Mask registers when writing
Date: Tue, 24 Jan 2023 13:31:22 +0900
Message-Id: <20230124043143.5515-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
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
2.39.0



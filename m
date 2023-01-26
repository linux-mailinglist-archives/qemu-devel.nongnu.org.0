Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0C67C902
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:48:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznj-00033W-DE; Thu, 26 Jan 2023 05:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzn7-0002dN-FF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzn5-0005LU-CA
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:36 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b10so1175709pjo.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n5oQQgVkIpxn8nbwvHbUnnlMSNPxf1WiQ2d9LLeBryk=;
 b=OGqam13iDGl+1lb1HR6ntG8tenQucqoE99iz2h3sJGko/zxhHn/g8MfztUU5m+6XxF
 ZqN+mOBrmvNrWbK7dmFwSYJ6NYL60hQq7Eaf3mhonUhCmrdTia+eDjGqlekQYkIbrkQS
 vkbA09sdVmLS/yDKORtcKMiaIV4T+Bn6TrZphAEfUcUXytibS8PlyQKkUI2/f+LEYYbS
 mtW+Ta1De3tjK4//gT0yupewYOJ6k1cfDBC8CxssuTyHFUW3LbFXswl/GQ+tGto0LkLX
 q+Eq688MkQBMk0KXHzKJeGEBkObb0RZXZ10NVv08BYpYe4BushniRuSdwdNupcP0duFJ
 nJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n5oQQgVkIpxn8nbwvHbUnnlMSNPxf1WiQ2d9LLeBryk=;
 b=h+SfV8o6LeaeMsv84IhXnETznJLxpxPXcMb+zVBhdmyV9bP9NcseitsESafGYcakmM
 ZJvyIayGeYR4QzDe2LV8a3mX35o/TX52+t+ZCtnqwk2k+gr7YBIpP5FNid+37aGF7541
 C+bZ7LcG7iv/CSxPJaoyVpuybXzI5ZC2ChxxshqjVc4myFHco2Agah238+ykKoRWmQ+c
 mYLjcgG4OVDvuFvO9pixBfxsAkU7swZZsT8uUMdoU5HBQl5m0mSGhUjNIDXL8i8OrKq9
 qam0Hkfd6Om5jK1wUz2B/EIYY+hjWJhJnVLWbJmKO6vXVCREtn+xBvpsHu1E5NZcFzyX
 59Hw==
X-Gm-Message-State: AO0yUKUU8J+lc8FMGHiRU6O7AZ9ZwSOK4scUphIkA71u/PxBwBNWhsNM
 nG5WOqvpyOuIx4ikmvB8W7Ba4g==
X-Google-Smtp-Source: AK7set9i61Zlywo97x+xVDr0pmBQRmjKqQ+PRLlqjq8akOYA86O1HTBOKfIQUIwNnTgF9H8rw+Uv7Q==
X-Received: by 2002:a17:90b:33c2:b0:22c:1bd6:77de with SMTP id
 lk2-20020a17090b33c200b0022c1bd677demr2714868pjb.3.1674730054043; 
 Thu, 26 Jan 2023 02:47:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:33 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 05/26] e1000: Mask registers when writing
Date: Thu, 26 Jan 2023 19:46:44 +0900
Message-Id: <20230126104705.35023-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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



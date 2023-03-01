Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA686A6962
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM1-0004EJ-UG; Wed, 01 Mar 2023 04:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILr-0004BP-KG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:23 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILp-0002n7-4t
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:19 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n6so11892304plf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZ8AkG9QTobJMyOjnuuHxMJCe9FqyNNvl3I0MN2F60s=;
 b=oT4Lfx1XL6L0s2l0Tw+As+Nq9LbEmt/EQqG2UHjRyb3wqL5ytMt+9qGN5ppSEklLEU
 WpnThplaDWE83g0ksIGzEGf2pGRNqIyA6XS6EZ/ic7djXsIL90foUesP3e6sRuL1UqR8
 wl3VlAJugbxig/ccHXGZRCbsi4B+3XxKMotXtWfpdNL4lLEc2IZswp/4feJTSmQXxbl2
 gVHjgs/8W73LOrCYFicqSB9Ol2yzDtksnpcfN35WCHHlGGL9hoObpyqQ9zxSJh6W7Biq
 A7m4OVWvHZTnXdoSEnCeLhqgletDZAbKNjQ9jKmjFjpgA2pQq4ofF3yyPcgel+oCIs2A
 5wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZ8AkG9QTobJMyOjnuuHxMJCe9FqyNNvl3I0MN2F60s=;
 b=gA39s6A7gcv7nTxy+eYlPQuQlztokIIzBZE6IIO1s2A23JwYo7eRT2LwmTR+eGgvG1
 oUysgPqluomo/URC/KM1gX+0szzP3phVBNGmd/mGT7Ob9Q85X8nl5RevMzgcpGP10akA
 Ol1nYLOxHiywnGNtuBtQIJr2ioBmcLdru719tlef/WHWg/cLrQR5eqWbzmGXlIsoPu5G
 jL/3CNQ/ukLQNKdOkZBdhaYerxP0ysaFEyY0ZHL6SfyAYMPek2EtzwKHrkeuzSuVzz+D
 fe6zl5giOd6L2yyeNTAiJkajRn3K7sHN61CVOGZTOWoY7VGQWN/I+LEKIuym7FQA6omz
 nUqA==
X-Gm-Message-State: AO0yUKXgy3oUm8myvzS0Us4j2IdHaDxBBXTj8F60W8NpXc6CdB3tfS71
 HurU5XButtML1OensfQdRsk=
X-Google-Smtp-Source: AK7set+gBDgokJSgzNQDhK2Bb20YTJ+vx8V+koZjeCdDT96LIcHdUmTsoNP353t66jGypaBrvIcYgQ==
X-Received: by 2002:a17:902:c407:b0:19d:5b5:c159 with SMTP id
 k7-20020a170902c40700b0019d05b5c159mr7492406plk.1.1677661335880; 
 Wed, 01 Mar 2023 01:02:15 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:15 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bmeng@tinylab.org>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 3/8] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:01:58 +0800
Message-Id: <20230301090203.1601925-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/i82596.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index ec21e2699a..ab26f8bea1 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -72,10 +72,6 @@ enum commands {
 #define I596_EOF        0x8000
 #define SIZE_MASK       0x3fff
 
-#define ETHER_TYPE_LEN 2
-#define VLAN_TCI_LEN 2
-#define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
-
 /* various flags in the chip config registers */
 #define I596_PREFETCH   (s->config[0] & 0x80)
 #define I596_PROMISC    (s->config[8] & 0x01)
@@ -488,8 +484,6 @@ bool i82596_can_receive(NetClientState *nc)
     return true;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 {
     I82596State *s = qemu_get_nic_opaque(nc);
@@ -500,7 +494,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
     size_t bufsz = sz; /* length of data in buf */
     uint32_t crc;
     uint8_t *crc_ptr;
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] = {
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -583,17 +576,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
         }
     }
 
-    /* if too small buffer, then expand it */
-    if (len < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, len);
-        memset(buf1 + len, 0, MIN_BUF_SIZE + VLAN_HLEN - len);
-        buf = buf1;
-        if (len < MIN_BUF_SIZE) {
-            len = MIN_BUF_SIZE;
-        }
-        bufsz = len;
-    }
-
     /* Calculate the ethernet checksum (4 bytes) */
     len += 4;
     crc = cpu_to_be32(crc32(~0, buf, sz));
-- 
2.34.1



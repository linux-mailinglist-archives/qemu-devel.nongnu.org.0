Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978333AD0E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:08:27 +0100 (CET)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiH4-000323-98
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6q-0008FV-Kn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6n-0004M8-QB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso14283482pjb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKGUAxYfgStlOjKa9CDTGixVmDCzAwr3my9wLQMl3fc=;
 b=YeklNh3EYLwCZRs/fhURm9HffdTeQFtVBK6ThD4yJokgNQadDY1Sl35V3KjbSMKzry
 15W65Yjm6KTIAJMGnnquVDThM5fOfunA5cmVbXcXrYGpPcNvE+pXl5DXZ/gnqvvql35I
 f+22q4rPvaVFT3KXMhEPueIj+gMz/Nyu3mo9axhDjpxeSOpdesX6fRD29pSVj5YbUgtD
 vAURk0FWd04r0FMYu7fZ8iO1C8lLipEm1lDUsr92mGGU8+shoj/2iN0X451rdA/ImjUD
 EYJ/LeUi66Ymmc0+uKZPLk4JIetA6WJ8lv7wKIDpbmFrQLI2iOi9oq9ICwIq1EI6H8YV
 xgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKGUAxYfgStlOjKa9CDTGixVmDCzAwr3my9wLQMl3fc=;
 b=PFH73SnSAj/8moIWHRzJ7/9ssWq+Xw2zIZmsaocHULzO2YGxkDEe79Fpzhxh+qZt6l
 2tIX9A4offEFFta+6TL2CWERF6g0VscrXh6gNqUWalPHshI+8dowbAfLEsURsyyh7XPe
 QpIUwYR/HLlHkJLIWJmbW/JjFEJjbdHFgDYawtomcwKEAQV3/CtnEY+umNU8QfQp2F6j
 1RZB8E2fQZrcNZ5H2MPzZRT5nY6REzeDIc3RGiKF7YFo1LfTtPvoxqNcUESozoM/ZXLw
 qb9YwPV8vvL1NEus0MwvxgpNSw9W0jg52kggtk+bUSe5amQWCUdXDaUl5eWbAKZ+ZSQ2
 FgAQ==
X-Gm-Message-State: AOAM531u6ar6z29CzMX8po43IIEVyEh+krgtDkiH4kP1tKsCCg80Dfh1
 AsM4M5MB+0BXmwU+ZDnLfIs=
X-Google-Smtp-Source: ABdhPJx0pT796fWVL5YmX63UGIXKH0V/o/svyTlEn8RT0NBcn3QELr9uuO65xn88aV8Vp28YN1ctfw==
X-Received: by 2002:a17:90a:f2d4:: with SMTP id
 gt20mr11644603pjb.212.1615795067877; 
 Mon, 15 Mar 2021 00:57:47 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:13 +0800
Message-Id: <20210315075718.5402-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/i82596.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 055c3a1470..1eca2e2d81 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -73,10 +73,6 @@ enum commands {
 #define I596_EOF        0x8000
 #define SIZE_MASK       0x3fff
 
-#define ETHER_TYPE_LEN 2
-#define VLAN_TCI_LEN 2
-#define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
-
 /* various flags in the chip config registers */
 #define I596_PREFETCH   (s->config[0] & 0x80)
 #define I596_PROMISC    (s->config[8] & 0x01)
@@ -489,8 +485,6 @@ bool i82596_can_receive(NetClientState *nc)
     return true;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 {
     I82596State *s = qemu_get_nic_opaque(nc);
@@ -501,7 +495,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
     size_t bufsz = sz; /* length of data in buf */
     uint32_t crc;
     uint8_t *crc_ptr;
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] = {
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -584,17 +577,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
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
2.25.1



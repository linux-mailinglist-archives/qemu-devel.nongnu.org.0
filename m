Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A621E33CF85
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:17:17 +0100 (CET)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4tA-0007jl-J3
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pc-0002Wf-T8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:37 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pa-0007v6-QO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e7so20378466edu.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=6g2fqKS4zXXBGv4/b0aMoziWaN2OpwusnZLdMFaob9Y=;
 b=LnkF9+4KoT8onqkme3Uvc3XVPXxV9ImLtdoQ4JQEqzFHj5zrHA87q6Yi6vaW2dQ6MG
 frNq8z+MwQhHYkbFgsj6XyfknGBy1yGEeI+xaXaAtTuBdWJcfjxCD5Q4jMu0LOWSXRct
 pPU6X/gb22XNFbriJe3Pf1rrfoZf7nSgxt/6utI3QNY9dhXg/tzNreg3N1AUlDUltgHS
 N98U1Ffz+nMP16rcZkC6FFZtIffQsmK74jTdrPSjUU7ZuanzI8Lf7vg6f2T9y6JQe28k
 v276ai3QESFOCWQsEpUjTiWTstuIQUIwcRgCohekOf/l0gJnyN0LecD9IwHOPZwjoC7W
 IU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=6g2fqKS4zXXBGv4/b0aMoziWaN2OpwusnZLdMFaob9Y=;
 b=bABtRQ2Pw0jXW53eNFUaRWYnoRWv8BH2yE2kZDDFfisZZcFy5hBbkTEeuzfKhz7Mx8
 T7o0iayThAZihEq4le4yGgdjRIxI2OL6aMa7ZTgFhNhd61Euux46l6QJgJb9cW43Bk2n
 tUW8qxO62O6y07Hu+ZDvYohHy7jZCeL2d8fGZJGbIjrSXx0YgrwsAzvMsu6Uul1YqtWj
 6BSl0Uq6VxjMroUIE9/Z2fXWsP/kig3Ctl1/lx37qARxW1oRl+acToSSL+JG/pOv2lKU
 7k0qRwz05h7GxD5qKLYTZJ8uzPhCvxzaJavGZVwUcVu/S1BY8/OlLBo8cRpFRRL1g/+M
 Y3mg==
X-Gm-Message-State: AOAM532vz/69/OxI0tYu5bqtbdHmox2C6EPh4wRnV6DgZLWiZAakmWVK
 mQQVtdNRe7Espgn3RzzLaSs=
X-Google-Smtp-Source: ABdhPJxP2B+ksJEHTg7o307tRov/6YgCzVFrrHBekxCeo+Y4V4mRR2m2wGdkwBiLa0t4BTBhtdFEBQ==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr34046081edt.251.1615882413599; 
 Tue, 16 Mar 2021 01:13:33 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:49 +0800
Message-Id: <20210316081254.72684-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

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
2.17.1



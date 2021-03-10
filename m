Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FAA333A34
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:41:42 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwHd-0005bk-Qu
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpM-00011S-L6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:28 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpL-0006uv-4U
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:28 -0500
Received: by mail-ej1-x632.google.com with SMTP id mm21so37465162ejb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=O9yrkVVHqbfS1wxTV5lf3YHG4sWif/zskA4hK5tu15U=;
 b=Oti8FuJjvU+FA5rJvKdbQJQRVztMP7zyDQr0Z2+GDvxMaVU4RE8Gwl9ts+8K19ZJ9x
 NT1lRaNJ6zgSzUjUzEovD14MLMmBoa67OB4MT3KFcRUvNRsTKlinSC1l5xmNi/kCa3js
 CXaLpK0GPQp7al37dj88AdMmgd+Xv2H3MiA0J4gz55hmpY3uRW0sxVTWRZivDH/iTVy/
 S5L9u9eK74ZHUdZNAvkZfHS0xAshugjjy9whAInHS/mm8T+yvy2ud2TsZhzhk9vMoIKj
 Y7uKpRUxx7tBgZeCgSHu7AyE86GgadHHv/uYJNow8E1CIeh3sz+WBiiUobCKW+4q4CO7
 L55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=O9yrkVVHqbfS1wxTV5lf3YHG4sWif/zskA4hK5tu15U=;
 b=tx6rk20rYpvzUQ1WuGLmfbFYXNcisDHsISPCSvecBBa0PeX8jqIaGIp51x33d8pY/F
 p9AuqoSU3EZicVDZosD4yjcqvWQqjCpSDU1yXsAaeBAQOBC5nUv+pmWXIYy5QaqXAmQF
 oEKaC7Mc2YJaYq2mhAc2Ji+DTRTN+aXTOA8rYOwgqItzH3rNtBUq9ZV0UQ6BPKPq6qGd
 kxMRQkP5nuFQP5do6edsKE8YUN3WDwk9NgLBgMnwcvU6bXPBDKCv1uUxCm0V/pXZnLc5
 6i9/tbhK+JbAdNa3qnq1D/Hl0l7ayX8TgEEnm4vFAnzzdrqeUlHGnUTmeEgtHcd/tFlk
 +AVQ==
X-Gm-Message-State: AOAM530F8qD9d+us3hYS42fHoTJoVujQv8kyP7dl5q3ftDLV6RDisVG/
 2xEtNMcQqgoCx59Z1S4vyrM=
X-Google-Smtp-Source: ABdhPJy+HrUevT9GNbqGYjUnbHPP/X6/rsSretogl+z7y6Sqbg3zql3xakhV66VDuQrbk/oZskxIMQ==
X-Received: by 2002:a17:906:68c5:: with SMTP id
 y5mr2841681ejr.371.1615371146008; 
 Wed, 10 Mar 2021 02:12:26 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 05/10] hw/net: i82596: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:52 +0800
Message-Id: <20210310101157.15136-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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



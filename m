Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1733D38B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:10:33 +0100 (CET)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8Wu-0007Nl-7a
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RD-0002Ue-O5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:39 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RB-0003lf-Q4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id p21so22444747pgl.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9LsfiXpwV9uYopdvb7Wgrlne4+iqiaA7iS+ccLjExg=;
 b=RqS4QMgv63Ez2V0FShuOBWpbuwxO6bMwPmNOHrVxiemCSoauGtSCYqg0Wlo26gkkhQ
 sHiyC2riBnr4N8otJUZqQlN0p/Tm61VoruChKhNT/fnDU1SH1TzhnukzO9xbtk45ewIc
 iPBsDCB85+hEatcDnE/42AEGEGJYL0H/QIbp2aPObogPGFPwkBIM1Apz8x2/CQAJd4Be
 x8B2a9wq3K97HH8Wy2I05PjZFMZl73waWUCPdq+tybjQTF+G5rSCUm2vTiRQk4Uu290L
 wg0xUkYpjpnX5mwJ00Qa4X7fchVj2YKOBmC1/rOIjv8c/5ApPExMsAaZo0S1mf2FdLzT
 x69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9LsfiXpwV9uYopdvb7Wgrlne4+iqiaA7iS+ccLjExg=;
 b=Q+nKygPMenJB0gDU+JDg/cLdrkXijARWP20EvlOrjrGTterbAYDQBkfKkStRW+rT5q
 25MpxzwGwZbOiux2jtx09mrt/7wxmJo5q7h9NBAwNO3zZ8ocm91TyYUlNC4u60OaNxhZ
 FZ/3rimnfM4y5w+bIXv82vjY2vQhfx2bmy1j2YZ7l6cAdbWplyQ6oXz8h+BpzuxFE+R8
 4VKeRcinoZOHZal07DVs8rH+PjM4YGFkjonOJdjgvnSLjibxvohNu1iyE2ZaSQ8D3rP5
 DCYtfdnxJz2uqvORYgeQuPtZQYS74/hII3Xhw+i6q5Yza1wArZ3sPXEtMLlzP3/a1EBd
 lQyg==
X-Gm-Message-State: AOAM532sZFwiWKKA0NQILGvSayPAiklnKUpF1lIMqcwqQDq49wDJ5P5m
 fURFF9XoO4f8xEnzrxHDFLFsgdgjfl0=
X-Google-Smtp-Source: ABdhPJygYPQAXOOZc2IiGw1BwUYCzhEbfdIxx1uY5CnjmR9rTnve2t81hNee3Dc77iAZ+cp6ulRG4w==
X-Received: by 2002:aa7:8488:0:b029:1fc:f312:b24e with SMTP id
 u8-20020aa784880000b02901fcf312b24emr14437426pfn.55.1615896276548; 
 Tue, 16 Mar 2021 05:04:36 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] net: Pad short frames to minimum size before sending
 from SLiRP/TAP
Date: Tue, 16 Mar 2021 20:04:11 +0800
Message-Id: <20210316120420.19658-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
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

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends like SLiRP/TAP, we change to pad short frames before sending
it out to the other end, if the other end does not forbid it via the
nc->do_not_pad flag. This ensures a backend as an Ethernet sender
does not violate the spec. But with this change, the behavior of
dropping short frames from SLiRP/TAP interfaces in the NIC model
cannot be emulated because it always receives a packet that is spec
complaint. The capability of sending short frames from NIC models is
still supported and short frames can still pass through SLiRP/TAP.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

The following 2 commits seem to be the one to workaround this issue
in e1000 and vmxenet3 before, and should probably be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v4:
- squash slirp/tap commits into one

Changes in v3:
- use the pad_short_frame() helper

 net/slirp.c     | 10 ++++++++++
 net/tap-win32.c | 10 ++++++++++
 net/tap.c       | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..a01a0fccd3 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -31,6 +31,7 @@
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "hub.h"
@@ -115,6 +116,15 @@ static ssize_t net_slirp_send_packet(const void *pkt, size_t pkt_len,
                                      void *opaque)
 {
     SlirpState *s = opaque;
+    uint8_t min_pkt[ETH_ZLEN];
+    size_t min_pktsz = sizeof(min_pkt);
+
+    if (!s->nc.peer->do_not_pad) {
+        if (eth_pad_short_frame(min_pkt, &min_pktsz, pkt, pkt_len)) {
+            pkt = min_pkt;
+            pkt_len = min_pktsz;
+        }
+    }
 
     return qemu_send_packet(&s->nc, pkt, pkt_len);
 }
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2b5dcda36e..fb92b55768 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -31,6 +31,7 @@
 
 #include "qemu-common.h"
 #include "clients.h"            /* net_init_tap */
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/tap.h"            /* tap_has_ufo, ... */
 #include "qemu/error-report.h"
@@ -688,9 +689,18 @@ static void tap_win32_send(void *opaque)
     uint8_t *buf;
     int max_size = 4096;
     int size;
+    uint8_t min_pkt[ETH_ZLEN];
+    size_t min_pktsz = sizeof(min_pkt);
 
     size = tap_win32_read(s->handle, &buf, max_size);
     if (size > 0) {
+        if (!s->nc.peer->do_not_pad) {
+            if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
+                buf = min_pkt;
+                size = min_pktsz;
+            }
+        }
+
         qemu_send_packet(&s->nc, buf, size);
         tap_win32_free_buffer(s->handle, buf);
     }
diff --git a/net/tap.c b/net/tap.c
index b7512853f4..dd42ac6134 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -32,6 +32,7 @@
 #include <sys/socket.h>
 #include <net/if.h>
 
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "monitor/monitor.h"
@@ -189,6 +190,8 @@ static void tap_send(void *opaque)
 
     while (true) {
         uint8_t *buf = s->buf;
+        uint8_t min_pkt[ETH_ZLEN];
+        size_t min_pktsz = sizeof(min_pkt);
 
         size = tap_read_packet(s->fd, s->buf, sizeof(s->buf));
         if (size <= 0) {
@@ -200,6 +203,13 @@ static void tap_send(void *opaque)
             size -= s->host_vnet_hdr_len;
         }
 
+        if (!s->nc.peer->do_not_pad) {
+            if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
+                buf = min_pkt;
+                size = min_pktsz;
+            }
+        }
+
         size = qemu_send_packet_async(&s->nc, buf, size, tap_send_completed);
         if (size == 0) {
             tap_read_poll(s, false);
-- 
2.25.1



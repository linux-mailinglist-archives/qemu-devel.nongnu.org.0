Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ED333E9C0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:29:49 +0100 (CET)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPgi-0005R7-Cf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe6-0003gl-1O
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe4-000056-5y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id e19so749803ejt.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rDQdQ31Ek+KqitukNgsTl2vL/K22ucZcSt0OxTt5Mtc=;
 b=UFv6XZy8hbJWJkW/XKJHaZmV806toP4HnbN9h5mv9CQfH83/SHxz3kBFv/6+5q17Fe
 8rLnpmYp8s5ebxW4CjmZX/p4dctx4aUIOHa8V0eKa4AE6bAdx3YAgUn4g6PFJoEwknZa
 wi7Dqy1Ghmg93fXnlIcMvKrtO7uqTv8xe/d7pzpfJFWwdjcldOThraEYWixrRfVmS2bW
 yQSKDt4qOBH5fCuBpk4U8+eiNAwq9l4davuuntX3Z4FODn4OeqbWcQFSehssSz5XY2FD
 DPLTenQR8rb8b1nPQBcAMxbwAgEW9JUrdBCZUKpSg5aqMvrgGTBdTecDjHDr4lw6yjMd
 WQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDQdQ31Ek+KqitukNgsTl2vL/K22ucZcSt0OxTt5Mtc=;
 b=KqoJBXg3XIZiBbLzfoPoxGV+d7fjqYMrOpFhZIzIMXIvYq/MA3Zp05ng9Rq4yduwDj
 w+I5EQxgjIFXwwq3hT/kds10oeCpAC1OaX5UIe3Q903CmHmkyFwSASVAsHQMwdv9KiPH
 2FmuQrl8F/0N3CAX2sWVpcW61US/ifyg3BtKeNVXPX39IR73rjsE2+xwiAA7d3XsxxF/
 e+G4XDFlicTJ77U2hgP+3oHuG06jQTNA8EheT7lcK5PH9tqUoKkOpAZhNkTF7Dmvp9Jq
 B1S5zJAXjjrb6AAxs9Rca2Q9q/PIsUeC+mEnwhIo9ghR5MlqtIrqPGa2b7JdYqb26ZqL
 Bhiw==
X-Gm-Message-State: AOAM533L2eJKpAd5Y2okRcPlwFILcuAG/9R1uE+bvulB69sJrWTSdhXb
 O0o0hOAFjTZ+xZkycwjvw8Y=
X-Google-Smtp-Source: ABdhPJw9nET9Ic5ETRK2ZZ4p0PGY6iqp6nrIC2QUlLcadY2ZRHQZnCLIYiKkpjx9SytDWEfY7SCyQw==
X-Received: by 2002:a17:907:7664:: with SMTP id
 kk4mr34725278ejc.352.1615962422820; 
 Tue, 16 Mar 2021 23:27:02 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 03/12] net: Pad short frames to minimum size before sending
 from SLiRP/TAP
Date: Wed, 17 Mar 2021 14:26:29 +0800
Message-Id: <20210317062638.72626-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

(no changes since v4)

Changes in v4:
- squash slirp/tap commits into one

Changes in v3:
- use the pad_short_frame() helper

 net/slirp.c     | 10 ++++++++++
 net/tap-win32.c | 10 ++++++++++
 net/tap.c       | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index 9454a673d6..a9fdc7a08f 100644
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
index 21e451107b..d7c2a8759c 100644
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
index 12a08d54fe..d6d8456188 100644
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
2.17.1



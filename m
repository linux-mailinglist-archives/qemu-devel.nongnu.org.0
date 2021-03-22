Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E44343DAD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:23:58 +0100 (CET)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHj3-00051H-0U
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU9-00083J-1u
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU6-0002ri-MO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3C1YNOjujSp5PvIN8idpavmEyhVJmsHoVH5Ju/f3tFY=;
 b=MVN4Mt2fSIWyYOqqxlRYWnrYtC9Cn4KrdHBc15aSSBuQFH+ms++rSFvOGJQpzex1EpTsCO
 VUWJ+1JXI4wNr7fXFBg/BoIxMEVfTzW/BMBhTKio66lWHztfm/ePxWB3Bul7umjkFTKjig
 SBwEdAon41cKeOBBEo8Cimb1r5SMICg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-LKWyI5DHPUmDMHzGmfyPOA-1; Mon, 22 Mar 2021 06:08:27 -0400
X-MC-Unique: LKWyI5DHPUmDMHzGmfyPOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0865A612A6;
 Mon, 22 Mar 2021 10:08:26 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C2A5D9CD;
 Mon, 22 Mar 2021 10:08:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 03/13] net: Pad short frames to minimum size before sending
 from SLiRP/TAP
Date: Mon, 22 Mar 2021 18:08:02 +0800
Message-Id: <1616407692-693-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/slirp.c     | 10 ++++++++++
 net/tap-win32.c | 10 ++++++++++
 net/tap.c       | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index 9454a67..a9fdc7a 100644
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
index 21e4511..d7c2a87 100644
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
index 12a08d5..d6d8456 100644
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
2.7.4



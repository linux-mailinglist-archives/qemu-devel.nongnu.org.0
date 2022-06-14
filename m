Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8B54AF4F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 13:29:06 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14jI-0004Pr-Pz
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 07:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14dw-0001r0-Bu
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:23:32 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:46320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14dt-0003X0-D8
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:23:31 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id CCBB12E0FA4;
 Tue, 14 Jun 2022 14:21:21 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 1D9NBe4btf-LKJWPbku; Tue, 14 Jun 2022 14:21:21 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1655205681; bh=rX7W3a286WJVB9w2NsRhrVtQ7sG04KTIiHHNhbXu3/E=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=HlJ7w/efQ7HWbIAvW+ThvEy7foZJhjg8i2gljvG1XJv2S4VS8OcPm4OD7tv+EEEHF
 0Tvx7OPpbVKm+HZZyHS1FcLvgNpM997cuCdSO9iHJIVsq4r6dGkseZIgHQBBItccti
 vwyCFEohtpKEZePxO8/XG70FZOzDYG4fk1kVoWbk=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from dellarbn.yandex.net (unknown [2a02:6b8:b081:32::1:13])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 sHPeVXHJAo-LEMu1IYT; Tue, 14 Jun 2022 14:21:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>
Subject: [PATCH 2/2] tap: initialize TAPState->enabled according to the actual
 state of queue
Date: Tue, 14 Jun 2022 14:21:44 +0300
Message-Id: <20220614112144.25324-1-arbn@yandex-team.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614111843.24960-1-arbn@yandex-team.com>
References: <20220614111843.24960-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Currently TAPState->enabled initialized as true. If fd was passed to qemu
in a disabled state it will cause an assert at the attempt to detach queue
in virtio_net_set_queues():

virtio_net_set_queues() :
            r = peer_detach() -> tap_disable():
                                    if (s->enabled == 0) {
                                       return 0;
				    } else {
				       //Will return an error.
                                       ret = tap_fd_disable(s->fd);
                                       ...
				       return ret;
            assert(!r);

Initialize ->enabled according to the actual state of fd to fix this.

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 net/tap-bsd.c     |  5 +++++
 net/tap-linux.c   | 12 ++++++++++++
 net/tap-solaris.c |  5 +++++
 net/tap.c         |  2 +-
 net/tap_int.h     |  1 +
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 005ce05c6e0..8c21f058c8c 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -217,6 +217,11 @@ int tap_probe_vnet_hdr_len(int fd, int len)
     return 0;
 }
 
+bool tap_probe_enabled(int fd)
+{
+    return true;
+}
+
 void tap_fd_set_vnet_hdr_len(int fd, int len)
 {
 }
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 304ff45071d..6078ba03af6 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -193,6 +193,18 @@ int tap_probe_vnet_hdr_len(int fd, int len)
     return 1;
 }
 
+bool tap_probe_enabled(int fd)
+{
+    struct ifreq ifr;
+
+    if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
+        error_report("TUNGETIFF ioctl() failed: %s",
+                     strerror(errno));
+        return false;
+    }
+    return !(ifr.ifr_flags & IFF_DETACH_QUEUE);
+}
+
 void tap_fd_set_vnet_hdr_len(int fd, int len)
 {
     if (ioctl(fd, TUNSETVNETHDRSZ, &len) == -1) {
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index a44f8805c23..ccaa3334882 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -221,6 +221,11 @@ int tap_probe_vnet_hdr_len(int fd, int len)
     return 0;
 }
 
+bool tap_probe_enabled(int fd)
+{
+    return true;
+}
+
 void tap_fd_set_vnet_hdr_len(int fd, int len)
 {
 }
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74b..799f8ec7c76 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -399,7 +399,7 @@ static TAPState *net_tap_fd_init(NetClientState *peer,
     s->host_vnet_hdr_len = vnet_hdr ? sizeof(struct virtio_net_hdr) : 0;
     s->using_vnet_hdr = false;
     s->has_ufo = tap_probe_has_ufo(s->fd);
-    s->enabled = true;
+    s->enabled = tap_probe_enabled(s->fd);
     tap_set_offload(&s->nc, 0, 0, 0, 0, 0);
     /*
      * Make sure host header length is set correctly in tap:
diff --git a/net/tap_int.h b/net/tap_int.h
index 547f8a5a28f..b8fc3dfbfa7 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -37,6 +37,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
 int tap_probe_vnet_hdr(int fd, Error **errp);
 int tap_probe_vnet_hdr_len(int fd, int len);
 int tap_probe_has_ufo(int fd);
+bool tap_probe_enabled(int fd);
 void tap_fd_set_offload(int fd, int csum, int tso4, int tso6, int ecn, int ufo);
 void tap_fd_set_vnet_hdr_len(int fd, int len);
 int tap_fd_set_vnet_le(int fd, int vnet_is_le);
-- 
2.35.1



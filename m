Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4A39B418
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:38:33 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4PY-0007Gb-Bq
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4Na-0004bC-Km
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4NY-0001Rj-Tb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622792188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yInjlKc/qubB9pbEHPSFUUc3nJ+hUGxFsu0TxYoDXb8=;
 b=O+9VyuVA8XfLUlplPrWt3HYQwkS47Zlz2J/Ck2hxNiE7Ot0PPadJfAxs0+T3ghnJVAhlER
 UJS2yuWLd6Y41q956ztW78KkBIs2xCkrV+NHlMswEmbe65fOy07fiH2YFCwu+5AAsNK4CB
 jAp1EaUrTtcOGSVmaoitXYLIFzLtG7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Bn6A6bHmPc-l08YpoXYmIg-1; Fri, 04 Jun 2021 03:36:26 -0400
X-MC-Unique: Bn6A6bHmPc-l08YpoXYmIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54BF58049CC;
 Fri,  4 Jun 2021 07:36:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC3960CC9;
 Fri,  4 Jun 2021 07:36:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/7] net: Added SetSteeringEBPF method for NetClientState.
Date: Fri,  4 Jun 2021 15:36:12 +0800
Message-Id: <20210604073617.69622-3-jasowang@redhat.com>
In-Reply-To: <20210604073617.69622-1-jasowang@redhat.com>
References: <20210604073617.69622-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

For now, that method supported only by Linux TAP.
Linux TAP uses TUNSETSTEERINGEBPF ioctl.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h |  2 ++
 net/tap-bsd.c     |  5 +++++
 net/tap-linux.c   | 13 +++++++++++++
 net/tap-solaris.c |  5 +++++
 net/tap-stub.c    |  5 +++++
 net/tap.c         |  9 +++++++++
 net/tap_int.h     |  1 +
 7 files changed, 40 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 1ef536d..5d15080 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -61,6 +61,7 @@ typedef int (SetVnetBE)(NetClientState *, bool);
 typedef struct SocketReadState SocketReadState;
 typedef void (SocketReadStateFinalize)(SocketReadState *rs);
 typedef void (NetAnnounce)(NetClientState *);
+typedef bool (SetSteeringEBPF)(NetClientState *, int);
 
 typedef struct NetClientInfo {
     NetClientDriver type;
@@ -82,6 +83,7 @@ typedef struct NetClientInfo {
     SetVnetLE *set_vnet_le;
     SetVnetBE *set_vnet_be;
     NetAnnounce *announce;
+    SetSteeringEBPF *set_steering_ebpf;
 } NetClientInfo;
 
 struct NetClientState {
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf67..4f64f31 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -259,3 +259,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap-linux.c b/net/tap-linux.c
index b0635e9..9584769 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -316,3 +316,16 @@ int tap_fd_get_ifname(int fd, char *ifname)
     pstrcpy(ifname, sizeof(ifr.ifr_name), ifr.ifr_name);
     return 0;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    if (ioctl(fd, TUNSETSTEERINGEBPF, (void *) &prog_fd) != 0) {
+        error_report("Issue while setting TUNSETSTEERINGEBPF:"
+                    " %s with fd: %d, prog_fd: %d",
+                    strerror(errno), fd, prog_fd);
+
+       return -1;
+    }
+
+    return 0;
+}
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 0475a58..d852242 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -255,3 +255,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap-stub.c b/net/tap-stub.c
index de525a2..a0fa258 100644
--- a/net/tap-stub.c
+++ b/net/tap-stub.c
@@ -85,3 +85,8 @@ int tap_fd_get_ifname(int fd, char *ifname)
 {
     return -1;
 }
+
+int tap_fd_set_steering_ebpf(int fd, int prog_fd)
+{
+    return -1;
+}
diff --git a/net/tap.c b/net/tap.c
index bae895e..f5686bb 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -347,6 +347,14 @@ static void tap_poll(NetClientState *nc, bool enable)
     tap_write_poll(s, enable);
 }
 
+static bool tap_set_steering_ebpf(NetClientState *nc, int prog_fd)
+{
+    TAPState *s = DO_UPCAST(TAPState, nc, nc);
+    assert(nc->info->type == NET_CLIENT_DRIVER_TAP);
+
+    return tap_fd_set_steering_ebpf(s->fd, prog_fd) == 0;
+}
+
 int tap_get_fd(NetClientState *nc)
 {
     TAPState *s = DO_UPCAST(TAPState, nc, nc);
@@ -372,6 +380,7 @@ static NetClientInfo net_tap_info = {
     .set_vnet_hdr_len = tap_set_vnet_hdr_len,
     .set_vnet_le = tap_set_vnet_le,
     .set_vnet_be = tap_set_vnet_be,
+    .set_steering_ebpf = tap_set_steering_ebpf,
 };
 
 static TAPState *net_tap_fd_init(NetClientState *peer,
diff --git a/net/tap_int.h b/net/tap_int.h
index 225a49e..547f8a5 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -44,5 +44,6 @@ int tap_fd_set_vnet_be(int fd, int vnet_is_be);
 int tap_fd_enable(int fd);
 int tap_fd_disable(int fd);
 int tap_fd_get_ifname(int fd, char *ifname);
+int tap_fd_set_steering_ebpf(int fd, int prog_fd);
 
 #endif /* NET_TAP_INT_H */
-- 
2.7.4



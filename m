Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C020F7CE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 17:00:36 +0200 (CEST)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqHkR-0006H8-3v
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 11:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jqHhu-0002zO-EO
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 10:57:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32523
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jqHho-0003Fd-I6
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 10:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593529071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20NAFHynPx9DjQRXiLXqEjvBYe5DS2rwSVpuGZzTeKE=;
 b=hNSh4Dvqo5UQlEmYGgTYdsjfukfiCkyeUQschh86fS49V1Zeb5KtmY3xcnt9K4jpjNEof6
 NJXTYt+DRxTmlMacoGMhwpSzJPbb3GOv65qgh0grsrJRMmQA9Cxz44wlXyBAat9J5tQWP6
 9dNb2RHss4WgnQmMFgGlH3pIM2gPp+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-KRE0-6eGO1CM5cWN0VoFkA-1; Tue, 30 Jun 2020 10:57:49 -0400
X-MC-Unique: KRE0-6eGO1CM5cWN0VoFkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92A7F6BF97;
 Tue, 30 Jun 2020 14:57:48 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-211.ams2.redhat.com
 [10.36.114.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D126741B5;
 Tue, 30 Jun 2020 14:57:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] net: detect errors from probing vnet hdr flag for TAP
 devices
Date: Tue, 30 Jun 2020 16:57:37 +0200
Message-Id: <20200630145737.232095-3-lvivier@redhat.com>
In-Reply-To: <20200630145737.232095-1-lvivier@redhat.com>
References: <20200630145737.232095-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Daniel P. Berrange" <berrange@redhat.com>

When QEMU sets up a tap based network device backend, it mostly ignores errors
reported from various ioctl() calls it makes, assuming the TAP file descriptor
is valid. This assumption can easily be violated when the user is passing in a
pre-opened file descriptor. At best, the ioctls may fail with a -EBADF, but if
the user passes in a bogus FD number that happens to clash with a FD number that
QEMU has opened internally for another reason, a wide variety of errnos may
result, as the TUNGETIFF ioctl number may map to a completely different command
on a different type of file.

By ignoring all these errors, QEMU sets up a zombie network backend that will
never pass any data. Even worse, when QEMU shuts down, or that network backend
is hot-removed, it will close this bogus file descriptor, which could belong to
another QEMU device backend.

There's no obvious guaranteed reliable way to detect that a FD genuinely is a
TAP device, as opposed to a UNIX socket, or pipe, or something else. Checking
the errno from probing vnet hdr flag though, does catch the big common cases.
ie calling TUNGETIFF will return EBADF for an invalid FD, and ENOTTY when FD is
a UNIX socket, or pipe which catches accidental collisions with FDs used for
stdio, or monitor socket.

Previously the example below where bogus fd 9 collides with the FD used for the
chardev saw:

$ ./x86_64-softmmu/qemu-system-x86_64 -netdev tap,id=hostnet0,fd=9 \
  -chardev socket,id=charchannel0,path=/tmp/qga,server,nowait \
  -monitor stdio -vnc :0
qemu-system-x86_64: -netdev tap,id=hostnet0,fd=9: TUNGETIFF ioctl() failed: Inappropriate ioctl for device
TUNSETOFFLOAD ioctl() failed: Bad address
QEMU 2.9.1 monitor - type 'help' for more information
(qemu) Warning: netdev hostnet0 has no peer

which gives a running QEMU with a zombie network backend.

With this change applied we get an error message and QEMU immediately exits
before carrying on and making a bigger disaster:

$ ./x86_64-softmmu/qemu-system-x86_64 -netdev tap,id=hostnet0,fd=9 \
  -chardev socket,id=charchannel0,path=/tmp/qga,server,nowait \
  -monitor stdio -vnc :0
qemu-system-x86_64: -netdev tap,id=hostnet0,vhost=on,fd=9: Unable to query TUNGETIFF on FD 9: Inappropriate ioctl for device

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Tested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20171027085548.3472-1-berrange@redhat.com
[lv: to simplify, don't check on EINVAL with TUNGETIFF as it exists since v2.6.27]
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/tap-bsd.c     |  2 +-
 net/tap-linux.c   |  8 +++++---
 net/tap-solaris.c |  2 +-
 net/tap-stub.c    |  2 +-
 net/tap.c         | 25 ++++++++++++++++++++-----
 net/tap_int.h     |  2 +-
 6 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index a5c3707f806d..77aaf674b19d 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -211,7 +211,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
 }
 
-int tap_probe_vnet_hdr(int fd)
+int tap_probe_vnet_hdr(int fd, Error **errp)
 {
     return 0;
 }
diff --git a/net/tap-linux.c b/net/tap-linux.c
index e0dd442ee34f..b0635e9e32ce 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -147,13 +147,15 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
     }
 }
 
-int tap_probe_vnet_hdr(int fd)
+int tap_probe_vnet_hdr(int fd, Error **errp)
 {
     struct ifreq ifr;
 
     if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
-        error_report("TUNGETIFF ioctl() failed: %s", strerror(errno));
-        return 0;
+        /* TUNGETIFF is available since kernel v2.6.27 */
+        error_setg_errno(errp, errno,
+                         "Unable to query TUNGETIFF on FD %d", fd);
+        return -1;
     }
 
     return ifr.ifr_flags & IFF_VNET_HDR;
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index 4725d2314eef..ae2ba6828415 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -206,7 +206,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
 }
 
-int tap_probe_vnet_hdr(int fd)
+int tap_probe_vnet_hdr(int fd, Error **errp)
 {
     return 0;
 }
diff --git a/net/tap-stub.c b/net/tap-stub.c
index a9ab8f829362..de525a2e69d4 100644
--- a/net/tap-stub.c
+++ b/net/tap-stub.c
@@ -37,7 +37,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 {
 }
 
-int tap_probe_vnet_hdr(int fd)
+int tap_probe_vnet_hdr(int fd, Error **errp)
 {
     return 0;
 }
diff --git a/net/tap.c b/net/tap.c
index f65966aaccd8..f0ba0ae069cb 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -597,7 +597,11 @@ int net_init_bridge(const Netdev *netdev, const char *name,
     }
 
     qemu_set_nonblock(fd);
-    vnet_hdr = tap_probe_vnet_hdr(fd);
+    vnet_hdr = tap_probe_vnet_hdr(fd, errp);
+    if (vnet_hdr < 0) {
+        close(fd);
+        return -1;
+    }
     s = net_tap_fd_init(peer, "bridge", name, fd, vnet_hdr);
 
     snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
@@ -803,7 +807,11 @@ int net_init_tap(const Netdev *netdev, const char *name,
 
         qemu_set_nonblock(fd);
 
-        vnet_hdr = tap_probe_vnet_hdr(fd);
+        vnet_hdr = tap_probe_vnet_hdr(fd, errp);
+        if (vnet_hdr < 0) {
+            close(fd);
+            return -1;
+        }
 
         net_init_tap_one(tap, peer, "tap", name, NULL,
                          script, downscript,
@@ -859,8 +867,11 @@ int net_init_tap(const Netdev *netdev, const char *name,
             qemu_set_nonblock(fd);
 
             if (i == 0) {
-                vnet_hdr = tap_probe_vnet_hdr(fd);
-            } else if (vnet_hdr != tap_probe_vnet_hdr(fd)) {
+                vnet_hdr = tap_probe_vnet_hdr(fd, errp);
+                if (vnet_hdr < 0) {
+                    goto free_fail;
+                }
+            } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
                 error_setg(errp,
                            "vnet_hdr not consistent across given tap fds");
                 ret = -1;
@@ -905,7 +916,11 @@ free_fail:
         }
 
         qemu_set_nonblock(fd);
-        vnet_hdr = tap_probe_vnet_hdr(fd);
+        vnet_hdr = tap_probe_vnet_hdr(fd, errp);
+        if (vnet_hdr < 0) {
+            close(fd);
+            return -1;
+        }
 
         net_init_tap_one(tap, peer, "bridge", name, ifname,
                          script, downscript, vhostfdname,
diff --git a/net/tap_int.h b/net/tap_int.h
index e3194b23f47d..225a49ea4843 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -34,7 +34,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
 ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen);
 
 void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
-int tap_probe_vnet_hdr(int fd);
+int tap_probe_vnet_hdr(int fd, Error **errp);
 int tap_probe_vnet_hdr_len(int fd, int len);
 int tap_probe_has_ufo(int fd);
 void tap_fd_set_offload(int fd, int csum, int tso4, int tso6, int ecn, int ufo);
-- 
2.26.2



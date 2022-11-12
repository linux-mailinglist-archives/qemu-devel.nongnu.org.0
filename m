Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE762693E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 12:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otosl-0002lN-6V; Sat, 12 Nov 2022 06:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1otosf-0002kn-DK
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 06:41:01 -0500
Received: from speedy.comstyle.com ([206.51.28.2] helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1otosd-0008Tf-PW
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 06:41:01 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4N8YY92dB9z8PbP;
 Sat, 12 Nov 2022 06:40:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=OQZ5fC2oIGbditZ6PL8HzM4gAgU=; b=Kqnq1C1LGvjr6cobm2s32dhMWHBE
 IlyeI5uAR48dsG7W1gTy2NrqaoonPsGZBbHsm2/nW4b/JYVoh+qNaSBbiGnLrpDo
 kI75btRtTotgsZdxSlXUt06jT1ovsTndsOWMD1GZZ3L1Be6lw6CgiiPJRgs7cZOU
 7xabq3P8tm64pIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=OrjzkVGru8+F3GpZv9hhaZR2C5B5lupFdcSQw8ZO4vsGqyq4wuyvU
 ySAh3MgavyR2K89T04XEE/CQNT0ckSv5HiK+yeGOSg1WtBY+vo3hlsDsAIj2nQje
 PM+mxEdArmce574/+E+RwfLOXUUYevHMpfymbP92sOMcZsE0GEFTeQ=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:6d50:1d1b:ba5e:b2c4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4N8YY91hClz8PbN;
 Sat, 12 Nov 2022 06:40:45 -0500 (EST)
Date: Sat, 12 Nov 2022 06:40:43 -0500
From: Brad Smith <brad@comstyle.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] qga: Add initial OpenBSD and NetBSD support
Message-ID: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=206.51.28.2; envelope-from=brad@comstyle.com;
 helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

qga: Add initial OpenBSD and NetBSD support

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 meson.build          | 2 +-
 qga/commands-bsd.c   | 5 +++++
 qga/commands-posix.c | 9 +++++++--
 qga/main.c           | 6 +++---
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index cf3e517e56..5556356f14 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ have_tools = get_option('tools') \
   .allowed()
 have_ga = get_option('guest_agent') \
   .disable_auto_if(not have_system and not have_tools) \
-  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
+  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd', 'netbsd', 'openbsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
 have_block = have_system or have_tools
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 15cade2d4c..17bddda1cf 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -21,7 +21,12 @@
 #include <sys/ucred.h>
 #include <sys/mount.h>
 #include <net/if_dl.h>
+#if defined(__NetBSD__) || defined(__OpenBSD__)
+#include <net/if_arp.h>
+#include <netinet/if_ether.h>
+#else
 #include <net/ethernet.h>
+#endif
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 32493d6383..86be320a1b 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -45,7 +45,12 @@
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#if defined(__NetBSD__) || defined(__OpenBSD__)
+#include <net/if_arp.h>
+#include <netinet/if_ether.h>
+#else
 #include <net/ethernet.h>
+#endif
 #include <sys/types.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
@@ -2881,7 +2886,7 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
-#ifndef __FreeBSD__
+#ifndef CONFIG_BSD
 /*
  * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
  * buffer with ETHER_ADDR_LEN length at least.
@@ -2930,7 +2935,7 @@ bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
     close(sock);
     return true;
 }
-#endif /* __FreeBSD__ */
+#endif /* CONFIG_BSD */
 
 /*
  * Build information about guest interfaces
diff --git a/qga/main.c b/qga/main.c
index b3580508fa..0865c992f0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -40,11 +40,11 @@
 #include "commands-common.h"
 
 #ifndef _WIN32
-#ifdef __FreeBSD__
+#ifdef CONFIG_BSD
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
-#else /* __FreeBSD__ */
+#else /* CONFIG_BSD */
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
-#endif /* __FreeBSD__ */
+#endif /* CONFIG_BSD */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
 #define QGA_STATE_RELATIVE_DIR  "run"
 #else
-- 
2.38.1



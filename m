Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFB612F7B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 05:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opMb3-0006EL-DS; Mon, 31 Oct 2022 00:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1opMb1-0006DR-6C
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 00:40:23 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1opMaz-0002J5-JA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 00:40:22 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4N10nS3sD1z8PbP;
 Mon, 31 Oct 2022 00:40:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=EU0TuiVdMuNZLLVNAK1VSuYkiOs=; b=KBPEaJqeNXhusklY0/+YqLbQEIex
 VaEULrGT8wwu9zYUYW4woaML34lwCs3qnZPj94c/4d52QVMse+RnEioPnym5mmOF
 8tkh8PvLW49T4pLB2R7aBzRBN+3TPKcAUMH507bBof4LAu9SDK+SnM4GAn8p1NBK
 oTpRJk21LJQsLYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=mm4bhhD0j+YzPPJrTWps/qa2CRAPk7NOm8PnfR2IWgZ/k4MM0KOSI
 x1LY2D5xWoBDzbbrAeUm+XY9eyzN6OtMuRLRCeJfJtqV0Vy46T3BBButs4ggg/EK
 yrwkahOPvS40Oo7iW2xNB0cGaGjVeNaq2na6DikWBTAbpsn6EsBhFw=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:4559:695d:5708:6465])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4N10nS1Z6vz8PbN;
 Mon, 31 Oct 2022 00:40:12 -0400 (EDT)
Date: Mon, 31 Oct 2022 00:40:10 -0400
From: Brad Smith <brad@comstyle.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] qga: Add initial OpenBSD support
Message-ID: <Y19Rqp61A16MJqJI@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qga: Add initial OpenBSD support

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 meson.build          | 2 +-
 qga/commands-bsd.c   | 5 +++++
 qga/commands-posix.c | 9 +++++++--
 qga/main.c           | 4 ++--
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 37737913df..fb69a6a683 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ have_tools = get_option('tools') \
   .allowed()
 have_ga = get_option('guest_agent') \
   .disable_auto_if(not have_system and not have_tools) \
-  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
+  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd', 'openbsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
 have_block = have_system or have_tools
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 15cade2d4c..4deb3bf580 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -21,7 +21,12 @@
 #include <sys/ucred.h>
 #include <sys/mount.h>
 #include <net/if_dl.h>
+#ifdef __OpenBSD__
+#include <net/if_arp.h>
+#include <netinet/if_ether.h>
+#else
 #include <net/ethernet.h>
+#endif
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 32493d6383..640f26dc16 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -45,7 +45,12 @@
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#ifdef __OpenBSD__
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
index b3580508fa..0fe94e80d1 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -40,9 +40,9 @@
 #include "commands-common.h"
 
 #ifndef _WIN32
-#ifdef __FreeBSD__
+#ifdef CONFIG_BSD
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
-#else /* __FreeBSD__ */
+#else /* CONFIG_BSD */
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
 #endif /* __FreeBSD__ */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
-- 
2.38.0



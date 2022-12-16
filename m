Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F164EC76
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAs-0008Dm-NR; Fri, 16 Dec 2022 08:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAr-0008DJ-09
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAp-0007ll-GE
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elk0Ql+J8g5yi+F0Q9RPVdDLypDI/fkOrSPZqoURnqg=;
 b=B43CVYtj6mJCBhoSP7xsg7RrLzZO00A0mQ//Aun0+FcX+mA1+ngz2Vn4d65DIO8BxaIvJl
 FWG2KcLzcSN4nph7kkbQ2ozHn5pStQdXfyusIWJq1UIfeJ7f+HyDpa8EE29XeQS8gmdDzc
 7eP8FHc1UbBl5QvccR5IXPwYX9PVnMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-1ONJkBurPHWI4vUb-ivSBA-1; Fri, 16 Dec 2022 08:54:47 -0500
X-MC-Unique: 1ONJkBurPHWI4vUb-ivSBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63ED5857F57;
 Fri, 16 Dec 2022 13:54:47 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 581D340C2005;
 Fri, 16 Dec 2022 13:54:46 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 3/8] qga: Add initial OpenBSD and NetBSD support
Date: Fri, 16 Dec 2022 15:54:34 +0200
Message-Id: <20221216135439.465033-4-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Brad Smith <brad@comstyle.com>

qga: Add initial OpenBSD and NetBSD support

Signed-off-by: Brad Smith <brad@comstyle.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 meson.build          | 2 +-
 qga/commands-bsd.c   | 5 +++++
 qga/commands-posix.c | 9 +++++++--
 qga/main.c           | 6 +++---
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..4c6f8a674a 100644
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
index 960c4209e5..0f1f0ca8aa 100644
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
index b2a6d8b227..3ae4a93974 100644
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
@@ -2809,7 +2814,7 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
-#ifndef __FreeBSD__
+#ifndef CONFIG_BSD
 /*
  * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
  * buffer with ETHER_ADDR_LEN length at least.
@@ -2858,7 +2863,7 @@ bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
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
2.25.1



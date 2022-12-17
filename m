Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3E64F863
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 10:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6TAi-0005t3-QJ; Sat, 17 Dec 2022 04:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAg-0005rc-Ch
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAd-0006cc-Kv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671268070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBNyMX+OlU77yDDpbKs/c0cqbxMQdPVs0W/gqD71INU=;
 b=FN+71AhhG7f49umG7MzCmVOm7T/a+2Y26jd/aHoIbrRM1rQTAV8oHb+kJmNRnLZ3gqhQXW
 NSAn91WhG+wFiEliH3kDykiUkEAgSAUxt5VmclGFGGKCFLhzXmiHR54WD71+VI+9XQiW5J
 5EQAFLqlHKPhfseWA+6Kf9X2SCbLP0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-hUiVucbVPBSNiv7mxBOdig-1; Sat, 17 Dec 2022 04:07:49 -0500
X-MC-Unique: hUiVucbVPBSNiv7mxBOdig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE4A6185A794;
 Sat, 17 Dec 2022 09:07:48 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-192-10.brq.redhat.com [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A5040C6EC4;
 Sat, 17 Dec 2022 09:07:47 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 3/6] qga: Add initial OpenBSD and NetBSD support
Date: Sat, 17 Dec 2022 11:07:37 +0200
Message-Id: <20221217090740.522093-4-kkostiuk@redhat.com>
In-Reply-To: <20221217090740.522093-1-kkostiuk@redhat.com>
References: <20221217090740.522093-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
index 1a28326ec7..b19b9c5d18 100644
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
@@ -2872,7 +2877,7 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
-#ifndef __FreeBSD__
+#ifndef CONFIG_BSD
 /*
  * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
  * buffer with ETHER_ADDR_LEN length at least.
@@ -2921,7 +2926,7 @@ bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
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



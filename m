Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73C5EFBF7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:27:07 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxJS-0005nv-MD
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odwSs-0006SW-Di
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odwSp-0003Mi-93
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pexMPmz3ERSDHT4uSVabYUPGRBus7DhQh4pqhnYYf8E=;
 b=S097JSPh0ikjo+eUxTYC7YfcRlSckhTYlxrB9c3lI5VioAFRiUNX8uf2G+JcubSYCRnimy
 /lsyBQsdGJqqT6uX2tyFgVJ9cW7AAJ7V8442AWFgXfrOiQa/YgKE4FG5DJ6w9HJu3e+tP4
 qG7KO6+dbFfuMmFoGYnT01oe7ag791c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-CNRfL-XhM32Zme2IkKqScg-1; Thu, 29 Sep 2022 12:32:41 -0400
X-MC-Unique: CNRfL-XhM32Zme2IkKqScg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6FED299E779;
 Thu, 29 Sep 2022 16:32:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1821731B;
 Thu, 29 Sep 2022 16:32:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] net: print a more actionable error when slirp is not found
Date: Thu, 29 Sep 2022 20:32:37 +0400
Message-Id: <20220929163237.1417215-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

If slirp is not found during compile-time, and not manually disabled,
print a friendly error message, as suggested in the "If your networking
is failing after updating to the latest git version of QEMU..." thread
by various people.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build |  4 ++++
 net/net.c   | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8dc661363f..4f69d7d0b4 100644
--- a/meson.build
+++ b/meson.build
@@ -657,6 +657,10 @@ if not get_option('slirp').auto() or have_system
   endif
 endif
 
+if get_option('slirp').disabled()
+  config_host_data.set('CONFIG_SLIRP_DISABLED', true)
+endif
+
 vde = not_found
 if not get_option('vde').auto() or have_system or have_tools
   vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
diff --git a/net/net.c b/net/net.c
index 2db160e063..e6072a5ddd 100644
--- a/net/net.c
+++ b/net/net.c
@@ -990,14 +990,29 @@ static int net_init_nic(const Netdev *netdev, const char *name,
     return idx;
 }
 
+#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
+static int net_init_user(const Netdev *netdev, const char *name,
+                         NetClientState *peer, Error **errp)
+{
+#ifdef CONFIG_SLIRP
+    return net_init_slirp(netdev, name, peer, errp);
+#else
+    error_setg(errp,
+               "Type 'user' is not a supported netdev backend by this QEMU build "
+               "because the libslirp development files were not found during build "
+               "of QEMU.");
+#endif
+    return -1;
+}
+#endif
 
 static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
     const Netdev *netdev,
     const char *name,
     NetClientState *peer, Error **errp) = {
         [NET_CLIENT_DRIVER_NIC]       = net_init_nic,
-#ifdef CONFIG_SLIRP
-        [NET_CLIENT_DRIVER_USER]      = net_init_slirp,
+#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
+        [NET_CLIENT_DRIVER_USER]      = net_init_user,
 #endif
         [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
         [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
-- 
2.37.3



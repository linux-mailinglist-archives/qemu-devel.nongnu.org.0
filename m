Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F454C6BC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:01:25 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qm4-0003Bk-GB
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdW-0003FZ-Qa
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdU-0001zT-P5
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHNoTjNExIE2yfua2XDNSZaph8Iy4XsvHUgF/wj8mNA=;
 b=K0OwwMcoVH78v8iKQfI23mrKqTkTLZGEdWx0/1nEujE6sm6yv5yxce6xCdelgobrY5N9fT
 NXuIsdW/JWh1rNX254C3R8KURyZA24AMtnyKr9XRZj5yEmOS76QNTgP6N7Xy8rTChdPFqg
 2dv4wO1ZcFA33uaXL6gvJf9CYqy+P6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-IX9o4wLCPZaLD_ZdPNXIWQ-1; Wed, 15 Jun 2022 06:52:30 -0400
X-MC-Unique: IX9o4wLCPZaLD_ZdPNXIWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 388671C3E984;
 Wed, 15 Jun 2022 10:52:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 730C21131D;
 Wed, 15 Jun 2022 10:52:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 4/4] net: convert to use qemu_find_file to locate bridge
 helper
Date: Wed, 15 Jun 2022 11:52:12 +0100
Message-Id: <20220615105212.780256-5-berrange@redhat.com>
In-Reply-To: <20220615105212.780256-1-berrange@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The TAP device code currently uses get_relocate_path to find the bridge
helper, however, this fails when run from the build dir. Adding support
to qemu_find_file for helper binaries, allows it to work from both the
(relocated) install tree and build dir.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/net/net.h      | 3 ++-
 include/qemu/datadir.h | 1 +
 net/tap.c              | 5 ++++-
 qemu-options.hx        | 4 ++--
 softmmu/datadir.c      | 9 +++++++++
 softmmu/trace-events   | 2 +-
 6 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7ac..6a853512ac 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -228,7 +228,8 @@ NetClientState *net_hub_port_find(int hub_id);
 
 #define DEFAULT_NETWORK_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifup"
 #define DEFAULT_NETWORK_DOWN_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifdown"
-#define DEFAULT_BRIDGE_HELPER CONFIG_QEMU_HELPERDIR "/qemu-bridge-helper"
+#define DEFAULT_BRIDGE_HELPER "qemu-bridge-helper"
+#define DEFAULT_BRIDGE_HELPER_PATH CONFIG_QEMU_HELPERDIR "/qemu-bridge-helper"
 #define DEFAULT_BRIDGE_INTERFACE "br0"
 
 void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd);
diff --git a/include/qemu/datadir.h b/include/qemu/datadir.h
index 427e90787a..a211b6b235 100644
--- a/include/qemu/datadir.h
+++ b/include/qemu/datadir.h
@@ -4,6 +4,7 @@
 #define QEMU_FILE_TYPE_BIOS   0
 #define QEMU_FILE_TYPE_KEYMAP 1
 #define QEMU_FILE_TYPE_ICON   2
+#define QEMU_FILE_TYPE_HELPER 3
 
 /**
  * qemu_find_file:
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74..161608e34a 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -42,6 +42,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
+#include "qemu/datadir.h"
 
 #include "net/tap.h"
 
@@ -507,9 +508,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = qemu_find_file(QEMU_FILE_TYPE_HELPER,
+                                                 DEFAULT_BRIDGE_HELPER);
     }
 
+    g_printerr("Helper %s\n", helper);
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
         error_setg_errno(errp, errno, "socketpair() failed");
         return -1;
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..b5b7e75048 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2665,7 +2665,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
     "                to deconfigure it\n"
     "                use '[down]script=no' to disable script execution\n"
-    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
+    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER_PATH ") to\n"
     "                configure it\n"
     "                use 'fd=h' to connect to an already opened TAP interface\n"
     "                use 'fds=x:y:...:z' to connect to already opened multiqueue capable TAP interfaces\n"
@@ -2684,7 +2684,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
     "                configure a host TAP network backend with ID 'str' that is\n"
     "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
-    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER ")\n"
+    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER_PATH ")\n"
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index e5d1fd0116..a68fe7167a 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -36,6 +36,7 @@ static char **extra_firmware_dirs;
 /* Default built-in directories */
 static char *default_data_dir;
 static char *default_icon_dir;
+static char *default_helper_dir;
 
 /* Whether we're known to be executing from a build tree */
 static bool in_build_dir;
@@ -73,6 +74,12 @@ char *qemu_find_file(int type, const char *name)
         default_install_dir = default_icon_dir;
         break;
 
+    case QEMU_FILE_TYPE_HELPER:
+        rel_install_dir = "";
+        rel_build_dir = "";
+        default_install_dir = default_helper_dir;
+        break;
+
     default:
         abort();
     }
@@ -140,9 +147,11 @@ void qemu_add_default_firmwarepath(void)
     /* Add default dirs relative to the executable path */
     default_data_dir = get_relocated_path(CONFIG_QEMU_DATADIR);
     default_icon_dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
+    default_helper_dir = get_relocated_path(CONFIG_QEMU_HELPERDIR);
 
     trace_datadir_init(default_data_dir,
                        default_icon_dir,
+                       default_helper_dir,
                        in_build_dir);
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c00e9f389..b22d7e7714 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -6,7 +6,7 @@ balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
 
 # datadir.c
 datadir_load_file(const char *name, const char *path, int err) "name %s location %s errno %d"
-datadir_init(const char *defdatadir, const char *deficondir, bool inbuilddir) "default data dir %s icon dir %s in build dir %d"
+datadir_init(const char *defdatadir, const char *deficondir, const char *defhelperdir, bool inbuilddir) "default data dir %s icon dir %s helper dir %s in build dir %d"
 
 # ioport.c
 cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
-- 
2.36.1



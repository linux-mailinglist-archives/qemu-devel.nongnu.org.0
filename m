Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A993AC2B8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:02:17 +0200 (CEST)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6e0-0004Nq-CU
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xx-0005pv-GP
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xv-0004kf-Sd
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqVKUlIoVYGJDWHLbcnA/DeXxdnLiyl9DUE51hYG/0c=;
 b=Po7K2TlQmK9VF8UCfkefI+YyeFlxEX6CM66Z0zVVoylEvHBFASwHokEUC+o8fin4ExVWzP
 VAxyI0JCR/SUyfoxfxY0yap79afa0k6RDOG03YYNBmCZEZ2vvpPb/12OCvO9/DfWnY+Mb0
 RGoSbj54TrE5hGQrqSQI5p83xSaT4WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-XEzIUyAMOlKvhTiFtpMbJw-1; Fri, 18 Jun 2021 00:55:57 -0400
X-MC-Unique: XEzIUyAMOlKvhTiFtpMbJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569011922962;
 Fri, 18 Jun 2021 04:55:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC1D5D6AC;
 Fri, 18 Jun 2021 04:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E05B7180354B; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/24] modules: check arch and block load on mismatch
Date: Fri, 18 Jun 2021 06:53:46 +0200
Message-Id: <20210618045353.2510174-18-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add module_allow_arch() to set the target architecture.
In case a module is limited to some arch verify arches
match and ignore the module if not.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/module.h |  1 +
 softmmu/vl.c          |  3 +++
 util/module.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index a98748d501d3..7f4b1af8198c 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -72,6 +72,7 @@ void module_call_init(module_init_type type);
 bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
+void module_allow_arch(const char *arch);
 
 /*
  * module info annotation macros
diff --git a/softmmu/vl.c b/softmmu/vl.c
index c91d63e3cc02..866ea310a411 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -126,6 +126,8 @@
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
 
+#include "config-host.h"
+
 #define MAX_VIRTIO_CONSOLES 1
 
 typedef struct BlockdevOptionsQueueEntry {
@@ -2725,6 +2727,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
 #ifdef CONFIG_MODULES
     module_init_info(qemu_modinfo);
+    module_allow_arch(TARGET_NAME);
 #endif
 
     qemu_init_subsystems();
diff --git a/util/module.c b/util/module.c
index acaaecad56c9..065aed09ffef 100644
--- a/util/module.c
+++ b/util/module.c
@@ -117,12 +117,33 @@ static const QemuModinfo module_info_stub[] = { {
     /* end of list */
 } };
 static const QemuModinfo *module_info = module_info_stub;
+static const char *module_arch;
 
 void module_init_info(const QemuModinfo *info)
 {
     module_info = info;
 }
 
+void module_allow_arch(const char *arch)
+{
+    module_arch = arch;
+}
+
+static bool module_check_arch(const QemuModinfo *modinfo)
+{
+    if (modinfo->arch) {
+        if (!module_arch) {
+            /* no arch set -> ignore all */
+            return false;
+        }
+        if (strcmp(module_arch, modinfo->arch) != 0) {
+            /* mismatch */
+            return false;
+        }
+    }
+    return true;
+}
+
 static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
 {
     GModule *g_module;
@@ -224,6 +245,13 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     g_hash_table_add(loaded_modules, module_name);
 
     for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (modinfo->arch) {
+            if (strcmp(modinfo->name, module_name) == 0) {
+                if (!module_check_arch(modinfo)) {
+                    return false;
+                }
+            }
+        }
         if (modinfo->deps) {
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
@@ -345,6 +373,7 @@ void qemu_load_module_for_opts(const char *group)
 
 #else
 
+void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
-- 
2.31.1



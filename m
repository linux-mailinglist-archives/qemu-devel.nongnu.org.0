Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD343B2D19
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:58:49 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN4K-0002Ue-OS
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMn6-00035w-69
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMn2-0007y4-5S
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knRgM+8UyobiMtp7tpNcTHLWowdvknC6HlopWI5dqPQ=;
 b=Ba5nDLZUvQApg14GpMUDwnK/RCNOkZkid9OAWwqjVzSjHn47GXMzubDt4U4HSG6mG1KTTM
 SS47XSs8VF5dat/kUVIhcK4c7cna65SBFiMNxsmWPYOhO7JATIRBf7PFPQ4+BWdMh26vMn
 BivJcK5PDMS1Z3oOyVASnl+wqQefNLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-pZbp-_84OLuBW-lgxXESyQ-1; Thu, 24 Jun 2021 06:40:54 -0400
X-MC-Unique: pZbp-_84OLuBW-lgxXESyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B718B100C612;
 Thu, 24 Jun 2021 10:40:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02D5E5D705;
 Thu, 24 Jun 2021 10:40:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D5B331803548; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/34] modules: check arch and block load on mismatch
Date: Thu, 24 Jun 2021 12:38:20 +0200
Message-Id: <20210624103836.2382472-19-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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
index 5c26e80126db..a70e7b4658e8 100644
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



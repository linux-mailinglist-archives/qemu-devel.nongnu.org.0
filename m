Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED53AC2C7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:10:41 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6m8-0005cS-OV
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xm-0005d2-Eb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xg-0004ZF-1o
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9uYxKFrK9WwU8Bk0tBUhZzNgciCZbCanX+mTsGMzPg=;
 b=O8TjAVwC9W+Di1QAAkPQ/PU/OTtuCaERvYPctAv5qCEmDw8ObtmdJ4Fa+hu5VAg1DyCaMa
 d1vER14QeTEg43j8AbrH6uNGVHCj7srsnzoqUYN+q/ywC2l6/BetZ1hnzqK66bqEA8EjYj
 VQcMnG7mX+TfDgTY2wU81eYVjz/wobs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-a-Ibd4JqOpqJB7hd2nNX5w-1; Fri, 18 Jun 2021 00:55:42 -0400
X-MC-Unique: a-Ibd4JqOpqJB7hd2nNX5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3521818401;
 Fri, 18 Jun 2021 04:55:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 616EC1A866;
 Fri, 18 Jun 2021 04:55:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D17BF180354A; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/24] modules: add tracepoints
Date: Fri, 18 Jun 2021 06:53:45 +0200
Message-Id: <20210618045353.2510174-17-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

One for module load and one for qom type lookup.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c     | 3 +++
 util/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/util/module.c b/util/module.c
index a9ec2da9972e..acaaecad56c9 100644
--- a/util/module.c
+++ b/util/module.c
@@ -24,6 +24,7 @@
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
+#include "trace.h"
 
 typedef struct ModuleEntry
 {
@@ -176,6 +177,7 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
         ret = 0;
     }
 
+    trace_module_load_module(fname);
     QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
         QTAILQ_REMOVE(&dso_init_list, e, node);
         g_free(e);
@@ -294,6 +296,7 @@ void module_load_qom_one(const char *type)
         return;
     }
 
+    trace_module_lookup_object_type(type);
     for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
         if (!modinfo->objs) {
             continue;
diff --git a/util/trace-events b/util/trace-events
index 806cac14a762..c8f53d7d9fc3 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -100,3 +100,7 @@ uffd_create_fd_api_failed(int err) "errno: %i"
 uffd_create_fd_api_noioctl(uint64_t ioctl_req, uint64_t ioctl_supp) "ioctl_req: 0x%" PRIx64 "ioctl_supp: 0x%" PRIx64
 uffd_register_memory_failed(void *addr, uint64_t length, uint64_t mode, int err) "addr: %p length: %" PRIu64 " mode: 0x%" PRIx64 " errno: %i"
 uffd_unregister_memory_failed(void *addr, uint64_t length, int err) "addr: %p length: %" PRIu64 " errno: %i"
+
+# module.c
+module_load_module(const char *name) "file %s"
+module_lookup_object_type(const char *name) "name %s"
-- 
2.31.1



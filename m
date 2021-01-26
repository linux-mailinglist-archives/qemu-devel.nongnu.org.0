Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E530377E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:51:06 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4J7x-0007W7-P6
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4J5Y-0004Sv-1P
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1l4J5W-0003cN-8h
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611647313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hWxOxOvBlLzowF6Ed6XuaVAx01HHiInDIwqo1JHD9D8=;
 b=RiTJA9BrBTPJFCXImPhslW//AN+oEUC2PVovlzow5vMix+WHRqrWQgoTII3pbGPnFmnTR1
 g/OQYfqX6NBmBqbOvWKi8VvWdqx+/gdzIx6zvsEk8QgqFugQWPArZGgFRIhMJxdga7sANO
 byA82lCVVEacE3sZeNeqmsAdMc6FtaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-FD7lngdhNvyTdn4sHLc52A-1; Tue, 26 Jan 2021 02:48:30 -0500
X-MC-Unique: FD7lngdhNvyTdn4sHLc52A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A05D415727
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:48:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E996B1A890;
 Tue, 26 Jan 2021 07:48:28 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND] hostmem: Don't report pmem attribute if unsupported
Date: Tue, 26 Jan 2021 08:48:25 +0100
Message-Id: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When management applications (like Libvirt) want to check whether
memory-backend-file.pmem is supported they can list object
properties using 'qom-list-properties'. However, 'pmem' is
declared always (and thus reported always) and only at runtime
QEMU errors out if it was built without libpmem (and thus can not
guarantee write persistence). This is suboptimal since we have
ability to declare attributes at compile time.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---

This is just a resend of a patch I've sent earlier with Reviewed-by and
Tested-by added:

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04558.html

 backends/hostmem-file.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 40e1e5b3e3..7e30eb5985 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -123,6 +123,7 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
     fb->align = val;
 }
 
+#ifdef CONFIG_LIBPMEM
 static bool file_memory_backend_get_pmem(Object *o, Error **errp)
 {
     return MEMORY_BACKEND_FILE(o)->is_pmem;
@@ -139,17 +140,9 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
         return;
     }
 
-#ifndef CONFIG_LIBPMEM
-    if (value) {
-        error_setg(errp, "Lack of libpmem support while setting the 'pmem=on'"
-                   " of %s. We can't ensure data persistence.",
-                   object_get_typename(o));
-        return;
-    }
-#endif
-
     fb->is_pmem = value;
 }
+#endif /* CONFIG_LIBPMEM */
 
 static void file_backend_unparent(Object *obj)
 {
@@ -180,8 +173,10 @@ file_backend_class_init(ObjectClass *oc, void *data)
         file_memory_backend_get_align,
         file_memory_backend_set_align,
         NULL, NULL);
+#ifdef CONFIG_LIBPMEM
     object_class_property_add_bool(oc, "pmem",
         file_memory_backend_get_pmem, file_memory_backend_set_pmem);
+#endif
 }
 
 static void file_backend_instance_finalize(Object *o)
-- 
2.26.2



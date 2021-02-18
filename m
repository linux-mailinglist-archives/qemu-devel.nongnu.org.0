Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929131F310
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:28:29 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsii-00067F-EC
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsep-00020j-MC
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCsem-00013s-Dp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613690663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDh634rj0bh+S5FAT8ZoaB9/l9PNvRltWR76opayvn4=;
 b=gzfKQ/Y8BSOGPq0ZpZbSMAz5HCcqikfHh03+ZXuUffTrqRPiw690b3GIelXayjLGTMsrne
 swM3rw9ywhy/7b5vXopokUW3Q3xWhFHiLpTbJgHYrrqcVVshrYGJu/f4an431W2HnARY1B
 pI0D/vnJCvPB902N3lNr1AEMtI0cOyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ZN6Qxp1gOs-uHaNZI4ut2w-1; Thu, 18 Feb 2021 18:24:20 -0500
X-MC-Unique: ZN6Qxp1gOs-uHaNZI4ut2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD6B5427D3;
 Thu, 18 Feb 2021 23:24:19 +0000 (UTC)
Received: from localhost (ovpn-3-246.rdu2.redhat.com [10.22.3.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E4D5D6AD;
 Thu, 18 Feb 2021 23:24:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/3] hostmem: Don't report pmem attribute if unsupported
Date: Thu, 18 Feb 2021 18:24:15 -0500
Message-Id: <20210218232415.1001078-4-ehabkost@redhat.com>
In-Reply-To: <20210218232415.1001078-1-ehabkost@redhat.com>
References: <20210218232415.1001078-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michal Privoznik <mprivozn@redhat.com>

When management applications (like Libvirt) want to check whether
memory-backend-file.pmem is supported they can list object
properties using 'qom-list-properties'. However, 'pmem' is
declared always (and thus reported always) and only at runtime
QEMU errors out if it was built without libpmem (and thus can not
guarantee write persistence). This is suboptimal since we have
ability to declare attributes at compile time.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
Message-Id: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 backends/hostmem-file.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 733408e076f..b683da9daf8 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -124,6 +124,7 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
     fb->align = val;
 }
 
+#ifdef CONFIG_LIBPMEM
 static bool file_memory_backend_get_pmem(Object *o, Error **errp)
 {
     return MEMORY_BACKEND_FILE(o)->is_pmem;
@@ -140,17 +141,9 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
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
 
 static bool file_memory_backend_get_readonly(Object *obj, Error **errp)
 {
@@ -203,8 +196,10 @@ file_backend_class_init(ObjectClass *oc, void *data)
         file_memory_backend_get_align,
         file_memory_backend_set_align,
         NULL, NULL);
+#ifdef CONFIG_LIBPMEM
     object_class_property_add_bool(oc, "pmem",
         file_memory_backend_get_pmem, file_memory_backend_set_pmem);
+#endif
     object_class_property_add_bool(oc, "readonly",
         file_memory_backend_get_readonly,
         file_memory_backend_set_readonly);
-- 
2.28.0



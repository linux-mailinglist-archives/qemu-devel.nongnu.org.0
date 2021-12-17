Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E78478D07
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:06:17 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDsG-0005Wm-3Z
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZj-0005kp-LG
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZi-0008ME-0b
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFc7fj3ByAzhOQCUJkIyjkyCsudyMWMEgKTKmRh5kWM=;
 b=KWfYU1gmvW8RNQSR61odK0nqm47oGqpNBA+2zRu3TtLW/TDEqDmkRMnN1NfazvLD6FJ2nj
 lNSDrDp4Ktl7rGYi6jdhvIKT+mCIWYcpMYfWkMlUBbOJLmhns25LVLQCB4lYfPApJrPP2N
 HXJzwMJonlRyeTIIFdmZg5ocMuI+IbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-6QTiFyijNquUO8alX_H_NQ-1; Fri, 17 Dec 2021 08:47:02 -0500
X-MC-Unique: 6QTiFyijNquUO8alX_H_NQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E5161015DA4;
 Fri, 17 Dec 2021 13:47:01 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CF465E482;
 Fri, 17 Dec 2021 13:46:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] util/oslib-posix: Don't create too many threads with
 small memory or little pages
Date: Fri, 17 Dec 2021 14:46:07 +0100
Message-Id: <20211217134611.31172-5-david@redhat.com>
In-Reply-To: <20211217134611.31172-1-david@redhat.com>
References: <20211217134611.31172-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's limit the number of threads to something sane, especially that
- We don't have more threads than the number of pages we have
- We don't have threads that initialize small (< 64 MiB) memory

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index cf2ead54ad..67c08a425e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -40,6 +40,7 @@
 #include <libgen.h>
 #include "qemu/cutils.h"
 #include "qemu/compiler.h"
+#include "qemu/units.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
@@ -525,7 +526,8 @@ static void *do_madv_populate_write_pages(void *arg)
     return (void *)(uintptr_t)ret;
 }
 
-static inline int get_memset_num_threads(int smp_cpus)
+static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
+                                         int smp_cpus)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
     int ret = 1;
@@ -533,6 +535,12 @@ static inline int get_memset_num_threads(int smp_cpus)
     if (host_procs > 0) {
         ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), smp_cpus);
     }
+
+    /* Especially with gigantic pages, don't create more threads than pages. */
+    ret = MIN(ret, numpages);
+    /* Don't start threads to prealloc comparatively little memory. */
+    ret = MIN(ret, MAX(1, hpagesize * numpages / (64 * MiB)));
+
     /* In case sysconf() fails, we fall back to single threaded */
     return ret;
 }
@@ -542,7 +550,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
 {
     static gsize initialized = 0;
     MemsetContext context = {
-        .num_threads = get_memset_num_threads(smp_cpus),
+        .num_threads = get_memset_num_threads(hpagesize, numpages, smp_cpus),
     };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
-- 
2.31.1



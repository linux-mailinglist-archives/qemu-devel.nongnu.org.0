Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BED478CF0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:58:42 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDkv-00040W-KM
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:58:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDa1-0005vw-9z
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZy-0008Oc-PC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK7N/JLH1vH5Wlk2zn5oWnKUC7prf7gO4iOXi3lsnLg=;
 b=SiO7qe3aHVgcTcrNRqArdHYLUaGdkbPTumPqO7LsuHxieE3TWHKY5CYzU4xj8ZqzSl5VVA
 gj1wZcwa5WX4Wn3gGuYjZwut5E5rRSYgM5MTMzZnQyleDTMyUFw0qrgSxcwFjTXFfHtqSU
 5BTWawGoNKJGDq//qkN439wiiLOC8Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-7maYqgKIP9i_3hik0-w_Aw-1; Fri, 17 Dec 2021 08:47:09 -0500
X-MC-Unique: 7maYqgKIP9i_3hik0-w_Aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D433E101F7A1;
 Fri, 17 Dec 2021 13:47:07 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D054A5E482;
 Fri, 17 Dec 2021 13:47:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] util/oslib-posix: Support concurrent os_mem_prealloc()
 invocation
Date: Fri, 17 Dec 2021 14:46:09 +0100
Message-Id: <20211217134611.31172-7-david@redhat.com>
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

Add a mutex to protect the SIGBUS case, as we cannot mess concurrently
with the sigbus handler and we have to manage the global variable
sigbus_memset_context. The MADV_POPULATE_WRITE path can run
concurrently.

Note that page_mutex and page_cond are shared between concurrent
invocations, which shouldn't be a problem.

This is a preparation for future virtio-mem prealloc code, which will call
os_mem_prealloc() asynchronously from an iothread when handling guest
requests.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index efa4f96d56..9829149e4b 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -95,6 +95,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
@@ -625,6 +626,7 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
                      Error **errp)
 {
+    static gsize initialized;
     int ret;
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
@@ -638,6 +640,12 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     use_madv_populate_write = madv_populate_write_possible(area, hpagesize);
 
     if (!use_madv_populate_write) {
+        if (g_once_init_enter(&initialized)) {
+            qemu_mutex_init(&sigbus_mutex);
+            g_once_init_leave(&initialized, 1);
+        }
+
+        qemu_mutex_lock(&sigbus_mutex);
         memset(&act, 0, sizeof(act));
         act.sa_handler = &sigbus_handler;
         act.sa_flags = 0;
@@ -665,6 +673,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
             perror("os_mem_prealloc: failed to reinstall signal handler");
             exit(1);
         }
+        qemu_mutex_unlock(&sigbus_mutex);
     }
 }
 
-- 
2.31.1



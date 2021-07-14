Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE43C83DA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:26:06 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3d1h-0003xz-UA
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3czN-0001GN-IK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3czL-0007zb-SD
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626261819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8Ju46ooO+LpOYtWfQ0zrbry10jP0PKilFnn/DoA13E=;
 b=gqggPKPJ9vLqdPYfWTnHJZPNTI/u/BHZy53K6Y3vjaAlxzWnj3mj09gV2wbRB4fwUAY11R
 DAgg54pU7Oy60h/9qq2y0OTl0R7JY5GJMMqknNd7IuOYDCbW+2410Jm7M+DcecHJEvhLmc
 IBnIQoDV5z63kXyPbJLvnXJSgek8pGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-mxaYE6vXNtWTWARBu8ZaSg-1; Wed, 14 Jul 2021 07:23:36 -0400
X-MC-Unique: mxaYE6vXNtWTWARBu8ZaSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C47100CF6E;
 Wed, 14 Jul 2021 11:23:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-63.ams2.redhat.com [10.36.114.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD2561001281;
 Wed, 14 Jul 2021 11:23:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/3] util/oslib-posix: Support concurrent os_mem_prealloc()
 invocation
Date: Wed, 14 Jul 2021 13:23:06 +0200
Message-Id: <20210714112306.67793-4-david@redhat.com>
In-Reply-To: <20210714112306.67793-1-david@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a mutext to protect the SIGBUS case, as we cannot mess concurrently
with the sigbus handler and we have to manage the global variable
sigbus_memset_context. The MADV_POPULATE_WRITE path can run
concurrently.

Note that page_mutex and page_cond are shared between concurrent
invocations, which shouldn't be a problem.

This is a preparation for future virtio-mem prealloc code, which will call
os_mem_prealloc() asynchronously from an iothread when handling guest
requests.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 60d1da2d6c..181f6bbf1a 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -94,6 +94,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
@@ -605,12 +606,17 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
                      Error **errp)
 {
+    static gsize initialized;
     int ret;
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
     bool use_madv_populate_write;
 
+    if (g_once_init_enter(&initialized)) {
+        qemu_mutex_init(&sigbus_mutex);
+    }
+
     /*
      * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
      * some special mappings, such as mapping /dev/mem.
@@ -620,6 +626,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     if (!use_madv_populate_write) {
+        qemu_mutex_lock(&sigbus_mutex);
         memset(&act, 0, sizeof(act));
         act.sa_handler = &sigbus_handler;
         act.sa_flags = 0;
@@ -646,6 +653,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
             perror("os_mem_prealloc: failed to reinstall signal handler");
             exit(1);
         }
+        qemu_mutex_unlock(&sigbus_mutex);
     }
 }
 
-- 
2.31.1



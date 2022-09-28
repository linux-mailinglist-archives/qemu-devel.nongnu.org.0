Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5B5EE2EE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:19:54 +0200 (CEST)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaiv-00046K-V2
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaD7-00036x-0N
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaD4-0001Ct-U3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664383618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTp/LLUqQAxZxImTmxz+pvxOy6NG+NQX6VA1T1e1u0I=;
 b=Y5aaVYH6MMYYsRT3/NOWIzI8EZbtYBHPQYjWT4H3dvHFaq8iRJG6Z4l3krvThI4/qqBVFP
 lahGH9TgxtW4o5lWOWat750hgKKHpX9T31CkzpJg8Qnbada1IGP+/gRLsxmP8YtHuxcvOX
 aHOqRvchgVeHQ+e/g7d8x0VFyeXo1JM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-y71jOLVNNoePrJWnzARDmQ-1; Wed, 28 Sep 2022 12:46:57 -0400
X-MC-Unique: y71jOLVNNoePrJWnzARDmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA97080206D;
 Wed, 28 Sep 2022 16:46:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9CA22166B26;
 Wed, 28 Sep 2022 16:46:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v1 7/7] vl: Allow ThreadContext objects to be created before
 the sandbox option
Date: Wed, 28 Sep 2022 18:45:42 +0200
Message-Id: <20220928164542.117952-8-david@redhat.com>
In-Reply-To: <20220928164542.117952-1-david@redhat.com>
References: <20220928164542.117952-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Currently, there is no way to configure a CPU affinity inside QEMU when
the sandbox option disables it for QEMU as a whole, for example, via:
    -sandbox enable=on,resourcecontrol=deny

While ThreadContext objects can be created on the QEMU commandline and
the CPU affinity can be configured externally via the thread-id, this is
insufficient if a ThreadContext with a certain CPU affinity is already
required during QEMU startup, before we can intercept QEMU and
configure the CPU affinity.

Blocking sched_setaffinity() was introduced in 24f8cdc57224 ("seccomp:
add resourcecontrol argument to command line"), "to avoid any bigger of the
process". However, we only care about once QEMU is running, not when
the instance starting QEMU explicitly requests a certain CPU affinity
on the QEMU comandline.

Right now, for NUMA-aware preallocation of memory backends used for initial
machine RAM, one has to:

1) Start QEMU with the memory-backend with "prealloc=off"
2) Pause QEMU before it starts the guest (-S)
3) Create ThreadContext, configure the CPU affinity using the thread-id
4) Configure the ThreadContext as "prealloc-context" of the memory
   backend
5) Trigger preallocation by setting "prealloc=on"

To simplify this handling especially for initial machine RAM,
allow creation of ThreadContext objects before parsing sandbox options,
such that the CPU affinity requested on the QEMU commandline alongside the
sandbox option can be set. As ThreadContext objects essentially only create
a persistant context thread and set the CPU affinity, this is easily
possible.

With this change, we can create a ThreadContext with a CPU affinity on
the QEMU commandline and use it for preallocation of memory backends
glued to the machine (simplified example):

To make "-name debug-threads=on" keep working as expected for the
context threads, perform earlier parsing of "-name".

qemu-system-x86_64 -m 1G \
 -object thread-context,id=tc1,cpu-affinity=3-4 \
 -object memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1 \
 -machine memory-backend=pc.ram \
 -S -monitor stdio -sandbox enable=on,resourcecontrol=deny

And while we can query the current CPU affinity:
  (qemu) qom-get tc1 cpu-affinity
  [
      3,
      4
  ]

We can no longer change it from QEMU directly:
  (qemu) qom-set tc1 cpu-affinity 1-2
  Error: Setting CPU affinity failed: Operation not permitted

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/vl.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9abadcc150..27488e32d0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1761,6 +1761,27 @@ static void object_option_parse(const char *optarg)
     visit_free(v);
 }
 
+/*
+ * Very early object creation, before the sandbox options have been activated.
+ */
+static bool object_create_pre_sandbox(const char *type)
+{
+    /*
+     * Objects should in general not get initialized "too early" without
+     * a reason. If you add one, state the reason in a comment!
+     */
+
+    /*
+     * Reason: -sandbox on,resourcecontrol=deny disallows setting CPU
+     * affinity of threads.
+     */
+    if (g_str_equal(type, "thread-context")) {
+        return true;
+    }
+
+    return false;
+}
+
 /*
  * Initial object creation happens before all other
  * QEMU data types are created. The majority of objects
@@ -1775,6 +1796,11 @@ static bool object_create_early(const char *type)
      * add one, state the reason in a comment!
      */
 
+    /* Reason: already created. */
+    if (object_create_pre_sandbox(type)) {
+        return false;
+    }
+
     /* Reason: property "chardev" */
     if (g_str_equal(type, "rng-egd") ||
         g_str_equal(type, "qtest")) {
@@ -1897,7 +1923,7 @@ static void qemu_create_early_backends(void)
  */
 static bool object_create_late(const char *type)
 {
-    return !object_create_early(type);
+    return !object_create_early(type) && !object_create_pre_sandbox(type);
 }
 
 static void qemu_create_late_backends(void)
@@ -2359,6 +2385,11 @@ static int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
 
 static void qemu_process_early_options(void)
 {
+    qemu_opts_foreach(qemu_find_opts("name"),
+                      parse_name, NULL, &error_fatal);
+
+    object_option_foreach_add(object_create_pre_sandbox);
+
 #ifdef CONFIG_SECCOMP
     QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
     if (olist) {
@@ -2366,9 +2397,6 @@ static void qemu_process_early_options(void)
     }
 #endif
 
-    qemu_opts_foreach(qemu_find_opts("name"),
-                      parse_name, NULL, &error_fatal);
-
     if (qemu_opts_foreach(qemu_find_opts("action"),
                           process_runstate_actions, NULL, &error_fatal)) {
         exit(1);
-- 
2.37.3



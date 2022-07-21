Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDE57CA84
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:16:43 +0200 (CEST)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEV6f-00075Z-8i
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUyN-0002cF-Sc
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUyJ-0000zz-AU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658405282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7w36JqEwtEyECpPl6nXdvmSWboGE6jsZbpoi6KrEN0=;
 b=CzBHqhTQ8qqofCa6dhFaNP1OIFdqxOxg53Gp3ZxTfHVhKRrcG4+cAb6P32CjYl07vow1pF
 PsJQuQR2Rr0MXaSkAS/VLkefPNs9vX11KhYDZvkWR1A73/m0AiRWgi7LL/HYm5nKNuPFga
 z7uBRprn5ZNdvW1QVn8UHSbZQy2vxxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-3_ooOJgiMdOQghXspDUV_g-1; Thu, 21 Jul 2022 08:07:59 -0400
X-MC-Unique: 3_ooOJgiMdOQghXspDUV_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03853C138A9;
 Thu, 21 Jul 2022 12:07:58 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445722026D64;
 Thu, 21 Jul 2022 12:07:55 +0000 (UTC)
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
Subject: [PATCH RFC 7/7] vl: Allow ThreadContext objects to be created before
 the sandbox option
Date: Thu, 21 Jul 2022 14:07:32 +0200
Message-Id: <20220721120732.118133-8-david@redhat.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
References: <20220721120732.118133-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/vl.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a..252732cf5d 100644
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
@@ -1895,7 +1921,7 @@ static void qemu_create_early_backends(void)
  */
 static bool object_create_late(const char *type)
 {
-    return !object_create_early(type);
+    return !object_create_early(type) && !object_create_pre_sandbox(type);
 }
 
 static void qemu_create_late_backends(void)
@@ -2365,6 +2391,8 @@ static int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
 
 static void qemu_process_early_options(void)
 {
+    object_option_foreach_add(object_create_pre_sandbox);
+
 #ifdef CONFIG_SECCOMP
     QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
     if (olist) {
-- 
2.35.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8065B129
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0h-00078U-QV; Mon, 02 Jan 2023 06:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0f-00078I-Ql
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0e-00080i-7l
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672658979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqnKwEYl8bSvsHZMLQ1pWuvrE1wRJieo2lU+F/vq3fo=;
 b=SRrTrY8KRopzTfUQpYuAtMGeU488ZUh/sTWv0Y6sEU3I3AbSoFqqhuiqV9MxKXDHe67+Oe
 sn9kx6nnxGjKYs2bxlAy1WqnOsdyEGOilzX3rpF8isUGuRlMs2X/3rASLXjLDMT0Z1gc/E
 m4kbTDUFr/A9q8Mm0GQJc3Pu4RDjBy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-e7d-ya0uOeOENOWE7Yxv2Q-1; Mon, 02 Jan 2023 06:29:34 -0500
X-MC-Unique: e7d-ya0uOeOENOWE7Yxv2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C633C0E205;
 Mon,  2 Jan 2023 11:29:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5833F40C2064;
 Mon,  2 Jan 2023 11:29:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [GIT PULL 4/4] hostmem: Honor multiple preferred nodes if possible
Date: Mon,  2 Jan 2023 12:29:21 +0100
Message-Id: <20230102112921.68077-5-david@redhat.com>
In-Reply-To: <20230102112921.68077-1-david@redhat.com>
References: <20230102112921.68077-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michal Privoznik <mprivozn@redhat.com>

If a memory-backend is configured with mode
HOST_MEM_POLICY_PREFERRED then
host_memory_backend_memory_complete() calls mbind() as:

  mbind(..., MPOL_PREFERRED, nodemask, ...);

Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
to the .host-nodes attribute. Therefore, there can be multiple
nodes specified. However, the documentation to MPOL_PREFERRED
says:

  MPOL_PREFERRED
    This mode sets the preferred node for allocation. ...
    If nodemask specifies more than one node ID, the first node
    in the mask will be selected as the preferred node.

Therefore, only the first node is honored and the rest is
silently ignored. Well, with recent changes to the kernel and
numactl we can do better.

The Linux kernel added in v5.15 via commit cfcaa66f8032
("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
support for MPOL_PREFERRED_MANY, which accepts multiple preferred
NUMA nodes instead.

Then, numa_has_preferred_many() API was introduced to numactl
(v2.0.15~26) allowing applications to query kernel support.

Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
mbind() call instead and stop ignoring multiple nodes, silently.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Message-Id: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem.c | 19 +++++++++++++++++--
 meson.build        |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 8640294c10..747e7838c0 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -23,7 +23,12 @@
 
 #ifdef CONFIG_NUMA
 #include <numaif.h>
+#include <numa.h>
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_DEFAULT != MPOL_DEFAULT);
+/*
+ * HOST_MEM_POLICY_PREFERRED may either translate to MPOL_PREFERRED or
+ * MPOL_PREFERRED_MANY, see comments further below.
+ */
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_PREFERRED != MPOL_PREFERRED);
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_BIND != MPOL_BIND);
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_INTERLEAVE != MPOL_INTERLEAVE);
@@ -346,6 +351,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
          * this doesn't catch hugepage case. */
         unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
+        int mode = backend->policy;
 
         /* check for invalid host-nodes and policies and give more verbose
          * error messages than mbind(). */
@@ -369,9 +375,18 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
                BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
         assert(maxnode <= MAX_NODES);
 
+#ifdef HAVE_NUMA_HAS_PREFERRED_MANY
+        if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
+            /*
+             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
+             * silently picks the first node.
+             */
+            mode = MPOL_PREFERRED_MANY;
+        }
+#endif
+
         if (maxnode &&
-            mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
-                  flags)) {
+            mbind(ptr, sz, mode, backend->host_nodes, maxnode + 1, flags)) {
             if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
                 error_setg_errno(errp, errno,
                                  "cannot bind memory to host NUMA nodes");
diff --git a/meson.build b/meson.build
index 4c6f8a674a..3f31db5963 100644
--- a/meson.build
+++ b/meson.build
@@ -1858,6 +1858,11 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+if numa.found()
+  config_host_data.set('HAVE_NUMA_HAS_PREFERRED_MANY',
+                       cc.has_function('numa_has_preferred_many',
+                                       dependencies: numa))
+endif
 config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
-- 
2.39.0



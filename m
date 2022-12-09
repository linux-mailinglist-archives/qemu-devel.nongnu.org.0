Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12004648688
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gJR-0007bv-MS; Fri, 09 Dec 2022 11:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p3gJD-0007Vp-48
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:33:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p3gJ9-0006YT-1x
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670603581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rAFQoXSUNAeEZ+3C7zeTfPgtVi+OES4kxhNqe80Hcag=;
 b=jU2F1zgjtVuUaNxjkF3TzNMh9TCF+sAgoXueMLYFXZU39OGLkfgGg4824HGGu/2yu/gY/z
 H/Lc7WoNfUopJeAKtwYTPcR010SjbTxYE6rLTVo4YkbxgyKW4fZqyAwp6c/tGNS1g8CsEE
 Qw8je7c3O2SHUL/tvNMMsj2giUEUnqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-J6OkyEazNaWXgMMP0kh09g-1; Fri, 09 Dec 2022 11:29:31 -0500
X-MC-Unique: J6OkyEazNaWXgMMP0kh09g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C85373C1023C
 for <qemu-devel@nongnu.org>; Fri,  9 Dec 2022 16:29:30 +0000 (UTC)
Received: from maggie.redhat.com (unknown [10.43.2.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3FC0477F5C;
 Fri,  9 Dec 2022 16:29:29 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Cc: david@redhat.com, imammedo@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com
Subject: [PATCH] hostmem: Honour multiple preferred nodes if possible
Date: Fri,  9 Dec 2022 17:29:23 +0100
Message-Id: <ba02465fc48807eddea9ad646fca7cc92f929ae7.1670603308.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
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

Therefore, only the first node is honoured and the rest is
silently ignored. Well, with recent changes to the kernel and
numactl we can do better.

Firstly, new mode - MPOL_PREFERRED_MANY - was introduced to
kernel (v5.15-rc1~107^2~21) which now accepts multiple NUMA
nodes.

Then, numa_has_preferred_many() API was introduced to numactl
(v2.0.15~26) allowing applications to query kernel support.

Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
mbind() call instead and stop ignoring multiple nodes, silently.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 backends/hostmem.c | 28 ++++++++++++++++++++++++++++
 meson.build        |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 8640294c10..e0d6cb6c8a 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -23,10 +23,22 @@
 
 #ifdef CONFIG_NUMA
 #include <numaif.h>
+#include <numa.h>
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_DEFAULT != MPOL_DEFAULT);
+/*
+ * HOST_MEM_POLICY_PREFERRED may some time also by MPOL_PREFERRED_MANY, see
+ * below.
+ */
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_PREFERRED != MPOL_PREFERRED);
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_BIND != MPOL_BIND);
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_INTERLEAVE != MPOL_INTERLEAVE);
+
+/*
+ * -1 for uninitialized,
+ *  0 for MPOL_PREFERRED_MANY unsupported,
+ *  1 for supported.
+ */
+static int has_preferred_many = -1;
 #endif
 
 char *
@@ -346,6 +358,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
          * this doesn't catch hugepage case. */
         unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
+        int mode = backend->policy;
 
         /* check for invalid host-nodes and policies and give more verbose
          * error messages than mbind(). */
@@ -369,6 +382,21 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
                BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
         assert(maxnode <= MAX_NODES);
 
+#ifdef HAVE_NUMA_SET_PREFERRED_MANY
+        if (has_preferred_many < 0) {
+            /* Check, whether kernel supports MPOL_PREFERRED_MANY. */
+            has_preferred_many = numa_has_preferred_many() > 0 ? 1 : 0;
+        }
+
+        if (mode == MPOL_PREFERRED && has_preferred_many > 0) {
+            /*
+             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
+             * silently picks the first node.
+             */
+            mode = MPOL_PREFERRED_MANY;
+        }
+#endif
+
         if (maxnode &&
             mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
                   flags)) {
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..ebbff7a8ea 100644
--- a/meson.build
+++ b/meson.build
@@ -1858,6 +1858,11 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+if numa.found()
+  config_host_data.set('HAVE_NUMA_SET_PREFERRED_MANY',
+                       cc.has_function('numa_set_preferred_many',
+                                       dependencies: numa))
+endif
 config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
-- 
2.37.4



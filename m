Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29F46B367
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:08:33 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUaW-0003cM-Px
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muUYb-0001jf-8w
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:06:33 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muUYS-0008TV-V0
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:06:30 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id A57C62E1266;
 Tue,  7 Dec 2021 10:06:17 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ph9wxHp6UI-6HLqIG1e; Tue, 07 Dec 2021 10:06:17 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638860777; bh=8gPwH387wsHbUVM1SunSCfrZH0nPeMnZqOK7k6KpunA=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=VJV6zLcKXOAA/Cm8IdyCv6D4ZHNS/5ZMmeZwQBdEwLOQ6rWGfykJWtm7e2fjDmy8k
 f85not4Ntfn2bP6iUpDfv+2eFlnUqvukBYZGNWTBaFTvG+6165jL4YcBVXKvxjGEKk
 nFDOl9DTZWSIVfKwpb8JqaL8sZCMD61ZrcLIIv24=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8118::1:31])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 0CVY1jOJUY-6HPCCX3h; Tue, 07 Dec 2021 10:06:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] hostmem: use a static size for maxnode,
 validate policy everywhere
Date: Tue,  7 Dec 2021 10:06:06 +0300
Message-Id: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, sw@weilnetz.de, pbonzini@redhat.com,
 yc-core@yandex-team.ru, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously we would calculate the last set bit in the mask, and add
2 to that value to get the maxnode value. This is unnecessary since
the mbind syscall allows the bitmap to be any (reasonable) size as
long as all the unused bits are clear. This also adds policy validation
in multiple places so that it's guaranteed to be valid when we call
mbind.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 backends/hostmem.c | 64 +++++++++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4c05862ed5..392026efe6 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -38,6 +38,29 @@ host_memory_backend_get_name(HostMemoryBackend *backend)
     return object_get_canonical_path(OBJECT(backend));
 }
 
+static bool
+validate_policy(HostMemPolicy policy, bool nodes_empty, Error **errp)
+{
+    /*
+     * check for invalid host-nodes and policies and give more verbose
+     * error messages than mbind().
+     */
+    if (!nodes_empty && policy == MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be empty for policy default,"
+                   " or you should explicitly specify a policy other"
+                   " than default");
+        return false;
+    }
+
+    if (nodes_empty && policy != MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be set for policy %s",
+                   HostMemPolicy_str(policy));
+        return false;
+    }
+
+    return true;
+}
+
 static void
 host_memory_backend_get_size(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
@@ -110,6 +133,7 @@ host_memory_backend_set_host_nodes(Object *obj, Visitor *v, const char *name,
 #ifdef CONFIG_NUMA
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
     uint16List *l, *host_nodes = NULL;
+    bool nodes_empty = bitmap_empty(backend->host_nodes, MAX_NODES + 1);
 
     visit_type_uint16List(v, name, &host_nodes, errp);
 
@@ -118,6 +142,13 @@ host_memory_backend_set_host_nodes(Object *obj, Visitor *v, const char *name,
             error_setg(errp, "Invalid host-nodes value: %d", l->value);
             goto out;
         }
+
+        nodes_empty = false;
+    }
+
+    if (host_memory_backend_mr_inited(backend) &&
+        !validate_policy(backend->policy, nodes_empty, errp)) {
+        goto out;
     }
 
     for (l = host_nodes; l; l = l->next) {
@@ -142,6 +173,13 @@ static void
 host_memory_backend_set_policy(Object *obj, int policy, Error **errp)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+    bool nodes_empty = bitmap_empty(backend->host_nodes, MAX_NODES + 1);
+
+    if (host_memory_backend_mr_inited(backend) &&
+        !validate_policy(policy, nodes_empty, errp)) {
+        return;
+    }
+
     backend->policy = policy;
 
 #ifndef CONFIG_NUMA
@@ -347,24 +385,9 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
             qemu_madvise(ptr, sz, QEMU_MADV_DONTDUMP);
         }
 #ifdef CONFIG_NUMA
-        unsigned long lastbit = find_last_bit(backend->host_nodes, MAX_NODES);
-        /* lastbit == MAX_NODES means maxnode = 0 */
-        unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
-        /* ensure policy won't be ignored in case memory is preallocated
-         * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
-         * this doesn't catch hugepage case. */
         unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
-
-        /* check for invalid host-nodes and policies and give more verbose
-         * error messages than mbind(). */
-        if (maxnode && backend->policy == MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be empty for policy default,"
-                       " or you should explicitly specify a policy other"
-                       " than default");
-            return;
-        } else if (maxnode == 0 && backend->policy != MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be set for policy %s",
-                       HostMemPolicy_str(backend->policy));
+        bool nodes_empty = bitmap_empty(backend->host_nodes, MAX_NODES + 1);
+        if (!validate_policy(backend->policy, nodes_empty, errp)) {
             return;
         }
 
@@ -373,12 +396,11 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          * cuts off the last specified node. This means backend->host_nodes
          * must have MAX_NODES+1 bits available.
          */
-        assert(sizeof(backend->host_nodes) >=
+        QEMU_BUILD_BUG_ON(sizeof(backend->host_nodes) <
                BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
-        assert(maxnode <= MAX_NODES);
 
-        if (maxnode &&
-            mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
+        if (!nodes_empty &&
+            mbind(ptr, sz, backend->policy, backend->host_nodes, MAX_NODES + 1,
                   flags)) {
             if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
                 error_setg_errno(errp, errno,
-- 
2.25.1



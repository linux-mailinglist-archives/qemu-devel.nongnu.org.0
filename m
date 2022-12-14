Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC67A64CE70
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu6-0004yt-88; Wed, 14 Dec 2022 11:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu0-0004wt-QI
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uty-0002PX-Sz
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyCSZtvTOMTN9aPaKROzPXb1f3pMvw9zZLUTgW2vGSY=;
 b=J4ApShaHqGD9cnckqhP/DomB/f6ZpVSvct79pHHW/i/hvZYmTgGpu6i9fSQQbtDCt8DLzg
 dGfu71tnse5UdvHhWH7sGPwjlxc+HXvakqlUizLW67IYCEE2Pm5/1Cor1ei2f3v5afBKrs
 P4PiTjcHMgtQ4MAUKozvSA0QsTLmhMc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400--LNLA8ecNhmj80c9kUoSzA-1; Wed, 14 Dec 2022 11:46:36 -0500
X-MC-Unique: -LNLA8ecNhmj80c9kUoSzA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0213815D27;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C12CA49BB6A;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 487E921E6498; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/14] qapi: Use returned bool to check for failure (again)
Date: Wed, 14 Dec 2022 17:46:25 +0100
Message-Id: <20221214164629.919880-11-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Commit 012d4c96e2 changed the visitor functions taking Error ** to
return bool instead of void, and the commits following it used the new
return value to simplify error checking.  Since then a few more uses
in need of the same treatment crept in.  Do that.  All pretty
mechanical except for

* balloon_stats_get_all()

  This is basically the same transformation commit 012d4c96e2 applied
  to the virtual walk example in include/qapi/visitor.h.

* set_max_queue_size()

  Additionally replace "goto end of function" by return.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-10-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-all.c              |  5 +----
 hw/core/qdev-properties-system.c |  5 +----
 hw/i386/pc.c                     |  5 +----
 hw/virtio/virtio-balloon.c       | 20 +++++++++-----------
 hw/virtio/virtio-mem.c           | 10 ++--------
 net/colo-compare.c               | 13 ++++---------
 target/i386/kvm/kvm.c            |  5 +----
 util/thread-context.c            | 10 ++--------
 8 files changed, 21 insertions(+), 52 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..e86c33e0e6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3586,7 +3586,6 @@ static void kvm_set_dirty_ring_size(Object *obj, Visitor *v,
                                     Error **errp)
 {
     KVMState *s = KVM_STATE(obj);
-    Error *error = NULL;
     uint32_t value;
 
     if (s->fd != -1) {
@@ -3594,9 +3593,7 @@ static void kvm_set_dirty_ring_size(Object *obj, Visitor *v,
         return;
     }
 
-    visit_type_uint32(v, name, &value, &error);
-    if (error) {
-        error_propagate(errp, error);
+    if (!visit_type_uint32(v, name, &value, errp)) {
         return;
     }
     if (value & (value - 1)) {
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a91f60567a..97a968f477 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -679,14 +679,11 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
 {
     Property *prop = opaque;
     ReservedRegion *rr = object_field_prop_ptr(obj, prop);
-    Error *local_err = NULL;
     const char *endptr;
     char *str;
     int ret;
 
-    visit_type_str(v, name, &str, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 546b703cb4..fa69b6f43e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1782,12 +1782,9 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
                                        Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
-    Error *error = NULL;
     uint64_t value;
 
-    visit_type_size(v, name, &value, &error);
-    if (error) {
-        error_propagate(errp, error);
+    if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
 
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 73ac5eb675..746f07c4d2 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -241,36 +241,34 @@ static void balloon_stats_poll_cb(void *opaque)
 static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
-    Error *err = NULL;
     VirtIOBalloon *s = VIRTIO_BALLOON(obj);
+    bool ok = false;
     int i;
 
-    if (!visit_start_struct(v, name, NULL, 0, &err)) {
-        goto out;
+    if (!visit_start_struct(v, name, NULL, 0, errp)) {
+        return;
     }
-    if (!visit_type_int(v, "last-update", &s->stats_last_update, &err)) {
+    if (!visit_type_int(v, "last-update", &s->stats_last_update, errp)) {
         goto out_end;
     }
 
-    if (!visit_start_struct(v, "stats", NULL, 0, &err)) {
+    if (!visit_start_struct(v, "stats", NULL, 0, errp)) {
         goto out_end;
     }
     for (i = 0; i < VIRTIO_BALLOON_S_NR; i++) {
-        if (!visit_type_uint64(v, balloon_stat_names[i], &s->stats[i], &err)) {
+        if (!visit_type_uint64(v, balloon_stat_names[i], &s->stats[i], errp)) {
             goto out_nested;
         }
     }
-    visit_check_struct(v, &err);
+    ok = visit_check_struct(v, errp);
 out_nested:
     visit_end_struct(v, NULL);
 
-    if (!err) {
-        visit_check_struct(v, &err);
+    if (ok) {
+        visit_check_struct(v, errp);
     }
 out_end:
     visit_end_struct(v, NULL);
-out:
-    error_propagate(errp, err);
 }
 
 static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index ed170def48..d96bde1fab 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1094,12 +1094,9 @@ static void virtio_mem_set_requested_size(Object *obj, Visitor *v,
                                           Error **errp)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
-    Error *err = NULL;
     uint64_t value;
 
-    visit_type_size(v, name, &value, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
 
@@ -1159,7 +1156,6 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
                                       void *opaque, Error **errp)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
-    Error *err = NULL;
     uint64_t value;
 
     if (DEVICE(obj)->realized) {
@@ -1167,9 +1163,7 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    visit_type_size(v, name, &value, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
 
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 787c740f14..7f9e6f89ce 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1135,22 +1135,17 @@ static void set_max_queue_size(Object *obj, Visitor *v,
                                const char *name, void *opaque,
                                Error **errp)
 {
-    Error *local_err = NULL;
     uint64_t value;
 
-    visit_type_uint64(v, name, &value, &local_err);
-    if (local_err) {
-        goto out;
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
     }
     if (!value) {
-        error_setg(&local_err, "Property '%s.%s' requires a positive value",
+        error_setg(errp, "Property '%s.%s' requires a positive value",
                    object_get_typename(obj), name);
-        goto out;
+        return;
     }
     max_queue_size = value;
-
-out:
-    error_propagate(errp, local_err);
 }
 
 static void compare_pri_rs_finalize(SocketReadState *pri_rs)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a213209379..0ab4e0734a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5689,7 +5689,6 @@ static void kvm_arch_set_notify_window(Object *obj, Visitor *v,
                                        Error **errp)
 {
     KVMState *s = KVM_STATE(obj);
-    Error *error = NULL;
     uint32_t value;
 
     if (s->fd != -1) {
@@ -5697,9 +5696,7 @@ static void kvm_arch_set_notify_window(Object *obj, Visitor *v,
         return;
     }
 
-    visit_type_uint32(v, name, &value, &error);
-    if (error) {
-        error_propagate(errp, error);
+    if (!visit_type_uint32(v, name, &value, errp)) {
         return;
     }
 
diff --git a/util/thread-context.c b/util/thread-context.c
index 4138245332..2bc7883b9e 100644
--- a/util/thread-context.c
+++ b/util/thread-context.c
@@ -90,16 +90,13 @@ static void thread_context_set_cpu_affinity(Object *obj, Visitor *v,
     uint16List *l, *host_cpus = NULL;
     unsigned long *bitmap = NULL;
     int nbits = 0, ret;
-    Error *err = NULL;
 
     if (tc->init_cpu_bitmap) {
         error_setg(errp, "Mixing CPU and node affinity not supported");
         return;
     }
 
-    visit_type_uint16List(v, name, &host_cpus, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!visit_type_uint16List(v, name, &host_cpus, errp)) {
         return;
     }
 
@@ -178,7 +175,6 @@ static void thread_context_set_node_affinity(Object *obj, Visitor *v,
     uint16List *l, *host_nodes = NULL;
     unsigned long *bitmap = NULL;
     struct bitmask *tmp_cpus;
-    Error *err = NULL;
     int ret, i;
 
     if (tc->init_cpu_bitmap) {
@@ -186,9 +182,7 @@ static void thread_context_set_node_affinity(Object *obj, Visitor *v,
         return;
     }
 
-    visit_type_uint16List(v, name, &host_nodes, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!visit_type_uint16List(v, name, &host_nodes, errp)) {
         return;
     }
 
-- 
2.37.3



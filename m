Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1664CE53
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:47:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu8-00050M-GO; Wed, 14 Dec 2022 11:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uty-0004ve-K5
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utw-0002Or-W5
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjk96eN4dFxrWGHqHY0ovQk3hxz2opcrecQGd4yU5zk=;
 b=KFxEmbFa64gOCrB15Wiyk++hveoALHqX3PnV3meTruZCulzIOsMdLk8p0u+CBUV0yxwXah
 Wcxd0nMYhpUG/WXprRpb+DnVb0IU+lMh2eistJmqOsBxXocaTBj6NKEjWQHajxDgsRo2uR
 ClflAN16DopJxL2XyllWTRv2MIlpDCs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-iMPGyRt9MDeIkBwflWJ1JQ-1; Wed, 14 Dec 2022 11:46:32 -0500
X-MC-Unique: iMPGyRt9MDeIkBwflWJ1JQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 865881C0DE80;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B38D40C2064;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B42521E6936; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/14] error: Move ERRP_GUARD() to the beginning of the function
Date: Wed, 14 Dec 2022 17:46:19 +0100
Message-Id: <20221214164629.919880-5-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

include/qapi/error.h advises to put ERRP_GUARD() right at the
beginning of the function, because only then can it guard the whole
function.  Clean up the few spots disregarding the advice.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-4-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armsse.c        | 3 +--
 hw/core/machine.c      | 3 +--
 hw/virtio/vhost-vdpa.c | 2 +-
 iothread.c             | 2 +-
 monitor/qmp-cmds.c     | 4 ++--
 5 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index aecdeb9815..0202bad787 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -900,6 +900,7 @@ static qemu_irq armsse_get_common_irq_in(ARMSSE *s, int irqno)
 
 static void armsse_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     ARMSSE *s = ARM_SSE(dev);
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(dev);
     const ARMSSEInfo *info = asc->info;
@@ -914,8 +915,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     DeviceState *dev_splitter;
     uint32_t addr_width_max;
 
-    ERRP_GUARD();
-
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
         return;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d34caa31d..2352861240 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -554,12 +554,11 @@ static void machine_get_mem(Object *obj, Visitor *v, const char *name,
 static void machine_set_mem(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
+    ERRP_GUARD();
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
     MemorySizeConfiguration *mem;
 
-    ERRP_GUARD();
-
     if (!visit_type_MemorySizeConfiguration(v, name, &mem, errp)) {
         return;
     }
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..bc1c79b325 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -963,6 +963,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
                                      struct vhost_vring_addr *addr,
                                      Error **errp)
 {
+    ERRP_GUARD();
     DMAMap device_region, driver_region;
     struct vhost_vring_addr svq_addr;
     struct vhost_vdpa *v = dev->opaque;
@@ -971,7 +972,6 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
     size_t avail_offset;
     bool ok;
 
-    ERRP_GUARD();
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
     driver_region = (DMAMap) {
diff --git a/iothread.c b/iothread.c
index 529194a566..3862a64471 100644
--- a/iothread.c
+++ b/iothread.c
@@ -155,8 +155,8 @@ static void iothread_init_gcontext(IOThread *iothread)
 
 static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
 {
-    IOThread *iothread = IOTHREAD(base);
     ERRP_GUARD();
+    IOThread *iothread = IOTHREAD(base);
 
     if (!iothread->ctx) {
         return;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 81c8fdadf8..686d562cad 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -474,9 +474,9 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
                             StatsFilter *filter, StatsRequest *request,
                             Error **errp)
 {
+    ERRP_GUARD();
     strList *targets = NULL;
     strList *names = NULL;
-    ERRP_GUARD();
 
     if (request) {
         if (request->provider != entry->provider) {
@@ -541,9 +541,9 @@ StatsSchemaList *qmp_query_stats_schemas(bool has_provider,
                                          StatsProvider provider,
                                          Error **errp)
 {
+    ERRP_GUARD();
     StatsSchemaList *stats_results = NULL;
     StatsCallbacks *entry;
-    ERRP_GUARD();
 
     QTAILQ_FOREACH(entry, &stats_callbacks, next) {
         if (!has_provider || provider == entry->provider) {
-- 
2.37.3



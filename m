Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671235659B9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:26:01 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NxY-0007wr-D7
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nuv-00051h-08
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nut-0002MK-Db
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrL2nj+uX/hvqKpBrStGoWhbrCZXAZE6aOGjVbKi+m8=;
 b=gNFVAMppm9M5vMzK+UsWHnl2Ma3GiWb42rd5qfPBkwbe9H5s/9I8pD0fVapdTjzQSqP/07
 fJCGgM7bv1MaVXm4vn6I3r165oOeegNqM5Z1MVBYT9IM0Lt0gue6ct9RbBgRmCDut+8Pwl
 o8oTn5wDZiuQFxe46Cc8SoO8PDyK1lA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-qyjvA9pEPYe8kGgMPK5fvQ-1; Mon, 04 Jul 2022 11:23:11 -0400
X-MC-Unique: qyjvA9pEPYe8kGgMPK5fvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48F93C0CD41;
 Mon,  4 Jul 2022 15:23:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 205E4C28100;
 Mon,  4 Jul 2022 15:23:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/7] misc: fix mixups of bool constants with int variables
Date: Mon,  4 Jul 2022 16:22:58 +0100
Message-Id: <20220704152303.760983-3-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/vhdx-log.c       | 2 +-
 hw/xtensa/sim.c        | 4 ++--
 nbd/client.c           | 4 ++--
 target/i386/cpu-dump.c | 3 ++-
 ui/spice-display.c     | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index ff0d4e0da0..8f34755a6f 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -215,7 +215,7 @@ exit:
 static bool vhdx_log_hdr_is_valid(VHDXLogEntries *log, VHDXLogEntryHeader *hdr,
                                   BDRVVHDXState *s)
 {
-    int valid = false;
+    bool valid = false;
 
     if (hdr->signature != VHDX_LOG_SIGNATURE) {
         goto exit;
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 946c71cb5b..70fce7fb85 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -97,9 +97,9 @@ void xtensa_sim_load_kernel(XtensaCPU *cpu, MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
 #if TARGET_BIG_ENDIAN
-    int big_endian = true;
+    int big_endian = 1;
 #else
-    int big_endian = false;
+    int big_endian = 0;
 #endif
 
     if (kernel_filename) {
diff --git a/nbd/client.c b/nbd/client.c
index 30d5383cb1..fee3959d24 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -832,8 +832,8 @@ static int nbd_list_meta_contexts(QIOChannel *ioc,
                                   Error **errp)
 {
     int ret;
-    int seen_any = false;
-    int seen_qemu = false;
+    bool seen_any = false;
+    bool seen_qemu = false;
 
     if (nbd_send_meta_query(ioc, NBD_OPT_LIST_META_CONTEXT,
                             info->name, NULL, errp) < 0) {
diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 08ac957e99..43521c74c8 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -275,7 +275,8 @@ static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
 static void dump_apic_interrupt(const char *name, uint32_t *ireg_tab,
                                 uint32_t *tmr_tab)
 {
-    int i, empty = true;
+    int i;
+    bool empty = true;
 
     qemu_printf("%s\t ", name);
     for (i = 0; i < 256; i++) {
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 494168e7fe..5d3b64413f 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -541,14 +541,14 @@ static int interface_get_command(QXLInstance *sin, QXLCommandExt *ext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     SimpleSpiceUpdate *update;
-    int ret = false;
+    int ret = 0;
 
     qemu_mutex_lock(&ssd->lock);
     update = QTAILQ_FIRST(&ssd->updates);
     if (update != NULL) {
         QTAILQ_REMOVE(&ssd->updates, update, next);
         *ext = update->ext;
-        ret = true;
+        ret = 1;
     }
     qemu_mutex_unlock(&ssd->lock);
 
-- 
2.36.1



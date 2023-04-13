Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84C6E0683
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 07:46:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmpmJ-0004vj-63; Thu, 13 Apr 2023 01:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmpm1-0004s2-Ui
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 01:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmplz-0005DC-Tb
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 01:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681364722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ApzX0kI8vsKbMu+jKf2LOe3hgo2/cLDE/IIHfzVoIHs=;
 b=OoBQVkusBNbmWfIRmgR0Onh1uogMT5Um7GW+PRQzIrHiDi16wThPER7eGnFspZTywg6UX1
 6hAve+KBv2kgjaLky3obuosNeCOPiizK+1Gmi4yFMeJfu9jQKtGOnc/aIEqDSIiYqYiX8u
 xpl2ZCGJ2CV35MB1o578r56D0EWWy/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-pHtXxMMaNIiFUXZncgZnkg-1; Thu, 13 Apr 2023 01:45:16 -0400
X-MC-Unique: pHtXxMMaNIiFUXZncgZnkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD450185A78F;
 Thu, 13 Apr 2023 05:45:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FAE11121320;
 Thu, 13 Apr 2023 05:45:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] softmmu: Move dirtylimit.c into the target independent source
 set
Date: Thu, 13 Apr 2023 07:45:09 +0200
Message-Id: <20230413054509.54421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

dirtylimit.c just uses one TARGET_PAGE_SIZE macro - change it to
qemu_target_page_size() so we can move thefile into the target
independent source set. Then we only have to compile this file
once during the build instead of multiple times (one time for
each target).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/dirtylimit.c | 3 ++-
 softmmu/meson.build  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index c56f0f58c8..82986c1499 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -20,6 +20,7 @@
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "exec/memory.h"
+#include "exec/target_page.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "trace.h"
@@ -236,7 +237,7 @@ static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
     static uint64_t max_dirtyrate;
     uint32_t dirty_ring_size = kvm_dirty_ring_size();
     uint64_t dirty_ring_size_meory_MB =
-        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
+        dirty_ring_size * qemu_target_page_size() >> 20;
 
     if (max_dirtyrate < dirtyrate) {
         max_dirtyrate = dirtyrate;
diff --git a/softmmu/meson.build b/softmmu/meson.build
index b392f0bd35..974732b0f3 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'ioport.c',
   'memory.c',
   'physmem.c',
-  'dirtylimit.c',
   'watchpoint.c',
 )])
 
@@ -18,6 +17,7 @@ softmmu_ss.add(files(
   'cpu-throttle.c',
   'cpu-timers.c',
   'datadir.c',
+  'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
-- 
2.31.1



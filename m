Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D76E8FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:17:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHd-0000up-Ga; Thu, 20 Apr 2023 06:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHa-0000s1-Do
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHQ-00081m-Eh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zqYsAAjJkBvnw8VZ4dP3cNY4TpO86L21BDYSPlT74A=;
 b=DCN/Xyb7yKSNA0BYOBzU3h/gEv3MKpo+zjAqfKGVB7XofopnmNudWBSz/Yqb/9coo8IRga
 qdJCrZqnP7Ve69CUfHXTAUU7M15W8GfibqIr3C2AWffMjT3eGGFzTmfL03GlXI4hbfjyg/
 JviEmK6YcSdGG3bqWV/T00MmW1QFK6U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-1HK2ilxVMzijWTgtJEhGmQ-1; Thu, 20 Apr 2023 06:12:38 -0400
X-MC-Unique: 1HK2ilxVMzijWTgtJEhGmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17BA33C14859;
 Thu, 20 Apr 2023 10:12:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367FE5AB7A;
 Thu, 20 Apr 2023 10:12:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/23] softmmu: Make qtest.c target independent
Date: Thu, 20 Apr 2023 12:12:07 +0200
Message-Id: <20230420101216.786304-15-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The code in this file is not performance critical, so we can use
the target independent endianess functions to only compile this
file once for all targets.

Message-Id: <20230411183418.1640500-4-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/qtest.c     | 12 ++++++------
 softmmu/meson.build |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 09126df38a..f8d764b719 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -13,12 +13,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "chardev/char-fe.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
+#include "exec/tswap.h"
 #include "hw/qdev-core.h"
 #include "hw/irq.h"
 #include "qemu/accel.h"
@@ -717,11 +717,11 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "endianness") == 0) {
         qtest_send_prefix(chr);
-#if TARGET_BIG_ENDIAN
-        qtest_sendf(chr, "OK big\n");
-#else
-        qtest_sendf(chr, "OK little\n");
-#endif
+        if (target_words_bigendian()) {
+            qtest_sendf(chr, "OK big\n");
+        } else {
+            qtest_sendf(chr, "OK little\n");
+        }
     } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
         int64_t ns;
 
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 1a7c7ac089..b392f0bd35 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'ioport.c',
   'memory.c',
   'physmem.c',
-  'qtest.c',
   'dirtylimit.c',
   'watchpoint.c',
 )])
@@ -23,6 +22,7 @@ softmmu_ss.add(files(
   'globals.c',
   'memory_mapping.c',
   'qdev-monitor.c',
+  'qtest.c',
   'rtc.c',
   'runstate-action.c',
   'runstate-hmp-cmds.c',
-- 
2.31.1



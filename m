Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51956DE3FB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:35:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIpC-0007s6-DV; Tue, 11 Apr 2023 14:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmIpA-0007rL-Sl
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmIp9-0007sz-Cb
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681238074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JUIOdBxGT6oGtU6vp8zJtxfRJKtCGtT/nlvEO2fOXw=;
 b=A+oF/1c+2Bm3VwviOcwguYyplau0xTWUtZrh1EjqgEslr3ckQQ5YliSm/i8AKvF/IgCuOs
 eo5oN5v3NMDE1NdZJIFayPFy2exXcz6g7uUv+B5aonltBNU6gGsskgTLsNTwHXklHyr4L5
 2ioaTYbvafswmCOHd9jm4WRAR2vkCEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-B2bh-6sHNRKmcF_Y6ZSTjA-1; Tue, 11 Apr 2023 14:34:29 -0400
X-MC-Unique: B2bh-6sHNRKmcF_Y6ZSTjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D56D185A78F;
 Tue, 11 Apr 2023 18:34:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38B7340BC797;
 Tue, 11 Apr 2023 18:34:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 3/3] softmmu: Make qtest.c target independent
Date: Tue, 11 Apr 2023 20:34:18 +0200
Message-Id: <20230411183418.1640500-4-thuth@redhat.com>
In-Reply-To: <20230411183418.1640500-1-thuth@redhat.com>
References: <20230411183418.1640500-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/qtest.c     | 12 ++++++------
 softmmu/meson.build |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 76cbb8bcee..9f2197fd6f 100644
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



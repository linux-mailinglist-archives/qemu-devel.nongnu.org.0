Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B840B2C2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:14:49 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQA92-0006ww-K9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ss-0007Xt-Rx
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9So-0001xL-Ta
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNOaNgDzolO+0it+J7fzAXgDUa5QpcR8ph6GT7968cA=;
 b=FYF4kXneVqcU0o4E2uvvgT1lRM5wwwsyg+R1FybFPBbfK+qbC9GXaJBnD0CJVFd6P4XS/p
 nFrwn2YtM8dB4k4FydQtbH5rGdwWPBcailpME/knPWYRq7i1gxe8cTxKiYnHQgoSeRENeB
 qykrHOnxMH0g8A/gHygE38zPhUNYRYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-F8zNCVkEPpKPd_8ReUkXYQ-1; Tue, 14 Sep 2021 10:31:08 -0400
X-MC-Unique: F8zNCVkEPpKPd_8ReUkXYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D240BAF81;
 Tue, 14 Sep 2021 14:31:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386465D9CA;
 Tue, 14 Sep 2021 14:30:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/53] qapi: introduce x-query-roms QMP command
Date: Tue, 14 Sep 2021 15:20:19 +0100
Message-Id: <20210914142042.1655100-31-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info roms" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/loader.c  | 55 ++++++++++++++++++++++++++++++++---------------
 qapi/machine.json | 12 +++++++++++
 2 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index c623318b73..014d131847 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -46,6 +46,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "trace.h"
 #include "hw/hw.h"
 #include "disas/disas.h"
@@ -1472,32 +1473,52 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
     return cbdata.rom;
 }
 
-void hmp_info_roms(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_roms(Error **errp)
 {
     Rom *rom;
+    g_autoptr(GString) buf = g_string_new("");
+    HumanReadableText *ret;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->mr) {
-            monitor_printf(mon, "%s"
-                           " size=0x%06zx name=\"%s\"\n",
-                           memory_region_name(rom->mr),
-                           rom->romsize,
-                           rom->name);
+            g_string_append_printf(buf, "%s"
+                                   " size=0x%06zx name=\"%s\"\n",
+                                   memory_region_name(rom->mr),
+                                   rom->romsize,
+                                   rom->name);
         } else if (!rom->fw_file) {
-            monitor_printf(mon, "addr=" TARGET_FMT_plx
-                           " size=0x%06zx mem=%s name=\"%s\"\n",
-                           rom->addr, rom->romsize,
-                           rom->isrom ? "rom" : "ram",
-                           rom->name);
+            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
+                                   " size=0x%06zx mem=%s name=\"%s\"\n",
+                                   rom->addr, rom->romsize,
+                                   rom->isrom ? "rom" : "ram",
+                                   rom->name);
         } else {
-            monitor_printf(mon, "fw=%s/%s"
-                           " size=0x%06zx name=\"%s\"\n",
-                           rom->fw_dir,
-                           rom->fw_file,
-                           rom->romsize,
-                           rom->name);
+            g_string_append_printf(buf, "fw=%s/%s"
+                                   " size=0x%06zx name=\"%s\"\n",
+                                   rom->fw_dir,
+                                   rom->fw_file,
+                                   rom->romsize,
+                                   rom->name);
         }
     }
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
+
+void hmp_info_roms(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
+
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 typedef enum HexRecord HexRecord;
diff --git a/qapi/machine.json b/qapi/machine.json
index 8737efa865..a4a1727589 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1327,3 +1327,15 @@
 { 'command': 'x-query-registers',
   'data': {'*cpu': 'int' },
   'returns': 'HumanReadableText' }
+
+##
+# @x-query-roms:
+#
+# Query information on the registered ROMS
+#
+# Returns: registered ROMs
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-roms',
+  'returns': 'HumanReadableText' }
-- 
2.31.1



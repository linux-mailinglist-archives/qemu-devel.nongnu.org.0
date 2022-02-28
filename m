Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13234C6AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:39:44 +0100 (CET)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeNU-00018K-0W
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:39:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAg-00047S-TI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAc-00078v-1o
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZgvseUMY2ncLr03zcIwzZc5vE1TTgn8IXYBQV0Kly4=;
 b=TegrRXnxaosIOAAylLrhE3ww4c29h31Lsy8qFrwd8LaGMm3pz+DDAdQQTD/o7RcpBlvpX5
 fDVutv5X13dBF38BLfAjjs+OcqThyfout42QZ+qerV8EwDk3oxBLEM0nW/d5GBMdU+VtHn
 Qm0sx00XFkMLAfCGqdgYkt3bK/GG2ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-shEG5upuPuq0JlOCtmxHNQ-1; Mon, 28 Feb 2022 06:26:18 -0500
X-MC-Unique: shEG5upuPuq0JlOCtmxHNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A253520F;
 Mon, 28 Feb 2022 11:26:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFE1D4E2A6;
 Mon, 28 Feb 2022 11:26:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF26F21E691B; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] qapi: Move RTC_CHANGE back out of target schema
Date: Mon, 28 Feb 2022 12:26:09 +0100
Message-Id: <20220228112613.520040-6-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

This commit effectively reverts commit 183e4281a30962, which moved
the RTC_CHANGE event to the target schema.  That change was an
attempt to make the event target-specific to improve introspection,
but the event isn't really target-specific: it's machine or device
specific.  Putting RTC_CHANGE in the target schema with an ifdef list
reduces maintainability (by adding an if: list with a long list of
targets that needs to be manually updated as architectures are added
or removed or as new devices gain the RTC_CHANGE functionality) and
increases compile time (by preventing RTC devices which emit the
event from being "compile once" rather than "compile once per
target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
which are poisoned in "compile once" files.)

Move RTC_CHANGE back to misc.json.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220221192123.749970-2-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 22 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 hw/rtc/pl031.c        |  2 +-
 5 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..036c5e4a91 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -2,39 +2,6 @@
 # vim: filetype=python
 #
 
-##
-# @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
-#
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
-#
-# Note: This event is rate-limited.
-#
-# Since: 0.13
-#
-# Example:
-#
-# <-   { "event": "RTC_CHANGE",
-#        "data": { "offset": 78 },
-#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
-##
-{ 'event': 'RTC_CHANGE',
-  'data': { 'offset': 'int' },
-  'if': { 'any': [ 'TARGET_ALPHA',
-                   'TARGET_ARM',
-                   'TARGET_HPPA',
-                   'TARGET_I386',
-                   'TARGET_MIPS',
-                   'TARGET_MIPS64',
-                   'TARGET_PPC',
-                   'TARGET_PPC64',
-                   'TARGET_S390X',
-                   'TARGET_SH4',
-                   'TARGET_SPARC' ] } }
-
 ##
 # @rtc-reset-reinjection:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b..7a70eaa3ff 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,25 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @RTC_CHANGE:
+#
+# Emitted when the guest changes the RTC time.
+#
+# @offset: offset between base RTC clock (as specified by -rtc base), and
+#          new RTC clock value
+#
+# Note: This event is rate-limited.
+#
+# Since: 0.13
+#
+# Example:
+#
+# <-   { "event": "RTC_CHANGE",
+#        "data": { "offset": 78 },
+#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
+#
+##
+{ 'event': 'RTC_CHANGE',
+  'data': { 'offset': 'int' } }
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index 94a5510e4e..79677cf550 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -32,7 +32,7 @@
 #include "hw/ppc/spapr.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index e61a0cced4..57c514e15c 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -40,7 +40,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 38d9d3c2f3..60167c778f 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
-- 
2.35.1



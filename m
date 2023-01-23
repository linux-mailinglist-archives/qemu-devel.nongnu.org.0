Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FFE67767C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:40:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsNC-0000v8-VT; Mon, 23 Jan 2023 03:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN7-0000rO-Lk
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN5-0007zt-Fa
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674463206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srm4IC0NoXO6qoREageHfSqEUq4jYX9xoqN1ujd8ulQ=;
 b=DgnJPyjxPvFUQLCHT4KJ9ue/kW13OqsnVdvRz084TB0nKxJR8OdDnj6YmTZN1rFtrDSvla
 93npaf6W0nTuMDOdrQLORC3mxqc7ka9dPTnrJhfOmSRqWLfnjBqZtkDSBZs93RW9awxY0z
 z+t4KZwdCxIOZy1Xm0TDEbvellOMiZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-InoOHJ2_N6G_8C3Q8yf58w-1; Mon, 23 Jan 2023 03:40:02 -0500
X-MC-Unique: InoOHJ2_N6G_8C3Q8yf58w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 739F43806078;
 Mon, 23 Jan 2023 08:40:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFFE175A2;
 Mon, 23 Jan 2023 08:40:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Date: Mon, 23 Jan 2023 09:39:56 +0100
Message-Id: <20230123083957.20349-2-thuth@redhat.com>
In-Reply-To: <20230123083957.20349-1-thuth@redhat.com>
References: <20230123083957.20349-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

From: Daniel P. Berrangé <berrange@redhat.com>

Way back in QEMU 4.0, the -audiodev command line option was introduced
for configuring audio backends. This CLI option does not use QemuOpts
so it is not visible for introspection in 'query-command-line-options',
instead using the QAPI Audiodev type.  Unfortunately there is also no
QMP command that uses the Audiodev type, so it is not introspectable
with 'query-qmp-schema' either.

This introduces a 'query-audiodev' command that simply reflects back
the list of configured -audiodev command line options. This alone is
maybe not very useful by itself, but it makes Audiodev introspectable
via 'query-qmp-schema', so that libvirt (and other upper layer tools)
can discover the available audiodevs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/audio.json | 13 +++++++++++++
 audio/audio.c   | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/qapi/audio.json b/qapi/audio.json
index 1e0a24bdfc..c7aafa2763 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -443,3 +443,16 @@
     'sndio':     'AudiodevSndioOptions',
     'spice':     'AudiodevGenericOptions',
     'wav':       'AudiodevWavOptions' } }
+
+##
+# @query-audiodevs:
+#
+# Returns information about audiodev configuration
+#
+# Returns: array of @Audiodev
+#
+# Since: 8.0
+#
+##
+{ 'command': 'query-audiodevs',
+  'returns': ['Audiodev'] }
diff --git a/audio/audio.c b/audio/audio.c
index d849a94a81..6f270c07b7 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -28,8 +28,10 @@
 #include "monitor/monitor.h"
 #include "qemu/timer.h"
 #include "qapi/error.h"
+#include "qapi/clone-visitor.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-audio.h"
+#include "qapi/qapi-commands-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/help_option.h"
@@ -2311,3 +2313,13 @@ size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
 
     return bytes;
 }
+
+AudiodevList *qmp_query_audiodevs(Error **errp)
+{
+    AudiodevList *ret = NULL;
+    AudiodevListEntry *e;
+    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
+        QAPI_LIST_PREPEND(ret, QAPI_CLONE(Audiodev, e->dev));
+    }
+    return ret;
+}
-- 
2.31.1



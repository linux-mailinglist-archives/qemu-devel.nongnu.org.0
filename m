Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0C32A8A6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:57:55 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9HO-0001KC-QC
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FE-00082z-E0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH9FA-0007IN-Kk
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614707735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+w1TdHsL+zCM/F/WczjhsSCYLbBjWjKeCO0aIS2FI2I=;
 b=PSo8dat8Ob+UyCBQGR0ClTe8MliIS7QeBmjmE06l2s3a1n5jb/Q7ePISixHD+J6hLh7EW/
 wRa7z6yMwSfmOsnI8ObHEI4zgRc++8Ci6MkdjcgVA7KG7kr70AZ4afpdZwiM18hD77Um13
 XSbpKd23RNT0iFOXCO0NTRVG8/24wGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-H6RgHmGgNaewRf5pSdav0g-1; Tue, 02 Mar 2021 12:55:33 -0500
X-MC-Unique: H6RgHmGgNaewRf5pSdav0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D1E80402C;
 Tue,  2 Mar 2021 17:55:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A37C62665;
 Tue,  2 Mar 2021 17:55:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qapi, audio: add query-audiodev command
Date: Tue,  2 Mar 2021 17:55:22 +0000
Message-Id: <20210302175524.1290840-2-berrange@redhat.com>
In-Reply-To: <20210302175524.1290840-1-berrange@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Way back in QEMU 4.0, the -audiodev command line option was introduced
for configuring audio backends. This CLI option does not use QemuOpts
so it is not visible for introspection in 'query-command-line-options',
instead using the QAPI Audiodev type.  Unfortunately there is also no
QMP command that uses the Audiodev type, so it is not introspectable
with 'query-qmp-schema' either.

This introduces a 'query-audiodev' command that simply reflects back
the list of configured -audiodev command line options. This in turn
makes Audiodev introspectable via 'query-qmp-schema'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c   | 19 +++++++++++++++++++
 qapi/audio.json | 13 +++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 6734c8af70..40a4bbd7ce 100644
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
 #include "sysemu/replay.h"
@@ -2201,3 +2203,20 @@ size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
     rate->bytes_sent += ret;
     return ret;
 }
+
+AudiodevList *qmp_query_audiodevs(Error **errp)
+{
+    AudiodevList *ret = NULL, *prev = NULL, *curr;
+    AudiodevListEntry *e;
+    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
+        curr = g_new0(AudiodevList, 1);
+        curr->value = QAPI_CLONE(Audiodev, e->dev);
+        if (prev) {
+            prev->next = curr;
+            prev = curr;
+        } else {
+            ret = prev = curr;
+        }
+    }
+    return ret;
+}
diff --git a/qapi/audio.json b/qapi/audio.json
index 9cba0df8a4..d7b91230d7 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -419,3 +419,16 @@
     'sdl':       'AudiodevSdlOptions',
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
+# Since: 6.0
+#
+##
+{ 'command': 'query-audiodevs',
+  'returns': ['Audiodev'] }
-- 
2.29.2



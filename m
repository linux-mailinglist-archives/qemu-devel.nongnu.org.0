Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B03AB426
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:58:33 +0200 (CEST)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrbM-0004Q0-JZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKq-0008Gl-Kj
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKo-0007qL-N8
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKXshQvKgN7QP9zrlHiN6CMoBwqclt3qPaYNoAc9mPI=;
 b=ZChKDFnfx4IIuwWGjXDl97vPO4HsLXzw5ssthGX5BZeHsZCs7YDlcIHXNJP4Sr+7ny/lLG
 SdiVhskC4pk0NUc+ciiVv2tqRYpcEizEE3vg3nlUL9yHYI3aepjuIqXTdQLXKKuQiQJNB4
 +xjwI5MOVZtuj5Rf9L/MtjRvNwbeBNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-COcCAH8YMeiu8rDrrybcfA-1; Thu, 17 Jun 2021 08:41:24 -0400
X-MC-Unique: COcCAH8YMeiu8rDrrybcfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 574C0100C610;
 Thu, 17 Jun 2021 12:41:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19ACE60FC2;
 Thu, 17 Jun 2021 12:41:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE8F018017CA; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] audio: move code to audio/audio.c
Date: Thu, 17 Jun 2021 14:41:03 +0200
Message-Id: <20210617124107.2386073-4-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Move the code to generate the pa_context_new() application name
argument to a function in audio/audio.c. The new function
audio_application_name() will also be used in the jackaudio
backend.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210517194604.2545-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h | 2 ++
 audio/audio.c     | 9 +++++++++
 audio/paaudio.c   | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 06f0913835b0..6d685e24a388 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -243,6 +243,8 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size);
 
 void audio_run(AudioState *s, const char *msg);
 
+const char *audio_application_name(void);
+
 typedef struct RateCtl {
     int64_t start_ticks;
     int64_t bytes_sent;
diff --git a/audio/audio.c b/audio/audio.c
index 534278edfed2..052ca6cb789b 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -32,6 +32,7 @@
 #include "qapi/qapi-visit-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
+#include "qemu-common.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
@@ -2172,6 +2173,14 @@ const char *audio_get_id(QEMUSoundCard *card)
     }
 }
 
+const char *audio_application_name(void)
+{
+    const char *vm_name;
+
+    vm_name = qemu_get_vm_name();
+    return vm_name ? vm_name : "qemu";
+}
+
 void audio_rate_start(RateCtl *rate)
 {
     memset(rate, 0, sizeof(RateCtl));
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 14b4269c5500..75401d53910a 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -2,7 +2,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
 #include "audio.h"
 #include "qapi/opts-visitor.h"
 
@@ -753,7 +752,6 @@ static int qpa_validate_per_direction_opts(Audiodev *dev,
 /* common */
 static void *qpa_conn_init(const char *server)
 {
-    const char *vm_name;
     PAConnection *c = g_malloc0(sizeof(PAConnection));
     QTAILQ_INSERT_TAIL(&pa_conns, c, list);
 
@@ -762,9 +760,8 @@ static void *qpa_conn_init(const char *server)
         goto fail;
     }
 
-    vm_name = qemu_get_vm_name();
     c->context = pa_context_new(pa_threaded_mainloop_get_api(c->mainloop),
-                                vm_name ? vm_name : "qemu");
+                                audio_application_name());
     if (!c->context) {
         goto fail;
     }
-- 
2.31.1



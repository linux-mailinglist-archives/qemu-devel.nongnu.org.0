Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A14383DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:47:17 +0200 (CEST)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijCu-00071p-EP
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBw-0005dk-IN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:16 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:33158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBu-0000R9-Vu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:16 -0400
Received: from fwd00.aul.t-online.de (fwd00.aul.t-online.de [172.20.26.147])
 by mailout01.t-online.de (Postfix) with SMTP id 787D929D8E;
 Mon, 17 May 2021 21:46:13 +0200 (CEST)
Received: from linpower.localnet
 (G-BMLoZFwh47Nue+7DAiTkKlxL94tTukj70Jt8LbkoYwKE7ivX-pkOIRVsoSwnYwoQ@[79.208.18.63])
 by fwd00.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lijBq-3mPuwy0; Mon, 17 May 2021 21:46:10 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5D563200620; Mon, 17 May 2021 21:46:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/4] audio: move code to audio/audio.c
Date: Mon, 17 May 2021 21:46:03 +0200
Message-Id: <20210517194604.2545-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
References: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: G-BMLoZFwh47Nue+7DAiTkKlxL94tTukj70Jt8LbkoYwKE7ivX-pkOIRVsoSwnYwoQ
X-TOI-EXPURGATEID: 150726::1621280770-00010D54-ABA2A352/0/0 CLEAN NORMAL
X-TOI-MSGID: a4dc22bb-2caa-4fbb-874b-4d432636a08a
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the code to generate the pa_context_new() application name
argument to a function in audio/audio.c. The new function
audio_application_name() will also be used in the jackaudio
backend.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c     | 9 +++++++++
 audio/audio_int.h | 2 ++
 audio/paaudio.c   | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 534278edfe..052ca6cb78 100644
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
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 06f0913835..6d685e24a3 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -243,6 +243,8 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size);
 
 void audio_run(AudioState *s, const char *msg);
 
+const char *audio_application_name(void);
+
 typedef struct RateCtl {
     int64_t start_ticks;
     int64_t bytes_sent;
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 14b4269c55..75401d5391 100644
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
2.26.2



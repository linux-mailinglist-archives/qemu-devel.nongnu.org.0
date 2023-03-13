Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE26B750C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfw4-00024W-OC; Mon, 13 Mar 2023 07:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfw2-00023t-QL
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfw1-0003u3-Am
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678705304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4igNrjk9KD9RDMi1RSLZacQpI7Uofe/DCpbxepvU14=;
 b=Y2q7sefmhC3eiUGUtatcVdSjfhMfC30iFcLVId0fvQtMUf8E2xV4+Dw46/sb2fRdzw1RXt
 U+PDaqvaFrilUYJmwiqetFJ9a52iXDAaM5vWt2uNpaNwxf8SQVkS/CcFGS8aiKn+TT78eI
 fKHyQs9s3eWDrzuzQZ7vDY1v8Zg/O6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-i3mKhBXAMYi5pavLhe-f-w-1; Mon, 13 Mar 2023 07:01:43 -0400
X-MC-Unique: i3mKhBXAMYi5pavLhe-f-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C888811E6E;
 Mon, 13 Mar 2023 11:01:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653051410F1B;
 Mon, 13 Mar 2023 11:01:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 03/18] audio/dbus: there are no sender for p2p mode
Date: Mon, 13 Mar 2023 15:01:11 +0400
Message-Id: <20230313110126.383392-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio_int.h | 2 +-
 audio/dbusaudio.c | 7 +++++--
 ui/dbus.c         | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index d51d63f08d..e57ff50155 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -143,7 +143,7 @@ struct audio_driver {
     void *(*init) (Audiodev *);
     void (*fini) (void *);
 #ifdef CONFIG_GIO
-    void (*set_dbus_server) (AudioState *s, GDBusObjectManagerServer *manager);
+    void (*set_dbus_server) (AudioState *s, GDBusObjectManagerServer *manager, bool p2p);
 #endif
     struct audio_pcm_ops *pcm_ops;
     int can_be_default;
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
index 722df0355e..fece74f78c 100644
--- a/audio/dbusaudio.c
+++ b/audio/dbusaudio.c
@@ -43,6 +43,7 @@
 
 typedef struct DBusAudio {
     GDBusObjectManagerServer *server;
+    bool p2p;
     GDBusObjectSkeleton *audio;
     QemuDBusDisplay1Audio *iface;
     GHashTable *out_listeners;
@@ -448,7 +449,8 @@ dbus_audio_register_listener(AudioState *s,
                              bool out)
 {
     DBusAudio *da = s->drv_opaque;
-    const char *sender = g_dbus_method_invocation_get_sender(invocation);
+    const char *sender =
+        da->p2p ? "p2p" : g_dbus_method_invocation_get_sender(invocation);
     g_autoptr(GDBusConnection) listener_conn = NULL;
     g_autoptr(GError) err = NULL;
     g_autoptr(GSocket) socket = NULL;
@@ -591,7 +593,7 @@ dbus_audio_register_in_listener(AudioState *s,
 }
 
 static void
-dbus_audio_set_server(AudioState *s, GDBusObjectManagerServer *server)
+dbus_audio_set_server(AudioState *s, GDBusObjectManagerServer *server, bool p2p)
 {
     DBusAudio *da = s->drv_opaque;
 
@@ -599,6 +601,7 @@ dbus_audio_set_server(AudioState *s, GDBusObjectManagerServer *server)
     g_assert(!da->server);
 
     da->server = g_object_ref(server);
+    da->p2p = p2p;
 
     da->audio = g_dbus_object_skeleton_new(DBUS_DISPLAY1_AUDIO_PATH);
     da->iface = qemu_dbus_display1_audio_skeleton_new();
diff --git a/ui/dbus.c b/ui/dbus.c
index f2dcba03d0..f529928f0b 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -220,7 +220,7 @@ dbus_display_complete(UserCreatable *uc, Error **errp)
                        dd->audiodev);
             return;
         }
-        audio_state->drv->set_dbus_server(audio_state, dd->server);
+        audio_state->drv->set_dbus_server(audio_state, dd->server, dd->p2p);
     }
 
     consoles = g_array_new(FALSE, FALSE, sizeof(guint32));
-- 
2.39.2



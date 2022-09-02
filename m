Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C285AB157
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:23:45 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6e7-0003Qr-8p
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VK-0006Uh-4E
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VI-0001yt-F3
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662124475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QFjtBZt0DPnJQiiGJpxsGG8YEYGBM+M+39eZCCzJyU=;
 b=YRNT7dDb8+RSga5WJqB3llt5ngWjpOnquZHvQ1a9HdxzPDPVVW0mAeG6jX+eqsbDdjW9FM
 nzHg7Rwu9gbxq2CiWZ/wNc5J5hoYHhwXIOCMPPK3461PwkssR+hPBQBNdLLbO48j30lCwQ
 uEjOkd/jvhRnXhf0Glp0aYGZlnELJrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-rwMFiuyBMkui6QgKSRsZWQ-1; Fri, 02 Sep 2022 09:14:33 -0400
X-MC-Unique: rwMFiuyBMkui6QgKSRsZWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A5485A58B;
 Fri,  2 Sep 2022 13:14:33 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E5462026D4C;
 Fri,  2 Sep 2022 13:14:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 4/4] audio: exit(1) if audio backend failed to be found or
 initialized
Date: Fri,  2 Sep 2022 17:14:12 +0400
Message-Id: <20220902131412.3125752-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

If you specify a known backend but it isn't compiled in, or failed to
initialize, you get a simple warning and the "none" backend as a
fallback, and QEMU runs happily:

$ qemu-system-x86_64 -audiodev id=audio,driver=dsound
audio: Unknown audio driver `dsound'
audio: warning: Using timer based audio emulation
...

Instead, QEMU should fail to start:
$ qemu-system-x86_64 -audiodev id=audio,driver=dsound
audio: Unknown audio driver `dsound'
$

Resolves:
https://bugzilla.redhat.com/show_bug.cgi?id=1983493

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220822131021.975656-1-marcandre.lureau@redhat.com>
---
 audio/audio.h |  2 +-
 audio/audio.c | 14 +++++++++++---
 softmmu/vl.c  |  4 +++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index b5e17cd218..27e67079a0 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -170,7 +170,7 @@ void audio_sample_from_uint64(void *samples, int pos,
 
 void audio_define(Audiodev *audio);
 void audio_parse_option(const char *opt);
-void audio_init_audiodevs(void);
+bool audio_init_audiodevs(void);
 void audio_legacy_help(void);
 
 AudioState *audio_state_by_name(const char *name);
diff --git a/audio/audio.c b/audio/audio.c
index a02f3ce5c6..76b8735b44 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1743,7 +1743,6 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         atexit(audio_cleanup);
         atexit_registered = true;
     }
-    QTAILQ_INSERT_TAIL(&audio_states, s, list);
 
     s->ts = timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
 
@@ -1769,6 +1768,10 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         } else {
             dolog ("Unknown audio driver `%s'\n", drvname);
         }
+        if (!done) {
+            free_audio_state(s);
+            return NULL;
+        }
     } else {
         for (i = 0; audio_prio_list[i]; i++) {
             AudiodevListEntry *e = audiodev_find(&head, audio_prio_list[i]);
@@ -1806,6 +1809,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
                "(Audio can continue looping even after stopping the VM)\n");
     }
 
+    QTAILQ_INSERT_TAIL(&audio_states, s, list);
     QLIST_INIT (&s->card_head);
     vmstate_register (NULL, 0, &vmstate_audio, s);
     return s;
@@ -2119,13 +2123,17 @@ void audio_define(Audiodev *dev)
     QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
 }
 
-void audio_init_audiodevs(void)
+bool audio_init_audiodevs(void)
 {
     AudiodevListEntry *e;
 
     QSIMPLEQ_FOREACH(e, &audiodevs, next) {
-        audio_init(e->dev, NULL);
+        if (!audio_init(e->dev, NULL)) {
+            return false;
+        }
     }
+
+    return true;
 }
 
 audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 706bd7cff7..dea4005e47 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1885,7 +1885,9 @@ static void qemu_create_early_backends(void)
      * setting machine properties, so they can be referred to.
      */
     configure_blockdev(&bdo_queue, machine_class, snapshot);
-    audio_init_audiodevs();
+    if (!audio_init_audiodevs()) {
+        exit(1);
+    }
 }
 
 
-- 
2.37.2



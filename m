Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD496AB6AB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4iX-00043h-9F; Mon, 06 Mar 2023 01:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iG-0003cs-EO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iE-0000YZ-Ob
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qs85+lNX1CIt1d17yJJi1YhLfEiUe41EDq6IGo6LhSY=;
 b=JTTU+zcd1+myU7XevjFhh4bQVNyZLK/YI7+zlU+UbnPsR+O48J7FWZjpyMk2sD40ODZmY3
 cOXCSvpPtkpowF+fTIPLLeZIwSYsagtYBlg+ErnkvhIcC/2rS52kK6s0HPQ/3yJODhYSMx
 xlv3AltwmclniZdluSaggqa3Y/5tJCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-rLDtAhNLOL20WXgMjy0OVw-1; Mon, 06 Mar 2023 01:52:42 -0500
X-MC-Unique: rLDtAhNLOL20WXgMjy0OVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03570811E6E;
 Mon,  6 Mar 2023 06:52:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D07175AD;
 Mon,  6 Mar 2023 06:52:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 08/27] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Date: Mon,  6 Mar 2023 10:51:43 +0400
Message-Id: <20230306065202.2160066-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

From: Volker Rümelin <vr_qemu@t-online.de>

Use g_malloc0() as a direct replacement for audio_calloc().

Since the type of the parameter n_bytes of the function g_malloc0()
is unsigned, the type of the variables voice_size_out and
voice_size_in has been changed to size_t. This means that the
function argument no longer has to be checked for negative values.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230121094735.11644-7-vr_qemu@t-online.de>
---
 audio/audio_int.h      |  4 ++--
 audio/audio_template.h | 18 ++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 4632cdf9cc..ce2d6bf92c 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -151,8 +151,8 @@ struct audio_driver {
     int can_be_default;
     int max_voices_out;
     int max_voices_in;
-    int voice_size_out;
-    int voice_size_in;
+    size_t voice_size_out;
+    size_t voice_size_in;
     QLIST_ENTRY(audio_driver) next;
 };
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index dfa440f778..592866f14a 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -40,7 +40,7 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
                                               struct audio_driver *drv)
 {
     int max_voices = glue (drv->max_voices_, TYPE);
-    int voice_size = glue (drv->voice_size_, TYPE);
+    size_t voice_size = glue(drv->voice_size_, TYPE);
 
     if (glue (s->nb_hw_voices_, TYPE) > max_voices) {
         if (!max_voices) {
@@ -63,8 +63,8 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
     }
 
     if (audio_bug(__func__, voice_size && !max_voices)) {
-        dolog ("drv=`%s' voice_size=%d max_voices=0\n",
-               drv->name, voice_size);
+        dolog("drv=`%s' voice_size=%zu max_voices=0\n",
+              drv->name, voice_size);
     }
 }
 
@@ -273,13 +273,11 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
         return NULL;
     }
 
-    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
-    if (!hw) {
-        dolog ("Can not allocate voice `%s' size %d\n",
-               drv->name, glue (drv->voice_size_, TYPE));
-        return NULL;
-    }
-
+    /*
+     * Since glue(s->nb_hw_voices_, TYPE) is != 0, glue(drv->voice_size_, TYPE)
+     * is guaranteed to be != 0. See the audio_init_nb_voices_* functions.
+     */
+    hw = g_malloc0(glue(drv->voice_size_, TYPE));
     hw->s = s;
     hw->pcm_ops = drv->pcm_ops;
 
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69E6F9321
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 18:39:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvKvW-0000uh-5n; Sat, 06 May 2023 12:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvT-0000tx-Sx
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvS-000449-97
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683391105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe2s/uDqRflXhELDMB82guoOho7E/nfVEtQ5clZC4uE=;
 b=PRebTJWAW1ZjlzNm2qSy1AGUJx4DpAPnxy7N/IGkvqyinv5imi3v7GPXcfo9lwzhOPxAiO
 J4iWQobM+dX3hTjXqSqAGUMf4T9QYQiF7BxZajvsPVcHnVg6MiDula7HVU0JeQp6ihRbNR
 EHaxT8ixo+rpDJ6wvxDhfhmircwymZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-KRVOFcssNX2lc2UdYjVCww-1; Sat, 06 May 2023 12:38:22 -0400
X-MC-Unique: KRVOFcssNX2lc2UdYjVCww-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E184B185A79C;
 Sat,  6 May 2023 16:38:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2707492B00;
 Sat,  6 May 2023 16:38:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 dbassey@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/12] audio/pw: simplify error reporting in stream creation
Date: Sat,  6 May 2023 20:37:33 +0400
Message-Id: <20230506163735.3481387-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

create_stream() now reports on all error paths.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/pwaudio.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/audio/pwaudio.c b/audio/pwaudio.c
index 5c706a9fde..38905f5be2 100644
--- a/audio/pwaudio.c
+++ b/audio/pwaudio.c
@@ -486,8 +486,6 @@ static int
 qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
                const char *name, enum spa_direction dir)
 {
-    int r;
-
     switch (v->info.channels) {
     case 8:
         v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
@@ -540,13 +538,7 @@ qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
     }
 
     /* create a new unconnected pwstream */
-    r = create_stream(c, v, stream_name, name, dir);
-    if (r < 0) {
-        AUD_log(AUDIO_CAP, "Failed to create stream.");
-        return -1;
-    }
-
-    return r;
+    return create_stream(c, v, stream_name, name, dir);
 }
 
 static int
@@ -577,7 +569,6 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
     r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
                        ppdo->name, SPA_DIRECTION_OUTPUT);
     if (r < 0) {
-        error_report("qpw_stream_new for playback failed");
         pw_thread_loop_unlock(c->thread_loop);
         return -1;
     }
@@ -621,7 +612,6 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     r = qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id,
                        ppdo->name, SPA_DIRECTION_INPUT);
     if (r < 0) {
-        error_report("qpw_stream_new for recording failed");
         pw_thread_loop_unlock(c->thread_loop);
         return -1;
     }
-- 
2.40.1



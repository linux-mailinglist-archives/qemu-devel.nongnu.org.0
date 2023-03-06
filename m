Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536336AB6A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4ie-0004Tk-Rb; Mon, 06 Mar 2023 01:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iW-0004Ej-PA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iU-0000aA-Ce
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gh6cAGLogsZGQMOi8ZarRPa2XwTwEITG4QFnno4k2CM=;
 b=XTr/DEBwE8+yOhBQkJaMO+ViizefyFl5NgqGPDlxGnx79n01uBgUeRvOaU+w5eBBpoCrjD
 a9MZl/vA8mVQng1REFcFyOhJgIxMWJX+MyO2GpnaI6mAMD8uyK66HapQg/GV39ghNbtyc7
 2eEghyK08Dwb2yuadhyAa4X0jgHpUgo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-3_tCTucqPdKQlQDnN1Hb0w-1; Mon, 06 Mar 2023 01:52:58 -0500
X-MC-Unique: 3_tCTucqPdKQlQDnN1Hb0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06963C025B1;
 Mon,  6 Mar 2023 06:52:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2BCE2166B26;
 Mon,  6 Mar 2023 06:52:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 12/27] alsaaudio: reintroduce default recording settings
Date: Mon,  6 Mar 2023 10:51:47 +0400
Message-Id: <20230306065202.2160066-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
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

Audio recording with ALSA default settings currently doesn't
work. The debug log shows updates every 0.75s and 1.5s.

audio: Elapsed since last alsa run (running): 0.743030
audio: Elapsed since last alsa run (running): 1.486048
audio: Elapsed since last alsa run (running): 0.743008
audio: Elapsed since last alsa run (running): 1.485878
audio: Elapsed since last alsa run (running): 1.486040
audio: Elapsed since last alsa run (running): 1.485886

The time between updates should be in the 10ms range. Audio
recording with ALSA has the same timing contraints as playback.
Reintroduce the default recording settings and use the same
default settings for recording as for playback.

The term "reintroduce" is correct because commit a93f328177
("alsaaudio: port to -audiodev config") removed the default
settings for recording.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230121094735.11644-11-vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 0cc982e61f..057571dd1e 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -923,15 +923,13 @@ static void *alsa_audio_init(Audiodev *dev)
         dev->u.alsa.out->buffer_length = 92880;
     }
 
-    /*
-     * OptsVisitor sets unspecified optional fields to zero, but do not depend
-     * on it...
-     */
     if (!dev->u.alsa.in->has_period_length) {
-        dev->u.alsa.in->period_length = 0;
+        /* 256 frames assuming 44100Hz */
+        dev->u.alsa.in->period_length = 5805;
     }
     if (!dev->u.alsa.in->has_buffer_length) {
-        dev->u.alsa.in->buffer_length = 0;
+        /* 4096 frames assuming 44100Hz */
+        dev->u.alsa.in->buffer_length = 92880;
     }
 
     return dev;
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C775C6AB6A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4ic-0004Qp-N3; Mon, 06 Mar 2023 01:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iR-000403-HW
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iQ-0000Zv-13
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCL/WlePjR2JAgRav/VzbVd4RjkGQvCfc7x11pY5c+o=;
 b=g0w7Vj3CZxnZdtVdUUbxbNUSz75q3TmUJdk2xOiUdXU+4/6SlwWYFYOYqjrQ0c69FTABPB
 8P5fw7SggOT5gVGsJ1MSrM/aQc02svK6kAS8abw+LhBC7gioFT199rfOazwSIjBe0T2gXQ
 54+JKcrjb08g1qf+0csFM3WcS/FoQMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-uK-HJgAkPT-qzsOGjSArLQ-1; Mon, 06 Mar 2023 01:52:54 -0500
X-MC-Unique: uK-HJgAkPT-qzsOGjSArLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1413802D2A;
 Mon,  6 Mar 2023 06:52:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D019EC1602A;
 Mon,  6 Mar 2023 06:52:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 11/27] alsaaudio: change default playback settings
Date: Mon,  6 Mar 2023 10:51:46 +0400
Message-Id: <20230306065202.2160066-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

The currently used default playback settings in the ALSA audio
backend are a bit unfortunate. With a few emulated audio devices,
audio playback does not work properly. Here is a short part of
the debug log while audio is playing (elapsed time in seconds).

audio: Elapsed since last alsa run (running): 0.046244
audio: Elapsed since last alsa run (running): 0.023137
audio: Elapsed since last alsa run (running): 0.023170
audio: Elapsed since last alsa run (running): 0.023650
audio: Elapsed since last alsa run (running): 0.060802
audio: Elapsed since last alsa run (running): 0.031931

For some audio devices the time of more than 23ms between updates
is too long.

Set the period time to 5.8ms so that the maximum time between
two updates typically does not exceed 11ms. This roughly matches
the 10ms period time when doing playback with the audio timer.
After this patch the debug log looks like this.

audio: Elapsed since last alsa run (running): 0.011919
audio: Elapsed since last alsa run (running): 0.005788
audio: Elapsed since last alsa run (running): 0.005995
audio: Elapsed since last alsa run (running): 0.011069
audio: Elapsed since last alsa run (running): 0.005901
audio: Elapsed since last alsa run (running): 0.006084

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230121094735.11644-10-vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 5f50dfa0bf..0cc982e61f 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
     alsa_init_per_direction(aopts->in);
     alsa_init_per_direction(aopts->out);
 
-    /*
-     * need to define them, as otherwise alsa produces no sound
-     * doesn't set has_* so alsa_open can identify it wasn't set by the user
-     */
+    /* don't set has_* so alsa_open can identify it wasn't set by the user */
     if (!dev->u.alsa.out->has_period_length) {
-        /* 1024 frames assuming 44100Hz */
-        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
+        /* 256 frames assuming 44100Hz */
+        dev->u.alsa.out->period_length = 5805;
     }
     if (!dev->u.alsa.out->has_buffer_length) {
         /* 4096 frames assuming 44100Hz */
-        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
+        dev->u.alsa.out->buffer_length = 92880;
     }
 
     /*
-- 
2.39.2



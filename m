Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5E2F7D77
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:01:31 +0100 (CET)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PfP-0000gu-00
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3N-00075U-6t
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Je-Dk
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t79JUn/Rxh8U+UErYcQu+ddL2SReo82Gt9CWPZf2H0k=;
 b=GQm12liNY2mBD8F+fWYouYK/yyPbdk1AX2Xvp3xSniD1kIglv56G+GGwwvMwhxNUgoDpcQ
 muW9ClC/jU5HK4S6ZKGNqWUEVAz2an8ZP/0afK4VWlPxs8ZFUCnyG9N7O33WgCiHhE3D9m
 /hRDYJED6YF1efbmlOCIxWlcSJeW0Kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-dEJtPyorPFOQJckPuzwh8w-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: dEJtPyorPFOQJckPuzwh8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7BAF8030A8;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A136819C71;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B81221800D48; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] paaudio: avoid to clip samples multiple times
Date: Fri, 15 Jan 2021 14:21:29 +0100
Message-Id: <20210115132146.1443592-14-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

The pulseaudio backend currently converts, clips and copies audio
playback samples in the mixing-engine sample buffer multiple
times.

In qpa_get_buffer_out() the function pa_stream_begin_write()
returns a rather large buffer and this allows audio_pcm_hw_run_out()
in audio/audio.c to copy all samples in the mixing-engine buffer
to the pulse audio buffer. Immediately after copying, qpa_write()
notices with a call to pa_stream_writable_size() that pulse audio
only needs a smaller part of the copied samples and ignores the
rest. This copy and ignore process happens several times for each
audio sample.

To fix this behaviour, call pa_stream_writable_size() in
qpa_get_buffer_out() to limit the number of samples
audio_pcm_hw_run_out() will convert. With this change the
pulseaudio pcm_ops functions put_buffer_out and write are no
longer identical and a separate qpa_put_buffer_out is needed.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-13-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index b05208469831..229bcfcae838 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -207,6 +207,7 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     PAVoiceOut *p = (PAVoiceOut *) hw;
     PAConnection *c = p->g->conn;
     void *ret;
+    size_t l;
     int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
@@ -214,12 +215,19 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
 
+    l = pa_stream_writable_size(p->stream);
+    CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
+                       "pa_stream_writable_size failed\n");
+
     *size = -1;
     r = pa_stream_begin_write(p->stream, &ret, size);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
     pa_threaded_mainloop_unlock(c->mainloop);
+    if (*size > l) {
+        *size = l;
+    }
     return ret;
 
 unlock_and_fail:
@@ -228,6 +236,28 @@ unlock_and_fail:
     return NULL;
 }
 
+static size_t qpa_put_buffer_out(HWVoiceOut *hw, void *data, size_t length)
+{
+    PAVoiceOut *p = (PAVoiceOut *)hw;
+    PAConnection *c = p->g->conn;
+    int r;
+
+    pa_threaded_mainloop_lock(c->mainloop);
+
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
+
+    r = pa_stream_write(p->stream, data, length, NULL, 0LL, PA_SEEK_RELATIVE);
+    CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail, "pa_stream_write failed\n");
+
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return length;
+
+unlock_and_fail:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return 0;
+}
+
 static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
 {
     PAVoiceOut *p = (PAVoiceOut *) hw;
@@ -861,7 +891,7 @@ static struct audio_pcm_ops qpa_pcm_ops = {
     .fini_out = qpa_fini_out,
     .write    = qpa_write,
     .get_buffer_out = qpa_get_buffer_out,
-    .put_buffer_out = qpa_write, /* pa handles it */
+    .put_buffer_out = qpa_put_buffer_out,
     .volume_out = qpa_volume_out,
 
     .init_in  = qpa_init_in,
-- 
2.29.2



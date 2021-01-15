Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7E2F7CF4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:44:12 +0100 (CET)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0POd-00044s-6w
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3L-000722-Rk
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003J3-8T
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TApp/TW9A8Q/k+BT23bohUT6cwsF5KUnbdWpHkQojt8=;
 b=E+Bsi7pDqb9x7iAfc8nj3Yx/ue7xSrljRL06IqN7OLpDvglEqv5Oay2oa9BZs0m2/RhD4m
 v+tbzaa+r7pYeA+0XmFpxlEgxLsIR9KPv6IUj5wmkp1qRS5zb/kiAsEzu/eAxvo8hV6vzR
 f0ft/mrTqsWpBrBMwPjeP0i0ss2yzW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-PlAYcvxCPkOsOnoO6kIHiQ-1; Fri, 15 Jan 2021 08:21:55 -0500
X-MC-Unique: PlAYcvxCPkOsOnoO6kIHiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CE3A107ACF8;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 341006F818;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CCCE11800D4A; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] paaudio: wait until the playback stream is ready
Date: Fri, 15 Jan 2021 14:21:31 +0100
Message-Id: <20210115132146.1443592-16-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Don't call pa_stream_writable_size() in qpa_get_buffer_out()
before the playback stream is ready. This prevents a lot of the
following pulseaudio error messages.

pulseaudio: pa_stream_writable_size failed
pulseaudio: Reason: Bad state

To reproduce start qemu with
-parallel none -device gus,audiodev=audio0 -audiodev pa,id=audio0

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-15-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 1a7252b16d6d..4a1ffda753d5 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -214,6 +214,12 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
 
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
+    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
+        /* wait for stream to become ready */
+        l = 0;
+        ret = NULL;
+        goto unlock;
+    }
 
     l = pa_stream_writable_size(p->stream);
     CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
@@ -224,6 +230,7 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
+unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
     if (*size > l) {
         *size = l;
-- 
2.29.2



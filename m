Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DD2F7DC0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:08:28 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pm7-0007yh-Dl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3Y-0007DH-2w
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Jq-Uu
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qlwhf25t/fMbWfP7mPYJ4QN5+k3A61Ud3sPas/O3NY=;
 b=aWfnqQVJi4A/IV/laCnem9A7CxM4+zlg6rurjMKJDgHoiumR7sgXpglEZGF5PlCu/fYTgJ
 ka4B93VZauC8vkGdhrrqrLRsn8SDnjgToA2/fb+a4A7hG3N8eLyzWGj1DjVnuthmyVqFix
 C4hU2EtpK/vFIQhvWtQh6Edod6CPv60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564--qHi3oJWNG6SZ0Fnl2DCJw-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: -qHi3oJWNG6SZ0Fnl2DCJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F6FF806662;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41E11002C11;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C27751800D49; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] paaudio: wait for PA_STREAM_READY in qpa_write()
Date: Fri, 15 Jan 2021 14:21:30 +0100
Message-Id: <20210115132146.1443592-15-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Don't call pa_stream_writable_size() in qpa_write() before the
playback stream is ready. This prevents a lot of the following
pulseaudio error messages.

pulseaudio: pa_stream_writable_size failed
pulseaudio: Reason: Bad state

To reproduce start qemu with
-parallel none -device gus,audiodev=audio0
-audiodev pa,id=audio0,out.mixing-engine=off

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-14-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 229bcfcae838..1a7252b16d6d 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -269,6 +269,11 @@ static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
 
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
+    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
+        /* wait for stream to become ready */
+        l = 0;
+        goto unlock;
+    }
 
     l = pa_stream_writable_size(p->stream);
 
@@ -282,6 +287,7 @@ static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
     r = pa_stream_write(p->stream, data, l, NULL, 0LL, PA_SEEK_RELATIVE);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail, "pa_stream_write failed\n");
 
+unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
     return l;
 
-- 
2.29.2



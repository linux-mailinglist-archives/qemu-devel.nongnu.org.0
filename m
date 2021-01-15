Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9432F7D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:49:44 +0100 (CET)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PTz-0003FE-P8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3K-0006yv-DP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003JR-7S
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGGocoEQ3P6f9bdFcttulrNqEEZTGBL2HjrIcE7dPH4=;
 b=O4BTBOIDP6dfQVXDA5iP9MZ0+WpwcOuyUJBvphBRGUIFo63N3w+xeQze3O8RExOimDxzWX
 KGqSwoJR87mMplPT0zFUSzhUWZhJI6JhRMOkbBhs6im58TSJ2yd+1QnLvZS8jIsnXA/BTj
 nNo7bh+eYIUILpCTsrDsq5nzLJxg70U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-ddphLbU3ObeHQDrZMCpaMA-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: ddphLbU3ObeHQDrZMCpaMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BDD107ACF7;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7776371C5E;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55D90180063A; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] sdlaudio: always clear the sample buffer
Date: Fri, 15 Jan 2021 14:21:21 +0100
Message-Id: <20210115132146.1443592-6-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Always fill the remaining audio callback buffer with silence.
SDL 2.0 doesn't initialize the audio callback buffer. This was
an incompatible change compared to SDL 1.2. For reference read
the SDL 1.2 to 2.0 migration guide.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-5-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/sdlaudio.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 68126a99ab32..79eed23849ea 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -211,27 +211,26 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     SDLAudioState *s = &glob_sdl;
     HWVoiceOut *hw = &sdl->hw;
 
-    if (s->exit) {
-        return;
-    }
+    if (!s->exit) {
 
-    /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
+        /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
 
-    while (hw->pending_emul && len) {
-        size_t write_len;
-        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
-        if (start < 0) {
-            start += hw->size_emul;
+        while (hw->pending_emul && len) {
+            size_t write_len;
+            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
+            if (start < 0) {
+                start += hw->size_emul;
+            }
+            assert(start >= 0 && start < hw->size_emul);
+
+            write_len = MIN(MIN(hw->pending_emul, len),
+                            hw->size_emul - start);
+
+            memcpy(buf, hw->buf_emul + start, write_len);
+            hw->pending_emul -= write_len;
+            len -= write_len;
+            buf += write_len;
         }
-        assert(start >= 0 && start < hw->size_emul);
-
-        write_len = MIN(MIN(hw->pending_emul, len),
-                        hw->size_emul - start);
-
-        memcpy(buf, hw->buf_emul + start, write_len);
-        hw->pending_emul -= write_len;
-        len -= write_len;
-        buf += write_len;
     }
 
     /* clear remaining buffer that we couldn't fill with data */
-- 
2.29.2



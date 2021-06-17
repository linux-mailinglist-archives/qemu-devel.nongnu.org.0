Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1C3AB47D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:18:43 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrus-0002ey-31
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKp-0008Bq-D6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKn-0007q5-4P
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cBXEaIt5mV0S2+VnWb9d7DedmXDz+kHUz9YXP8rRI4=;
 b=IbFuglP4S84F3NJLcTIb5GOzVnL4ViizemGK2moyyNUhjJrNw6EozWJIY8iWDjvuFL+ry+
 e+lITFWkprVrAe8B0Zzs4euptYvp7XJ6hAQ/8jp/SgGqK2F6cr0dAZgPSck+ZRQ2mDKCSk
 +IYbKREFOLnCI/xY2gjXGeaKA4TOTi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-LQAg1g4UMimOzQSUaK_jHw-1; Thu, 17 Jun 2021 08:41:22 -0400
X-MC-Unique: LQAg1g4UMimOzQSUaK_jHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEFE1800C60;
 Thu, 17 Jun 2021 12:41:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CDD610B0;
 Thu, 17 Jun 2021 12:41:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B534B1800D7B; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] alsaaudio: remove #ifdef DEBUG to avoid bit rot
Date: Thu, 17 Jun 2021 14:41:01 +0200
Message-Id: <20210617124107.2386073-2-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Merge the #ifdef DEBUG code with the if statement a few lines
above to avoid bit rot.

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210517194604.2545-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/alsaaudio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index fcc2f62864fb..2b9789e64771 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -34,6 +34,8 @@
 #define AUDIO_CAP "alsa"
 #include "audio_int.h"
 
+#define DEBUG_ALSA 0
+
 struct pollhlp {
     snd_pcm_t *handle;
     struct pollfd *pfds;
@@ -587,16 +589,12 @@ static int alsa_open(bool in, struct alsa_params_req *req,
 
     *handlep = handle;
 
-    if (obtfmt != req->fmt ||
-         obt->nchannels != req->nchannels ||
-         obt->freq != req->freq) {
+    if (DEBUG_ALSA || obtfmt != req->fmt ||
+        obt->nchannels != req->nchannels || obt->freq != req->freq) {
         dolog ("Audio parameters for %s\n", typ);
         alsa_dump_info(req, obt, obtfmt, apdo);
     }
 
-#ifdef DEBUG
-    alsa_dump_info(req, obt, obtfmt, apdo);
-#endif
     return 0;
 
  err:
-- 
2.31.1



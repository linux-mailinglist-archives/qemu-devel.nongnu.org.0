Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757C6AB6AF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4in-0005FQ-Ey; Mon, 06 Mar 2023 01:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4il-00057C-25
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4ij-0000cs-Iz
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQ9+mo9N6X1dx7pB9GOrfGo4mTgvCi6rRd/ddPf4sk8=;
 b=f0vwBkZP96swREZ6KaUzQHXkMcUn7muu1VpAT326LAI2ldedBjr84rczxIFpzoQhI404Oq
 T0OylF9flm7ffXWIMRPl74VPKMuje/rypCI0epY+hv+gzOWuWAaoirPo1cMaleZ7x42kOy
 XT0qIihgppGHzViPC0h5f+IoH8+zMNs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-l5lh--aBPlKbJgv0fEymUw-1; Mon, 06 Mar 2023 01:53:12 -0500
X-MC-Unique: l5lh--aBPlKbJgv0fEymUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A9A4803513;
 Mon,  6 Mar 2023 06:53:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7416F40C10FA;
 Mon,  6 Mar 2023 06:53:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 15/27] audio: make the resampling code greedy
Date: Mon,  6 Mar 2023 10:51:50 +0400
Message-Id: <20230306065202.2160066-16-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Read the maximum possible number of audio frames instead of the
minimum necessary number of frames when the audio stream is
downsampled and the output buffer is limited. This makes the
function symmetrical to upsampling when the input buffer is
limited. The maximum possible number of frames is written here.

With this change it's easier to calculate the exact number of
audio frames the resample function will read or write. These two
functions will be introduced later.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-3-vr_qemu@t-online.de>
---
 audio/rate_template.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/audio/rate_template.h b/audio/rate_template.h
index b432719ebb..6648f0d2e5 100644
--- a/audio/rate_template.h
+++ b/audio/rate_template.h
@@ -40,8 +40,6 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
     int64_t t;
 #endif
 
-    ilast = rate->ilast;
-
     istart = ibuf;
     iend = ibuf + *isamp;
 
@@ -59,15 +57,17 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
         return;
     }
 
-    while (obuf < oend) {
+    /* without input samples, there's nothing to do */
+    if (ibuf >= iend) {
+        *osamp = 0;
+        return;
+    }
 
-        /* Safety catch to make sure we have input samples.  */
-        if (ibuf >= iend) {
-            break;
-        }
+    ilast = rate->ilast;
 
-        /* read as many input samples so that ipos > opos */
+    while (true) {
 
+        /* read as many input samples so that ipos > opos */
         while (rate->ipos <= (rate->opos >> 32)) {
             ilast = *ibuf++;
             rate->ipos++;
@@ -78,6 +78,11 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
             }
         }
 
+        /* make sure that the next output sample can be written */
+        if (obuf >= oend) {
+            break;
+        }
+
         icur = *ibuf;
 
         /* wrap ipos and opos around long before they overflow */
-- 
2.39.2



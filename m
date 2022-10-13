Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C645FD5D3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:00:21 +0200 (CEST)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oit8e-0006kP-Kn
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois64-0005V6-PT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois63-0006tH-5K
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFY53AzsJRcBKruII2zUrxQtmZw/doxyqTmRmsjsMuo=;
 b=AyMCRtoAhn1tuB8IHUtQYqGJQQFKZx849hkfVaR5Oa+znwGLCwTK0zPGNnUdmhocCCSOhC
 iRcaeHIJEAlZvItIMcCounn9bAAAwj5+5k0DiZL+UPCYwLNpZNIRiqilPcrdg1uOzt2WkU
 0/VgyZppOP6QBJAI8baC7l1CkuE/hR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-379P_Xt5ObuQKdTq1rHIig-1; Thu, 13 Oct 2022 02:53:31 -0400
X-MC-Unique: 379P_Xt5ObuQKdTq1rHIig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A236986EB4B;
 Thu, 13 Oct 2022 06:53:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7241B2166BDB;
 Thu, 13 Oct 2022 06:53:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D5AD18009C1; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 12/26] audio: prevent an integer overflow in resampling code
Date: Thu, 13 Oct 2022 08:52:10 +0200
Message-Id: <20221013065224.1864145-13-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

There are corner cases where rate->opos can overflow. For
example, if QEMU is started with -audiodev pa,id=audio0,
out.frequency=11025 -device ich9-intel-hda -device hda-duplex,
audiodev=audio0 and the guest plays audio with a sampling
frequency of 44100Hz, rate->opos will overflow after 27.05h
and the audio stream will be silent for a long time.

To prevent a rate->opos and also a rate->ipos overflow, both
are wrapped around after a short time. The wrap around point
rate->ipos >= 0x10001 is an arbitrarily selected value and can
be any small value, 0 and 1 included.

The comment that an ipos overflow will result in an infinite
loop has been removed, because in this case the resampling code
only generates no more output samples and the audio stream stalls.
However, there is no infinite loop.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220923183640.8314-12-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/rate_template.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/audio/rate_template.h b/audio/rate_template.h
index f94c940c61b1..b432719ebbaa 100644
--- a/audio/rate_template.h
+++ b/audio/rate_template.h
@@ -72,11 +72,6 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
             ilast = *ibuf++;
             rate->ipos++;
 
-            /* if ipos overflow, there is  a infinite loop */
-            if (rate->ipos == 0xffffffff) {
-                rate->ipos = 1;
-                rate->opos = rate->opos & 0xffffffff;
-            }
             /* See if we finished the input buffer yet */
             if (ibuf >= iend) {
                 goto the_end;
@@ -85,6 +80,12 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
 
         icur = *ibuf;
 
+        /* wrap ipos and opos around long before they overflow */
+        if (rate->ipos >= 0x10001) {
+            rate->ipos = 1;
+            rate->opos &= 0xffffffff;
+        }
+
         /* interpolate */
 #ifdef FLOAT_MIXENG
 #ifdef RECIPROCAL
-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2885EA12C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:46:32 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocld9-0001va-73
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpu-0005ey-KK
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockps-0003om-OV
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdNGq6hWlpuhjkU34UysDLKoPOaBocYG/ganxIELqNM=;
 b=Sf/EmJV3D1ZczFdkENQ34gjXsTsOf5jN4QetzoSXEMyaty/hCzvQpGEvf3cZFpA+8yYbuK
 vkpVdSvCYOVDCu2/79DX+AUU1JAHJVF50HerTQOau/CC+sY5SBT8Eg6RR0Y8fzQmQZRFaS
 0lyzghCdfoKTq1PldcEIM8UG0N/wobo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-lq0ZusRZMRSkNkvC7HyfMQ-1; Mon, 26 Sep 2022 05:55:32 -0400
X-MC-Unique: lq0ZusRZMRSkNkvC7HyfMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7017F80029D;
 Mon, 26 Sep 2022 09:55:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26686492B04;
 Mon, 26 Sep 2022 09:55:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B3F9180A405; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 23/25] audio: remove abort() in audio_bug()
Date: Mon, 26 Sep 2022 11:55:07 +0200
Message-Id: <20220926095509.3759409-24-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Commit ab32b78cd1 "audio: Simplify audio_bug() removing old code"
introduced abort() in audio_bug() for regular builds.

audio_bug() was never meant to abort QEMU for the following
reasons.

  - There's code in audio_bug() that expects audio_bug() gets
    called more than once with error condition true. The variable
    'shown' is only 0 on first error.

  - All call sites test the return code of audio_bug(), print
    an error context message and handle the errror.

  - The abort() in audio_bug() enables a class of guest-triggered
    aborts similar to the Launchpad Bug #1910603 at
    https://bugs.launchpad.net/bugs/1910603.

Fixes: ab32b78cd1 "audio: Simplify audio_bug() removing old code"
Buglink: https://bugs.launchpad.net/bugs/1910603
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220917131626.7521-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index d96a13055940..df6818ed5598 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -118,7 +118,6 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-        abort();
     }
 
     return cond;
-- 
2.37.3



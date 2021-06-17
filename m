Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00B3AB489
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:20:50 +0200 (CEST)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrwv-00008o-Tg
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrL1-0000VU-60
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKz-0007ts-HE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLeWiMuKzRo+ge2zkxXdPM72eO+GkkXG3FVYYNgCrE4=;
 b=Ibayga+ijSSVJo1yZ3FzgyZE9cb37Gy4IO3yUYC4E+20/9wNasgY2sMyGajsA0dZ3u0Ryi
 h6oUBAGlpNJQg2I1/3RN72nzVqGR4PyQ5+s6SiKsWS7t2Wqi+yfOx/v4y6G9oRjQ401lEs
 i3jekrEyYt+ZGlnsUgMZNRgzIyfynVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-7ioJmNfJOr65nVHzGLdk_Q-1; Thu, 17 Jun 2021 08:41:35 -0400
X-MC-Unique: 7ioJmNfJOr65nVHzGLdk_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 718AB9F92B;
 Thu, 17 Jun 2021 12:41:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 784AA5D9C6;
 Thu, 17 Jun 2021 12:41:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D968A18017CB; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] jackaudio: avoid that the client name contains the word
 (NULL)
Date: Thu, 17 Jun 2021 14:41:04 +0200
Message-Id: <20210617124107.2386073-5-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

Currently with jackaudio client name and qemu guest name unset,
the JACK client names are out-(NULL) and in-(NULL). These names
are user visible in the patch bay. Replace the function call to
qemu_get_vm_name() with a call to audio_application_name() which
replaces NULL with "qemu" to have more descriptive names.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210517194604.2545-4-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/jackaudio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3031c4e29bd4..e7de6d5433e9 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -26,7 +26,6 @@
 #include "qemu/module.h"
 #include "qemu/atomic.h"
 #include "qemu/main-loop.h"
-#include "qemu-common.h"
 #include "audio.h"
 
 #define AUDIO_CAP "jack"
@@ -412,7 +411,7 @@ static int qjack_client_init(QJackClient *c)
 
     snprintf(client_name, sizeof(client_name), "%s-%s",
         c->out ? "out" : "in",
-        c->opt->client_name ? c->opt->client_name : qemu_get_vm_name());
+        c->opt->client_name ? c->opt->client_name : audio_application_name());
 
     if (c->opt->exact_name) {
         options |= JackUseExactName;
-- 
2.31.1



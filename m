Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52962009DC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 15:22:22 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmGyL-0007mC-RI
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 09:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jmGu3-0001w9-2e
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:17:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59611
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jmGu1-000384-ED
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592572672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=N1c9BQx11x41ffPvg5cZuk3HbuS5fDo5PBxVW02RQIo=;
 b=bSMX5oT+VxUkpi0bZERGxKK5RLpudW/h8ZPAyEsqUTs6VAUHnW4mdvBF2DZiKf1zvMjoXv
 NXmq74UyNENpZKKaVlZ4Fnux62HYrbIuhsldCgqtbMCke8BLYehdq0j4habqZL1qfwrgt0
 s2C8wiFakgh/Be5w7P95RRn2KMo27EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-cPFrpP6ZPpWJWg3_mi2n7A-1; Fri, 19 Jun 2020 09:17:50 -0400
X-MC-Unique: cPFrpP6ZPpWJWg3_mi2n7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6418D107ACCA;
 Fri, 19 Jun 2020 13:17:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD5FF5BAC7;
 Fri, 19 Jun 2020 13:17:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 698471750C; Fri, 19 Jun 2020 15:17:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] audio/jack: fix invalid minimum buffer size check
Date: Fri, 19 Jun 2020 15:17:35 +0200
Message-Id: <20200619131741.10857-2-kraxel@redhat.com>
In-Reply-To: <20200619131741.10857-1-kraxel@redhat.com>
References: <20200619131741.10857-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 05:19:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Geoffrey McRae <geoff@hostfission.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Geoffrey McRae <geoff@hostfission.com>

JACK does not provide us with the configured buffer size until after
activiation which was overriding this minimum value. JACK itself doesn't
have this minimum limitation, but the QEMU virtual hardware and as such
it must be enforced, failure to do so results in audio discontinuities.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
Message-id: 20200613040518.38172-2-geoff@hostfission.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/jackaudio.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 722ddb1dfe43..d0b6f748f26c 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -434,17 +434,6 @@ static int qjack_client_init(QJackClient *c)
     jack_set_xrun_callback(c->client, qjack_xrun, c);
     jack_on_shutdown(c->client, qjack_shutdown, c);
 
-    /*
-     * ensure the buffersize is no smaller then 512 samples, some (all?) qemu
-     * virtual devices do not work correctly otherwise
-     */
-    if (c->buffersize < 512) {
-        c->buffersize = 512;
-    }
-
-    /* create a 2 period buffer */
-    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
-
     /* allocate and register the ports */
     c->port = g_malloc(sizeof(jack_port_t *) * c->nchannels);
     for (int i = 0; i < c->nchannels; ++i) {
@@ -468,6 +457,17 @@ static int qjack_client_init(QJackClient *c)
     jack_activate(c->client);
     c->buffersize = jack_get_buffer_size(c->client);
 
+    /*
+     * ensure the buffersize is no smaller then 512 samples, some (all?) qemu
+     * virtual devices do not work correctly otherwise
+     */
+    if (c->buffersize < 512) {
+        c->buffersize = 512;
+    }
+
+    /* create a 2 period buffer */
+    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
+
     qjack_client_connect_ports(c);
     c->state = QJACK_STATE_RUNNING;
     return 0;
-- 
2.18.4



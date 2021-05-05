Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E335D3738A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:39:51 +0200 (CEST)
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEwZ-00030D-0a
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEv0-0001Dp-6k
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEux-0007hq-TZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RQlaoH3uqa9HBuyEfpQHmFY6ilplTIyJVDnXQ10u/A=;
 b=h7rI3rQXcjrOlrkxorr4SW/KRjTA+uuoB5178naEcGDekvHKUA2sMqMmYh+Sx7c2MvAXOt
 Uc1+r8gG2rLLG7+oZ+nFbpNHm7vnSDkXUHTNvrSPfI0lcBuLQbPMU9KlOykETeS9V7WzgV
 BKYiBzoIkzrtTXy2v+a6at8pYb9kzGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-pXIbI1tPPYKjv0CgarAimA-1; Wed, 05 May 2021 06:38:06 -0400
X-MC-Unique: pXIbI1tPPYKjv0CgarAimA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5298801ADA;
 Wed,  5 May 2021 10:38:04 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C48A5885D;
 Wed,  5 May 2021 10:37:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] io: use GDateTime for formatting timestamp for websock
 headers
Date: Wed,  5 May 2021 11:37:00 +0100
Message-Id: <20210505103702.521457-6-berrange@redhat.com>
In-Reply-To: <20210505103702.521457-1-berrange@redhat.com>
References: <20210505103702.521457-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-websock.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index 03c1f7cb62..70889bb54d 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -177,15 +177,9 @@ qio_channel_websock_handshake_send_res(QIOChannelWebsock *ioc,
 
 static gchar *qio_channel_websock_date_str(void)
 {
-    struct tm tm;
-    time_t now = time(NULL);
-    char datebuf[128];
+    g_autoptr(GDateTime) now = g_date_time_new_now_utc();
 
-    gmtime_r(&now, &tm);
-
-    strftime(datebuf, sizeof(datebuf), "%a, %d %b %Y %H:%M:%S GMT", &tm);
-
-    return g_strdup(datebuf);
+    return g_date_time_format(now, "%a, %d %b %Y %H:%M:%S GMT");
 }
 
 static void qio_channel_websock_handshake_send_res_err(QIOChannelWebsock *ioc,
-- 
2.31.1



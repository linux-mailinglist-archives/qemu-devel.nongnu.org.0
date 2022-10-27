Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660360FF5F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:34:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jF-0004fc-9C; Thu, 27 Oct 2022 13:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jB-0004Fr-FL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6j9-0000u5-Sx
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HT28IacGPyaph4KCx+4XKBS+Ey4r3kszG5aBhg/WB0=;
 b=PNAkXjOTbJjbo/1Whif/UTLc5sM2AjGR5V1mAyc76+bzaamTy7oQ/H2KudWG5vbi/zdHX2
 lBayLnvTcIn9hFp2d5wthHYHTG03+c6pDLxG0DfnsJ6k3KbFNW3lz4mP8/HFZsSECFDgab
 xl1F6uwSWoau/FaWLz2QII6u5ZW11Qk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-1d128bIBOkqb8IzZ0we3JQ-1; Thu, 27 Oct 2022 13:31:26 -0400
X-MC-Unique: 1d128bIBOkqb8IzZ0we3JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5562F1C14365;
 Thu, 27 Oct 2022 17:31:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC6B40C6EC3;
 Thu, 27 Oct 2022 17:31:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PULL 05/20] io/channel-watch: Fix socket watch on Windows
Date: Thu, 27 Oct 2022 18:30:48 +0100
Message-Id: <20221027173103.299479-6-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Random failure was observed when running qtests on Windows due to
"Broken pipe" detected by qmp_fd_receive(). What happened is that
the qtest executable sends testing data over a socket to the QEMU
under test but no response is received. The errno of the recv()
call from the qtest executable indicates ETIMEOUT, due to the qmp
chardev's tcp_chr_read() is never called to receive testing data
hence no response is sent to the other side.

tcp_chr_read() is registered as the callback of the socket watch
GSource. The reason of the callback not being called by glib, is
that the source check fails to indicate the source is ready. There
are two socket watch sources created to monitor the same socket
event object from the char-socket backend in update_ioc_handlers().
During the source check phase, qio_channel_socket_source_check()
calls WSAEnumNetworkEvents() to discover occurrences of network
events for the indicated socket, clear internal network event records,
and reset the event object. Testing shows that if we don't reset the
event object by not passing the event handle to WSAEnumNetworkEvents()
the symptom goes away and qtest runs very stably.

It seems we don't need to call WSAEnumNetworkEvents() at all, as we
don't parse the result of WSANETWORKEVENTS returned from this API.
We use select() to poll the socket status. Fix this instability by
dropping the WSAEnumNetworkEvents() call.

Some side notes:

During the testing, I removed the following codes in update_ioc_handlers():

  remove_hup_source(s);
  s->hup_source = qio_channel_create_watch(s->ioc, G_IO_HUP);
  g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
                        chr, NULL);
  g_source_attach(s->hup_source, chr->gcontext);

and such change also makes the symptom go away.

And if I moved the above codes to the beginning, before the call to
io_add_watch_poll(), the symptom also goes away.

It seems two sources watching on the same socket event object is
the key that leads to the instability. The order of adding a source
watch seems to also play a role but I can't explain why.
Hopefully a Windows and glib expert could explain this behavior.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-watch.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 43d38494f7..ad7c568a84 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -115,17 +115,13 @@ static gboolean
 qio_channel_socket_source_check(GSource *source)
 {
     static struct timeval tv0;
-
     QIOChannelSocketSource *ssource = (QIOChannelSocketSource *)source;
-    WSANETWORKEVENTS ev;
     fd_set rfds, wfds, xfds;
 
     if (!ssource->condition) {
         return 0;
     }
 
-    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
-
     FD_ZERO(&rfds);
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
-- 
2.37.3



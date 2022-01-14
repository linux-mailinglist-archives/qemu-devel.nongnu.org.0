Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F374E48E4A3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:59:41 +0100 (CET)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GYm-0002Hm-UL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GU4-0007QU-Ir
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GU2-0007S7-PG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Db+BJOh3MbAU72S5OQF2ZzZigyfWJ2jLBjbHHCuvX+0=;
 b=O+Cq8oAiidqhZmwZ6o1dblwbTec0/us7nvPJKinO4Ar6qPXpAJv1YXxd2xkjUyI1IIPMg8
 wqp/TpYqiW0CIez0/6MtgRjiTNWi41SZ0wBbN8dlPJhR7drXfmScUlFvNIQLhbOCzj63zD
 aQkkkhLpCpvFICTqh/bv3TSiGl5D1F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-kB931KBlO_eXHf0FbX2dOw-1; Fri, 14 Jan 2022 01:54:41 -0500
X-MC-Unique: kB931KBlO_eXHf0FbX2dOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7328E1006AA6;
 Fri, 14 Jan 2022 06:54:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7141F78DA1;
 Fri, 14 Jan 2022 06:54:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8160C1800634; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] ui/vnc.c: Fixed a deadlock bug.
Date: Fri, 14 Jan 2022 07:53:09 +0100
Message-Id: <20220114065326.782420-4-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Rao Lei <lei.rao@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao Lei <lei.rao@intel.com>

The GDB statck is as follows:
(gdb) bt
0  __lll_lock_wait (futex=futex@entry=0x56211df20360, private=0) at lowlevellock.c:52
1  0x00007f263caf20a3 in __GI___pthread_mutex_lock (mutex=0x56211df20360) at ../nptl/pthread_mutex_lock.c:80
2  0x000056211a757364 in qemu_mutex_lock_impl (mutex=0x56211df20360, file=0x56211a804857 "../ui/vnc-jobs.h", line=60)
    at ../util/qemu-thread-posix.c:80
3  0x000056211a0ef8c7 in vnc_lock_output (vs=0x56211df14200) at ../ui/vnc-jobs.h:60
4  0x000056211a0efcb7 in vnc_clipboard_send (vs=0x56211df14200, count=1, dwords=0x7ffdf1701338) at ../ui/vnc-clipboard.c:138
5  0x000056211a0f0129 in vnc_clipboard_notify (notifier=0x56211df244c8, data=0x56211dd1bbf0) at ../ui/vnc-clipboard.c:209
6  0x000056211a75dde8 in notifier_list_notify (list=0x56211afa17d0 <clipboard_notifiers>, data=0x56211dd1bbf0) at ../util/notify.c:39
7  0x000056211a0bf0e6 in qemu_clipboard_update (info=0x56211dd1bbf0) at ../ui/clipboard.c:50
8  0x000056211a0bf05d in qemu_clipboard_peer_release (peer=0x56211df244c0, selection=QEMU_CLIPBOARD_SELECTION_CLIPBOARD)
    at ../ui/clipboard.c:41
9  0x000056211a0bef9b in qemu_clipboard_peer_unregister (peer=0x56211df244c0) at ../ui/clipboard.c:19
10 0x000056211a0d45f3 in vnc_disconnect_finish (vs=0x56211df14200) at ../ui/vnc.c:1358
11 0x000056211a0d4c9d in vnc_client_read (vs=0x56211df14200) at ../ui/vnc.c:1611
12 0x000056211a0d4df8 in vnc_client_io (ioc=0x56211ce70690, condition=G_IO_IN, opaque=0x56211df14200) at ../ui/vnc.c:1649
13 0x000056211a5b976c in qio_channel_fd_source_dispatch
    (source=0x56211ce50a00, callback=0x56211a0d4d71 <vnc_client_io>, user_data=0x56211df14200) at ../io/channel-watch.c:84
14 0x00007f263ccede8e in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
15 0x000056211a77d4a1 in glib_pollfds_poll () at ../util/main-loop.c:232
16 0x000056211a77d51f in os_host_main_loop_wait (timeout=958545) at ../util/main-loop.c:255
17 0x000056211a77d630 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
18 0x000056211a45bc8e in qemu_main_loop () at ../softmmu/runstate.c:726
19 0x000056211a0b45fa in main (argc=69, argv=0x7ffdf1701778, envp=0x7ffdf17019a8) at ../softmmu/main.c:50

From the call trace, we can see it is a deadlock bug.
vnc_disconnect_finish will acquire the output_mutex.
But, the output_mutex will be acquired again in vnc_clipboard_send.
Repeated locking will cause deadlock. So, I move
qemu_clipboard_peer_unregister() behind vnc_unlock_output();

Fixes: 0bf41cab93e ("ui/vnc: clipboard support")
Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220105020808.597325-1-lei.rao@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 1ed1c7efc688..3ccd33dedcc8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
         /* last client gone */
         vnc_update_server_surface(vs->vd);
     }
+    vnc_unlock_output(vs);
+
     if (vs->cbpeer.notifier.notify) {
         qemu_clipboard_peer_unregister(&vs->cbpeer);
     }
 
-    vnc_unlock_output(vs);
-
     qemu_mutex_destroy(&vs->output_mutex);
     if (vs->bh != NULL) {
         qemu_bh_delete(vs->bh);
-- 
2.34.1



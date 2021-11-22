Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D7458EB8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:51:56 +0100 (CET)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8nc-0006CM-27
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:51:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8dt-0005Fd-H0
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8do-0000L2-6h
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjyM9d3ICthhyQ18EMW1+ECIfBi14fRqaK3MJfXRw+I=;
 b=QjrkSvKJXZz9rk84VJCN/XKYUenKRGye4lbLjCznoxVGWLMTftJTOxPtR+JFyNVVUBrMbF
 k/tV7iBUxNysTr4Y7nur9gSyqfpLQ8vXsqnlR5zlQLWN8szwP6qtRpWHG1w2aSahT4/ghe
 UUJ5Lqmt+LBD2nI6UmAW1PGBbFsRUO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-Rmm8HZSVNkeETAl0t32Bng-1; Mon, 22 Nov 2021 07:41:42 -0500
X-MC-Unique: Rmm8HZSVNkeETAl0t32Bng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 978601DDF2;
 Mon, 22 Nov 2021 12:41:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEA160862;
 Mon, 22 Nov 2021 12:41:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7279D1800928; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] ui/vnc-clipboard: fix adding notifier twice
Date: Mon, 22 Nov 2021 13:40:11 +0100
Message-Id: <20211122124015.909318-5-kraxel@redhat.com>
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
References: <20211122124015.909318-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

vnc_server_cut_text_caps() is not guaranteed to be called only once.

If it called twice, we finally call notifier_list_add() twice with same
element. Which leads to loopback QLIST. So, on next
notifier_list_notify() we'll loop forever and QEMU stuck.

So, let's only register new notifier if it's not yet registered.

Note, that similar check is used in vdagent_chr_recv_caps() (before
call qemu_clipboard_peer_register()), and also before
qemu_clipboard_peer_unregister() call in vdagent_disconnect() and in
vnc_disconnect_finish().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211110103800.2266729-1-vsementsov@virtuozzo.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc-clipboard.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
index 9f077965d056..67284b556cd8 100644
--- a/ui/vnc-clipboard.c
+++ b/ui/vnc-clipboard.c
@@ -316,8 +316,10 @@ void vnc_server_cut_text_caps(VncState *vs)
     caps[1] = 0;
     vnc_clipboard_send(vs, 2, caps);
 
-    vs->cbpeer.name = "vnc";
-    vs->cbpeer.update.notify = vnc_clipboard_notify;
-    vs->cbpeer.request = vnc_clipboard_request;
-    qemu_clipboard_peer_register(&vs->cbpeer);
+    if (!vs->cbpeer.update.notify) {
+        vs->cbpeer.name = "vnc";
+        vs->cbpeer.update.notify = vnc_clipboard_notify;
+        vs->cbpeer.request = vnc_clipboard_request;
+        qemu_clipboard_peer_register(&vs->cbpeer);
+    }
 }
-- 
2.33.1



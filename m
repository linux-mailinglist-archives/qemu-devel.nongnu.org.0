Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D15E9EF6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:17:27 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclB0-0000vL-Fr
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpq-0005Sv-Si
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpo-0003nF-3G
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5PZAgDZ0Zk8jlRJBwRHM6yfmEwxC0P3PBdvK/bzC34=;
 b=SuRD+Agckaq6Llna6RQZpOoFUNnJVtiW3ikpkyJq+8rbOWVdnqaHoV25b6Cv/KxcL4tcoX
 7JKq5adTaQOy+qb12yQrVPDlYNfB512ec3Ed8QNyRaIzlk+bDaUn3PO5bfZIheoXOcAL1P
 Vdb1ReiUpbMqPjmlrP7twB9ExyqCVeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-0wiUAdGiNIKKDHc1EdkYZQ-1; Mon, 26 Sep 2022 05:55:20 -0400
X-MC-Unique: 0wiUAdGiNIKKDHc1EdkYZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82767185A7A4;
 Mon, 26 Sep 2022 09:55:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E7B40C2064;
 Mon, 26 Sep 2022 09:55:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 742D018030B1; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/25] ui/vdagent: fix serial reset of guest agent
Date: Mon, 26 Sep 2022 11:54:53 +0200
Message-Id: <20220926095509.3759409-10-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

In order to reset the guest agent, we send CLOSED & OPENED events.

They are correctly received by the guest kernel. However, they might not
be noticed by the guest agent process, as the IO task (poll() for
example) might be wake up after both CLOSED & OPENED have been
processed.

Wait until the guest agent is disconnected to re-open our side.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220912102455.111765-6-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 819e0dc1435b..4bf50f0c4d88 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -471,7 +471,7 @@ static void vdagent_clipboard_reset_serial(VDAgentChardev *vd)
 
     /* reopen the agent connection to reset the serial state */
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
-    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
+    /* OPENED again after the guest disconnected, see set_fe_open */
 }
 
 static void vdagent_clipboard_notify(Notifier *notifier, void *data)
@@ -875,6 +875,9 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     if (!fe_open) {
         trace_vdagent_close();
+        /* To reset_serial, we CLOSED our side. Make sure the other end knows we
+         * are ready again. */
+        qemu_chr_be_event(chr, CHR_EVENT_OPENED);
         return;
     }
 
-- 
2.37.3



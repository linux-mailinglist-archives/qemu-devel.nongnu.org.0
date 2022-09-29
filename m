Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED495EF484
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:42:43 +0200 (CEST)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrw9-00043U-Ix
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMK-0001F7-Q7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrMJ-0001yf-AJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VUhs4rAc5DdkL/r1kEvE47gIjm+3f12pZ7vfN+8Q1c=;
 b=jI/s6CZKj7aQGbr4KFTSvnoGmWoVBbNEXdxUiWo0Xj/WETsE0T+dR3iQfDndxRsV94XCeu
 7tzjNS7WLoI+aaIH0unrvEyKIGhyPOBph233Mi6IMOFI4VagUvbH4dpTaST5K3+MbNaroH
 7grWKP5RmjWJ4m//dP/vVhknLMbaznk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-dKGnIhEsMviUouM0psuRiw-1; Thu, 29 Sep 2022 07:05:37 -0400
X-MC-Unique: dKGnIhEsMviUouM0psuRiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065701C05AC0;
 Thu, 29 Sep 2022 11:05:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F834099B52;
 Thu, 29 Sep 2022 11:05:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Maksim Davydov <davydov-max@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 6/8] chardev: fix segfault in finalize
Date: Thu, 29 Sep 2022 15:05:06 +0400
Message-Id: <20220929110508.1323529-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Maksim Davydov <davydov-max@yandex-team.ru>

If finalize chardev-msmouse or chardev-wctable is called immediately after
init it cases QEMU to crash with segfault. This happens because of
QTAILQ_REMOVE in qemu_input_handler_unregister tries to dereference
NULL pointer.
For instance, this error can be reproduced via `qom-list-properties`
command.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220825165247.33704-1-davydov-max@yandex-team.ru>
---
 chardev/msmouse.c  | 4 +++-
 chardev/wctablet.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 9006703023..ab8fe981d6 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -247,7 +247,9 @@ static void char_msmouse_finalize(Object *obj)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(obj);
 
-    qemu_input_handler_unregister(mouse->hs);
+    if (mouse->hs) {
+        qemu_input_handler_unregister(mouse->hs);
+    }
     fifo8_destroy(&mouse->outbuf);
 }
 
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index e8b292c43c..43bdf6b608 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)
 {
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
-    qemu_input_handler_unregister(tablet->hs);
+    if (tablet->hs) {
+        qemu_input_handler_unregister(tablet->hs);
+    }
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.37.3



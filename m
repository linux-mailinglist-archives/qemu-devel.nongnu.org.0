Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B196A5E9E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:03:57 +0200 (CEST)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ockxw-0007eN-Ew
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpe-0004pq-7o
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpc-0003g6-GT
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8MB6qewQt3dNDFWmIT6gK9a8vJJkApS1O6Zso0beBQ=;
 b=UeCbsG1+AAd9n/gouw9UOu+JQjFQY4qlOWYIheUaVXMkAdnYmE2KcWyD1TzxeTGv3VaP8N
 JuMg4mh7ppkBKXH694S+1brl5F5Cv897wr6gC1gVQkfEvGazQQH1Fpp38T6pH5grKlNk5l
 sqV5vjUXXVnJvTG0pY472dPwrIU5B8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-bD0SU6DZMBybMALOrt9L3A-1; Mon, 26 Sep 2022 05:55:18 -0400
X-MC-Unique: bD0SU6DZMBybMALOrt9L3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAFC03C11040;
 Mon, 26 Sep 2022 09:55:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EFBE49BB60;
 Mon, 26 Sep 2022 09:55:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D0E618030AD; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
Subject: [PULL 06/25] ui/clipboard: fix serial priority
Date: Mon, 26 Sep 2022 11:54:50 +0200
Message-Id: <20220926095509.3759409-7-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

The incoming grab event should have a higher serial.
See also "vdagent: introduce VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL":
https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/045a6978d6dbbf7046affc5c321fa8177c8cce56

This is only a relevant fix for the -display dbus, only user of that
function.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220912102455.111765-3-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/clipboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index cd5382fcb0c1..3e2d02d5490c 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -54,9 +54,9 @@ bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client)
     }
 
     if (client) {
-        ok = cbinfo[info->selection]->serial >= info->serial;
+        ok = info->serial >= cbinfo[info->selection]->serial;
     } else {
-        ok = cbinfo[info->selection]->serial > info->serial;
+        ok = info->serial > cbinfo[info->selection]->serial;
     }
 
     trace_clipboard_check_serial(cbinfo[info->selection]->serial, info->serial, ok);
-- 
2.37.3



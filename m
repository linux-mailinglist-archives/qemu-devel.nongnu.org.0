Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76445E9ED2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:14:52 +0200 (CEST)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl8V-0006lg-RC
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpj-00054N-Io
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpi-0003lV-41
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FOzTXJOVlAuEoG61vZulT59fd8k9A6AOrx8I9fMOQc=;
 b=ODVboMZIXre1fUtmxku3kLLjWj3/jIPAmGx0+lxy4rg8fd3jlTxO3D8YGmnAvS/dkERC/T
 Bx/+U3PkaE1MT2tCkuCJ3p1s9HWNSVxjpjBAjWYzj5UK+Ev8IPVuvPtrpTVgL86xCVNi8I
 Ttxisg1P9CRljppb9mqdMDVeZetbPHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-Y8gJYKBZM42qqBYs3g3r_Q-1; Mon, 26 Sep 2022 05:55:20 -0400
X-MC-Unique: Y8gJYKBZM42qqBYs3g3r_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C615101CC67;
 Mon, 26 Sep 2022 09:55:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3084840C6EC2;
 Mon, 26 Sep 2022 09:55:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6773E18030B0; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
Subject: [PULL 08/25] ui/clipboard: reset the serial state on reset
Date: Mon, 26 Sep 2022 11:54:52 +0200
Message-Id: <20220926095509.3759409-9-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Not only we have to reset the vdagent clipboards serial state, but also
the current QEMU clipboards info serial (the value is currently used by
qemu_clipboard_check_serial, only used by -display dbus).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220912102455.111765-5-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/clipboard.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 3e2d02d5490c..3d14bffaf80f 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -139,7 +139,14 @@ void qemu_clipboard_request(QemuClipboardInfo *info,
 void qemu_clipboard_reset_serial(void)
 {
     QemuClipboardNotify notify = { .type = QEMU_CLIPBOARD_RESET_SERIAL };
+    int i;
 
+    for (i = 0; i < QEMU_CLIPBOARD_SELECTION__COUNT; i++) {
+        QemuClipboardInfo *info = qemu_clipboard_info(i);
+        if (info) {
+            info->serial = 0;
+        }
+    }
     notifier_list_notify(&clipboard_notifiers, &notify);
 }
 
-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C23564F7B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:15:08 +0200 (CEST)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HEY-0007zX-Jk
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8H04-0002Kv-Hd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8H02-0007ii-7g
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbJdS73OxROIhUmAgqiRN/3KnzFejn6dneuQRkLDcnQ=;
 b=ANoMkluKDcb+u1TQ6+mcfIM+2zrM/H3M3/lanCcp2p6qCeeB0ju3ylcPrFfrUIErW/1ARj
 uualURqt96m9QwA628S8XIWEFp8NUa32hEKq3QYzWOszWxWUZHH2nwxPR7lQizKzW9RK1K
 f9F7CwNhcywd7eC4nDFbp62c1QPgby0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-15B4tYc8Pg-CB1d01LrmgQ-1; Mon, 04 Jul 2022 03:59:52 -0400
X-MC-Unique: 15B4tYc8Pg-CB1d01LrmgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92C5D3C138A0;
 Mon,  4 Jul 2022 07:59:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CF412166B29;
 Mon,  4 Jul 2022 07:59:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C113F180063D; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: [PULL 4/8] ui/cocoa: Fix clipboard text release
Date: Mon,  4 Jul 2022 09:59:42 +0200
Message-Id: <20220704075946.921883-5-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

[-NSPasteboard dataForType:] returns an autoreleased NSString,
and callings its release method will result in double-free when
the global autorelease pool is released. Use NSAutoreleasePool to
release it properly.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220614212131.94696-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5e..6a4dccff7f02 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1894,16 +1894,18 @@ static void cocoa_clipboard_notify(Notifier *notifier, void *data)
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type)
 {
+    NSAutoreleasePool *pool;
     NSData *text;
 
     switch (type) {
     case QEMU_CLIPBOARD_TYPE_TEXT:
+        pool = [[NSAutoreleasePool alloc] init];
         text = [[NSPasteboard generalPasteboard] dataForType:NSPasteboardTypeString];
         if (text) {
             qemu_clipboard_set_data(&cbpeer, info, type,
                                     [text length], [text bytes], true);
-            [text release];
         }
+        [pool release];
         break;
     default:
         break;
-- 
2.36.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000985AB158
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:24:25 +0200 (CEST)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6el-00051Y-Uy
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VE-0006Fh-Ch
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6VB-0001xE-7F
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662124468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeQgff18/wjt2z9nrM7eBmSQtcsPIZiDZo+RGap6TtU=;
 b=XO6JiMPGGttXMWbl5KE+Pm/pdQYDS9SaLw354EyMwcJq3qgVKAhKcCszOoIcltubI/iBSk
 ZpUuwjiRu49blCe3kri4RXUp3Jm8BERLwEqMKUXigJbTA28D2qLSGh15hOjtjCp3+tyfLI
 EGEJ5/UI9o7DzKS7/U1j02HDchZU00s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-UsXnDdUFPK2UBkiDeIt5_Q-1; Fri, 02 Sep 2022 09:14:25 -0400
X-MC-Unique: UsXnDdUFPK2UBkiDeIt5_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB7B101A56C;
 Fri,  2 Sep 2022 13:14:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222381415125;
 Fri,  2 Sep 2022 13:14:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 2/4] chardev/char-socket: Update AF_UNIX for Windows
Date: Fri,  2 Sep 2022 17:14:10 +0400
Message-Id: <20220902131412.3125752-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Now that AF_UNIX has come to Windows, update the existing logic in
qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220802075200.907360-4-bmeng.cn@gmail.com>
---
 chardev/char-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..879564aa8a 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -557,12 +557,10 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
     const char *left = "", *right = "";
 
     switch (ss->ss_family) {
-#ifndef _WIN32
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
                                s->is_listen ? ",server=on" : "");
-#endif
     case AF_INET6:
         left  = "[";
         right = "]";
@@ -1372,10 +1370,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 
     qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
+#ifndef _WIN32
     /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
     if (addr->type == SOCKET_ADDRESS_TYPE_UNIX) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
+#endif
 
     /*
      * In the chardev-change special-case, we shouldn't register a new yank
-- 
2.37.2



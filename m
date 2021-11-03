Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D94443E8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:52:48 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHd9-0007rT-7G
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHaj-0005Ri-6l
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHag-0003tM-5X
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPV+W1JEglcUG/T8I71cXAh8f2sG/9F6plQ0Iae9Ago=;
 b=gIiJXxAuXCTgYUz3RKlfXJ6RRo5YAo9uJxReSq61CWssPpXq06kyy/SvXa1MLODtmNVAwJ
 0OwJwiiLP3aQOpQhPkKHha0nt4A9/9RDUr59FV/gOcqq1XsQLoJFuUEXmkWMaP/BZnKTTI
 3tgRt5rBzasJEgpGRwOswxRrOKaJ7Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Z9AizK6LOGmejnIJ8HGUIQ-1; Wed, 03 Nov 2021 10:50:10 -0400
X-MC-Unique: Z9AizK6LOGmejnIJ8HGUIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421B787D547;
 Wed,  3 Nov 2021 14:50:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39FB019741;
 Wed,  3 Nov 2021 14:50:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] ui/clipboard: Don't use g_autoptr just to free a variable
Date: Wed,  3 Nov 2021 10:48:40 -0400
Message-Id: <20211103144844.1285634-3-jsnow@redhat.com>
In-Reply-To: <20211103144844.1285634-1-jsnow@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang doesn't recognize that the variable is being "used" and will emit
a warning:

  ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
      g_autoptr(QemuClipboardInfo) old = NULL;
                                 ^
  1 error generated.

OK, fine. Just do things the old way.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 ui/clipboard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a..d53576b0f6 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
-    g_autoptr(QemuClipboardInfo) old = NULL;
+    QemuClipboardInfo *old = NULL;
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
     notifier_list_notify(&clipboard_notifiers, info);
 
     old = cbinfo[info->selection];
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
+    g_free(old);
 }
 
 QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection)
-- 
2.31.1



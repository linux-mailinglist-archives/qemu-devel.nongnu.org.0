Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA746C4D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 21:45:09 +0100 (CET)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muhKm-00023A-Pa
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 15:45:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muhHO-0006sV-KX
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muhHM-0001X5-RT
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638909696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcvDFRD7wH73IBrzFUVypp8m7aFaIeCDOjPBTV5Wx8g=;
 b=BsczS+yCiLemRRVI4rWNXJHCmDS7idldk1fsll9Cgt9ekoSCdF3LR/poP08l/Xhx3WsKUa
 W5Z5ksKcMx4oDCdf73NFjiTAlk1JAkAVs+MfPZsfGh+hETJmwv/LlunAKmL/u1Z9ak2B0g
 F1LI9JllaqPmyDEzWYIuZ1Su9AIUxr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-pkgDj18zMSaW0iFm_mE37Q-1; Tue, 07 Dec 2021 15:41:33 -0500
X-MC-Unique: pkgDj18zMSaW0iFm_mE37Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F5C347AA;
 Tue,  7 Dec 2021 20:41:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6EC56A84;
 Tue,  7 Dec 2021 20:41:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/clipboard: Don't use g_autoptr just to free a
 variable
Date: Tue,  7 Dec 2021 15:40:38 -0500
Message-Id: <20211207204038.664133-3-jsnow@redhat.com>
In-Reply-To: <20211207204038.664133-1-jsnow@redhat.com>
References: <20211207204038.664133-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe Mathieu Daude <philmd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
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
 ui/clipboard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a..9ab65efefb 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
-    g_autoptr(QemuClipboardInfo) old = NULL;
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
     notifier_list_notify(&clipboard_notifiers, info);
 
-    old = cbinfo[info->selection];
+    g_free(cbinfo[info->selection]);
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
 }
 
-- 
2.31.1



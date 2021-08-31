Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD843FC8D2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:51:56 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4B9-0005lr-Hu
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3u6-0000Sn-J3
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3u4-0000jq-Vp
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqPT+58pnOmmaWzAwrlvirBDgNknMiRmcjA5qgc1JxA=;
 b=caia2erXsv/O+9cpk8abSOaTj/jmzIWVeky1r/72K89HpU1x9J7Zf96oUXPLrSRIOH56cc
 KPn0gFT/339jWYGc3HFbmFaX19la+D9xtegJjanLWfTqCZ8W7QkC0JxBMY1NwA6IcHVMJO
 oQ4FXRbukdoJoL36aIw+ZgUu0rT0uG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-FTvtu1gON4Ow_jgdj7VGmw-1; Tue, 31 Aug 2021 09:34:12 -0400
X-MC-Unique: FTvtu1gON4Ow_jgdj7VGmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAC418C8C01;
 Tue, 31 Aug 2021 13:34:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73D1D5D9D5;
 Tue, 31 Aug 2021 13:34:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] ui/vdagent: use qemu_clipboard_peer_release helper
Date: Tue, 31 Aug 2021 17:31:26 +0400
Message-Id: <20210831133132.1697228-13-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-13-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 362064213c..99ba34646f 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -507,13 +507,7 @@ static void vdagent_clipboard_recv_data(VDAgentChardev *vd, uint8_t s, uint32_t
 
 static void vdagent_clipboard_recv_release(VDAgentChardev *vd, uint8_t s)
 {
-    g_autoptr(QemuClipboardInfo) info = NULL;
-
-    if (vd->cbinfo[s] && vd->cbinfo[s]->owner == &vd->cbpeer) {
-        /* set empty clipboard info */
-        info = qemu_clipboard_info_new(NULL, s);
-        qemu_clipboard_update(info);
-    }
+    qemu_clipboard_peer_release(&vd->cbpeer, s);
 }
 
 static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
-- 
2.33.0.rc2



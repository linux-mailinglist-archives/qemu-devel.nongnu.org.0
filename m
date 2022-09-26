Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A325E9EBE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:12:43 +0200 (CEST)
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl6Q-0003QX-5g
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpg-0004uI-CQ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpe-0003iT-QT
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0j2Aqtnv13FSXqrmRMEFPQ/3l4+enM7Zc2eriMcTAk=;
 b=C4OgMLfAk/8Qp6IME3QnznWiE9ztcTcnza0SRIPI1yM0q10YLD3dcGDZ+P0BwUgOnoD9LX
 oPac7sm2t2VSBHRM5FZeKlb+TF0AWnHOw59pHnNEcLaNzW6Q+SxJSZA0u0SM/y/dn5KwPh
 3RmtPk6CmiXkBX5T94FZVEkeANT+3Rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-zFnF1XXxPLmhJriejEAmzw-1; Mon, 26 Sep 2022 05:55:18 -0400
X-MC-Unique: zFnF1XXxPLmhJriejEAmzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF68185A583;
 Mon, 26 Sep 2022 09:55:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 718612166B26;
 Mon, 26 Sep 2022 09:55:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A33618030AF; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
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
Subject: [PULL 07/25] ui/vdagent: always reset the clipboard serial on caps
Date: Mon, 26 Sep 2022 11:54:51 +0200
Message-Id: <20220926095509.3759409-8-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

The guest agent doesn't know what is the current serial state. Reset the
serial value whenever a new agent connection is established.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2124446

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220912102455.111765-4-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 58ce7507fddc..819e0dc1435b 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -719,8 +719,10 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
     if (have_mouse(vd) && vd->mouse_hs) {
         qemu_input_handler_activate(vd->mouse_hs);
     }
+
+    memset(vd->last_serial, 0, sizeof(vd->last_serial));
+
     if (have_clipboard(vd) && vd->cbpeer.notifier.notify == NULL) {
-        memset(vd->last_serial, 0, sizeof(vd->last_serial));
         vd->cbpeer.name = "vdagent";
         vd->cbpeer.notifier.notify = vdagent_clipboard_notify;
         vd->cbpeer.request = vdagent_clipboard_request;
-- 
2.37.3



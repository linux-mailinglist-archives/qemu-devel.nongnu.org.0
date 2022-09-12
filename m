Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CA5B5881
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:35:30 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgmn-0007hW-8C
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgd2-000737-N8
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcy-0007Ms-1f
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBn1X8lQoli8t3ZEXhzyF4No2MEb689wWZb2oofKLrk=;
 b=BosW97Ez14JSnSIdChD7vIDDTqyPJ+vL4BkfuR1prED7a9ujGLM7/jcLxsQ6nPOyDiq696
 h8+g1T+dTm1xIko1tc9Qg5VPxav2CD7n4NyiqIveQDS0DTqJBge0gadoT4De4Kzd+RjjOV
 D44bXF1IrelbhdkS0bulkAIOSopf6ts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-XZaykpcaP9ukRrpwiHgd1w-1; Mon, 12 Sep 2022 06:25:16 -0400
X-MC-Unique: XZaykpcaP9ukRrpwiHgd1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3B8E811E80
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCFB12027062;
 Mon, 12 Sep 2022 10:25:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 3/5] ui/vdagent: always reset the clipboard serial on caps
Date: Mon, 12 Sep 2022 14:24:53 +0400
Message-Id: <20220912102455.111765-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220912102455.111765-1-marcandre.lureau@redhat.com>
References: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The guest agent doesn't know what is the current serial state. Reset the
serial value whenever a new agent connection is established.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2124446

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index f3bd56e3e7..167f5addc1 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -718,8 +718,10 @@ static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *msg)
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



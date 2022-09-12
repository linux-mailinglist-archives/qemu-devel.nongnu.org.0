Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F815B5895
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:42:54 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgtx-0005W3-TL
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgdF-00073m-MA
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgd9-0007TH-VJ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+3301cBnWbCJwhEynCvJGkzm/LZrIMV9ydeNQMAbOw=;
 b=AIjlv6v0vsTdhXgLdfoEL0wV/pOjdIhuoZfLtxMtMYldB3zqvW3Rk/f+yoBcmcK5+ICqf7
 6Xb+bjuvbZlhm4nRWjvi2ixOJKK8+6jky17ZLBiy9c1yDUSTULp3cBbaOtnye425sG8/3R
 ozSGVp4yrKMhfbpK9Js+qqeSm68xFuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-7SW39eOFPkSeWy2_7mUlwA-1; Mon, 12 Sep 2022 06:25:26 -0400
X-MC-Unique: 7SW39eOFPkSeWy2_7mUlwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29FE7811E83
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1562C492B04;
 Mon, 12 Sep 2022 10:25:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 5/5] ui/vdagent: fix serial reset of guest agent
Date: Mon, 12 Sep 2022 14:24:55 +0400
Message-Id: <20220912102455.111765-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220912102455.111765-1-marcandre.lureau@redhat.com>
References: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

In order to reset the guest agent, we send CLOSED & OPENED events.

They are correctly received by the guest kernel. However, they might not
be noticed by the guest agent process, as the IO task (poll() for
example) might be wake up after both CLOSED & OPENED have been
processed.

Wait until the guest agent is disconnected to re-open our side.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 167f5addc1..2aef96a9d3 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -471,7 +471,7 @@ static void vdagent_clipboard_reset_serial(VDAgentChardev *vd)
 
     /* reopen the agent connection to reset the serial state */
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
-    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
+    /* OPENED again after the guest disconnected, see set_fe_open */
 }
 
 static void vdagent_clipboard_notify(Notifier *notifier, void *data)
@@ -874,6 +874,9 @@ static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     if (!fe_open) {
         trace_vdagent_close();
+        /* To reset_serial, we CLOSED our side. Make sure the other end knows we
+         * are ready again. */
+        qemu_chr_be_event(chr, CHR_EVENT_OPENED);
         return;
     }
 
-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32630B180
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:19:13 +0100 (CET)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ffE-0006Th-JA
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6fb6-0003md-V3
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:14:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6fb5-0005Dz-FP
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612210494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anVCmEkZuqPEuOFOmVTZSm0mWzJ+vgZcmWCPZiBxC9k=;
 b=WhdA8jnNJ1T2LHanmVKh2eo207lpXzPffToUha4z+U7tdzF53KjQCylL+Irc+6v1VA2F8m
 sKcxKGwFheqfs4sBHoaJBUR0IEZn9BR3miEAoP+qQIABnZa6rwKqpG5Jlp+MtxdCqcsZVM
 JudDv5v2V9WhD5DWIxLhfoaAbdQ2n+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-lsCtQ0IhNb6WcC1wIR4LTw-1; Mon, 01 Feb 2021 15:14:52 -0500
X-MC-Unique: lsCtQ0IhNb6WcC1wIR4LTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1CBD802B44
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 20:14:51 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBA335D749;
 Mon,  1 Feb 2021 20:14:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qxl: also notify the rendering is done when skipping it
Date: Tue,  2 Feb 2021 00:14:22 +0400
Message-Id: <20210201201422.446552-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210201201422.446552-1-marcandre.lureau@redhat.com>
References: <20210201201422.446552-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Asynchronous handlers may be waiting for the graphic_hw_update_done() to
be called in this case too.

Fixes: 4d6316218 ("console: add graphic_hw_update_done()")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/qxl-render.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index 3ce2e57b8f..d28849b121 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -181,6 +181,7 @@ void qxl_render_update(PCIQXLDevice *qxl)
         qxl->mode == QXL_MODE_UNDEFINED) {
         qxl_render_update_area_unlocked(qxl);
         qemu_mutex_unlock(&qxl->ssd.lock);
+        graphic_hw_update_done(qxl->ssd.dcl.con);
         return;
     }
 
-- 
2.29.0



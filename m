Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E531C7EF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:23:10 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwZZ-0005gE-1H
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lBwXu-0004mb-D9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lBwXr-0001hl-2R
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613467282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TaO32Hj5jpnAwCffRkvucpYHy2OciNg361TUkHsn6U=;
 b=CRNoTEEoinl38bYcsINd7W1WOTPLZrK6DKLODp+7rA1bcZEVsnXgSJcd/9QUBQ4+FgUrLb
 M5pUvKcuoEgYDDM/13wlEO8cmZMYtU7U1YNPRCSlp4GniDlv26Ck400P73jPxtUgelzosJ
 crMbsv/dJAIn5a8p/vwSEkHW9952d6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-L627sPiqMq2p-gIAqSXEXg-1; Tue, 16 Feb 2021 04:21:20 -0500
X-MC-Unique: L627sPiqMq2p-gIAqSXEXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96F488710E3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 09:21:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA0A91658A;
 Tue, 16 Feb 2021 09:21:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] spice: flush drawing before notifying client
Date: Tue, 16 Feb 2021 13:20:56 +0400
Message-Id: <20210216092056.2301293-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210216092056.2301293-1-marcandre.lureau@redhat.com>
References: <20210216092056.2301293-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This solves the client having slow/outdated VGA/2D console. It's a
regression introduced when the code was switched to render it via opengl
in commit 4423184376d ("spice/gl: render DisplaySurface via opengl")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/spice-display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index d562c64084..ad93b953a9 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -846,6 +846,7 @@ static void spice_gl_refresh(DisplayChangeListener *dcl)
     graphic_hw_update(dcl->con);
     if (ssd->gl_updates && ssd->have_surface) {
         qemu_spice_gl_block(ssd, true);
+        glFlush();
         cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
         spice_qxl_gl_draw_async(&ssd->qxl, 0, 0,
                                 surface_width(ssd->ds),
-- 
2.29.0



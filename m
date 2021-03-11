Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D5337CE4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:48:11 +0100 (CET)
Received: from localhost ([::1]:40318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQLy-0008HK-DU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4f-0001i1-5c
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQ4d-0004bJ-AE
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94xKz9rBs80qA3AWXFxKoeefCjGHm9eb9tHdY/+37+8=;
 b=WuMJ83mjihe+PTbWJc/P6dQwiM0+gPxGGIfnb/GFHW5uoWWfTsK6L/NLqDOmIQSy/PfyC5
 kshNPij1ydzcjDjvxORbcltDNCaQC5nf5ZBaS9/rd/LDJQINKz0uW//ir/bOYM8DvKouhl
 qACwcHyIQ0Z6hpc7Tfi4ps/1s3keFEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-rrgX_cu3O9qrr8iUCn3PVQ-1; Thu, 11 Mar 2021 13:30:12 -0500
X-MC-Unique: rrgX_cu3O9qrr8iUCn3PVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99EF801817
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:30:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-85.ams2.redhat.com
 [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A19E2C15A;
 Thu, 11 Mar 2021 18:30:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] ui: use client width/height in WMVi message
Date: Thu, 11 Mar 2021 18:29:56 +0000
Message-Id: <20210311182957.486939-4-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-1-berrange@redhat.com>
References: <20210311182957.486939-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The WMVi message is supposed to provide the same width/height
information as the regular desktop resize and extended desktop
resize messages. There can be times where the client width and
height are different from the pixman surface dimensions.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/vnc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 7291429c04..8c9890b3cd 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2319,8 +2319,8 @@ static void vnc_colordepth(VncState *vs)
         vnc_write_u8(vs, 0);
         vnc_write_u16(vs, 1); /* number of rects */
         vnc_framebuffer_update(vs, 0, 0,
-                               pixman_image_get_width(vs->vd->server),
-                               pixman_image_get_height(vs->vd->server),
+                               vs->client_width,
+                               vs->client_height,
                                VNC_ENCODING_WMVi);
         pixel_format_message(vs);
         vnc_unlock_output(vs);
-- 
2.29.2



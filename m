Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220042DE3AA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:06:10 +0100 (CET)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGOW-0003yx-T2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqGGF-00075f-L2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqGGD-000472-OT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608299852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jku7vyzWGtKSJWS07EhF9TXv0loPr6KZedcOtCVkIiY=;
 b=aCE1Le9xQ4dWGLtlNZoY1wwH18T7DaAX2YodlT9pY6pabvTBWxtZuqXz1HwelwnRQAZ66Y
 pFd4in7Xy0DJcQ6kquGq9AlVISDlHw9nKq4OQoHyN06smkCJ7QboSgRerpsdYpftZYwKue
 DL4D9yXzZnuQ7qzpNRB5iHKzJZufJso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-yWeVTMklMYGMT0pSL-4sXg-1; Fri, 18 Dec 2020 08:57:31 -0500
X-MC-Unique: yWeVTMklMYGMT0pSL-4sXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B678A0CB6
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 13:57:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 495C874AAA;
 Fri, 18 Dec 2020 13:57:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] win32: drop fd registration to the main-loop on setting
 non-block
Date: Fri, 18 Dec 2020 17:57:11 +0400
Message-Id: <20201218135712.674094-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Low-level fd users from QEMU use aio_set_fd_handler(), which handles
event registration with the main-loop.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/oslib-win32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 23a7c7320b..01787df74c 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -221,7 +221,6 @@ int qemu_try_set_nonblock(int fd)
     if (ioctlsocket(fd, FIONBIO, &opt) != NO_ERROR) {
         return -socket_error();
     }
-    qemu_fd_register(fd);
     return 0;
 }
 
-- 
2.29.0



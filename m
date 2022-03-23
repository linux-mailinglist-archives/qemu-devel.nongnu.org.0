Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0CA4E5619
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:10:52 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3ZT-0006Ce-2k
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:10:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3NH-0002GD-1r
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3NF-0004kN-IT
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfKTTVbZm8Z4/Cu003Bbhwc0JceqR4+AWCW6r9SfzV4=;
 b=iO5P+liWR1tGno3fXOr4KwPw4Ub6O7pqKLRhfQZHAmXZzKzgeFbdwnBtpNffAzMVWh9nJq
 rAzwpyvKUHgOjYQuoSz9hnUw+wO9gh8mBbtOC5flZzxs2Qu5xYbsbNKL5cW4ZbUci7A83f
 kepGoP8YoQ0NzLQeQFLJjUINOUzC0bo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-Mt9io3wyMrKXKPWHL04oag-1; Wed, 23 Mar 2022 11:58:11 -0400
X-MC-Unique: Mt9io3wyMrKXKPWHL04oag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60C5E1C05EC1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:58:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF4C112132C;
 Wed, 23 Mar 2022 15:57:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/32] meson: use chardev_ss dependencies
Date: Wed, 23 Mar 2022 19:57:12 +0400
Message-Id: <20220323155743.1585078-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

chardev subsystem/library doesn't use gnutls. Use the dedicated
chardev_ss.dependencies() instead.

Looking at history, it was added in commit 3eacf70bb5a83e ("meson:
Propagate gnutls dependency") because crypto/tlscreds.h included
GnuTLS. This was cleaned-up later by commit 678bcc3c2cf222 ("crypto:
Make QCryptoTLSCreds* structures private").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index aef724ad3c0e..dc17d37e461b 100644
--- a/meson.build
+++ b/meson.build
@@ -3091,7 +3091,7 @@ qmp = declare_dependency(link_whole: [libqmp])
 
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
                             name_suffix: 'fa',
-                            dependencies: [gnutls],
+                            dependencies: chardev_ss.dependencies(),
                             build_by_default: false)
 
 chardev = declare_dependency(link_whole: libchardev)
-- 
2.35.1.273.ge6ebfd0e8cbb



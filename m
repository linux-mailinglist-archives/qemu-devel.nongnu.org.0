Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB52F47A4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:33:39 +0100 (CET)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcX4-0007VJ-Qy
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUm-0005lC-5r
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUj-0002wx-NC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610530272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKde8W3EpFqNiZbJkhG/VYyyMlyPl64FhJ8VI+Q8VaY=;
 b=gah5PQXeU78z9RQhaLJylaij9VT7vXYb+09u7ovX8Cg3o/W0XPFQXpMrE06libCJHNbAa0
 4WCbmMJvUgI+LWlgj3AMKiZR9ozEo3H0QAeksMptyI6CXGFLua8OrALn/geYbkXresqsWJ
 BcWT0Pcp2xvokgJJ5NqlWpsPimOMnqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-iW7rXPx5OGmMvARSdIqlAQ-1; Wed, 13 Jan 2021 04:31:10 -0500
X-MC-Unique: iW7rXPx5OGmMvARSdIqlAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D735DF8B0;
 Wed, 13 Jan 2021 09:31:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D27681F04F;
 Wed, 13 Jan 2021 09:31:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92BEF11385A7; Wed, 13 Jan 2021 10:31:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
Date: Wed, 13 Jan 2021 10:30:59 +0100
Message-Id: <20210113093101.550964-6-armbru@redhat.com>
In-Reply-To: <20210113093101.550964-1-armbru@redhat.com>
References: <20210113093101.550964-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, lukasstraub2@web.de,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Make qio_channel_tls_shutdown thread-safe by using atomics when
accessing tioc->shutdown.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <5bd8733f583f3558b32250fd0eb576b7aa756485.1609167865.git.lukasstraub2@web.de>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 io/channel-tls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 388f019977..2ae1b92fc0 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "io/channel-tls.h"
 #include "trace.h"
+#include "qemu/atomic.h"
 
 
 static ssize_t qio_channel_tls_write_handler(const char *buf,
@@ -277,7 +278,8 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
                     return QIO_CHANNEL_ERR_BLOCK;
                 }
             } else if (errno == ECONNABORTED &&
-                       (tioc->shutdown & QIO_CHANNEL_SHUTDOWN_READ)) {
+                       (qatomic_load_acquire(&tioc->shutdown) &
+                        QIO_CHANNEL_SHUTDOWN_READ)) {
                 return 0;
             }
 
@@ -361,7 +363,7 @@ static int qio_channel_tls_shutdown(QIOChannel *ioc,
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
 
-    tioc->shutdown |= how;
+    qatomic_or(&tioc->shutdown, how);
 
     return qio_channel_shutdown(tioc->master, how, errp);
 }
-- 
2.26.2



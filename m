Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C493B8194
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 14:03:11 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYvu-0006ja-7c
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 08:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpk-0006GS-H6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpf-0000mg-EI
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625054201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VgCNqkT5Q9y4YcjIPIh1BqShbR7C8qP2qwizgjXr4I=;
 b=E6Us1Twt/ISqQks6Ubq7b4gADmdMqOQy3wkpqHnlmQOrlsFIGMlkewtKLJcyDRiTYjZ0gu
 aFxObxb8B7yHkityEBbq+wQnngPAyxPAOnbjgMi+msccZR74Pss8V8PQjMAcl35NryzOQQ
 priIYxh2YBkpT9myRS+L23Y+JLKQdzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-qkbKbGMbMQifF30eN0SsOQ-1; Wed, 30 Jun 2021 07:56:40 -0400
X-MC-Unique: qkbKbGMbMQifF30eN0SsOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB570804143;
 Wed, 30 Jun 2021 11:56:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-116.ams2.redhat.com
 [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931EE5D6AD;
 Wed, 30 Jun 2021 11:56:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Wed, 30 Jun 2021 12:56:08 +0100
Message-Id: <20210630115612.827664-4-berrange@redhat.com>
In-Reply-To: <20210630115612.827664-1-berrange@redhat.com>
References: <20210630115612.827664-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-nbd.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 93ef4e288f..26ffbf15af 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -43,6 +43,7 @@
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
 #include "crypto/init.h"
+#include "crypto/tlscreds.h"
 #include "trace/control.h"
 #include "qemu-version.h"
 
@@ -422,18 +423,12 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, bool list,
         return NULL;
     }
 
-    if (list) {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a client endpoint");
-            return NULL;
-        }
-    } else {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
-            return NULL;
-        }
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          list
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
+        return NULL;
     }
     object_ref(obj);
     return creds;
-- 
2.31.1



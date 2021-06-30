Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12853B818B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:59:04 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYrv-0000wf-Ux
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpZ-000655-OW
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpW-0000ix-Gc
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625054194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdJwe5+fGafSehEwgR2Etxg6ealeHuB1UzaPvOApRIk=;
 b=IVA3cbpxpWFnAodRJ/G9+tOn91NsIx5V8p7C3uNANr38CMTxp2xWpQd8+IhTWAr5+4f2HC
 Wum7g6o6dXeWEBTv8X040zCtvhEY78pxzUmmRINz8owVKSZsEuO1uGauNMDVqIFJx9duHq
 vz/owItsmaZYbdaa7TB50gz9RVdpPq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-ZZ1UVp1fOHai5AD9KU1HLw-1; Wed, 30 Jun 2021 07:56:32 -0400
X-MC-Unique: ZZ1UVp1fOHai5AD9KU1HLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB72800D62;
 Wed, 30 Jun 2021 11:56:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-116.ams2.redhat.com
 [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEB6C5D6AD;
 Wed, 30 Jun 2021 11:56:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Wed, 30 Jun 2021 12:56:07 +0100
Message-Id: <20210630115612.827664-3-berrange@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3cbee762de..601fccc5ba 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1839,9 +1839,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a client endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98..bdfa7ed3a5 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,9 +108,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a server endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
-- 
2.31.1



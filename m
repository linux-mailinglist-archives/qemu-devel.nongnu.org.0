Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201A4CDD60
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:40:13 +0100 (CET)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDme-0006L7-Ix
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDj8-0002l3-6J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDj5-0004IW-Qz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9CbxaoQFdMFgkKAH9Zs4fgZbAwyslIveYArq8DfUSU=;
 b=BHxeyRkxVyadHBzfIfWCap6yGBP3xQZjYkJlHCzJ4RExyftmUw/rQsaZS2+ata9Sgd9ksH
 edZHG2XOI0gwklScv1gTKxbuVgM64x8bvRbw6Dx+kkWEyPAQj630o7vB+4AfdsfqfBqObK
 6TavlpcZMce5Paq7vCcgA/Zx8uIl/t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-f5ppcwzLOdSCuw_SDWMgJg-1; Fri, 04 Mar 2022 14:36:28 -0500
X-MC-Unique: f5ppcwzLOdSCuw_SDWMgJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D9DF1091DA0;
 Fri,  4 Mar 2022 19:36:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 305735DF21;
 Fri,  4 Mar 2022 19:36:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] crypto: mandate a hostname when checking x509 creds
 on a client
Date: Fri,  4 Mar 2022 19:35:59 +0000
Message-Id: <20220304193610.3293146-2-berrange@redhat.com>
In-Reply-To: <20220304193610.3293146-1-berrange@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the TLS session object assumes that the caller will always
provide a hostname when using x509 creds on a client endpoint. This
relies on the caller to detect and report an error if the user has
configured QEMU with x509 credentials on a UNIX socket. The migration
code has such a check, but it is too broad, reporting an error when
the user has configured QEMU with PSK credentials on a UNIX socket,
where hostnames are irrelevant.

Putting the check into the TLS session object credentials validation
code ensures we report errors in only the scenario that matters.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlssession.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index a8db8c76d1..b302d835d2 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -373,6 +373,12 @@ qcrypto_tls_session_check_certificate(QCryptoTLSSession *session,
                                session->hostname);
                     goto error;
                 }
+            } else {
+                if (session->creds->endpoint ==
+                    QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
+                    error_setg(errp, "No hostname for certificate validation");
+                    goto error;
+                }
             }
         }
 
-- 
2.34.1



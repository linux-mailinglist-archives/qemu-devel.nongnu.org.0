Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96B60FF59
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:33:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6ka-000179-OT; Thu, 27 Oct 2022 13:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6ju-0007uk-IN
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jt-00013C-67
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjFv36ycSpe+n+GdI8z5hQGrr1gfHtr16GIoxh77J6g=;
 b=GBG7i1V7NihbKClayBCBtox8+3Y5SXwcRxid3TNvJA866pn+3CxhTDyTELSKz4YF1kEXhs
 8n3tKn9FLjTSUwoKTWc3qL4GZLPLk0OXohXQwe9S/VrTTXGGNaFHqAUp1UQLGmoQDDnlyh
 wyl6+ocfTW7Y6OzAOLWC0+eN/AtzWDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-vWzXSL_QN4WC1jWsJy9f8g-1; Thu, 27 Oct 2022 13:32:17 -0400
X-MC-Unique: vWzXSL_QN4WC1jWsJy9f8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B5C182D3A0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 773FB414A815;
 Thu, 27 Oct 2022 17:31:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 18/20] crypto: quote algorithm names in error messages
Date: Thu, 27 Oct 2022 18:31:01 +0100
Message-Id: <20221027173103.299479-19-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If given a malformed LUKS header, it is possible that the algorithm
names end up being an empty string. This leads to confusing error
messages unless quoting is used to highlight where the empty string
is subsituted in the error message.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index bb89c10225..df2b4105d6 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -162,7 +162,7 @@ static int qcrypto_block_luks_cipher_name_lookup(const char *name,
         }
     }
 
-    error_setg(errp, "Algorithm %s with key size %d bytes not supported",
+    error_setg(errp, "Algorithm '%s' with key size %d bytes not supported",
                name, key_bytes);
     return 0;
 }
@@ -198,7 +198,7 @@ static int qcrypto_block_luks_name_lookup(const char *name,
     int ret = qapi_enum_parse(map, name, -1, NULL);
 
     if (ret < 0) {
-        error_setg(errp, "%s %s not supported", type, name);
+        error_setg(errp, "%s '%s' not supported", type, name);
         return 0;
     }
     return ret;
@@ -592,7 +592,7 @@ qcrypto_block_luks_parse_header(QCryptoBlockLUKS *luks, Error **errp)
      */
     ivgen_name = strchr(cipher_mode, '-');
     if (!ivgen_name) {
-        error_setg(errp, "Unexpected cipher mode string format %s",
+        error_setg(errp, "Unexpected cipher mode string format '%s'",
                    luks->header.cipher_mode);
         return -1;
     }
-- 
2.37.3



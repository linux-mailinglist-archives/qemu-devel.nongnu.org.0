Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE965AE451
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:34:31 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUyU-0000qD-Oa
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9q-0006t9-Ez
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9n-0006PE-Ug
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgF3P6QzGk6TRW8H0PrJBUdixdlQTSrnJzMWn1/eZ34=;
 b=BIXaZfP5U8Qp8ibUyujgBLd/aw1c+OQcOPseq3r4YYos/9Y1pfjIWdpk37E6wB8y0fHXiF
 1l4frTaPG7tOFk6JJ6L5onReQpOBEyowU6MdJtR9jHhWm41u11g2y+/HjrPR4t8fVYg3v2
 37gvgMbFnrLil/wtwUNwEnorFpIjPqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-hZ5noF0iMZKjmFxbeWpGJA-1; Tue, 06 Sep 2022 04:41:58 -0400
X-MC-Unique: hZ5noF0iMZKjmFxbeWpGJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE0A85A58B
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F156C15BB3;
 Tue,  6 Sep 2022 08:41:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 09/11] crypto: quote algorithm names in error messages
Date: Tue,  6 Sep 2022 09:41:45 +0100
Message-Id: <20220906084147.1423045-10-berrange@redhat.com>
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If given a malformed LUKS header, it is possible that the algorithm
names end up being an empty string. This leads to confusing error
messages unless quoting is used to highlight where the empty string
is subsituted in the error message.

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
2.37.2



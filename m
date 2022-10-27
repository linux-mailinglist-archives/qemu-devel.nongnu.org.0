Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5C60FF55
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:32:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jO-0006Zd-UW; Thu, 27 Oct 2022 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jM-0006Ab-36
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jJ-0000x1-LA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIydIM3MpccY0OeB1ELJ6B1IYFIFpUL1bZiDY7/mDDs=;
 b=OA9ven+MC1eIt6KMvrkhsQiuY9Kbufd1j1DwQsBWPXG9xiAtpfYN51ALvnoJeiSLV8LLCq
 fufSS10WP8rIs5y2AYez0ohu4pzJplN/CqfbAZ/uYS7JYt0fzo0x1kPkE5F6PuTswIvT3S
 oeIZcRwVAkZC60/0Md37n3GLN3JnLlM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-vsS8e7GWMuSLPtR4CDGDlA-1; Thu, 27 Oct 2022 13:31:38 -0400
X-MC-Unique: vsS8e7GWMuSLPtR4CDGDlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDFD8867469
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:18 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2FEE414A809;
 Thu, 27 Oct 2022 17:31:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 10/20] crypto: sanity check that LUKS header strings are
 NUL-terminated
Date: Thu, 27 Oct 2022 18:30:53 +0100
Message-Id: <20221027173103.299479-11-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The LUKS spec requires that header strings are NUL-terminated, and our
code relies on that. Protect against maliciously crafted headers by
adding validation.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index f62be6836b..27d1b34c1d 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -554,6 +554,24 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
         return -1;
     }
 
+    if (!memchr(luks->header.cipher_name, '\0',
+                sizeof(luks->header.cipher_name))) {
+        error_setg(errp, "LUKS header cipher name is not NUL terminated");
+        return -1;
+    }
+
+    if (!memchr(luks->header.cipher_mode, '\0',
+                sizeof(luks->header.cipher_mode))) {
+        error_setg(errp, "LUKS header cipher mode is not NUL terminated");
+        return -1;
+    }
+
+    if (!memchr(luks->header.hash_spec, '\0',
+                sizeof(luks->header.hash_spec))) {
+        error_setg(errp, "LUKS header hash spec is not NUL terminated");
+        return -1;
+    }
+
     /* Check all keyslots for corruption  */
     for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
 
-- 
2.37.3



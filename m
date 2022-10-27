Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D60FF61
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:34:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jQ-0006ie-2r; Thu, 27 Oct 2022 13:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jN-0006T4-Q8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jM-0000yE-DB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g66N5pGatgzCQotR8YoljXFuHmyxSjOJ6Zmm4Han4G8=;
 b=GLNE1IS+TaDGXXyscJnx8LNVhKNMOXk8atlMF+/Ac7QU8bqjzz4oItS9ZGy5n4DC3REAb7
 F54YicR88+z3cRjwbL1CVOJOnaSvoFOVoWrsc2bqeYt24bMuvAua4s3E/JXw2v4lPzCQbI
 Uefpr1Dh7LbqUHwmLPc9pyBNblxPibU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-TDf0xHa4PLmMuGyQnz_rTA-1; Thu, 27 Oct 2022 13:31:46 -0400
X-MC-Unique: TDf0xHa4PLmMuGyQnz_rTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E73D48039BA
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEF6E40C6EC3;
 Thu, 27 Oct 2022 17:31:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 15/20] crypto: check that LUKS PBKDF2 iterations count is
 non-zero
Date: Thu, 27 Oct 2022 18:30:58 +0100
Message-Id: <20221027173103.299479-16-berrange@redhat.com>
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

Both the master key and key slot passphrases are run through the PBKDF2
algorithm. The iterations count is expected to be generally very large
(many 10's or 100's of 1000s). It is hard to define a low level cutoff,
but we can certainly say that iterations count should be non-zero. A
zero count likely indicates an initialization mistake so reject it.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index e6ee8506b2..254490c256 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -579,6 +579,11 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
         return -1;
     }
 
+    if (luks->header.master_key_iterations == 0) {
+        error_setg(errp, "LUKS key iteration count is zero");
+        return -1;
+    }
+
     /* Check all keyslots for corruption  */
     for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
 
@@ -602,6 +607,12 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
             return -1;
         }
 
+        if (slot1->active == QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED &&
+            slot1->iterations == 0) {
+            error_setg(errp, "Keyslot %zu iteration count is zero", i);
+            return -1;
+        }
+
         if (start1 < DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
                                   QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
             error_setg(errp,
-- 
2.37.3



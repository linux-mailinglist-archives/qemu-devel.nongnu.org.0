Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6025AE462
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:38:38 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVV2T-0004P2-AQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9g-0006p9-53
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9d-0006N8-Qk
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZMS7LZgBlXkramID6TSN9j8R9ImFaf9ir8rFHUUjnw=;
 b=W+mdmVb/s5gfIEiUOBbDO7dCmOwcSNV5BWRoy463eybtv0Zsuvn4iyKuS0XbeXB1ZF0ze7
 08pNGD+HoFhkm8MigM2/R40lTkfrHE9IqhaZx8u5w8qAqQ/DhMaka4pLY7LXv+xRwfYPZ4
 kM4P7+Y4ZXQokUFda/TR2zrePAM7hd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-H27TQPJ0NwWBFMfaZ2GTDQ-1; Tue, 06 Sep 2022 04:41:55 -0400
X-MC-Unique: H27TQPJ0NwWBFMfaZ2GTDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83873811E83
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3A3FC15BB3;
 Tue,  6 Sep 2022 08:41:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 06/11] crypto: check that LUKS PBKDF2 iterations count is
 non-zero
Date: Tue,  6 Sep 2022 09:41:42 +0100
Message-Id: <20220906084147.1423045-7-berrange@redhat.com>
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Both the master key and key slot passphrases are run through the PBKDF2
algorithm. The iterations count is expected to be generally very large
(many 10's or 100's of 1000s). It is hard to define a low level cutoff,
but we can certainly say that iterations count should be non-zero. A
zero count likely indicates an initialization mistake so reject it.

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
2.37.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E425AE3FC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:19:12 +0200 (CEST)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUjf-0005YU-MU
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9f-0006ns-VC
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9d-0006Mp-8z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Liklr7RgzrbFgCIDnLf1V5xx6GbRjLkj0BUFKC9iN8Y=;
 b=gpvnA9pOi/WqZ61mQtH4RduImbaCw3vqzTL7NMwASE0FRPhXuMQsItOo/fkVfSVXFLAKKe
 /18hHzyH65pmZ4VVkdODEsuX1tZ/dd/g/c7WRB47twOvGcMnJQtRmJDBBLaIHfbassoG6k
 1xdkMFQ5eNSSyp1AZC0fNrwefSBoSyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-kcYFqs9vMemuVrYxmU4AWg-1; Tue, 06 Sep 2022 04:41:54 -0400
X-MC-Unique: kcYFqs9vMemuVrYxmU4AWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE33418A0160
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273D3C15BB3;
 Tue,  6 Sep 2022 08:41:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 04/11] crypto: validate that LUKS payload doesn't overlap with
 header
Date: Tue,  6 Sep 2022 09:41:40 +0100
Message-Id: <20220906084147.1423045-5-berrange@redhat.com>
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

We already validate that LUKS keyslots don't overlap with the
header, or with each other. This closes the remain hole in
validation of LUKS file regions.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 6ef9a89ffa..f22bc63e54 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -572,6 +572,13 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
         return -1;
     }
 
+    if (luks->header.payload_offset_sector <
+        DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
+                     QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
+        error_setg(errp, "LUKS payload is overlapping with the header");
+        return -1;
+    }
+
     /* Check all keyslots for corruption  */
     for (i = 0 ; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS ; i++) {
 
-- 
2.37.2



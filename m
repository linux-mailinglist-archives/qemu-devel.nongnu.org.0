Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A305560FF70
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:38:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6kX-0000nl-Hl; Thu, 27 Oct 2022 13:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jg-0007dn-5G
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jd-00012Q-Gp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ayn1zX34QAAHHwrkqjQq+/JtHwAEqjpz33b4o84095s=;
 b=V5gC0L4WYOzsVcNwJ+Vgh6f7Qx2DvrcqmRS9/wRtmNzGQ5DcYPZE5Zc+94mDbdFAFCaTWe
 7ZljDndm+sUKdKGz/5/7njGsN8Z62Su44c73EYEZ4bvGsQZSytDQ4cC7cJ9QYp1LgdR17Y
 g/xAaNPsp6wqR0MQtPE0eWECI/T7kLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Ky4U4H6bPKGFonB6DI0pZQ-1; Thu, 27 Oct 2022 13:32:00 -0400
X-MC-Unique: Ky4U4H6bPKGFonB6DI0pZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 264FF18E0057
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF11414A814;
 Thu, 27 Oct 2022 17:31:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 12/20] crypto: enforce that key material doesn't overlap with
 LUKS header
Date: Thu, 27 Oct 2022 18:30:55 +0100
Message-Id: <20221027173103.299479-13-berrange@redhat.com>
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

We already check that key material doesn't overlap between key slots,
and that it doesn't overlap with the payload. We didn't check for
overlap with the LUKS header.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 81744e2a8e..6ef9a89ffa 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -595,6 +595,14 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
             return -1;
         }
 
+        if (start1 < DIV_ROUND_UP(sizeof(QCryptoBlockLUKSHeader),
+                                  QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
+            error_setg(errp,
+                       "Keyslot %zu is overlapping with the LUKS header",
+                       i);
+            return -1;
+        }
+
         if (start1 + len1 > luks->header.payload_offset_sector) {
             error_setg(errp,
                        "Keyslot %zu is overlapping with the encrypted payload",
-- 
2.37.3



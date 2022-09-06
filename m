Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F45AE478
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:41:20 +0200 (CEST)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVV55-0000tj-DY
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9o-0006rz-7q
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9a-0006Ma-PM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W44bhcl3++vy3DCiR/fD6+2nHRgCHTSPRLiU5Z7kSqU=;
 b=Y5HzZfXA4WRXVmqnit6DAsxs8jT/79CxgJqm1tPBsF10xZfD52xzjTET/GKqlJ7mENgMcO
 MjTCX575Lfyr4Kbz6fRyD9Olg54HQGX0YjsEGIUok2Qku8mA11l+ODrTps+bUphkD91adv
 KeUiovGSypGit5LJhDJUpPxBoO/+sPY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-2UykbJ62OSqYJFzEO_cl5g-1; Tue, 06 Sep 2022 04:41:53 -0400
X-MC-Unique: 2UykbJ62OSqYJFzEO_cl5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDAF11C13944
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F243CC15BB3;
 Tue,  6 Sep 2022 08:41:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 03/11] crypto: enforce that key material doesn't overlap with
 LUKS header
Date: Tue,  6 Sep 2022 09:41:39 +0100
Message-Id: <20220906084147.1423045-4-berrange@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We already check that key material doesn't overlap between key slots,
and that it doesn't overlap with the payload. We didn't check for
overlap with the LUKS header.

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
2.37.2



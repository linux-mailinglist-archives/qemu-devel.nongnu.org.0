Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508285AE444
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:31:10 +0200 (CEST)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUvF-0006Ei-7O
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9b-0006iT-OS
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9Z-0006ML-Im
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8eTJqdGXTW6Hcu8M3bwOgdwpEz1BWPbD5xBUq9bMZc=;
 b=XMzoWTCGo52hpNlvitwYIdHn1kXBD2YzV7xx46zSigsG+uHcpVYeOPVxZaidPkpl3+2bHi
 8tJVk7lR8qftlerJsKyGb8aluZ/eZ45s5cE+XIJC5vBcWJWgXunnqy/CfrbW87OFBLjNRu
 pg7S8v5MY5wC2vkCkUKhbliGrcGBUAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-ynWmCWXcPxe7cD7-7jLkyg-1; Tue, 06 Sep 2022 04:41:51 -0400
X-MC-Unique: ynWmCWXcPxe7cD7-7jLkyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A773F80418F
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:51 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE068C15BB3;
 Tue,  6 Sep 2022 08:41:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 02/11] crypto: enforce that LUKS stripes is always a fixed
 value
Date: Tue,  6 Sep 2022 09:41:38 +0100
Message-Id: <20220906084147.1423045-3-berrange@redhat.com>
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

Although the LUKS stripes are encoded in the keyslot header and so
potentially configurable, in pratice the cryptsetup impl mandates
this has the fixed value 4000. To avoid incompatibility apply the
same enforcement in QEMU too. This also caps the memory usage for
key material when QEMU tries to open a LUKS volume.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 27d1b34c1d..81744e2a8e 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -582,8 +582,9 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
                                                    header_sectors,
                                                    slot1->stripes);
 
-        if (slot1->stripes == 0) {
-            error_setg(errp, "Keyslot %zu is corrupted (stripes == 0)", i);
+        if (slot1->stripes != QCRYPTO_BLOCK_LUKS_STRIPES) {
+            error_setg(errp, "Keyslot %zu is corrupted (stripes %d != %d)",
+                       i, slot1->stripes, QCRYPTO_BLOCK_LUKS_STRIPES);
             return -1;
         }
 
-- 
2.37.2



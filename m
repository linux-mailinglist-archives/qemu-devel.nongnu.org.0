Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8660FF5B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:33:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jO-0006Te-CD; Thu, 27 Oct 2022 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jL-00069M-Vt
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jK-0000xz-I0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1Zxp3RZOU1MCY76Fw63/rxm/fF4YDwZP1hI7Pfxzwg=;
 b=ffMx74rTnkTqhxNJbTKvvEzhwj/irMT0McCKSYYntCvKTxbJM7eXbrPY7GL4brVxWTT8/F
 avSIRIanK/zUelUfVpSEcfGbMHxPSxBOc7e8b7EAdDdYx2kHV4Z91QSLryUqpmdw11WSIa
 MEdNq0DA0wjQnsaS+reA6bTFBezsXuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-Zkp6YKPIPHylVTYCJuAxnw-1; Thu, 27 Oct 2022 13:31:41 -0400
X-MC-Unique: Zkp6YKPIPHylVTYCJuAxnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14CA08726BA
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E1240C6EC3;
 Thu, 27 Oct 2022 17:31:19 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 11/20] crypto: enforce that LUKS stripes is always a fixed value
Date: Thu, 27 Oct 2022 18:30:54 +0100
Message-Id: <20221027173103.299479-12-berrange@redhat.com>
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

Although the LUKS stripes are encoded in the keyslot header and so
potentially configurable, in pratice the cryptsetup impl mandates
this has the fixed value 4000. To avoid incompatibility apply the
same enforcement in QEMU too. This also caps the memory usage for
key material when QEMU tries to open a LUKS volume.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
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
2.37.3



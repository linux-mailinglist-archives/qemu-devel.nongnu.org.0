Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED25AE4C8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:51:35 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVEv-0004Hx-2F
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9o-0006s2-AM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9Y-0006MH-Tc
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGwR6ZrWcGMn25hLLernNMRNJa+MoDuH1rfhVyCIMXk=;
 b=jK3ZlA/8sKrul9sx1+Y0sMDlH3fLZ7TE/7Bk87Gjy7giTzbemNsZN6Dh7x3NjxxVxZ1dy7
 AJah+LIQwb7tTuoEzaTVFpbJuUU1Y0HRZzSlQm8h6fdMlZBUSINOthAWuZDxKkNB5vibfp
 44sSFfUJEbWEQbJFRnwLqPmfjuEEHC0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-N9EvR8_ENQye2xVxDn8gZA-1; Tue, 06 Sep 2022 04:41:50 -0400
X-MC-Unique: N9EvR8_ENQye2xVxDn8gZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A5729AB44F
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3160C15BB3;
 Tue,  6 Sep 2022 08:41:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 01/11] crypto: sanity check that LUKS header strings are
 NUL-terminated
Date: Tue,  6 Sep 2022 09:41:37 +0100
Message-Id: <20220906084147.1423045-2-berrange@redhat.com>
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

The LUKS spec requires that header strings are NUL-terminated, and our
code relies on that. Protect against maliciously crafted headers by
adding validation.

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
2.37.2



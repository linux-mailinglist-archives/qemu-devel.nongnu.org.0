Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB03E1800
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:30:03 +0200 (CEST)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfJq-0001Xu-NS
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIb-000755-RW
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIa-0006UI-Bd
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqCyKF1HCxanVyMGi61qjHU8auBqMoXq11OuszeJ5GY=;
 b=CXLSDkYe/4tHXsuDHEMQpHWRBXTyqhS+jSk3o9DoM3xbJNNaRjB8k83QQYtYxjcqstr0Pv
 V5ZgD1DvHWULyLN+qGmVA0eSp8DjcP/eYI5bv3PuLwlwGGwSslzstXzI7rYcZNf3SpWgpH
 OkYeWJPiloUYWu8Wn2WMbbz909C0lgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-cqOk96tZOw-uzmtMgz_aLA-1; Thu, 05 Aug 2021 11:28:42 -0400
X-MC-Unique: cqOk96tZOw-uzmtMgz_aLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD88190A7A3;
 Thu,  5 Aug 2021 15:28:41 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E395927CAA;
 Thu,  5 Aug 2021 15:28:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/12] s390x/mmu_helper: avoid setting the storage key if
 nothing changed
Date: Thu,  5 Aug 2021 17:28:00 +0200
Message-Id: <20210805152804.100333-9-david@redhat.com>
In-Reply-To: <20210805152804.100333-1-david@redhat.com>
References: <20210805152804.100333-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid setting the key if nothing changed.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 36ab4e9c81..0c2c39a970 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -301,7 +301,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
 {
     static S390SKeysClass *skeyclass;
     static S390SKeysState *ss;
-    uint8_t key;
+    uint8_t key, old_key;
     int rc;
 
     /*
@@ -337,6 +337,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
         trace_get_skeys_nonzero(rc);
         return;
     }
+    old_key = key;
 
     switch (rw) {
     case MMU_DATA_LOAD:
@@ -360,9 +361,11 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
     /* Any store/fetch sets the reference bit */
     key |= SK_R;
 
-    rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
-    if (rc) {
-        trace_set_skeys_nonzero(rc);
+    if (key != old_key) {
+        rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+        if (rc) {
+            trace_set_skeys_nonzero(rc);
+        }
     }
 }
 
-- 
2.31.1



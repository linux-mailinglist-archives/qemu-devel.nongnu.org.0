Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B353E8CF1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:11:40 +0200 (CEST)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkGx-0008OY-B7
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBc-0004Ba-7f
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBa-00088F-Pk
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628672766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koATax0ENfqN19XtTaC7VpmNCcm6q32Nu4FPP5NnrNA=;
 b=TGck/vg5AQbBWgk62UdUDcYhZSlI0X2fZmvEwh1rYpQ3jlVL8mBiFtEIRHDBZWoXwOkgYQ
 u5ue29OhKF2pxrKfRzibzrWC3sUOD7q8ArBxgyxt0O+abHN9PZnUbEFGHdMbP16ZpKymy7
 3buXJB61E/rICetDn2LhrfKUCSnRtbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-kDpek6OlPVKqq2K4cvu8Uw-1; Wed, 11 Aug 2021 05:06:03 -0400
X-MC-Unique: kDpek6OlPVKqq2K4cvu8Uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95ABC1019623;
 Wed, 11 Aug 2021 09:06:01 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEAF95B4BC;
 Wed, 11 Aug 2021 09:05:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] s390x/mmu_helper: avoid setting the storage key if
 nothing changed
Date: Wed, 11 Aug 2021 11:05:22 +0200
Message-Id: <20210811090527.30556-9-david@redhat.com>
In-Reply-To: <20210811090527.30556-1-david@redhat.com>
References: <20210811090527.30556-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index de6df928d2..e2b372efd9 100644
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



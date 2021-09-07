Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E11402A29
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:51:24 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbVT-0000ys-NQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNax0-0003R8-LH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawv-0002dB-Mv
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ig/yAAGXleUETsSBfnb26Ws7WCjlfLXvRmQkq2OaEwU=;
 b=WCBwsBmbOIrjmwh3wGddGr0DTNiUl7YYHIeSlZTV+RZPgR28vJ+0wyzaG1+0wy0vKHkrcw
 uV9IgU+84WdiuuTniAdoXZKBy/t/14KJATGnGIHuXLF8uipLpzT6XiGz5847dGDwOk8KcA
 Mjr7MIRuG32c9zaBSmvdDz83FYPkNmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-4uIyofr3NXWmAkhKun71Fg-1; Tue, 07 Sep 2021 09:15:39 -0400
X-MC-Unique: 4uIyofr3NXWmAkhKun71Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9637A800FF3;
 Tue,  7 Sep 2021 13:15:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 543C15C1B4;
 Tue,  7 Sep 2021 13:15:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/20] s390x/mmu_helper: avoid setting the storage key if
 nothing changed
Date: Tue,  7 Sep 2021 15:14:42 +0200
Message-Id: <20210907131449.493875-14-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Avoid setting the key if nothing changed.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-9-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0



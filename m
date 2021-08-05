Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730703E1809
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:31:02 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfKn-0004TP-GQ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIB-0005ZH-JV
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIA-00069s-5I
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOkajuKxB7wsdTlaDaKGGR4etEtucDQ5uqvDayD5FCo=;
 b=D/ur0Td5ai5SauFE76oQr3GDm/lOuuQGmw0JyV/uskNFBQT0Cq78eQaXYuD73x8NG0fuLG
 ufuILKISzirVbB+1IFvaX2RaY6rVaQ5cJ36XpjLQvMkF5KxfnIGlvs79iUk4CTDZMEuChV
 plD4fBz9qOqHRyfBkKHgXdksnrLXxhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-UWsckzkLPFarGjWCJbCwVg-1; Thu, 05 Aug 2021 11:28:16 -0400
X-MC-Unique: UWsckzkLPFarGjWCJbCwVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2EC81006C8B;
 Thu,  5 Aug 2021 15:28:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 192BE3CC7;
 Thu,  5 Aug 2021 15:28:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/12] s390x/tcg: wrap address for RRBE
Date: Thu,  5 Aug 2021 17:27:53 +0200
Message-Id: <20210805152804.100333-2-david@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let's wrap the address just like for SSKE and ISKE.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 21a4de4067..e0befd0f03 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2223,11 +2223,12 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t addr = wrap_address(env, r2);
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
-    if (r2 > ms->ram_size) {
+    if (addr > ms->ram_size) {
         return 0;
     }
 
@@ -2236,14 +2237,14 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
-    if (skeyclass->get_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
+    if (skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
         return 0;
     }
 
     re = key & (SK_R | SK_C);
     key &= ~SK_R;
 
-    if (skeyclass->set_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
+    if (skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
         return 0;
     }
    /*
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026904002BE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:57:48 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBZb-0003OU-2j
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXP-0000UB-AM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXL-0000AN-Ec
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+mS3O4POYnN7uAyASYwN1m7JdQo0LFcFpwPNpjhd3cs=;
 b=W5woOOzIeEF7eX2PPUcXohE1Cbf/eOaYMU3029iWA814n4Is9wEiHON/lGx1EyMSB7NSl4
 nRefCTD9VXV25mJ/2mvpik1sLqYsha2tKCABrHY8hl4i63Qqm7LP8gjQhdVS91Ti797pfh
 l9GYuaGlsZf1qtPuOk82WxSykSTEdGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-n5MmcQS3OUSSjJCutmeDog-1; Fri, 03 Sep 2021 11:55:25 -0400
X-MC-Unique: n5MmcQS3OUSSjJCutmeDog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5541180198A;
 Fri,  3 Sep 2021 15:55:24 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F70560861;
 Fri,  3 Sep 2021 15:55:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] s390x/tcg: wrap address for RRBE
Date: Fri,  3 Sep 2021 17:55:02 +0200
Message-Id: <20210903155514.44772-2-david@redhat.com>
In-Reply-To: <20210903155514.44772-1-david@redhat.com>
References: <20210903155514.44772-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Let's wrap the address just like for SSKE and ISKE.

Reviewed-by: Thomas Huth <thuth@redhat.com>
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



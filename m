Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA74002BD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:57:47 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBZb-0003Pq-0X
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXR-0000UL-2P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXN-0000D4-TU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVmrBQcqY5jBbgaTEsCI13ymxgm1ptrCnTA6JG4uFYg=;
 b=YmWK/XThUZyYpc1FZmLN/HKiy+9cmZTq9mn3DybxB7vw9nhTuNwS1pTOFR9Soc9+ktacjx
 CHkuEWZjEMujusly2SYu9KFk2z3HKsyliaiDtdd7v3IAjy41OWzaSVLQ1L71gTAzyEcenD
 rAJ5ytLWh3GJwPB15e5c+omyYmUDFTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-wHkV_z5qO8-H-XS338-LRQ-1; Fri, 03 Sep 2021 11:55:28 -0400
X-MC-Unique: wHkV_z5qO8-H-XS338-LRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1984D80198A;
 Fri,  3 Sep 2021 15:55:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B37B660861;
 Fri,  3 Sep 2021 15:55:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] s390x/tcg: fix ignoring bit 63 when setting the
 storage key in SSKE
Date: Fri,  3 Sep 2021 17:55:03 +0200
Message-Id: <20210903155514.44772-3-david@redhat.com>
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

Right now we could set an 8-bit storage key via SSKE and retrieve it
again via ISKE, which is against the architecture description:

SSKE:
"
The new seven-bit storage-key value, or selected bits
thereof, is obtained from bit positions 56-62 of gen-
eral register R 1 . The contents of bit positions 0-55
and 63 of the register are ignored.
"

ISKE:
"
The seven-bit storage key is inserted in bit positions
56-62 of general register R 1 , and bit 63 is set to zero.
"

Let's properly ignore bit 63 to create the correct seven-bit storage key.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index e0befd0f03..3c0820dd74 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2210,7 +2210,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
-    key = (uint8_t) r1;
+    key = r1 & 0xfe;
     skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
    /*
     * As we can only flush by virtual address and not all the entries
-- 
2.31.1



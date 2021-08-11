Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3873E8CDC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:09:14 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkEb-0002Uz-Kt
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBI-00038Y-M9
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBG-0007sN-44
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628672744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlLcEK4sJhfTE3pXmaG2DvF6Zr1wwk/2u/lE+zkLEJ8=;
 b=OHJ6Nz7O6zYXHKEkzHgRouvDNfLvKs1u51hA3tqRtIa7FlniOz6/11Sp58BQ04VaQqN/z/
 zK/hXeI5m90gAyRDTSg3QkMC6tXfkkHz9iGfixanhnwUrJpfYTHprtYzxKYqwpfTr9NQX/
 T64KmVRUQOla+g5zJYsS5e3gcy4hsLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-pSiXBXzgMDaAxTZpZ9_XCQ-1; Wed, 11 Aug 2021 05:05:43 -0400
X-MC-Unique: pSiXBXzgMDaAxTZpZ9_XCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB21801AE7;
 Wed, 11 Aug 2021 09:05:42 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D49B69CBA;
 Wed, 11 Aug 2021 09:05:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] s390x/tcg: convert real to absolute address for RRBE,
 SSKE and ISKE
Date: Wed, 11 Aug 2021 11:05:17 +0200
Message-Id: <20210811090527.30556-4-david@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

For RRBE, SSKE, and ISKE, we're dealing with real addresses, so we have to
convert to an absolute address first.

In the future, when adding EDAT1 support, we'll have to pay attention to
SSKE handling, as we'll be dealing with absolute addresses when the
multiple-block control is one.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3c0820dd74..dd506d8d17 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2177,6 +2177,7 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
@@ -2201,6 +2202,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return;
     }
@@ -2228,6 +2230,7 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
-- 
2.31.1



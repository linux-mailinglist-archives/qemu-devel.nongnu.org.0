Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C53E180B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:31:38 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfLN-0005pu-Ea
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIO-0006Ka-HW
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIM-0006HK-Aw
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fe3sMQ+PibUUj2YWAVnWiZ3Lvg66Qs6UCbf/dhij790=;
 b=OEXSrnXtdFYXM/MoqWviTtAVmJwrJXS1gf6fijzYU0NVRUk4SOCYt9KQHZRD18VdsFVyLW
 YBL1A9E4Kk/9KmRQH0CHx/0IChw3zd/JqQm5FwMiBTcp2Cquca1jhPzUOacWaapMDTeVdo
 xNcVw/AqbK7IrwP4x4tkxEoV0BFplJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Vl_Tlx3vMYaNcYhBhQSI7w-1; Thu, 05 Aug 2021 11:28:28 -0400
X-MC-Unique: Vl_Tlx3vMYaNcYhBhQSI7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318441006C80;
 Thu,  5 Aug 2021 15:28:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C607C3CC7;
 Thu,  5 Aug 2021 15:28:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/12] s390x/mmu_helper: no need to pass access type to
 mmu_translate_asce()
Date: Thu,  5 Aug 2021 17:27:57 +0200
Message-Id: <20210805152804.100333-6-david@redhat.com>
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

The access type is unused.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 0620b1803e..167f1b1455 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -125,7 +125,7 @@ static inline bool read_table_entry(CPUS390XState *env, hwaddr gaddr,
 
 static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
                               uint64_t asc, uint64_t asce, target_ulong *raddr,
-                              int *flags, int rw)
+                              int *flags)
 {
     const bool edat1 = (env->cregs[0] & CR0_EDAT) &&
                        s390_has_feat(S390_FEAT_EDAT);
@@ -428,7 +428,7 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
     }
 
     /* perform the DAT translation */
-    r = mmu_translate_asce(env, vaddr, asc, asce, raddr, flags, rw);
+    r = mmu_translate_asce(env, vaddr, asc, asce, raddr, flags);
     if (unlikely(r)) {
         return r;
     }
-- 
2.31.1



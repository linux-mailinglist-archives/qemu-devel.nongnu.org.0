Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E13E1716
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:38:59 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeWQ-0006V3-39
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBeVb-0005fY-Ad
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBeVY-0003ns-RE
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628174284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=991YL8eQijU1GWy+I4WkdIjaP/iev/uY2VJQ7M99Efw=;
 b=ZVAwK4KrocponFfgUG03Isbxlhf0qsdXZdwZZxdouA3InVlwXD8LnxKrzaCYvjWbbW48Dt
 Ec9KYLwXKB4e2Y45CM6t/JYXprA+7JkBuKzIQevJ61pFucymXu50icePCzGOdGzkZVSjN1
 pl5btaIFIauzUfZ6Rvt6xPQu9xba7V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-KO1qYK77NMS3xk5YAVDIxg-1; Thu, 05 Aug 2021 10:38:01 -0400
X-MC-Unique: KO1qYK77NMS3xk5YAVDIxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E401006C86;
 Thu,  5 Aug 2021 14:38:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559C51002D71;
 Thu,  5 Aug 2021 14:37:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
Date: Thu,  5 Aug 2021 16:37:53 +0200
Message-Id: <20210805143753.86520-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
"css" test, which fails with:

  FAIL: Channel Subsystem: measurement block format1: Unaligned MB origin:
  Program interrupt: expected(21) == received(0)

Because we end up not injecting an operand program exception.

Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be aligned")
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/ioinst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index 4eb0a7a9f8..bdae5090bc 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -123,7 +123,7 @@ static int ioinst_schib_valid(SCHIB *schib)
     }
     /* for MB format 1 bits 26-31 of word 11 must be 0 */
     /* MBA uses words 10 and 11, it means align on 2**6 */
-    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
+    if ((be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
         (be64_to_cpu(schib->mba) & 0x03fUL)) {
         return 0;
     }
-- 
2.31.1



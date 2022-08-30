Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DC5A6AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:34:07 +0200 (CEST)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT57m-0000Vq-HR
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u9-0006O7-OL
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u6-0005hz-HJ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661879997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWT2hJHkg+Svuv6fDzYJqfPZvRwRiMFQOkWMQKMmPYQ=;
 b=LtZCd61s19/nPDKTU9A3/UZMiRbWDzW+b0M87+LzXbP/4sRqAJHIBpF6rSm6t+Ijbzh44+
 bgvbnjGJtHH+wkXAK3mwSIiQ5L7PMpxsKwNE4JuvbdxDQfSDHtVEuTL4v7MjMV0DskI+SD
 5rGf/MP+RlensfUHiQaOXm5wryp6v94=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Q36PoTSMOCWY_VXxJ8SUcA-1; Tue, 30 Aug 2022 13:19:56 -0400
X-MC-Unique: Q36PoTSMOCWY_VXxJ8SUcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 127BB29DD990;
 Tue, 30 Aug 2022 17:19:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D13BF1121314;
 Tue, 30 Aug 2022 17:19:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 3/6] target/s390x: Fix CLFIT and CLGIT immediate size
Date: Tue, 30 Aug 2022 19:19:44 +0200
Message-Id: <20220830171947.71464-4-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

I2 is 16 bits, not 32.

Found by running valgrind's none/tests/s390x/traps.

Fixes: 1c2687518235 ("target-s390: Implement COMPARE AND TRAP")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220817161529.597414-1-iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.def | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 5e448bb2c4..6d2cfe5fa2 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -290,8 +290,8 @@
     D(0xb961, CLGRT,   RRF_c, GIE, r1_o, r2_o, 0, 0, ct, 0, 1)
     D(0xeb23, CLT,     RSY_b, MIE, r1_32u, m2_32u, 0, 0, ct, 0, 1)
     D(0xeb2b, CLGT,    RSY_b, MIE, r1_o, m2_64, 0, 0, ct, 0, 1)
-    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
-    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
+    D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_16u, 0, 0, ct, 0, 1)
+    D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_16u, 0, 0, ct, 0, 1)
 
 /* CONVERT TO DECIMAL */
     C(0x4e00, CVD,     RX_a,  Z,   r1_o, a2, 0, 0, cvd, 0)
-- 
2.31.1



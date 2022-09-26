Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A95EAE36
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:31:55 +0200 (CEST)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrxS-0000Ml-Es
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrac-0005ef-O7
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocraa-0005L3-DR
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWLDEjpESEgHVRY3YW3LdWNx205RAnX3WZY+o2JTKaE=;
 b=Nwp730Yz4A21+iZGHCTux3fwtEgOElc2t6j3c6NmkuwnUmxMkY9/EGCvoo+Oz/vhTGaHaZ
 MweRiaSXz8T5m/fjVWFXGZszY9jxh+KsgxAE+6G947bHBSQnhIi+H/xa2gdNqyFW+Iu1xG
 RnDuRInkVh0Id+qZie5HmF/j8eHdtHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-lmS6sHK1MiSfrO4UhpR4Ng-1; Mon, 26 Sep 2022 13:08:12 -0400
X-MC-Unique: lmS6sHK1MiSfrO4UhpR4Ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 283828027F5;
 Mon, 26 Sep 2022 17:08:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB577140EBF4;
 Mon, 26 Sep 2022 17:08:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org
Subject: [PULL 01/14] s390x/tcg: Fix opcode for lzrf
Date: Mon, 26 Sep 2022 19:07:51 +0200
Message-Id: <20220926170804.453855-2-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Christian Borntraeger <borntraeger@linux.ibm.com>

Fix the opcode for Load and Zero Rightmost Byte (32).

Fixes: c2a5c1d718ea ("target/s390x: Implement load-and-zero-rightmost-byte insns")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Cc: qemu-stable@nongnu.org
Message-Id: <20220914105750.767697-1-borntraeger@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.def | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 6d2cfe5fa2..6382ceabfc 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -466,7 +466,7 @@
     C(0xe39f, LAT,     RXY_a, LAT, 0, m2_32u, r1, 0, lat, 0)
     C(0xe385, LGAT,    RXY_a, LAT, 0, a2, r1, 0, lgat, 0)
 /* LOAD AND ZERO RIGHTMOST BYTE */
-    C(0xe3eb, LZRF,    RXY_a, LZRB, 0, m2_32u, new, r1_32, lzrb, 0)
+    C(0xe33b, LZRF,    RXY_a, LZRB, 0, m2_32u, new, r1_32, lzrb, 0)
     C(0xe32a, LZRG,    RXY_a, LZRB, 0, m2_64, r1, 0, lzrb, 0)
 /* LOAD LOGICAL AND ZERO RIGHTMOST BYTE */
     C(0xe33a, LLZRGF,  RXY_a, LZRB, 0, m2_32u, r1, 0, lzrb, 0)
-- 
2.31.1



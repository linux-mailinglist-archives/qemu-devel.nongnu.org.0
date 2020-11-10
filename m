Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4242AD488
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:16:32 +0100 (CET)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRdX-0004Uv-LC
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZE-00075S-Ql
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZB-0004bw-20
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=curk6aRgfvQd5PuCN+FruMdP+NuNnu3mSZJo9whc/+g=;
 b=b3iPHXUJ4cH78v+CO1w2EQXJuAYFhHdDScXutSWar0Uk7gCB2PPvn83dspAP2Yl5k68Y+r
 gIefFNQXY9psCwyeNASxKdoDEEkURlSkC3A+Jro0xRsxy/I9lmYWBVe2VvDY1/sEs5RG7y
 cy/ZifR1WO/kNgWuxva89/CpHUxDMV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-cH5ezNDoOTWTSN2gkqpOfQ-1; Tue, 10 Nov 2020 06:11:58 -0500
X-MC-Unique: cH5ezNDoOTWTSN2gkqpOfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5060A801FD4;
 Tue, 10 Nov 2020 11:11:57 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA30510013D9;
 Tue, 10 Nov 2020 11:11:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/19] fuzz: Make fork_fuzz.ld compatible with LLVM's LLD
Date: Tue, 10 Nov 2020 12:11:24 +0100
Message-Id: <20201110111132.559399-12-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

LLVM's linker, LLD, supports the keyword "INSERT AFTER", starting with
version 11.
However, when multiple sections are defined in the same "INSERT AFTER",
they are added in a reversed order, compared to BFD's LD.

This patch makes fork_fuzz.ld generic enough to work with both linkers.
Each section now has its own "INSERT AFTER" keyword, so proper ordering is
defined between the sections added.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201105221905.1350-2-dbuono@linux.vnet.ibm.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/fork_fuzz.ld | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
index bfb667ed06..cfb88b7fdb 100644
--- a/tests/qtest/fuzz/fork_fuzz.ld
+++ b/tests/qtest/fuzz/fork_fuzz.ld
@@ -16,6 +16,11 @@ SECTIONS
       /* Lowest stack counter */
       *(__sancov_lowest_stack);
   }
+}
+INSERT AFTER .data;
+
+SECTIONS
+{
   .data.fuzz_ordered :
   {
       /*
@@ -34,6 +39,11 @@ SECTIONS
        */
        *(.bss._ZN6fuzzer3TPCE);
   }
+}
+INSERT AFTER .data.fuzz_start;
+
+SECTIONS
+{
   .data.fuzz_end : ALIGN(4K)
   {
       __FUZZ_COUNTERS_END = .;
@@ -43,4 +53,4 @@ SECTIONS
  * Don't overwrite the SECTIONS in the default linker script. Instead insert the
  * above into the default script
  */
-INSERT AFTER .data;
+INSERT AFTER .data.fuzz_ordered;
-- 
2.18.4



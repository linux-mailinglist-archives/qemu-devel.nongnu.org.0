Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD522E0906
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:57:10 +0100 (CET)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfLp-0003Jz-VX
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAp-0005P5-7D
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAh-0007GY-Px
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPjVQvlEL3lQ6y46LR4PLaJOhlkPYFrnJhHVW3iTnes=;
 b=N7q/BaJHF2jm3rCXsZzNm9MgHl2/Iaas62mUk4usvix9vv8W1SeNRlO7SGj4wMRpHXznlM
 o4T/8v94kXYeQvUb7/fqpY14c1zCcgBPYSC7Zw32JqqYtSkRWfiJJK/17v+LWCDiVvAm5S
 225gJ0e5HKvVDfL478YF/xcAQhtgTWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-_v22ZTYvMJGYZs34q4kG9A-1; Tue, 22 Dec 2020 05:45:33 -0500
X-MC-Unique: _v22ZTYvMJGYZs34q4kG9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75221EC1AB;
 Tue, 22 Dec 2020 10:45:30 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E942A7BB40;
 Tue, 22 Dec 2020 10:45:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/14] s390x/pci: Fix memory_region_access_valid call
Date: Tue, 22 Dec 2020 11:45:02 +0100
Message-Id: <20201222104503.224510-14-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

In pcistb_service_handler, a call is made to validate that the memory
region can be accessed.  However, the call is made using the entire length
of the pcistb operation, which can be larger than the allowed memory
access size (8).  Since we already know that the provided buffer is a
multiple of 8, fix the call to memory_region_access_valid to iterate
over the memory region in the same way as the subsequent call to
memory_region_dispatch_write.

Fixes: 863f6f52b7 ("s390: implement pci instructions")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Pierre Morel <pmorel@linux.ibm.com>
Message-Id: <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index e23029399886..76b08a39a738 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
 
-    if (!memory_region_access_valid(mr, offset, len, true,
-                                    MEMTXATTRS_UNSPECIFIED)) {
-        s390_program_interrupt(env, PGM_OPERAND, ra);
-        return 0;
+    for (i = 0; i < len; i += 8) {
+        if (!memory_region_access_valid(mr, offset + i, 8, true,
+                                        MEMTXATTRS_UNSPECIFIED)) {
+            s390_program_interrupt(env, PGM_OPERAND, ra);
+            return 0;
+        }
     }
 
     if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
-- 
2.26.2



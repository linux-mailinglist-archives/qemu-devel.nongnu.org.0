Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EB2AD552
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:34:42 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRv7-000460-VC
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZa-0007nG-TK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZZ-0004iP-35
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=2E78a2o1zPurh5hsMhbsPrbEGz5NSDXCiYG6NizuyBY=;
 b=SGlEqkBSJJiFgZlmtWcfG4Vv/RHLbH0b1JBrCIb6oh5plFHAh5sP+Nd9Jp7RR0PJSuSIwy
 eU9ObUl6TfNyMGUkNP6jdq+yVVDd3pLpDTTyewMKaCabfJjt5cdeX4J5XFqIkfUAhHlyzb
 CsdHRhyXCBNRSqxZLAeuOHXXv+31+GQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-gykdH1yPPo2Fhx_9NSnVBg-1; Tue, 10 Nov 2020 06:12:22 -0500
X-MC-Unique: gykdH1yPPo2Fhx_9NSnVBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE14C107466B;
 Tue, 10 Nov 2020 11:12:20 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3503310013D9;
 Tue, 10 Nov 2020 11:12:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 19/19] s390x: Avoid variable size warning in ipl.h
Date: Tue, 10 Nov 2020 12:11:32 +0100
Message-Id: <20201110111132.559399-20-thuth@redhat.com>
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

S390IPLState contains two IplParameterBlock, which may in turn have
either a IPLBlockPV or a IplBlockFcp, both ending with a variable
sized field (an array).

This causes a warning with clang 11 or greater, which checks that
variable sized type are only allocated at the end of the struct:

In file included from ../qemu-cfi-v3/target/s390x/diag.c:21:
../qemu-cfi-v3/hw/s390x/ipl.h:161:23: error: field 'iplb' with variable sized type 'IplParameterBlock' (aka 'union IplParameterBlock') not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
    IplParameterBlock iplb;
                      ^
../qemu-cfi-v3/hw/s390x/ipl.h:162:23: error: field 'iplb_pv' with variable sized type 'IplParameterBlock' (aka 'union IplParameterBlock') not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
    IplParameterBlock iplb_pv;

In this case, however, the warning is a false positive, because
IPLBlockPV and IplBlockFcp are allocated in a union wrapped at 4K,
making the union non-variable sized.

Fix the warning by turning the two variable sized arrays into arrays
of size 0. This avoids the compiler error and should produce the
same code.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201105221905.1350-5-dbuono@linux.vnet.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index 9e90169695..dfc6dfd89c 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -32,7 +32,7 @@ struct IPLBlockPV {
     uint32_t num_comp;          /* 0x74 */
     uint64_t pv_header_addr;    /* 0x78 */
     uint64_t pv_header_len;     /* 0x80 */
-    struct IPLBlockPVComp components[];
+    struct IPLBlockPVComp components[0];
 } QEMU_PACKED;
 typedef struct IPLBlockPV IPLBlockPV;
 
@@ -63,7 +63,7 @@ struct IplBlockFcp {
     uint64_t br_lba;
     uint32_t scp_data_len;
     uint8_t  reserved6[260];
-    uint8_t  scp_data[];
+    uint8_t  scp_data[0];
 } QEMU_PACKED;
 typedef struct IplBlockFcp IplBlockFcp;
 
-- 
2.18.4



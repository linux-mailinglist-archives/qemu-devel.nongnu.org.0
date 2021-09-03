Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD64002F6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:08:04 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBjX-0004ZY-Jl
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBY0-0001vw-6q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXx-0000lc-Ai
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvXtWV7uKYaC3yADNUWplnYXFVfQJU9iG6ABZ6uLVG4=;
 b=ZgcXSBjGQsRFosVdWUDRn0YLHqhbcFNd3Vm53+LWeV4oKs97bA5FXl2XOEVV/FEA+LhREx
 fnXoCgFcSROCLUNcGfZ185X0/bvI5xCpBM04UaH3tCCR6NFbYizZIar8jDtYE1oPIb1m4/
 cvIuMASx9goStSbZ+Ua0fwxAKSDLJBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-t75P-Ij6OVGJhqvYr_fPrw-1; Fri, 03 Sep 2021 11:56:03 -0400
X-MC-Unique: t75P-Ij6OVGJhqvYr_fPrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 005076D4E0;
 Fri,  3 Sep 2021 15:56:02 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC4E6608B;
 Fri,  3 Sep 2021 15:55:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] hw/s390x/s390-skeys: check if an address is valid
 before dumping the key
Date: Fri,  3 Sep 2021 17:55:12 +0200
Message-Id: <20210903155514.44772-12-david@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

Let's validate the given address and report a proper error in case it's
not. All call paths now properly check the validity of the given GFN.
Remove the TODO.

The errors inside the getter and setter should only trigger if something
really goes wrong now, for example, with a broken migration stream. Or
when we forget to update the storage key allocation with memory hotplug.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-skeys.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 56a47fe180..db73e9091d 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -18,6 +18,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
 #include "sysemu/memory_mapping.h"
+#include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "migration/qemu-file-types.h"
 #include "migration/register.h"
@@ -86,6 +87,13 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    if (!address_space_access_valid(&address_space_memory,
+                                    addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
+                                    false, MEMTXATTRS_UNSPECIFIED)) {
+        monitor_printf(mon, "Error: The given address is not valid\n");
+        return;
+    }
+
     r = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
     if (r < 0) {
         monitor_printf(mon, "Error: %s\n", strerror(-r));
@@ -197,11 +205,6 @@ static int qemu_s390_skeys_enabled(S390SKeysState *ss)
     return 1;
 }
 
-/*
- * TODO: for memory hotplug support qemu_s390_skeys_set and qemu_s390_skeys_get
- * will have to make sure that the given gfn belongs to a memory region and not
- * a memory hole.
- */
 static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
                               uint64_t count, uint8_t *keys)
 {
-- 
2.31.1



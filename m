Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF44029F4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:42:14 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbMb-0002Rf-Rz
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNax6-0003kD-K4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNax0-0002fN-RA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32PbFx+XofcWLaJy/lllawIl0VH7OwNuARAzOtwLEL4=;
 b=Cv1cyRsNvOdMBQjTxWgvrcIooOiK5dtECBVL2Ets5JQVOoyqsFV38Bw+z79PZ2LD15AWN9
 KVFpBCKMYdafw6gyGu0uHnksZLaH7w2VfAXdyrXf+5AbS2HEmRjknPOgeKn5qLoXxKa/ol
 5NwBepNW4+PKHl2jLUVHeXisMlGTqm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-UVIIzyf6P4mRBNh7CCmApQ-1; Tue, 07 Sep 2021 09:15:44 -0400
X-MC-Unique: UVIIzyf6P4mRBNh7CCmApQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86ECE80196C;
 Tue,  7 Sep 2021 13:15:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA155C1B4;
 Tue,  7 Sep 2021 13:15:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/20] hw/s390x/s390-skeys: check if an address is valid before
 dumping the key
Date: Tue,  7 Sep 2021 15:14:45 +0200
Message-Id: <20210907131449.493875-17-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's validate the given address and report a proper error in case it's
not. All call paths now properly check the validity of the given GFN.
Remove the TODO.

The errors inside the getter and setter should only trigger if something
really goes wrong now, for example, with a broken migration stream. Or
when we forget to update the storage key allocation with memory hotplug.

Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-12-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0



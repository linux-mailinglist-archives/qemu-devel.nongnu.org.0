Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3C65FCBF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi69-0002XC-9O; Fri, 06 Jan 2023 03:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi67-0002X0-60
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi65-0005VB-Fl
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xl/kPsma4+CokXD027GgAKWxG1Cp4Q3btDYha9T9ayI=;
 b=YdjABc7uQ8x9lJR7aShyNC6mLBp4dGds9YoC/AYI9Hdh5406l5MHOeLo68YKkOUaghnGnS
 V3p3FkPyspyWHA3/O4ILdedUM0MDfdZAdFGXdgoDwtoqhP5ODxouAdmYZqHyk+zXmkNwfn
 HqzLikdx40yB87E/mwazaaRXDXsriJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-abkVrsUKMc-LIQeczTJrTQ-1; Fri, 06 Jan 2023 03:29:02 -0500
X-MC-Unique: abkVrsUKMc-LIQeczTJrTQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0C9183B3C8;
 Fri,  6 Jan 2023 08:29:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71357492B06;
 Fri,  6 Jan 2023 08:29:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 04/15] exec/memory: Expose memory_region_access_valid()
Date: Fri,  6 Jan 2023 09:28:42 +0100
Message-Id: <20230106082853.31787-5-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Instead of having hardware device poking into memory
internal API, expose memory_region_access_valid().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217152454.96388-2-philmd@linaro.org>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/memory-internal.h | 4 ----
 include/exec/memory.h          | 4 ++++
 hw/s390x/s390-pci-inst.c       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 9fcc2af25c..100c1237ac 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -38,10 +38,6 @@ void flatview_unref(FlatView *view);
 
 extern const MemoryRegionOps unassigned_mem_ops;
 
-bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
-                                unsigned size, bool is_write,
-                                MemTxAttrs attrs);
-
 void flatview_add_to_dispatch(FlatView *fv, MemoryRegionSection *section);
 AddressSpaceDispatch *address_space_dispatch_new(FlatView *fv);
 void address_space_dispatch_compact(AddressSpaceDispatch *d);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..c37ffdbcd1 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2442,6 +2442,10 @@ void memory_global_dirty_log_stop(unsigned int flags);
 
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled);
 
+bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
+                                unsigned size, bool is_write,
+                                MemTxAttrs attrs);
+
 /**
  * memory_region_dispatch_read: perform a read directly to the specified
  * MemoryRegion.
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 9abe95130c..2eee5db7e1 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memop.h"
-#include "exec/memory-internal.h"
+#include "exec/memory.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
-- 
2.31.1



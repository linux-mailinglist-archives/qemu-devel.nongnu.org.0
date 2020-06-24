Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65E207194
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:54:54 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo33N-0007qb-FU
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zf-0000ul-PL
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zd-0001Eq-Ow
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9Je4/GAg4SH4ewN1aBvGsdOoDw32X/9E7go6c+n/Uk=;
 b=P4kEQ2GVdxnpqEc7t4t7oFQEvCTa624bS6vQu0NJHsHMG/xjg/6Sz739SRd+RT+fvzrXFh
 j6/+wBGIkh9y6Hro4RrSaqvmrQDwfYsdxeHfPLd94TrjolNNt8CNTdcsJZumhES7Jm8Ygg
 +hShBOZgW31fkqyjmEiveEmZsAC3Y44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-lDTrkSTPPcC5AwSzj00fzA-1; Wed, 24 Jun 2020 06:50:58 -0400
X-MC-Unique: lDTrkSTPPcC5AwSzj00fzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D325A87950F;
 Wed, 24 Jun 2020 10:50:57 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883681DC;
 Wed, 24 Jun 2020 10:50:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/31] memory: Revert "memory: accept mismatching sizes in
 memory_region_access_valid"
Date: Wed, 24 Jun 2020 06:50:22 -0400
Message-Id: <20200624105048.375353-5-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

Memory API documentation documents valid .min_access_size and .max_access_size
fields and explains that any access outside these boundaries is blocked.

This is what devices seem to assume.

However this is not what the implementation does: it simply
ignores the boundaries unless there's an "accepts" callback.

Naturally, this breaks a bunch of devices.

Revert to the documented behaviour.

Devices that want to allow any access can just drop the valid field,
or add the impl field to have accesses converted to appropriate
length.

Cc: qemu-stable@nongnu.org
Reviewed-by: Richard Henderson <rth@twiddle.net>
Fixes: CVE-2020-13754
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842363
Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_access_valid")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20200610134731.1514409-1-mst@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 memory.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/memory.c b/memory.c
index 2f15a4b250..9200b20130 100644
--- a/memory.c
+++ b/memory.c
@@ -1352,35 +1352,24 @@ bool memory_region_access_valid(MemoryRegion *mr,
                                 bool is_write,
                                 MemTxAttrs attrs)
 {
-    int access_size_min, access_size_max;
-    int access_size, i;
-
-    if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
+    if (mr->ops->valid.accepts
+        && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
         return false;
     }
 
-    if (!mr->ops->valid.accepts) {
-        return true;
-    }
-
-    access_size_min = mr->ops->valid.min_access_size;
-    if (!mr->ops->valid.min_access_size) {
-        access_size_min = 1;
+    if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
+        return false;
     }
 
-    access_size_max = mr->ops->valid.max_access_size;
+    /* Treat zero as compatibility all valid */
     if (!mr->ops->valid.max_access_size) {
-        access_size_max = 4;
+        return true;
     }
 
-    access_size = MAX(MIN(size, access_size_max), access_size_min);
-    for (i = 0; i < size; i += access_size) {
-        if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
-                                    is_write, attrs)) {
-            return false;
-        }
+    if (size > mr->ops->valid.max_access_size
+        || size < mr->ops->valid.min_access_size) {
+        return false;
     }
-
     return true;
 }
 
-- 
2.26.2




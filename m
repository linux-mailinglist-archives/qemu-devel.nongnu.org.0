Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C46207C00
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:06:55 +0200 (CEST)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joAjW-0003Su-2w
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1joAcr-0002RJ-J6
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:00:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46782
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1joAcp-0004Kx-J8
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593025198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar9EPNnW2UkZsgMWjVnCcQt7kxez+sGtf7BypjVxH9s=;
 b=WlrtY/h7KRBgqD1/lqeUIx/1G6pAK1ORIRPVcxyqpiVK1Q7R7EmkrqF1vEPmGLlxBRQMBI
 I+1cGDxIcF3rezYnSL/P2Qt4vurCHP5zQrTWHI7EDgonfmp5YGEhp0uGOKCqmOe0Xj7b/m
 PHdI2zRRzPc091BtgnuJ5ye4jvuYmXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-Xg_17yIGNF-pbuJlylgdmQ-1; Wed, 24 Jun 2020 14:58:43 -0400
X-MC-Unique: Xg_17yIGNF-pbuJlylgdmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2DB107ACF8;
 Wed, 24 Jun 2020 18:58:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CC871660;
 Wed, 24 Jun 2020 18:58:38 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 9/9] memory: assert MemoryRegionOps callbacks are defined
Date: Thu, 25 Jun 2020 00:25:23 +0530
Message-Id: <20200624185523.762240-10-ppandit@redhat.com>
In-Reply-To: <20200624185523.762240-1-ppandit@redhat.com>
References: <20200624185523.762240-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

When registering a MemoryRegionOps object, assert that its
read/write callback methods are defined. This avoids potential
guest crash via a NULL pointer dereference.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 memory.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

Update v2: assert read/write_with_attrs methods
  -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg05717.html

diff --git a/memory.c b/memory.c
index 2f15a4b250..3d635a1bca 100644
--- a/memory.c
+++ b/memory.c
@@ -1496,7 +1496,13 @@ void memory_region_init_io(MemoryRegion *mr,
                            uint64_t size)
 {
     memory_region_init(mr, owner, name, size);
-    mr->ops = ops ? ops : &unassigned_mem_ops;
+    if (ops) {
+        assert(ops->read || ops->read_with_attrs);
+        assert(ops->write || ops->write_with_attrs);
+        mr->ops = ops;
+    } else {
+        mr->ops = &unassigned_mem_ops;
+    }
     mr->opaque = opaque;
     mr->terminates = true;
 }
@@ -1674,6 +1680,8 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
 {
     Error *err = NULL;
     assert(ops);
+    assert(ops->read || ops->read_with_attrs);
+    assert(ops->write || ops->write_with_attrs);
     memory_region_init(mr, owner, name, size);
     mr->ops = ops;
     mr->opaque = opaque;
-- 
2.26.2



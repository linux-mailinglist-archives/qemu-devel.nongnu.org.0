Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2904A59BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:16:23 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqD0-0007an-HO
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nEq7J-0003JU-6U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nEq7H-0002h8-6Y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4BJ3S9+/yiTVZGQuOc6Fj6a9ivKYCqgLrKm+3RnLxic=;
 b=S66zgSbrkbfBPRlotZnjOCPfVpLplziMhMYhcpgs8yL+queWs5GGPqa/N8PpDa/C0Pf6Df
 Lb20KSFKEoAa89JyODGzS5GanY1ZXozJuDinMX8qqGkVxk5huNdp/d/iI6e3gKYlitinSo
 tK6qb44CitjHdem6V0K5ZG8S87qUu6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-48b7gPDPP0Stj8ZU9iwLVQ-1; Tue, 01 Feb 2022 05:10:25 -0500
X-MC-Unique: 48b7gPDPP0Stj8ZU9iwLVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF1B283DD27;
 Tue,  1 Feb 2022 10:10:23 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD02A66E26;
 Tue,  1 Feb 2022 10:09:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Make memory_region_readd_subregion() properly handle
 mapped aliases
Date: Tue,  1 Feb 2022 11:09:40 +0100
Message-Id: <20220201100940.47788-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_readd_subregion() wants to readd a region by first
removing it and then readding it. For readding, it doesn't use one of
the memory_region_add_*() variants, which is why fail to re-increment the
mr->mapped_via_alias counters, resulting in the
assert(alias->mapped_via_alias >= 0) in memory_region_del_subregion()
triggering the next time we call memory_region_readd_subregion().

Fix it by using memory_region_add_subregion_common() for readding the
region.

Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed when mapped via an alias")
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 678dc62f06..76bb1677fe 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
         memory_region_transaction_begin();
         memory_region_ref(mr);
         memory_region_del_subregion(container, mr);
-        mr->container = container;
-        memory_region_update_container_subregions(mr);
+        memory_region_add_subregion_common(container, mr->addr, mr);
         memory_region_unref(mr);
         memory_region_transaction_commit();
     }
-- 
2.34.1



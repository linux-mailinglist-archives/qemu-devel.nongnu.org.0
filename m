Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258403015F5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:38:06 +0100 (CET)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K3B-0003wD-7V
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxB-0003UV-8l
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwu-0005ny-BV
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJoJqcVD0FeihSpvSKdIlKLidD1YQnN95uh2EZwyz5A=;
 b=ULYThxNq9jFoHRLeaAMbrdjP/QNnoEg24Yi4N+JEXun9Ri/uLRtLIRK0dkPvzuwksEP0I4
 6pF0tzuno4SjVj7nKYmxmsKAVXxyAfWyQR/DPGnJSrCz0OHQhksm6k3gE1gdFG4ASY78h8
 tBnheFX08de+RC7BNtVT4GM9a0hCISE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-b_eIwO2KO9WZnVZzUB9tsQ-1; Sat, 23 Jan 2021 09:31:33 -0500
X-MC-Unique: b_eIwO2KO9WZnVZzUB9tsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D04B1005586;
 Sat, 23 Jan 2021 14:31:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125AB5D9CC;
 Sat, 23 Jan 2021 14:31:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/31] softmmu/physmem: Silence GCC 10 maybe-uninitialized error
Date: Sat, 23 Jan 2021 09:31:03 -0500
Message-Id: <20210123143128.1167797-7-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building with GCC 10.2 configured with --extra-cflags=-Os, we get:

  softmmu/physmem.c: In function 'address_space_translate_for_iotlb':
  softmmu/physmem.c:643:26: error: 'notifier' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    643 |         notifier->active = true;
        |                          ^
  softmmu/physmem.c:608:23: note: 'notifier' was declared here
    608 |     TCGIOMMUNotifier *notifier;
        |                       ^~~~~~~~

Initialize 'notifier' to silence the warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210117170411.4106949-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5..cdcd197656 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
      * when the IOMMU tells us the mappings we've cached have changed.
      */
     MemoryRegion *mr = MEMORY_REGION(iommu_mr);
-    TCGIOMMUNotifier *notifier;
+    TCGIOMMUNotifier *notifier = NULL;
     int i;
 
     for (i = 0; i < cpu->iommu_notifiers->len; i++) {
-- 
2.26.2




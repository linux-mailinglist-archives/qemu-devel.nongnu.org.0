Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8C4029E7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:40:35 +0200 (CEST)
Received: from localhost ([::1]:39834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbL0-0005un-Rj
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawm-0003GI-Sb
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawi-0002Ul-FA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgxDINm2GHEMZcqKoxv3s7LaM40WtOIzvvw9zQeKW0E=;
 b=ftZgihfBbKIj6j0UKiL1ngudWn1qlYcY0plSMghr+HBMPLewhRjBSysnx3aCrMwSNC1tln
 VknsLG+8nKbH490KEYiDofYVrXRvWfIlIjjXgVyqSfMaJ43TaICKUsEPsPnfEF5MF82pNR
 +Zyt/JH5yg/mL3OK0FsWRni5xdI1XC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-5n07UVy-NmevGgOsGZlESw-1; Tue, 07 Sep 2021 09:15:24 -0400
X-MC-Unique: 5n07UVy-NmevGgOsGZlESw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A97102CB6F;
 Tue,  7 Sep 2021 13:15:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D62E5C1B4;
 Tue,  7 Sep 2021 13:15:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/20] s390x/tcg: convert real to absolute address for RRBE,
 SSKE and ISKE
Date: Tue,  7 Sep 2021 15:14:37 +0200
Message-Id: <20210907131449.493875-9-thuth@redhat.com>
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

For RRBE, SSKE, and ISKE, we're dealing with real addresses, so we have to
convert to an absolute address first.

In the future, when adding EDAT1 support, we'll have to pay attention to
SSKE handling, as we'll be dealing with absolute addresses when the
multiple-block control is one.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-4-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3c0820dd74..dd506d8d17 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2177,6 +2177,7 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
@@ -2201,6 +2202,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return;
     }
@@ -2228,6 +2230,7 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
+    addr = mmu_real2abs(env, addr);
     if (addr > ms->ram_size) {
         return 0;
     }
-- 
2.27.0



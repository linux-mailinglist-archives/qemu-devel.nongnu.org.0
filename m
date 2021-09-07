Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4C402A0B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:45:35 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbPq-0000kk-PW
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawp-0003HY-6W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawl-0002Ud-Ig
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IvV6nEVbiIc1PJLQDa/7CVFhHsA7w/2ifB/3BOUZ6b0=;
 b=L4BkRdJIkBoIbSs661W1D1hHPH4nmm0AlmaOMwDUI/qhYj9jAQp/4SClf7gKgKscwaVihv
 SSJp6zd2y8oPUjIM6pJ/42fWTvAzvGDSVRBZnl515uu4Ox9FM4CQSpZqR+a7L2k00DPD2I
 /WM5QEMsX+1Ob1ye0u9gWYJHIWB4+cA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-J5wLMFHqPKSv1zWUz4xgrg-1; Tue, 07 Sep 2021 09:15:21 -0400
X-MC-Unique: J5wLMFHqPKSv1zWUz4xgrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C52107ACED;
 Tue,  7 Sep 2021 13:15:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67B8D5C1B4;
 Tue,  7 Sep 2021 13:15:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/20] s390x/tcg: wrap address for RRBE
Date: Tue,  7 Sep 2021 15:14:35 +0200
Message-Id: <20210907131449.493875-7-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Let's wrap the address just like for SSKE and ISKE.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-2-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 21a4de4067..e0befd0f03 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2223,11 +2223,12 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t addr = wrap_address(env, r2);
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
-    if (r2 > ms->ram_size) {
+    if (addr > ms->ram_size) {
         return 0;
     }
 
@@ -2236,14 +2237,14 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
-    if (skeyclass->get_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
+    if (skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
         return 0;
     }
 
     re = key & (SK_R | SK_C);
     key &= ~SK_R;
 
-    if (skeyclass->set_skeys(ss, r2 / TARGET_PAGE_SIZE, 1, &key)) {
+    if (skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
         return 0;
     }
    /*
-- 
2.27.0



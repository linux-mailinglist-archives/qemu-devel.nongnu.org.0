Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC62B5C85
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:03:02 +0100 (CET)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexpF-000172-Dl
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkU-0003Wy-I3
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkS-0003We-Qa
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=BZEG4W+EcU2ZPgJac6qWwUr/0t43j26tSCn7gDFtKkY=;
 b=NSTqXKsCCfeDZEffDkrMCZYua5xvVhjEPkg+O9Y9ASVjqiLae/64E7JY3/omx28d80yB5U
 Yx0Apivja6lVzSvsS42xoKwFSSZpCnSbmS+mXhkwLtTVRPLQ5cyC1H8HvlXItIgTrc5Prd
 01W5im0KZI8lT9cIRI9S9myH6/I4kVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-4NPFRHJmMfuqtcwF2WgNTQ-1; Tue, 17 Nov 2020 04:58:01 -0500
X-MC-Unique: 4NPFRHJmMfuqtcwF2WgNTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A16451882FA8;
 Tue, 17 Nov 2020 09:58:00 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6496D5B4BF;
 Tue, 17 Nov 2020 09:57:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/12] target/microblaze: Fix possible array out of bounds in
 mmu_write()
Date: Tue, 17 Nov 2020 10:57:43 +0100
Message-Id: <20201117095748.122371-8-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

The size of env->mmu.regs is 3, but the range of 'rn' is [0, 5].
To avoid data access out of bounds, only if 'rn' is less than 3, we
can print env->mmu.regs[rn]. In other cases, we can print
env->mmu.regs[MMU_R_TLBX].

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <5FA10ABA.1080109@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/microblaze/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 2baaef7545..1e426963ba 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -234,7 +234,8 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
     unsigned int i;
 
     qemu_log_mask(CPU_LOG_MMU,
-                  "%s rn=%d=%x old=%x\n", __func__, rn, v, env->mmu.regs[rn]);
+                  "%s rn=%d=%x old=%x\n", __func__, rn, v,
+                  rn < 3 ? env->mmu.regs[rn] : env->mmu.regs[MMU_R_TLBX]);
 
     if (cpu->cfg.mmu < 2 || !cpu->cfg.mmu_tlb_access) {
         qemu_log_mask(LOG_GUEST_ERROR, "MMU access on MMU-less system\n");
-- 
2.18.4



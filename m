Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B333E06B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:22:28 +0100 (CET)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH91-000659-9u
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2h-0005dn-ST
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2a-0003WB-2Z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsN4/rvHHU48Yr6aQ62htF/9dKQLdus/U7a075wQNHE=;
 b=ZoqjnNv/mWRf74xi7UiL7TCizhC2NybQOvzS1kyq9Ihnp3jtBFVZNytGmcryLi4IXUE9Ln
 /FFRqPL4vRlU1+A+dgpmKoDxXow/UavDv2WeSWr+h1PEmITgts+G9xlscVgbD8EU8N/tQH
 wpBUVFeA9A5q8+1kMyaTe32fEd/fI0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-bNsMNdJhNMSs8l4nwOwlaQ-1; Tue, 16 Mar 2021 17:15:44 -0400
X-MC-Unique: bNsMNdJhNMSs8l4nwOwlaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD01183DD21
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BED150331
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] Revert "accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot"
Date: Tue, 16 Mar 2021 17:15:28 -0400
Message-Id: <20210316211531.1649909-14-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This reverts commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb.
Thomas Huth reported a failure with CentOS 6 guests:

../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 37b0a1861e..b6d9f92f15 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -673,10 +673,6 @@ out:
 #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
 #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
 
-/*
- * As the granule of kvm dirty log is qemu_real_host_page_size,
- * @start and @size are expected and restricted to align to it.
- */
 static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
                                   uint64_t size)
 {
@@ -686,9 +682,6 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
-    /* Make sure start and size are qemu_real_host_page_size aligned */
-    assert(QEMU_IS_ALIGNED(start | size, psize));
-
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.26.2




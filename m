Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C79476E16
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:48:36 +0100 (CET)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnNL-0007FZ-Bu
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJu-0004LV-B0
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJq-0001KV-4v
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNijh0j14IXrFAhUPvLrmPRgcHlgDJ2ynjAxSWO21+E=;
 b=V3BNs5SbzVy8wTGhhw2K7TT8xTigh3jstTw2GVwg25ZW9bk6ehSvmwEXXNcF4cG6oWgSbr
 1YPFMPkrp5Iml4cx/Yg1Nrhvxi3lntBq4ddxFavcdGcAuB0/wxjCjNoi81uYpW/c0RVJL3
 YA3mTbt7RXoEMM9EUh34KBKZ1+szgUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-mekszwF5MTyag_RB7pA6Fw-1; Thu, 16 Dec 2021 04:44:53 -0500
X-MC-Unique: mekszwF5MTyag_RB7pA6Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B468D1934105;
 Thu, 16 Dec 2021 09:44:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DE110A403A;
 Thu, 16 Dec 2021 09:44:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] s390: kvm: adjust diag318 resets to retain data
Date: Thu, 16 Dec 2021 10:44:40 +0100
Message-Id: <20211216094447.58496-2-thuth@redhat.com>
In-Reply-To: <20211216094447.58496-1-thuth@redhat.com>
References: <20211216094447.58496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Collin Walling <walling@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Collin Walling <walling@linux.ibm.com>

The CPNC portion of the diag318 data is erroneously reset during an
initial CPU reset caused by SIGP. Let's go ahead and relocate the
diag318_info field within the CPUS390XState struct such that it is
only zeroed during a clear reset. This way, the CPNC will be retained
for each VCPU in the configuration after the diag318 instruction
has been invoked.

The s390_machine_reset code already takes care of zeroing the diag318
data on VM resets, which also cover resets caused by diag308.

Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Collin Walling <walling@linux.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Message-Id: <20211117152303.627969-1-walling@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.h     | 4 ++--
 target/s390x/kvm/kvm.c | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index ca3845d023..a75e559134 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -63,6 +63,8 @@ struct CPUS390XState {
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
 
+    uint64_t diag318_info;
+
     /* Fields up to this point are not cleared by initial CPU reset */
     struct {} start_initial_reset_fields;
 
@@ -118,8 +120,6 @@ struct CPUS390XState {
     uint16_t external_call_addr;
     DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
 
-    uint64_t diag318_info;
-
 #if !defined(CONFIG_USER_ONLY)
     uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
     int tlb_fill_exc;        /* exception number seen during tlb_fill */
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..6acf14d5ec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
         env->diag318_info = diag318_info;
         cs->kvm_run->s.regs.diag318 = diag318_info;
         cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+        /*
+         * diag 318 info is zeroed during a clear reset and
+         * diag 308 IPL subcodes.
+         */
     }
 }
 
-- 
2.27.0



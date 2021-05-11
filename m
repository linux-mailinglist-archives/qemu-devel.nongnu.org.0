Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1437A23B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:35:13 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNrE-0007ks-Aq
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX5-0001ze-4m
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWn-0000mr-TX
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZPB9N2t2OCORPbxCO45ezCsscidVXSXm5nHDcqgm6M=;
 b=hZSAguOL/7p1Y6IKEuB4fjRMfNbSLjeFh3AOeG9ftLEsUXuWDOlfbcGYWlYnaVcFYds17d
 PaFexnTnAE3his7HoSaeFekzoTILhhNOeOh2JDf+ecTdHU5AFWT44PZiMOg0DN9g4JjN0F
 61lNzYXIsSxbPsXzZu4tN28WnzjWHwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-QxBQww7lMkeSAi-V00JfWw-1; Tue, 11 May 2021 04:14:03 -0400
X-MC-Unique: QxBQww7lMkeSAi-V00JfWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E9C98189C6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D73C6E407
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] target/i386: merge SVM_NPTEXIT_* with PF_ERROR_*
 constants
Date: Tue, 11 May 2021 04:13:39 -0400
Message-Id: <20210511081350.419428-23-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

They are the same value, and are so by design.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/svm.h                    |  5 -----
 target/i386/tcg/sysemu/excp_helper.c | 10 +++++-----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/i386/svm.h b/target/i386/svm.h
index ae30fc6f79..b515b5ced4 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -137,11 +137,6 @@
 #define SVM_NPT_NXE         (1 << 2)
 #define SVM_NPT_PSE         (1 << 3)
 
-#define SVM_NPTEXIT_P       (1ULL << 0)
-#define SVM_NPTEXIT_RW      (1ULL << 1)
-#define SVM_NPTEXIT_US      (1ULL << 2)
-#define SVM_NPTEXIT_RSVD    (1ULL << 3)
-#define SVM_NPTEXIT_ID      (1ULL << 4)
 #define SVM_NPTEXIT_GPA     (1ULL << 32)
 #define SVM_NPTEXIT_GPT     (1ULL << 33)
 
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 1fcac51a32..7697fa4adc 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -205,17 +205,17 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
     return pte + page_offset;
 
  do_fault_rsvd:
-    exit_info_1 |= SVM_NPTEXIT_RSVD;
+    exit_info_1 |= PG_ERROR_RSVD_MASK;
  do_fault_protect:
-    exit_info_1 |= SVM_NPTEXIT_P;
+    exit_info_1 |= PG_ERROR_P_MASK;
  do_fault:
     x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
                  gphys);
-    exit_info_1 |= SVM_NPTEXIT_US;
+    exit_info_1 |= PG_ERROR_U_MASK;
     if (access_type == MMU_DATA_STORE) {
-        exit_info_1 |= SVM_NPTEXIT_RW;
+        exit_info_1 |= PG_ERROR_W_MASK;
     } else if (access_type == MMU_INST_FETCH) {
-        exit_info_1 |= SVM_NPTEXIT_ID;
+        exit_info_1 |= PG_ERROR_I_D_MASK;
     }
     if (prot) {
         exit_info_1 |= SVM_NPTEXIT_GPA;
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098F5A6B70
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:56:59 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT5Tt-0007x2-8Z
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uN-0006Rh-A6
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u9-0005iu-JA
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661880000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMppPlGTIdS9SRAKUhai0VSJ9OsNB1b3noyyc4GaZZs=;
 b=FKOQSU67cIPh9MAWNe/FpF6ZuGGfyYIkvH3EsnnJGmYrrDOWqkft+jfJJR6oKXZp/sMQoU
 F1FRHpe2AzroWqYfAHmamThZW5kpnN3GB/TZNCcBMw8FaMBk36AHq+Rg91r8jDCqfnx6ve
 W1VzAQUCpe/R2rHgZdii+osTZRLoilE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-7DTSjoSvM5WNyYtq2tbyYQ-1; Tue, 30 Aug 2022 13:19:55 -0400
X-MC-Unique: 7DTSjoSvM5WNyYtq2tbyYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86D6080A0C2;
 Tue, 30 Aug 2022 17:19:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D13D1121314;
 Tue, 30 Aug 2022 17:19:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 2/6] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
Date: Tue, 30 Aug 2022 19:19:43 +0200
Message-Id: <20220830171947.71464-3-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@linux.ibm.com>

Add stfle 197 (processor-activity-instrumentation extension 1) to the
gen16 default model and fence it off for 7.1 and older.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220727135120.12784-1-borntraeger@linux.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu_features_def.h.inc | 1 +
 hw/s390x/s390-virtio-ccw.c          | 1 +
 target/s390x/gen-features.c         | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index 3603e5fb12..e3cfe63735 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -114,6 +114,7 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decima
 DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility")
 DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
 DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility")
+DEF_FEAT(PAIE, "paie", STFL, 197, "Processor-Activity-Instrumentation extension-1")
 
 /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
 DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index bf1b36d824..9a2467c889 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -804,6 +804,7 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
     ccw_machine_7_2_instance_options(machine);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index ad140184b9..1558c52626 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -575,6 +575,7 @@ static uint16_t full_GEN16_GA1[] = {
     S390_FEAT_BEAR_ENH,
     S390_FEAT_RDP,
     S390_FEAT_PAI,
+    S390_FEAT_PAIE,
 };
 
 
@@ -669,6 +670,7 @@ static uint16_t default_GEN16_GA1[] = {
     S390_FEAT_BEAR_ENH,
     S390_FEAT_RDP,
     S390_FEAT_PAI,
+    S390_FEAT_PAIE,
 };
 
 /* QEMU (CPU model) features */
-- 
2.31.1



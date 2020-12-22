Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F7C2E08F1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:50:13 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfF6-0001k1-Eo
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAP-0004lF-1i
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAM-00074y-Fo
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4x+6OY4TA3ZvGFJW/wQuCD/w6LHR4VjfeValzh+5690=;
 b=dPFQLp3b38dwk8LZ4LOGEXmrd7LUnB0Bsjg48Y7VQ7xyR1R/BnCqwF8HXaNBot8S+dQaPW
 lEKWjzZe3EaUMsa1EV6QfTE1D11pQJismp0o0QQGd0fTbTVHDwiXgyihEkmAMzpqi91Nxf
 uSd/4sumPuGpkHS+ARAhj8TK4T2Wqvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-FKKRtRMKOHat1eA-KVr1xA-1; Tue, 22 Dec 2020 05:45:12 -0500
X-MC-Unique: FKKRtRMKOHat1eA-KVr1xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7479D805EF9;
 Tue, 22 Dec 2020 10:45:09 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC4B47B132;
 Tue, 22 Dec 2020 10:45:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/14] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
Date: Tue, 22 Dec 2020 11:44:50 +0100
Message-Id: <20201222104503.224510-2-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

There's no VSIE support for a protected guest, so let's better not
advertise it and its support facilities.

Fixes: c3347ed0d2ee ("s390x: protvirt: Support unpack facility")
Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20201211105109.2913-1-frankja@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu_features.c | 39 ++++++++++++++++++++++++++++++++++++-
 target/s390x/cpu_models.c   | 25 ++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 42fe0bf4ca7a..5528acd08289 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -107,8 +107,45 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
         feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
     }
 
-    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
+    if (!s390_is_pv()) {
+        return;
+    }
+
+    /*
+     * Some facilities are not available for CPUs in protected mode:
+     * - All SIE facilities because SIE is not available
+     * - DIAG318
+     *
+     * As VMs can move in and out of protected mode the CPU model
+     * doesn't protect us from that problem because it is only
+     * validated at the start of the VM.
+     */
+    switch (type) {
+    case S390_FEAT_TYPE_SCLP_CPU:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_F2)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SKEY)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GPERE)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIGPIF)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IB)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CEI)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_HPMA2)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT:
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_64BSCAO)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CMMA)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_PFMFI)->bit, data);
+        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IBS)->bit, data);
+        break;
+    case S390_FEAT_TYPE_SCLP_FAC134:
         clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
+        break;
+    default:
+        return;
     }
 }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index b5abff8befea..93d8744d29a3 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -239,8 +239,29 @@ bool s390_has_feat(S390Feat feat)
         }
         return 0;
     }
-    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
-        return false;
+
+    if (s390_is_pv()) {
+        switch (feat) {
+        case S390_FEAT_DIAG_318:
+        case S390_FEAT_HPMA2:
+        case S390_FEAT_SIE_F2:
+        case S390_FEAT_SIE_SKEY:
+        case S390_FEAT_SIE_GPERE:
+        case S390_FEAT_SIE_SIIF:
+        case S390_FEAT_SIE_SIGPIF:
+        case S390_FEAT_SIE_IB:
+        case S390_FEAT_SIE_CEI:
+        case S390_FEAT_SIE_KSS:
+        case S390_FEAT_SIE_GSLS:
+        case S390_FEAT_SIE_64BSCAO:
+        case S390_FEAT_SIE_CMMA:
+        case S390_FEAT_SIE_PFMFI:
+        case S390_FEAT_SIE_IBS:
+            return false;
+            break;
+        default:
+            break;
+        }
     }
     return test_bit(feat, cpu->model->features);
 }
-- 
2.26.2



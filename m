Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBA42EDBD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:33:03 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJaI-0004O7-GF
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKM-0003Bv-UD
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKK-0001du-7O
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EALxeUwl49a5fi3MlOBm9TiJoX5lmp3cY9bey6GuZKM=;
 b=JfOq4pWJtIbLslcPi/5TMLO5SnjyTOufbwuV9mudraySglhXpieO9El8kVTEkV6HvMOcNQ
 JED/bdLujRDaxWBQptFlfTF2K7TtxgjjIVaDvJJ0NpWVLJ4KWkXJX65HzzplO9sOKycEWW
 3PsRE0phMGK+u0DogOITYsjS6mRlKJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-BCUgVz2QPcWXDuARpVyl2A-1; Fri, 15 Oct 2021 05:16:28 -0400
X-MC-Unique: BCUgVz2QPcWXDuARpVyl2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CD47801ADA;
 Fri, 15 Oct 2021 09:16:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 322E41B5C0;
 Fri, 15 Oct 2021 09:16:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] s390x: sigp: Force Set Architecture to return Invalid
 Parameter
Date: Fri, 15 Oct 2021 11:16:18 +0200
Message-Id: <20211015091622.1302433-3-thuth@redhat.com>
In-Reply-To: <20211015091622.1302433-1-thuth@redhat.com>
References: <20211015091622.1302433-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

According to the Principles of Operation, the SIGP Set Architecture
order will return Incorrect State if some CPUs are not stopped, but
only if the CZAM facility is not present. If it is, the order will
return Invalid Parameter because the architecture mode cannot be
changed.

Since CZAM always exists when S390_FEAT_ZARCH exists, which in turn
exists for every defined CPU model, we can simplify this code.

Fixes: 075e52b81664 ("s390x/cpumodel: we are always in zarchitecture mode")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Message-Id: <20211008203811.1980478-2-farman@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/sigp.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index d57427ced8..51c727834c 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -428,26 +428,10 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
 static int sigp_set_architecture(S390CPU *cpu, uint32_t param,
                                  uint64_t *status_reg)
 {
-    CPUState *cur_cs;
-    S390CPU *cur_cpu;
-    bool all_stopped = true;
-
-    CPU_FOREACH(cur_cs) {
-        cur_cpu = S390_CPU(cur_cs);
-
-        if (cur_cpu == cpu) {
-            continue;
-        }
-        if (s390_cpu_get_state(cur_cpu) != S390_CPU_STATE_STOPPED) {
-            all_stopped = false;
-        }
-    }
-
     *status_reg &= 0xffffffff00000000ULL;
 
     /* Reject set arch order, with czam we're always in z/Arch mode. */
-    *status_reg |= (all_stopped ? SIGP_STAT_INVALID_PARAMETER :
-                    SIGP_STAT_INCORRECT_STATE);
+    *status_reg |= SIGP_STAT_INVALID_PARAMETER;
     return SIGP_CC_STATUS_STORED;
 }
 
-- 
2.27.0



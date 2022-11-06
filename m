Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F061E307
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdK-0005uO-JW; Sun, 06 Nov 2022 10:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdI-0005uG-9V
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhdG-0000wc-IO
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hui+x56VCFnzeo+xXoNx7wtQIXmlXYo5/6lVYqmwUo=;
 b=ZwAR1wvCU9gHi6gdhsTvA+7fC0ZL0AJ5btJNdGd8LskuOa3WMufHfpRoSeJtOVUjenrXcF
 2yWDumbLGr+h6+0I837flGIHD4jMv0J9ZD9jvX9U1aybaLagUBBbiWpP8n1ajVKUiASHoO
 cnbSRmRXX90A0UiO/fO1sjC8M+u26k4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-3UtDXoEZPdSTe_AZjN4kyg-1; Sun, 06 Nov 2022 10:32:18 -0500
X-MC-Unique: 3UtDXoEZPdSTe_AZjN4kyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FC433814582;
 Sun,  6 Nov 2022 15:32:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38DF640C6EC5;
 Sun,  6 Nov 2022 15:32:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Peter Jin <pjin@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PULL 09/12] s390x/css: revert SCSW ctrl/flag bits on error
Date: Sun,  6 Nov 2022 16:31:53 +0100
Message-Id: <20221106153156.620150-10-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Jin <pjin@linux.ibm.com>

Revert the control and flag bits in the subchannel status word in case
the SSCH operation fails with non-zero CC (ditto for CSCH and HSCH).
According to POPS, the control and flag bits are only changed if SSCH,
CSCH, and HSCH return CC 0, and no other action should be taken otherwise.
In order to simulate that after the fact, the bits need to be reverted on
non-zero CC.

While the do_subchannel_work logic for virtual (virtio) devices will
return condition code 0, passthrough (vfio) devices may encounter
errors from either the host kernel or real hardware that need to be
accounted for after this point. This includes restoring the state of
the Subchannel Status Word to reflect the subchannel, as these bits
would not be set in the event of a non-zero condition code from the
affected instructions.

Experimentation has shown that a failure on a START SUBCHANNEL (SSCH)
to a passthrough device would leave the subchannel with the START
PENDING activity control bit set, thus blocking subsequent SSCH
operations in css_do_ssch() until some form of error recovery was
undertaken since no interrupt would be expected.

Signed-off-by: Peter Jin <pjin@linux.ibm.com>
Message-Id: <20221027212341.2904795-1-pjin@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
[thuth: Updated the commit description to Eric's suggestion]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/css.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 7d9523f811..95d1b3a3ce 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1522,21 +1522,37 @@ IOInstEnding css_do_xsch(SubchDev *sch)
 IOInstEnding css_do_csch(SubchDev *sch)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
     }
 
+    /*
+     * Save the current scsw.ctrl in case CSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+
     /* Trigger the clear function. */
     schib->scsw.ctrl &= ~(SCSW_CTRL_MASK_FCTL | SCSW_CTRL_MASK_ACTL);
     schib->scsw.ctrl |= SCSW_FCTL_CLEAR_FUNC | SCSW_ACTL_CLEAR_PEND;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+    }
+
+    return ccode;
 }
 
 IOInstEnding css_do_hsch(SubchDev *sch)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
@@ -1553,6 +1569,12 @@ IOInstEnding css_do_hsch(SubchDev *sch)
         return IOINST_CC_BUSY;
     }
 
+    /*
+     * Save the current scsw.ctrl in case HSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+
     /* Trigger the halt function. */
     schib->scsw.ctrl |= SCSW_FCTL_HALT_FUNC;
     schib->scsw.ctrl &= ~SCSW_FCTL_START_FUNC;
@@ -1564,7 +1586,13 @@ IOInstEnding css_do_hsch(SubchDev *sch)
     }
     schib->scsw.ctrl |= SCSW_ACTL_HALT_PEND;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+    }
+
+    return ccode;
 }
 
 static void css_update_chnmon(SubchDev *sch)
@@ -1605,6 +1633,8 @@ static void css_update_chnmon(SubchDev *sch)
 IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl, old_scsw_flags;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
@@ -1626,11 +1656,26 @@ IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
     }
     sch->orb = *orb;
     sch->channel_prog = orb->cpa;
+
+    /*
+     * Save the current scsw.ctrl and scsw.flags in case SSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+    old_scsw_flags = schib->scsw.flags;
+
     /* Trigger the start function. */
     schib->scsw.ctrl |= (SCSW_FCTL_START_FUNC | SCSW_ACTL_START_PEND);
     schib->scsw.flags &= ~SCSW_FLAGS_MASK_PNO;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+        schib->scsw.flags = old_scsw_flags;
+    }
+
+    return ccode;
 }
 
 static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
-- 
2.31.1



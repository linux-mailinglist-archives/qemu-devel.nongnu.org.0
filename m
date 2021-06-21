Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324223AE70B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:28:27 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHAI-0006PG-5u
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjL-0000qQ-Q9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjJ-0007XJ-3Z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXL+WQLfbUYWX5YBSicPl70iIMdDxwqd+Vc0GeiaIoo=;
 b=FWePBOoYxt7MOoazkS5+0g1A0LuRiWEgcfxLIw03wZBpACAgonreDenkxZuCOrdFX7YWbb
 HD3kQpiUsrHk5+XPC7mPaltqnECg8Ez/0XhMdqxKUSkky+MxQmF2nDZIRpglQAzvAMZIjw
 HSwOd/L3+HQZv0p5D7+VCcnO4Ora0Kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-pJxaLCZXPV21i5d6m_Kniw-1; Mon, 21 Jun 2021 06:00:28 -0400
X-MC-Unique: pJxaLCZXPV21i5d6m_Kniw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEFAD80430F;
 Mon, 21 Jun 2021 10:00:27 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 986DA5D740;
 Mon, 21 Jun 2021 10:00:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 37/37] s390x/css: Add passthrough IRB
Date: Mon, 21 Jun 2021 11:58:42 +0200
Message-Id: <20210621095842.335162-38-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Wire in the subchannel callback for building the IRB
ESW and ECW space for passthrough devices, and copy
the hardware's ESW into the IRB we are building.

If the hardware presented concurrent sense, then copy
that sense data into the IRB's ECW space.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20210617232537.1337506-5-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/css.c         | 16 +++++++++++++++-
 hw/s390x/s390-ccw.c    |  1 +
 hw/vfio/ccw.c          |  4 ++++
 include/hw/s390x/css.h |  3 +++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 1a3aad516363..133ddea5757e 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,7 +1335,7 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
-static void copy_esw_to_guest(ESW *dest, const ESW *src)
+void copy_esw_to_guest(ESW *dest, const ESW *src)
 {
     dest->word0 = cpu_to_be32(src->word0);
     dest->erw = cpu_to_be32(src->erw);
@@ -1650,6 +1650,20 @@ static void build_irb_sense_data(SubchDev *sch, IRB *irb)
     }
 }
 
+void build_irb_passthrough(SubchDev *sch, IRB *irb)
+{
+    /* Copy ESW from hardware */
+    irb->esw = sch->esw;
+
+    /*
+     * If (irb->esw.erw & ESW_ERW_SENSE) is true, then the contents
+     * of the ECW is sense data. If false, then it is model-dependent
+     * information. Either way, copy it into the IRB for the guest to
+     * read/decide what to do with.
+     */
+    build_irb_sense_data(sch, irb);
+}
+
 void build_irb_virtual(SubchDev *sch, IRB *irb)
 {
     SCHIB *schib = &sch->curr_status;
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index c227c77984ce..2fc8bb9c2327 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -124,6 +124,7 @@ static void s390_ccw_realize(S390CCWDevice *cdev, char *sysfsdev, Error **errp)
     }
     sch->driver_data = cdev;
     sch->do_subchannel_work = do_subchannel_work_passthrough;
+    sch->irb_cb = build_irb_passthrough;
 
     ccw_dev->sch = sch;
     ret = css_sch_build_schib(sch, &cdev->hostid);
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 139a3d9d1b95..000992fb9fb6 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -321,6 +321,7 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
     SCHIB *schib = &sch->curr_status;
     SCSW s;
     IRB irb;
+    ESW esw;
     int size;
 
     if (!event_notifier_test_and_clear(&vcdev->io_notifier)) {
@@ -371,6 +372,9 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
     copy_scsw_to_guest(&s, &irb.scsw);
     schib->scsw = s;
 
+    copy_esw_to_guest(&esw, &irb.esw);
+    sch->esw = esw;
+
     /* If a uint check is pending, copy sense data. */
     if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
         (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 7c23a13f3d3d..10ed1df1bb74 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -141,6 +141,7 @@ struct SubchDev {
     void (*irb_cb)(SubchDev *, IRB *);
     SenseId id;
     void *driver_data;
+    ESW esw;
 };
 
 static inline void sch_gen_unit_exception(SubchDev *sch)
@@ -202,6 +203,7 @@ int css_sch_build_schib(SubchDev *sch, CssDevId *dev_id);
 unsigned int css_find_free_chpid(uint8_t cssid);
 uint16_t css_build_subchannel_id(SubchDev *sch);
 void copy_scsw_to_guest(SCSW *dest, const SCSW *src);
+void copy_esw_to_guest(ESW *dest, const ESW *src);
 void css_inject_io_interrupt(SubchDev *sch);
 void css_reset(void);
 void css_reset_sch(SubchDev *sch);
@@ -216,6 +218,7 @@ void css_clear_sei_pending(void);
 IOInstEnding s390_ccw_cmd_request(SubchDev *sch);
 IOInstEnding do_subchannel_work_virtual(SubchDev *sub);
 IOInstEnding do_subchannel_work_passthrough(SubchDev *sub);
+void build_irb_passthrough(SubchDev *sch, IRB *irb);
 void build_irb_virtual(SubchDev *sch, IRB *irb);
 
 int s390_ccw_halt(SubchDev *sch);
-- 
2.31.1



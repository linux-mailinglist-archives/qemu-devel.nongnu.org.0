Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AF3AE738
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:36:27 +0200 (CEST)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHI2-0001jP-Lf
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjI-0000f5-0v
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjF-0007Vx-U9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=td8GEFiY1lRCnYc5DwqP+qeUFrKL2hai8DSvewMVrw0=;
 b=jBpUG9YuFHf7LFMStsOuWcxqraFyxuDNttnbhK8hGmd3cxew0tYDayCLYUc2qcAPubmjg1
 BK5R7zSgSDj5GPQ9tgUmjJY0szfwVssURaccRD0efZ2/tBO1UNbqAhy4FewB32p/Npigo5
 l7YxvcadLd7LJazavWhit2lDyEFS2iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-YQ2ELJ4nOyKKImMVWDYSNQ-1; Mon, 21 Jun 2021 06:00:27 -0400
X-MC-Unique: YQ2ELJ4nOyKKImMVWDYSNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 478CA100C662;
 Mon, 21 Jun 2021 10:00:26 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396EC5D740;
 Mon, 21 Jun 2021 10:00:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 36/37] s390x/css: Refactor IRB construction
Date: Mon, 21 Jun 2021 11:58:41 +0200
Message-Id: <20210621095842.335162-37-cohuck@redhat.com>
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Currently, all subchannel types have "sense data" copied into
the IRB.ECW space, and a couple flags enabled in the IRB.SCSW
and IRB.ESW. But for passthrough (vfio-ccw) subchannels,
this data isn't populated in the first place, so enabling
those flags leads to unexpected behavior if the guest tries to
process the sense data (zeros) in the IRB.ECW.

Let's add a subchannel callback that builds these portions of
the IRB, and move the existing code into a routine for those
virtual subchannels. The passthrough subchannels will be able
to piggy-back onto this later.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20210617232537.1337506-4-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/3270-ccw.c    |  1 +
 hw/s390x/css.c         | 45 +++++++++++++++++++++++++++---------------
 hw/s390x/virtio-ccw.c  |  1 +
 include/hw/s390x/css.h |  2 ++
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index 13e93d8d8f61..69e6783ade59 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -129,6 +129,7 @@ static void emulated_ccw_3270_realize(DeviceState *ds, Error **errp)
                                 EMULATED_CCW_3270_CHPID_TYPE);
     sch->do_subchannel_work = do_subchannel_work_virtual;
     sch->ccw_cb = emulated_ccw_3270_cb;
+    sch->irb_cb = build_irb_virtual;
 
     ck->init(dev, &err);
     if (err) {
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 26bd01458fcd..1a3aad516363 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1650,6 +1650,30 @@ static void build_irb_sense_data(SubchDev *sch, IRB *irb)
     }
 }
 
+void build_irb_virtual(SubchDev *sch, IRB *irb)
+{
+    SCHIB *schib = &sch->curr_status;
+    uint16_t stctl = schib->scsw.ctrl & SCSW_CTRL_MASK_STCTL;
+
+    if (stctl & SCSW_STCTL_STATUS_PEND) {
+        if (schib->scsw.cstat & (SCSW_CSTAT_DATA_CHECK |
+                        SCSW_CSTAT_CHN_CTRL_CHK |
+                        SCSW_CSTAT_INTF_CTRL_CHK)) {
+            irb->scsw.flags |= SCSW_FLAGS_MASK_ESWF;
+            irb->esw.word0 = 0x04804000;
+        } else {
+            irb->esw.word0 = 0x00800000;
+        }
+        /* If a unit check is pending, copy sense data. */
+        if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
+            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
+            irb->scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
+            build_irb_sense_data(sch, irb);
+            irb->esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
+        }
+    }
+}
+
 int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 {
     SCHIB *schib = &sch->curr_status;
@@ -1668,23 +1692,12 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 
     /* Copy scsw from current status. */
     irb.scsw = schib->scsw;
-    if (stctl & SCSW_STCTL_STATUS_PEND) {
-        if (schib->scsw.cstat & (SCSW_CSTAT_DATA_CHECK |
-                        SCSW_CSTAT_CHN_CTRL_CHK |
-                        SCSW_CSTAT_INTF_CTRL_CHK)) {
-            irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
-            irb.esw.word0 = 0x04804000;
-        } else {
-            irb.esw.word0 = 0x00800000;
-        }
-        /* If a unit check is pending, copy sense data. */
-        if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
-            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
-            irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
-            build_irb_sense_data(sch, &irb);
-            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
-        }
+
+    /* Build other IRB data, if necessary */
+    if (sch->irb_cb) {
+        sch->irb_cb(sch, &irb);
     }
+
     /* Store the irb to the guest. */
     p = schib->pmcw;
     copy_irb_to_guest(target_irb, &irb, &p, irb_len);
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 220b9efcf945..d68888fccd06 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -753,6 +753,7 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
     sch->id.reserved = 0xff;
     sch->id.cu_type = VIRTIO_CCW_CU_TYPE;
     sch->do_subchannel_work = do_subchannel_work_virtual;
+    sch->irb_cb = build_irb_virtual;
     ccw_dev->sch = sch;
     dev->indicators = NULL;
     dev->revision = -1;
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index bba7593d2eaa..7c23a13f3d3d 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -138,6 +138,7 @@ struct SubchDev {
     int (*ccw_cb) (SubchDev *, CCW1);
     void (*disable_cb)(SubchDev *);
     IOInstEnding (*do_subchannel_work) (SubchDev *);
+    void (*irb_cb)(SubchDev *, IRB *);
     SenseId id;
     void *driver_data;
 };
@@ -215,6 +216,7 @@ void css_clear_sei_pending(void);
 IOInstEnding s390_ccw_cmd_request(SubchDev *sch);
 IOInstEnding do_subchannel_work_virtual(SubchDev *sub);
 IOInstEnding do_subchannel_work_passthrough(SubchDev *sub);
+void build_irb_virtual(SubchDev *sch, IRB *irb);
 
 int s390_ccw_halt(SubchDev *sch);
 int s390_ccw_clear(SubchDev *sch);
-- 
2.31.1



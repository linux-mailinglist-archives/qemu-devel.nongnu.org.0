Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014093AE730
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:32:42 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHEO-0004Bh-Sj
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjD-0000Q6-Ic
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjB-0007Sz-9Q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ca4PDFDwC5IzxbQ4C67RHAiWW398J9uP42Y0coc47E=;
 b=LrD7UUcfHXzSjnnxGXUKodvY12KsAjjJNOykZ7+im+9SzFuBKz3ZBd/PgwivptTDeoWrun
 MxGQewqMzjft7wtGlawk6Tc7UtT/jNQtXttjSsEAG5fuyJR3wdHBJzuuhGChMS+P56P8dM
 0Av+bFcImI9Q0G8P2Xgko/5EEUlRx5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-H8aVICSSPvePf7pY32Kg2g-1; Mon, 21 Jun 2021 06:00:22 -0400
X-MC-Unique: H8aVICSSPvePf7pY32Kg2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E08181940928;
 Mon, 21 Jun 2021 10:00:21 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BD485D740;
 Mon, 21 Jun 2021 10:00:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 35/37] s390x/css: Split out the IRB sense data
Date: Mon, 21 Jun 2021 11:58:40 +0200
Message-Id: <20210621095842.335162-36-cohuck@redhat.com>
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Let's move this logic into its own routine,
so it can be reused later.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210617232537.1337506-3-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/css.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 2025507eddc1..26bd01458fcd 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1639,6 +1639,17 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
     *irb_len = sizeof(*dest);
 }
 
+static void build_irb_sense_data(SubchDev *sch, IRB *irb)
+{
+    int i;
+
+    /* Attention: sense_data is already BE! */
+    memcpy(irb->ecw, sch->sense_data, sizeof(sch->sense_data));
+    for (i = 0; i < ARRAY_SIZE(irb->ecw); i++) {
+        irb->ecw[i] = be32_to_cpu(irb->ecw[i]);
+    }
+}
+
 int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 {
     SCHIB *schib = &sch->curr_status;
@@ -1669,14 +1680,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
             (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
-            int i;
-
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
-            /* Attention: sense_data is already BE! */
-            memcpy(irb.ecw, sch->sense_data, sizeof(sch->sense_data));
-            for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
-                irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
-            }
+            build_irb_sense_data(sch, &irb);
             irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
         }
     }
-- 
2.31.1



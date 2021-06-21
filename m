Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95B3AE732
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:33:25 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHF6-0005bb-At
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjF-0000X7-Nt
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjB-0007TR-Rc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a619Oxq7VM/K+Gf9mzcS/8TX4Z3nCJmWLWVBWZawoIk=;
 b=gyq8Dbb8cL96ZYmWvwGuqLHyStiI7wXp6vuJgDhRrbsD8n//boHfJTHZVNoVFramaQBojy
 bz2rTYIp9V97w+d+QY/tc/b5qD9QnVl4AgF5aBCDvR+CmnN/hZTMicawkBbrwDqaQzdWmW
 Zx+HWLI3/4vW6oIfoVoXWxOiNDXb6Rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-pZQdMX_ONFScUke1fb6eXQ-1; Mon, 21 Jun 2021 06:00:21 -0400
X-MC-Unique: pZQdMX_ONFScUke1fb6eXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D3F2100CEC0;
 Mon, 21 Jun 2021 10:00:20 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E02003AC1;
 Mon, 21 Jun 2021 10:00:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 34/37] s390x/css: Introduce an ESW struct
Date: Mon, 21 Jun 2021 11:58:39 +0200
Message-Id: <20210621095842.335162-35-cohuck@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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

The Interrupt Response Block is comprised of several other
structures concatenated together, but only the 12-byte
Subchannel-Status Word (SCSW) is defined as a proper struct.
Everything else is a simple array of 32-bit words.

Let's define a proper struct for the 20-byte Extended-Status
Word (ESW) so that we can make good decisions about the sense
data that would go into the ECW area for virtual vs
passthrough devices.

[CH: adapted ESW definition to build with mingw, as discussed]
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20210617232537.1337506-2-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/css.c            | 19 +++++++++++++------
 include/hw/s390x/ioinst.h | 12 +++++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3a2..2025507eddc1 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,6 +1335,14 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
+static void copy_esw_to_guest(ESW *dest, const ESW *src)
+{
+    dest->word0 = cpu_to_be32(src->word0);
+    dest->erw = cpu_to_be32(src->erw);
+    dest->word2 = cpu_to_be64(src->word2);
+    dest->word4 = cpu_to_be32(src->word4);
+}
+
 IOInstEnding css_do_stsch(SubchDev *sch, SCHIB *schib)
 {
     int ret;
@@ -1604,9 +1612,8 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
 
     copy_scsw_to_guest(&dest->scsw, &src->scsw);
 
-    for (i = 0; i < ARRAY_SIZE(dest->esw); i++) {
-        dest->esw[i] = cpu_to_be32(src->esw[i]);
-    }
+    copy_esw_to_guest(&dest->esw, &src->esw);
+
     for (i = 0; i < ARRAY_SIZE(dest->ecw); i++) {
         dest->ecw[i] = cpu_to_be32(src->ecw[i]);
     }
@@ -1655,9 +1662,9 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
                         SCSW_CSTAT_CHN_CTRL_CHK |
                         SCSW_CSTAT_INTF_CTRL_CHK)) {
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
-            irb.esw[0] = 0x04804000;
+            irb.esw.word0 = 0x04804000;
         } else {
-            irb.esw[0] = 0x00800000;
+            irb.esw.word0 = 0x00800000;
         }
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
@@ -1670,7 +1677,7 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
             for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
                 irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
             }
-            irb.esw[1] = 0x01000000 | (sizeof(sch->sense_data) << 8);
+            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
         }
     }
     /* Store the irb to the guest. */
diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
index c6737a30d447..3771fff9d44d 100644
--- a/include/hw/s390x/ioinst.h
+++ b/include/hw/s390x/ioinst.h
@@ -123,10 +123,20 @@ typedef struct SCHIB {
     uint8_t mda[4];
 } QEMU_PACKED SCHIB;
 
+/* format-0 extended-status word */
+typedef struct ESW {
+    uint32_t word0;      /* subchannel logout for format 0 */
+    uint32_t erw;
+    uint64_t word2;     /* failing-storage address for format 0 */
+    uint32_t word4;     /* secondary-CCW address for format 0 */
+} QEMU_PACKED ESW;
+
+#define ESW_ERW_SENSE 0x01000000
+
 /* interruption response block */
 typedef struct IRB {
     SCSW scsw;
-    uint32_t esw[5];
+    ESW esw;
     uint32_t ecw[8];
     uint32_t emw[8];
 } IRB;
-- 
2.31.1



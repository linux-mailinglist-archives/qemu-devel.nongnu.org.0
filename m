Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8A4029D6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:38:11 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbIg-0001gY-Cm
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawM-00035Q-70
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawK-0002Gr-C2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDiSpT8/0/iOgoA90CPNRSwuaTYy0g2zubuo4AaEDzI=;
 b=I7voZgvaFkEaPh55igx0mZlKViiHbzOpnEhCXFpMmc/sqQpHtoLRUeIBQFsufRmRbcRNIP
 FU9dc1fG8V02JZMbE1JtLswZf2Almb7ZSOJN674yjGrHGQtU0PWuvILHMzlcTKUdM4vfVu
 aJEGn2H5rjBQYPg9Qa64w/IAIiFEyB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-VMVo6Qy-N1WHysM4Dg0vxw-1; Tue, 07 Sep 2021 09:15:00 -0400
X-MC-Unique: VMVo6Qy-N1WHysM4Dg0vxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FF2501E6;
 Tue,  7 Sep 2021 13:14:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9598F5C1B4;
 Tue,  7 Sep 2021 13:14:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/20] vfio-ccw: forward halt/clear errors
Date: Tue,  7 Sep 2021 15:14:30 +0200
Message-Id: <20210907131449.493875-2-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

hsch and csch basically have two parts: execute the command,
and perform the halt/clear function. For fully emulated
subchannels, it is pretty clear how it will work: check the
subchannel state, and actually 'perform the halt/clear function'
and set cc 0 if everything looks good.

For passthrough subchannels, some of the checking is done
within QEMU, but some has to be done within the kernel. QEMU's
subchannel state may be such that we can perform the async
function, but the kernel may still get a cc != 0 when it is
actually executing the instruction. In that case, we need to
set the condition actually encountered by the kernel; if we
set cc 0 on error, we would actually need to inject an interrupt
as well.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Jared Rossi <jrossi@linux.ibm.com>
Message-Id: <20210705163952.736020-2-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/css.c | 38 ++++++++++++++++++++++++++++++++++----
 hw/vfio/ccw.c  |  4 ++--
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 133ddea575..7d9523f811 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1206,23 +1206,53 @@ static void sch_handle_start_func_virtual(SubchDev *sch)
 
 }
 
-static void sch_handle_halt_func_passthrough(SubchDev *sch)
+static IOInstEnding sch_handle_halt_func_passthrough(SubchDev *sch)
 {
     int ret;
 
     ret = s390_ccw_halt(sch);
     if (ret == -ENOSYS) {
         sch_handle_halt_func(sch);
+        return IOINST_CC_EXPECTED;
+    }
+    /*
+     * Some conditions may have been detected prior to starting the halt
+     * function; map them to the correct cc.
+     * Note that we map both -ENODEV and -EACCES to cc 3 (there's not really
+     * anything else we can do.)
+     */
+    switch (ret) {
+    case -EBUSY:
+        return IOINST_CC_BUSY;
+    case -ENODEV:
+    case -EACCES:
+        return IOINST_CC_NOT_OPERATIONAL;
+    default:
+        return IOINST_CC_EXPECTED;
     }
 }
 
-static void sch_handle_clear_func_passthrough(SubchDev *sch)
+static IOInstEnding sch_handle_clear_func_passthrough(SubchDev *sch)
 {
     int ret;
 
     ret = s390_ccw_clear(sch);
     if (ret == -ENOSYS) {
         sch_handle_clear_func(sch);
+        return IOINST_CC_EXPECTED;
+    }
+    /*
+     * Some conditions may have been detected prior to starting the clear
+     * function; map them to the correct cc.
+     * Note that we map both -ENODEV and -EACCES to cc 3 (there's not really
+     * anything else we can do.)
+     */
+    switch (ret) {
+    case -ENODEV:
+    case -EACCES:
+        return IOINST_CC_NOT_OPERATIONAL;
+    default:
+        return IOINST_CC_EXPECTED;
     }
 }
 
@@ -1265,9 +1295,9 @@ IOInstEnding do_subchannel_work_passthrough(SubchDev *sch)
     SCHIB *schib = &sch->curr_status;
 
     if (schib->scsw.ctrl & SCSW_FCTL_CLEAR_FUNC) {
-        sch_handle_clear_func_passthrough(sch);
+        return sch_handle_clear_func_passthrough(sch);
     } else if (schib->scsw.ctrl & SCSW_FCTL_HALT_FUNC) {
-        sch_handle_halt_func_passthrough(sch);
+        return sch_handle_halt_func_passthrough(sch);
     } else if (schib->scsw.ctrl & SCSW_FCTL_START_FUNC) {
         return sch_handle_start_func_passthrough(sch);
     }
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 000992fb9f..0354737666 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -199,7 +199,7 @@ again:
     case 0:
     case -ENODEV:
     case -EACCES:
-        return 0;
+        return ret;
     case -EFAULT:
     default:
         sch_gen_unit_exception(sch);
@@ -240,7 +240,7 @@ again:
     case -EBUSY:
     case -ENODEV:
     case -EACCES:
-        return 0;
+        return ret;
     case -EFAULT:
     default:
         sch_gen_unit_exception(sch);
-- 
2.27.0



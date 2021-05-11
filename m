Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F837AAB1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:28:23 +0200 (CEST)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUIz-0008Pi-Vl
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lgU2v-0002jm-6j
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:11:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lgU2t-0005Uz-DH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2PyFznFveNCG5KwLVbcmm04Gz+OBsW0l24Gnvhx9maU=;
 b=Dw7XEi6A23qhXCy6XaRkDCoGZDcI+VdbVsJvP+ve4A1HmNJtXekP5v6+ufvZ3noSaQPLuU
 kBEvkUL/vIlrudlrS9yEtJDkxXXpuV/UU6FbJ0ipVYZK5hflI2nWQnL6UwCS1nxVh8K5li
 7zDNwBVpOVHw/FpFYmOj4BobSWefSV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-l41qzwwvNLiELZw4TC3_OA-1; Tue, 11 May 2021 11:11:36 -0400
X-MC-Unique: l41qzwwvNLiELZw4TC3_OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D67D1854E26;
 Tue, 11 May 2021 15:11:35 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-172.ams2.redhat.com
 [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBCC60C04;
 Tue, 11 May 2021 15:11:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH RFC] vfio-ccw: forward halt/clear errors
Date: Tue, 11 May 2021 17:11:29 +0200
Message-Id: <20210511151129.77051-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---

Stumbled over this during the vfio-ccw kernel locking discussions.

This is probably a corner case, and I'm not sure how I can actually
get this path excercised, but it passes my smoke tests.

Not sure whether this is the way to go. The unit exceptions in the
halt/clear error paths also seem slightly fishy.

---
 hw/s390x/css.c | 34 ++++++++++++++++++++++++++++++----
 hw/vfio/ccw.c  |  4 ++--
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3a2..ce2e903ca25a 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1206,23 +1206,49 @@ static void sch_handle_start_func_virtual(SubchDev *sch)
 
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
+     */
+    switch (ret) {
+    case -ENODEV:
+    case -EACCES:
+        return IOINST_CC_NOT_OPERATIONAL;
+    default:
+        return IOINST_CC_EXPECTED;
     }
 }
 
@@ -1265,9 +1291,9 @@ IOInstEnding do_subchannel_work_passthrough(SubchDev *sch)
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
index e752c845e9e4..39275a917bd2 100644
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
2.31.1



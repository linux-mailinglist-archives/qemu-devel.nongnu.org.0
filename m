Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0F3BC1C1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:42:06 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RfU-0003a5-78
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Rdd-00026P-2r
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0RdZ-0002Yu-Td
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625503201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyqoZEKMC8QY0hMLVIVb1HzM83IWAO/ngg2T50Tz0LU=;
 b=SuAuiQzZ8kBRlTcXkXYcwZyYv7PPUlhEYh2XrsFax5jdlSJuZDAISOMKeLLVVOoydFeoaL
 nmzAB/0YqlVBAmd/6bYO88FLA4WGhrvUumdyWMrwao1Jvhvhznw3BP4xQR0z36j8aKYozY
 ubJLe6+5X1fct1A/AXqskdwfQ9NOFyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-WiqgGDHWPyqFgWK6eO88pA-1; Mon, 05 Jul 2021 12:39:59 -0400
X-MC-Unique: WiqgGDHWPyqFgWK6eO88pA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99ADF100C661;
 Mon,  5 Jul 2021 16:39:58 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA5060877;
 Mon,  5 Jul 2021 16:39:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH v2 1/2] vfio-ccw: forward halt/clear errors
Date: Mon,  5 Jul 2021 18:39:51 +0200
Message-Id: <20210705163952.736020-2-cohuck@redhat.com>
In-Reply-To: <20210705163952.736020-1-cohuck@redhat.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
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
 hw/s390x/css.c | 38 ++++++++++++++++++++++++++++++++++----
 hw/vfio/ccw.c  |  4 ++--
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 133ddea5757e..7d9523f81138 100644
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
index 000992fb9fb6..0354737666a1 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B16A40B8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboC-0005W0-HH; Mon, 27 Feb 2023 06:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo7-0005R3-Ud
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo2-0005ek-5H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jl85V4yF+bE/uUwIgiylKeXfLeedtsatGAppAmJc05g=;
 b=JjeK7aamDUYbLdlMJFeO1piG8JwLNW2eU2KgRbLlpEhEXjtlUlpCyRFBP+y8VqcTGezx3z
 CKoa2icPkcsvxKkwxJIZ4ihyOyQb3wI3eiVshCR6WPZPLr4SH/OBAxUawjjuFWYUD19AoM
 j6NEVjtrpTvJ02IVv8vlvfoyxpec3T4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-Ur4vv3CWPYyYHmZYtrF-MQ-1; Mon, 27 Feb 2023 06:36:29 -0500
X-MC-Unique: Ur4vv3CWPYyYHmZYtrF-MQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7B7F85CBE2;
 Mon, 27 Feb 2023 11:36:28 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C23131121314;
 Mon, 27 Feb 2023 11:36:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 04/33] hw/vfio/ccw: Use intermediate S390CCWDevice variable
Date: Mon, 27 Feb 2023 12:35:52 +0100
Message-Id: <20230227113621.58468-5-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

'cdev' is VFIOCCWDevice's private parent object.
Access it using the S390_CCW_DEVICE() QOM macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20230213170145.45666-4-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/vfio/ccw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 503de94ce1..2c20e3c202 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -588,9 +588,10 @@ static void vfio_ccw_put_device(VFIOCCWDevice *vcdev)
 static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
                                 Error **errp)
 {
-    char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
-                                 vcdev->cdev.hostid.ssid,
-                                 vcdev->cdev.hostid.devid);
+    S390CCWDevice *cdev = S390_CCW_DEVICE(vcdev);
+    char *name = g_strdup_printf("%x.%x.%04x", cdev->hostid.cssid,
+                                 cdev->hostid.ssid,
+                                 cdev->hostid.devid);
     VFIODevice *vbasedev;
 
     QLIST_FOREACH(vbasedev, &group->device_list, next) {
@@ -611,7 +612,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
      */
     vcdev->vdev.ram_block_discard_allowed = true;
 
-    if (vfio_get_device(group, vcdev->cdev.mdevid, &vcdev->vdev, errp)) {
+    if (vfio_get_device(group, cdev->mdevid, &vcdev->vdev, errp)) {
         goto out_err;
     }
 
-- 
2.31.1



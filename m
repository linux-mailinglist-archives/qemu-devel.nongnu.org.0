Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376768D0FB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlE-00038H-3c; Tue, 07 Feb 2023 02:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlB-00036g-Mp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-0000sQ-1O
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=up3Hdvqdxk/oz7M+820DMtsjjWbqfnXSy19YNp1JRPA=;
 b=UFZX8SgMu263mhgyn2sZ6GpjUglvi8cmThTz3BvySW5vB3wa1XcZCw0IVRsSHF3Yo9Bdyx
 Qtgb4w0EVU4PkE7vuk+QEDsx5sd+D9mpjGqwz8SXaojSI7F5s0bQbl4dgtj+eivEpYSSMq
 n0kpULSoWEJIGYmpWt2PDSwvB6bMfCw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-CSln0YMKPzmv98WOAWxl-w-1; Tue, 07 Feb 2023 02:51:20 -0500
X-MC-Unique: CSln0YMKPzmv98WOAWxl-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81EE7181B7CA;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8831121314;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C343E21E6A24; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 05/12] hw/smbios: Dumb down smbios_entry_add() stub
Date: Tue,  7 Feb 2023 08:51:08 +0100
Message-Id: <20230207075115.1525-6-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

The QERR_ macros are leftovers from the days of "rich" error objects.
We've been trying to reduce their remaining use.

smbios_entry_add() is only ever called on behalf of CLI option
-smbios.  Since qemu-options.hx sets @arch_mask to QEMU_ARCH_I386 |
QEMU_ARCH_ARM, it is reachable only for these targets.  Since they
provide a real smbios_entry_add(), the stub is unreachable.

There's no point in unreachable code keeping QERR_UNSUPPORTED alive.
Dumb it down to g_assert_not_reached().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/smbios/smbios-stub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/smbios/smbios-stub.c b/hw/smbios/smbios-stub.c
index 64e5ba93ec..e8808adfda 100644
--- a/hw/smbios/smbios-stub.c
+++ b/hw/smbios/smbios-stub.c
@@ -21,11 +21,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "hw/firmware/smbios.h"
 
 void smbios_entry_add(QemuOpts *opts, Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
+    g_assert_not_reached();
 }
-- 
2.39.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7B68D101
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlF-00039h-Te; Tue, 07 Feb 2023 02:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-000362-C5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIl8-0000rv-Jj
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9myWflUZ6i7vRzdzuvWwLb00WgrWqPkxl0scMtsfyU=;
 b=MKOGdYaFS7hjpXNwXdn1kneHqZ1ogQfFDj8ue4YEVIQ2GzI6j1+XBncpLJzAqr+84hBDlv
 Qc3jIyf+leYCm0crbrK2SEx6BaQgq/1rXYklV8r0/EhoCI/qxEGTWf/Xubkbm54uVzYytX
 /PNYPUePpFY7Cy8IlTsve0HTnmqHcRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-K0KHXLmBMoCuflfiQ_EaAA-1; Tue, 07 Feb 2023 02:51:20 -0500
X-MC-Unique: K0KHXLmBMoCuflfiQ_EaAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E993C0E444;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59EA5140EBF4;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D230521E6901; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 10/12] hw/core: Improve the query-hotpluggable-cpus error
 message
Date: Tue,  7 Feb 2023 08:51:13 +0100
Message-Id: <20230207075115.1525-11-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Get rid of a use of QERR_FEATURE_DISABLED, and improve the slightly
awkward error message

    (qemu) info hotpluggable-cpus
    Error: The feature 'query-hotpluggable-cpus' is not enabled

to

    Error: machine does not support hot-plugging CPUs

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index a6ed3a63c3..2d904747c0 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -16,7 +16,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-machine.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qobject.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
@@ -141,7 +140,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     if (!mc->has_hotpluggable_cpus) {
-        error_setg(errp, QERR_FEATURE_DISABLED, "query-hotpluggable-cpus");
+        error_setg(errp, "machine does not support hot-plugging CPUs");
         return NULL;
     }
 
-- 
2.39.0



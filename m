Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ED68D0F8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlF-000390-1Y; Tue, 07 Feb 2023 02:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlC-00037W-S3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-0000sq-PG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRlHnBV0dPzvSaab4DNFeZ5QHXV3Mgy4vRmzJRuIHbo=;
 b=aaj9i/FeZ/6TTknJQFWBxlYtK/sYsi2/k1reFFCCiQS0dpp/ZsKkPyyM6cp6QnMWmbsL8+
 j8cVjjEZsDW58hj7Q9cg9IGx1OxQ8jhHpcXPDzrdk8fBxuwTfR9dvCEUjVLcxkczjCgawR
 aBj5kb15iqNRv2NlfHzL5IWQtJzpvvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-EUSgSp5VPda5nAxT-AiYLA-1; Tue, 07 Feb 2023 02:51:20 -0500
X-MC-Unique: EUSgSp5VPda5nAxT-AiYLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F826181B7C9;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A62D2166B29;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4D9B21E690F; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 11/12] migration/colo: Improve an x-colo-lost-heartbeat error
 message
Date: Tue,  7 Feb 2023 08:51:14 +0100
Message-Id: <20230207075115.1525-12-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Get rid of a use of QERR_FEATURE_DISABLED, and improve the somewhat
imprecise error message

    (qemu) x_colo_lost_heartbeat
    Error: The feature 'colo' is not enabled

to

    Error: VM is not in COLO mode

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/colo-failover.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/colo-failover.c b/migration/colo-failover.c
index 42453481c4..6cb6f90357 100644
--- a/migration/colo-failover.c
+++ b/migration/colo-failover.c
@@ -17,7 +17,6 @@
 #include "migration.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -78,7 +77,7 @@ FailoverStatus failover_get_state(void)
 void qmp_x_colo_lost_heartbeat(Error **errp)
 {
     if (get_colo_mode() == COLO_MODE_NONE) {
-        error_setg(errp, QERR_FEATURE_DISABLED, "colo");
+        error_setg(errp, "VM is not in COLO mode");
         return;
     }
 
-- 
2.39.0



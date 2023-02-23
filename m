Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41446A0B14
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvk-00023F-Rx; Thu, 23 Feb 2023 08:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvf-0001zR-0F
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvd-0001Mc-4E
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDRXgA6vbOoFLEWZKWxTSfVECrV7/I3P6OGMABGcmIs=;
 b=Clfk28iL/Y28li7OO/OiFDTSMOUVT+Dr5uGehzwjqa8/lBuI4fNdCb+tGfmhRV/sCvf8qa
 QEgMaWYE/ua+j45XJWG99EoNlmFPi0bG3ezRYw5o/A6m9dqgoUbho3aLrKAvJXX2KaLIHe
 6ojydR2JXW5Ahw9iOrvQAT9BXcwkZjg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-oTnPmUC1Oa6fsUfOb4VmfQ-1; Thu, 23 Feb 2023 08:46:29 -0500
X-MC-Unique: oTnPmUC1Oa6fsUfOb4VmfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B444087A9E3;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93D7DC15BA0;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E75121E6A25; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 06/12] hw/acpi: Dumb down acpi_table_add() stub
Date: Thu, 23 Feb 2023 14:46:20 +0100
Message-Id: <20230223134626.2107382-7-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

acpi_table_add() is only ever called on behalf of CLI option
-acpitable.  Since qemu-options.hx sets @arch_mask to QEMU_ARCH_I386,
it is reachable only for these targets.  Since they provide a real
acpi_table_add(), the stub is unreachable.

There's no point in unreachable code keeping QERR_UNSUPPORTED alive.
Dumb it down to g_assert_not_reached().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-7-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 hw/acpi/acpi-stub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/acpi-stub.c b/hw/acpi/acpi-stub.c
index 4c9d081ed4..e268ce9b1a 100644
--- a/hw/acpi/acpi-stub.c
+++ b/hw/acpi/acpi-stub.c
@@ -19,11 +19,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "hw/acpi/acpi.h"
 
 void acpi_table_add(const QemuOpts *opts, Error **errp)
 {
-    error_setg(errp, QERR_UNSUPPORTED);
+    g_assert_not_reached();
 }
-- 
2.39.0



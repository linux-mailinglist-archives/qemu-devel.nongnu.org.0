Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCDE64EBBF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:59:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AIW-00088K-9I; Fri, 16 Dec 2022 07:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHz-0007rm-S6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:58:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHr-00064D-Lw
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUEAwdE9XRlr+4WMqDld8wcprb/TeuVRPIZb1Af6fPg=;
 b=VxM1E510Va7eDKTReZgD2MRGH+7Zm8iVfQxDUp/AV88pjIhdVv+VCGvR7eY+ZGyuqxXw1/
 34qlrp0Zxv5xFjVRt+sL+V7og9mCxKl5KIODswwOYjym7WB6fDOeUP+nCdsOx29nl71mcg
 FNZ7mlv5xqQmk43pVwkVgBLW/9bBH/w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-_RrAHeevO4iGLrS4fxMZkg-1; Fri, 16 Dec 2022 07:57:52 -0500
X-MC-Unique: _RrAHeevO4iGLrS4fxMZkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3B5B85A588;
 Fri, 16 Dec 2022 12:57:51 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 801EF492C14;
 Fri, 16 Dec 2022 12:57:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/watchdog: add trace events for watchdog action handling
Date: Fri, 16 Dec 2022 07:57:47 -0500
Message-Id: <20221216125749.596075-4-berrange@redhat.com>
In-Reply-To: <20221216125749.596075-1-berrange@redhat.com>
References: <20221216125749.596075-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

The tracepoints aid in debugging the triggering of watchdog devices.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/watchdog/trace-events | 4 ++++
 hw/watchdog/watchdog.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 89ccbcfdfd..54371ae075 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -16,3 +16,7 @@ spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
 spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
 spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
 spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"
+
+# watchdog.c
+watchdog_perform_action(unsigned int action) "action=%u"
+watchdog_set_action(unsigned int action) "action=%u"
diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 6c082a3263..955046161b 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -30,6 +30,7 @@
 #include "sysemu/watchdog.h"
 #include "hw/nmi.h"
 #include "qemu/help_option.h"
+#include "trace.h"
 
 static WatchdogAction watchdog_action = WATCHDOG_ACTION_RESET;
 
@@ -43,6 +44,8 @@ WatchdogAction get_watchdog_action(void)
  */
 void watchdog_perform_action(void)
 {
+    trace_watchdog_perform_action(watchdog_action);
+
     switch (watchdog_action) {
     case WATCHDOG_ACTION_RESET:     /* same as 'system_reset' in monitor */
         qapi_event_send_watchdog(WATCHDOG_ACTION_RESET);
@@ -89,4 +92,5 @@ void watchdog_perform_action(void)
 void qmp_watchdog_set_action(WatchdogAction action, Error **errp)
 {
     watchdog_action = action;
+    trace_watchdog_set_action(watchdog_action);
 }
-- 
2.38.1



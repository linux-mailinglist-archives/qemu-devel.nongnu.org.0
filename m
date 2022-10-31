Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF666137CA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUi6-0003ku-24; Mon, 31 Oct 2022 09:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUho-0002mL-HF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhl-0005Oz-V3
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwlt14ABo4s0tRH6Aet8hetcqXHwT0mR2iSVpf7bJNo=;
 b=bVrco9tYYaKlZ4WKQRYQLhqC0JFOJ4plwoNW0Xan/b3g23KezUlW5K/lRVM483gXkQPYmX
 z30StyJmcljwlc+Dg/63nhXVaHU20yGWZDAUbEkWHhrdXIjYAMDPjKrXXARogZaIOMNNYR
 WNNShO2zSpOTYccYjM+nUVHuFE+UjSM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-0H-kmCAqP5eqC_esvxLyjQ-1; Mon, 31 Oct 2022 09:19:49 -0400
X-MC-Unique: 0H-kmCAqP5eqC_esvxLyjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F83E3C0F661;
 Mon, 31 Oct 2022 13:19:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11BF0477F5C;
 Mon, 31 Oct 2022 13:19:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/4] hw/watchdog: add trace events for watchdog action handling
Date: Mon, 31 Oct 2022 13:19:33 +0000
Message-Id: <20221031131934.425448-4-berrange@redhat.com>
In-Reply-To: <20221031131934.425448-1-berrange@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The tracepoints aid in debugging the triggering of watchdog devices.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/watchdog/trace-events | 4 ++++
 hw/watchdog/watchdog.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 89ccbcfdfd..fc1d048702 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -16,3 +16,7 @@ spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
 spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
 spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
 spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"
+
+# watchdog.c
+watchdog_perform_action(unsigned int action) "action=%d"
+watchdog_set_action(unsigned int action) "action=%d"
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
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD208653148
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ylv-00041G-9V; Wed, 21 Dec 2022 08:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylt-00040o-7l
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylr-0003vH-Q8
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SiUjLycaplE4DAkWjhkh2LvDbKNbgoDGsiuIfbJL8+Q=;
 b=PXBbOZ2qVpOMe47EAtsSieH8HhmyCYkzUwgM2shsEHUVLbQcGTjFXweCMJoKecgYWRLYQn
 LgncGGG/iF7GKQJ2CCgO6RWmkmVOP1aZjPVmyJVK9qfQCEiFdTYp7eA393lXm0o5RYrMJf
 ipXgBNqbPMo/U9fFKwAWWsJTVco6ii0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-Ful5M5Y6P7e1z2wexjwtlw-1; Wed, 21 Dec 2022 08:04:30 -0500
X-MC-Unique: Ful5M5Y6P7e1z2wexjwtlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so663434wmj.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SiUjLycaplE4DAkWjhkh2LvDbKNbgoDGsiuIfbJL8+Q=;
 b=FL5IAacffvVnTh1y22dNHY6hFqrTCaVACsIcrnopeQU7gI/STjDxkqdM0ie8k2eL7d
 7bDqArFyRxcwgyqywURPInzpWP6jYjNpZBB7f8cnQKMtBo5xMepYJz+meW/bIxYooGxe
 Kh1yezDaRoDKELHX0xIfCY2H3W1Bo5jb0mxesRByBmUbfTGNsahNECvQblx5xeVeMMJq
 HYP/3Rb8RE+YAgqiUHDA8ea7tbyus3cKje4hHtRfOIfXi7vPbwpQQ4IrUolOIjlYewtq
 MxQ5Ycz1gUu7XpQG0GJIj5aa8CQQkb+Kam582PPis1XfKhB1Fv3xmw5E2cph9WCNdic6
 4qgw==
X-Gm-Message-State: AFqh2kqUGAZtroWtHbD3/iFLWQlI2YazycDozgsz7fm3xIA9FWf2vL1r
 oG5F4NLUdUBZt2KoCYvt8Xen0nHjMC52D3/bFQWg25qz2BCnYWS0mflx1vHXMfPqDtSaFAf4kLF
 NzDKib+BCxRgeNIabNSGuNw80+GKbtyaCEY8G3P8hL2QF/GRhzKJ/jEv+BDw5
X-Received: by 2002:a05:600c:4651:b0:3c6:e63e:24e with SMTP id
 n17-20020a05600c465100b003c6e63e024emr1637497wmo.37.1671627867054; 
 Wed, 21 Dec 2022 05:04:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXva9Si87Bqu/OwjI7IbT2H+OgphUwzgda0TpkWi3X96sipUOd2kcpZsFqnUl51QhiGlyg6H/Q==
X-Received: by 2002:a05:600c:4651:b0:3c6:e63e:24e with SMTP id
 n17-20020a05600c465100b003c6e63e024emr1637475wmo.37.1671627866771; 
 Wed, 21 Dec 2022 05:04:26 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003c70191f267sm2294734wmc.39.2022.12.21.05.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:25 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 03/41] hw/watchdog: add trace events for watchdog action
 handling
Message-ID: <20221221130339.1234592-4-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

The tracepoints aid in debugging the triggering of watchdog devices.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221216125749.596075-4-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/watchdog/watchdog.c   | 4 ++++
 hw/watchdog/trace-events | 4 ++++
 2 files changed, 8 insertions(+)

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
-- 
MST



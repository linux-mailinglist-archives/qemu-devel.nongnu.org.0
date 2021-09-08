Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D748D4041C2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:27:22 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6yP-00043U-SR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sG-0007KZ-Br
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sE-0002wS-E6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2rov07jCDHA26r/9GcgxSj1NkWhTs7Eb1vPCWPgxnA=;
 b=RozFAsnnwYFkaB0pfKzK9DQMb1u2uHJ5zI8M5bmUzi/8hI+7Pz8yqiGnYTuGIZcu00cbVd
 JmeiTD2j6hg3mLMbDNIkcel7sy77u4AYx80QLjruhpnw+Lg4gp+vWK9gnX7w3kR66fr74F
 62kzflqAg8uWRDuspmlsA44ZS6bwqdo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-t_aiY6zjN2CH9IMAhJws_g-1; Wed, 08 Sep 2021 19:20:56 -0400
X-MC-Unique: t_aiY6zjN2CH9IMAhJws_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so27885wmq.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2rov07jCDHA26r/9GcgxSj1NkWhTs7Eb1vPCWPgxnA=;
 b=DLcHWz9edKgvESYhhygeMPAHZROi6fcZeA6iEZtiD7XqeXz85iGzbrV7za9f4mTec9
 firegZV3JOHrxO125jyBOHt1F9eJ0QYKmUWtERRLAr/74t8n3izK6BWTk6zJwmNz9DJ6
 od8XHAX57jn/RXbfouynwRxi7w3+++inQIcy0QohRCQVo3DP19/hXHcnu2LMlB890+Rx
 q8H9I4iAESiAO1yM3HsbhC2p3CD9/+Hz871siliVhCd7C7JJ5K1nVTAONUCZvhBRQuVv
 osmnP6RRk9wzWfuYh0RxEtNe0qDNzp0X10/5GvRuspHUJfgeZx3oXA3sFtAPCEbOhEnr
 NjCA==
X-Gm-Message-State: AOAM530fqKFc/oSsRrC9M/pj6OUX3bwC7MRZ1sBwJ5n/PZmIQt3W6cMj
 By1OVZkGR1bexHtNWDS8Mq/8w+7gViCIYx1NEF0vsgHd5e6rK7DsgoEsPk70tFe28BaCTvAsfXI
 tpoHvIdKtGhDbg2+do24B/NNRaKDymrNjO/1RZCSCKyjftS4ICdhGHgqittUjYjBY
X-Received: by 2002:a5d:6781:: with SMTP id v1mr83005wru.249.1631143255312;
 Wed, 08 Sep 2021 16:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0YS7l2ozSVHS0MrlXrrjEkKOBRZTLJQiA3uLjalXryjpOEItjin5eop39X0TrxKIC57agAQ==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr82983wru.249.1631143255072;
 Wed, 08 Sep 2021 16:20:55 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b22sm390180wmn.18.2021.09.08.16.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/10] qdev: Use qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:20 +0200
Message-Id: <20210908232024.2399215-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add DeviceClass::taints_security_policy field to allow an
unsafe device to eventually taint the global security policy
in DeviceRealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h |  6 ++++++
 hw/core/qdev.c         | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1..ff9ce6671be 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -122,6 +122,12 @@ struct DeviceClass {
      */
     bool user_creatable;
     bool hotpluggable;
+    /*
+     * %false if the device is within the QEMU security policy boundary,
+     * %true if there is no guarantee this device can be used safely.
+     * See: https://www.qemu.org/contribute/security-process/
+     */
+    bool taints_security_policy;
 
     /* callbacks */
     /*
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..a5a00f3564c 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
+#include "qemu-common.h"
 #include "qemu/option.h"
 #include "hw/hotplug.h"
 #include "hw/irq.h"
@@ -257,6 +258,13 @@ bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
     MachineClass *mc;
     Object *m_obj = qdev_get_machine();
 
+    if (qemu_security_policy_is_strict()
+            && DEVICE_GET_CLASS(dev)->taints_security_policy) {
+        error_setg(errp, "Device '%s' can not be hotplugged when"
+                         " 'strict' security policy is in place",
+                   object_get_typename(OBJECT(dev)));
+    }
+
     if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
         machine = MACHINE(m_obj);
         mc = MACHINE_GET_CLASS(machine);
@@ -385,6 +393,9 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
     } else {
         assert(!DEVICE_GET_CLASS(dev)->bus_type);
     }
+    qemu_security_policy_taint(DEVICE_GET_CLASS(dev)->taints_security_policy,
+                               "device type %s",
+                               object_get_typename(OBJECT(dev)));
 
     return object_property_set_bool(OBJECT(dev), "realized", true, errp);
 }
-- 
2.31.1



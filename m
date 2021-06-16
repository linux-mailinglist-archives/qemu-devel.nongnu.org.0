Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052653AA5E8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:06:00 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcjX-0005d7-3X
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPC-000347-D5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcP9-0001BY-LS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwN9k9erMbxP28zXm+/E3BtjsxL5FFiaHo0p4KwDA5c=;
 b=B+P8Sno8Qq8Uzvi0fZo3rWemkSSWYBRqD/RACEhXAT2MoXZtGCOBjDhL+64AKoAEfQoImY
 KiclWSHj6QxeQKV+3WUG0B1t+tjQipJw2tYw0gmhB68MRJAotGWZz8DmBelbL2ch1oI7V+
 47zYfCPSc0N+01VYFe9ndaFE895Jzkk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-AN-VyG1HPvGXDOd9-GZEoA-1; Wed, 16 Jun 2021 16:44:54 -0400
X-MC-Unique: AN-VyG1HPvGXDOd9-GZEoA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l2-20020adfe5820000b029011a64161d6aso1877279wrm.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwN9k9erMbxP28zXm+/E3BtjsxL5FFiaHo0p4KwDA5c=;
 b=WQii36Cic/U32lw8N1aseANJQHfEeB2fya9xDffHudBZLpBGidYoBbCo38jU49CU9G
 A1ciRjvry7IvL/wBUZhxq6sfZxFG/99CiEuZApXI0DNot0x8CNryiS9T87Ed5aLTUe+q
 O4sM3oSpCdb9j7GghEafk471f1me/ClJuPNNd5eBClxeBye7CmvsOv2MaTAVoZPhm9D2
 OTdY9hYSQIhWtRbrEmc31cPGu3drZgixNirh447mGKNwkAehk5NS1+bL8gNmEtjzbQaF
 FZn2pdmQmVvXhM0KWmIay/DkT6ge/s5OBceYfQLmd6VRGGOZbk6KHV/c6VZ7JpcJlY0W
 7BvA==
X-Gm-Message-State: AOAM530m1SMJwSo4fB/iqK9C9dnn3Z8ylcsEB45uwB4xNTQpzeRZLBLw
 akauuFr+iYfJplybRWoq+tI3ojSAZh1WjfPxguPxDpaAc9pdYhTBwUV3PU16TAA96W5wwjd9jt8
 SaGgP8uakqdHqNgQCKKhiWNskhTDWDE1YncbmiQhTQJtOZuyCCfvoNFKssE2XO3wH
X-Received: by 2002:a05:6000:10e:: with SMTP id
 o14mr1207089wrx.76.1623876292653; 
 Wed, 16 Jun 2021 13:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPtcGMuuCPV6j8X7fX2Wamjki6bV6QuxuLKex07GP+vJnlF7gENNSAEE/zq/pgF9lx/lpF/A==
X-Received: by 2002:a05:6000:10e:: with SMTP id
 o14mr1207058wrx.76.1623876292473; 
 Wed, 16 Jun 2021 13:44:52 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l4sm3209991wru.41.2021.06.16.13.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/23] target/i386/sev: Move qmp_query_sev_launch_measure()
 to sev.c
Date: Wed, 16 Jun 2021 22:43:19 +0200
Message-Id: <20210616204328.2611406-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_launch_measure() from monitor.c to sev.c
and make sev_get_launch_measurement() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        |  1 -
 target/i386/monitor.c         | 17 -----------------
 target/i386/sev-sysemu-stub.c |  3 ++-
 target/i386/sev.c             | 20 ++++++++++++++++++--
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 62ee2e1b16a..615cebea1a8 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,6 +28,5 @@ extern bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
-extern char *sev_get_launch_measurement(void);
 
 #endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 6c6d0b5d707..d2289d1fb47 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -709,20 +709,3 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict)
 
     qapi_free_SevInfo(info);
 }
-
-SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
-{
-    char *data;
-    SevLaunchMeasureInfo *info;
-
-    data = sev_get_launch_measurement();
-    if (!data) {
-        error_setg(errp, "Measurement is not available");
-        return NULL;
-    }
-
-    info = g_malloc0(sizeof(*info));
-    info->data = data;
-
-    return info;
-}
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index e62ac5edd83..f5e7536f987 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -22,8 +22,9 @@ SevInfo *sev_get_info(void)
     return NULL;
 }
 
-char *sev_get_launch_measurement(void)
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 23295d74c8b..4ddd24f6bdd 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -718,8 +718,7 @@ free_measurement:
     g_free(measurement);
 }
 
-char *
-sev_get_launch_measurement(void)
+static char *sev_get_launch_measurement(void)
 {
     if (sev_guest &&
         sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
@@ -729,6 +728,23 @@ sev_get_launch_measurement(void)
     return NULL;
 }
 
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
+{
+    char *data;
+    SevLaunchMeasureInfo *info;
+
+    data = sev_get_launch_measurement();
+    if (!data) {
+        error_setg(errp, "Measurement is not available");
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->data = data;
+
+    return info;
+}
+
 static Notifier sev_machine_done_notify = {
     .notify = sev_launch_get_measure,
 };
-- 
2.31.1



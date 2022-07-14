Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A232A574EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:08:17 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByZk-0000YR-PF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo6M-0003Yj-1x; Wed, 13 Jul 2022 21:57:16 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38299)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo6G-0000W4-7U; Wed, 13 Jul 2022 21:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657763828; x=1689299828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+HsAV7OdxnMWexC9vmkuCrGxJDRJZBL9S2oOKWMLa10=;
 b=vp40MMRKnWlKRZ7TxDeqxWijU6b4hhgOX2c9rxNBpCBarP3gEFC4vj63
 4aPusg7ImauInIhYWIwOoc022Rv8OB/lLXvi0qmph0kFFX6H1U1UuLSdQ
 8rKi7z3BnVeUMNcu/NUgBT8jXiKHPiCIapdXXPG9r7+yr+gqrzFOVGdxi c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2022 18:57:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:57:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:05 -0700
Received: from perseverance.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:04 -0700
From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Graeme Gregory
 <quic_ggregory@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>
Subject: [PATCH 2/3] hw/sensor: max31785 : add fan status, tach target,
 and tach input object properties
Date: Wed, 13 Jul 2022 20:56:36 -0500
Message-ID: <20220714015637.817066-3-quic_mkurapat@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_mkurapat@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 09:02:08 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fix adds object properties for the FAN_COMMAND_1 (3Bh), STATUS_FANS_1_2 (81h),
READ_FAN_SPEED_1 (90h) registers for the MAX31785 instrumentation. An additional
property tach_margin_percent updates the tachs for a configured percent of
FAN_COMMAND_1 value.

Register                property
--------------------------------------
FAN_COMMAND_1 (3Bh)     fan_target
STATUS_FANS_1_2 (81h)   status_fans_1_2
READ_FAN_SPEED_1 (90h)  fan_input

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/sensor/max31785.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/sensor/max31785.c b/hw/sensor/max31785.c
index 8b95e32481..1cb31c2e82 100644
--- a/hw/sensor/max31785.c
+++ b/hw/sensor/max31785.c
@@ -164,6 +164,7 @@ typedef struct MAX31785State {
     uint64_t mfr_date;
     uint64_t mfr_serial;
     uint16_t mfr_revision;
+    int8_t  tach_margin_percent[MAX31785_FAN_PAGES];
 } MAX31785State;
 
 static uint8_t max31785_read_byte(PMBusDevice *pmdev)
@@ -530,6 +531,27 @@ static void max31785_init(Object *obj)
 
     for (int i = MAX31785_MIN_FAN_PAGE; i <= MAX31785_MAX_FAN_PAGE; i++) {
         pmbus_page_config(pmdev, i, PB_HAS_VOUT_MODE);
+
+        /* STATUS_FANS_1_2 (81h) for FAULT and WARN bits */
+        object_property_add_uint8_ptr(obj, "status_fans_1_2[*]",
+                            &pmdev->pages[i].status_fans_1_2,
+                            OBJ_PROP_FLAG_READWRITE);
+
+        /* FAN_COMMAND_1 (3Bh)  target fan speed (pwm/rpm) */
+        object_property_add_uint16_ptr(obj, "fan_target[*]",
+                            &pmdev->pages[i].fan_command_1,
+                            OBJ_PROP_FLAG_READWRITE);
+
+        /* margin fan speed in percent (could be +ve or -ve) */
+        object_property_add_int8_ptr(obj, "tach_margin_percent[*]",
+                            &(MAX31785(obj))->tach_margin_percent[i],
+                            OBJ_PROP_FLAG_READWRITE);
+
+        /* READ_FAN_SPEED_1 (90h) returns the fan speed in RPM */
+        object_property_add_uint16_ptr(obj, "fan_input[*]",
+                            &pmdev->pages[i].read_fan_speed_1,
+                            OBJ_PROP_FLAG_READWRITE);
+
     }
 
     for (int i = MAX31785_MIN_TEMP_PAGE; i <= MAX31785_MAX_TEMP_PAGE; i++) {
-- 
2.25.1



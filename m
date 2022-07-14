Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F899574EAA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:08:01 +0200 (CEST)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByZU-00007M-A3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBoCI-0004CU-I1; Wed, 13 Jul 2022 22:03:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7091)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBoCG-0001Zg-QN; Wed, 13 Jul 2022 22:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657764201; x=1689300201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mdg9Jruk/D6blRzaGREhg7fOIzA0MUljG20KF/x/WcI=;
 b=BZ2t+ktts0ySXVs8MOJABw+krTPCaQwCeSjZIzl6GOsN//A4zPWRhqU3
 cY2/UK92iCcCOMk751Dj24WTBkQdkdr3JQ9ze/HgVT8AZ9k5ATdx8chOZ
 nzb+c9V8hdCGz4nvwYiClA9TLNfJWd+q0vaBuE1NTpp9o77/gUrjC2NZk I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 13 Jul 2022 18:57:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:57:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:07 -0700
Received: from perseverance.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:06 -0700
From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Graeme Gregory
 <quic_ggregory@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>
Subject: [PATCH 3/3] hw/sensor: max31785 : update the tach input based on the
 tach margin percentage
Date: Wed, 13 Jul 2022 20:56:37 -0500
Message-ID: <20220714015637.817066-4-quic_mkurapat@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_mkurapat@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Update the tach input based on the percentage of tach target.  The tach margin
could be a +ve or -ve margin of the target tach rpm.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/sensor/max31785.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/sensor/max31785.c b/hw/sensor/max31785.c
index 1cb31c2e82..c37b154130 100644
--- a/hw/sensor/max31785.c
+++ b/hw/sensor/max31785.c
@@ -71,7 +71,7 @@
 /* FAN_CONFIG_1_2 */
 #define MAX31785_MFR_FAN_CONFIG                0xF1
 #define MAX31785_FAN_CONFIG_ENABLE             BIT(7)
-#define MAX31785_FAN_CONFIG_RPM_PWM            BIT(6)
+#define MAX31785_FAN_CONFIG_FAN_MODE_RPM       BIT(6)
 #define MAX31785_FAN_CONFIG_PULSE(pulse)       (pulse << 4)
 #define MAX31785_DEFAULT_FAN_CONFIG_1_2(pulse)                                 \
     (MAX31785_FAN_CONFIG_ENABLE | MAX31785_FAN_CONFIG_PULSE(pulse))
@@ -316,6 +316,8 @@ static int max31785_write_data(PMBusDevice *pmdev, const uint8_t *buf,
                                uint8_t len)
 {
     MAX31785State *s = MAX31785(pmdev);
+    int16_t   tach_margin = 0;
+
     if (len == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
         return -1;
@@ -342,9 +344,23 @@ static int max31785_write_data(PMBusDevice *pmdev, const uint8_t *buf,
     case PMBUS_FAN_COMMAND_1:
         if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
             pmdev->pages[pmdev->page].fan_command_1 = pmbus_receive16(pmdev);
-            pmdev->pages[pmdev->page].read_fan_speed_1 =
-                ((MAX31785_DEFAULT_FAN_SPEED / MAX31785_DEFAULT_FAN_MAX_PWM) *
-                pmdev->pages[pmdev->page].fan_command_1);
+            if ((pmdev->pages[pmdev->page].fan_config_1_2 &
+                 MAX31785_FAN_CONFIG_FAN_MODE_RPM)
+                  == MAX31785_FAN_CONFIG_FAN_MODE_RPM) {
+                /* calculate the tach margin (+ve or -ve) */
+                tach_margin = (int16_t)pmdev->pages[pmdev->page].fan_command_1 *
+                        ((float)s->tach_margin_percent[pmdev->page] / 100.0);
+
+                /* set the tach */
+                pmdev->pages[pmdev->page].read_fan_speed_1 =
+                 (uint16_t)(pmdev->pages[pmdev->page].fan_command_1 +
+                            tach_margin);
+            } else {
+                /* pwm mode */
+                pmdev->pages[pmdev->page].read_fan_speed_1 =
+                  ((MAX31785_DEFAULT_FAN_SPEED / MAX31785_DEFAULT_FAN_MAX_PWM) *
+                   pmdev->pages[pmdev->page].fan_command_1);
+            }
         }
         break;
 
-- 
2.25.1



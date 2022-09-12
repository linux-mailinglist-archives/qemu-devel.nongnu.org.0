Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C45B59A1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:50:01 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhwt-0007Qg-Uv
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVf-0007uy-TQ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:56 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVe-0000Xk-8m
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsyajiVUozNqEycv+XWLjkg+gyBRfpaPILS7Uf8nvYcnkak1gRtDxu47Psj1DmOR6IdoIyAXOdGq38EoiJnezLrs690B7ExIOokxUfF9FZvKw8+WiDy4H0RDLz4HOSweADVOvs1c5si4Ck1Z10re91EXZZQCumw3Qi8pDHSRVeyvuige5eiaf0ZQrP9n2QrzW2PfyEROV1UfrI/TV65HNNPpBjXYCrKYh88av41HjgFFKakpuxYJaugTNn92NYWI3FVE5pDCrQImbc+TKAF3wwA0WFosUdBat8na4vna33w8CHIQPTbvgqXvdLlR/DCYEmr0Sz8hMPqHzfnEJ0pU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdo7DP1k8AcmSJZiJ9U6W+JLZhdL2c/VOtzZKNYA6YI=;
 b=Bjglnt8IHpynYbSUeaphIzxxEzHij6MKO3eojbWrWkLWiYHztDqDA1ZBnQc/KfZOiZxtCHWAjqM16BLT1rN45oGEDqLUw1ajq0NozkU0hnoVDCiHt8BExEPWXPv5cwR9z5yY+xBLmvodxQRSzhytg3vIbRm1WiEUxmeZPlD+zKIROTDD/ckwQw9XYuvvApFnJ6onUTvxGpeun1hrXCkk187G2uvfoJPcM7GQYqiG3PhYaw0Y68YMFxK8W7rKoH4Wm5xfQStBHGpxwZ0BbKSZiQAAAUpUbR1h+IwUiALl8eSYQV975Ajsct53Xdvu8L8gLcDh19RtBpao5y6g6tAxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdo7DP1k8AcmSJZiJ9U6W+JLZhdL2c/VOtzZKNYA6YI=;
 b=okQQuHa8IK2eDIhYkXkcPin9gOPjz8meNW4WaDCcNDBtIgZNEpPEpExMASKGTr7AfupTbYmr5GGWq7FMs5RJ/H3qsW61ShwmwE4NY5kHp2417st8nhMj4H8FuL2l+qO1wPU0Na5RASEHbQyD0h934gg73MseqzWxCjK8kVOfmqqqTaD0DBUC52xxOmxJ+oIPBmGpuj0avE96CWSOnnB+HS0nBA41+uq5X3k0TBXD99QC4fh9SpJliNnndndIZY7eZJ0f3/NQ9eGQWundnHNo9U7ZgBlPlI5/tKY+eNcOT/TYkNMiUWxXmv4hpGqbY6RuurBuZzzpE0T8kSQ2Lmyx8A==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:42 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:42 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 6/8] hw/avr/arduino: Add D13 LED
Date: Mon, 12 Sep 2022 20:21:04 +0900
Message-ID: <DM5PR06MB2537BAC1DA9716B3883C0FA7E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [OyMZLmjkiwKrylyJJHofw0X1oZF7vJdd]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-6-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ba405e-ea1d-45d3-1f80-08da94b0f7c1
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmqxq1ifAc9vd1hrDdkf/Zi28x2bOXBcG7F4dYQOass6opJJEBSMdk0JHB/Jcbg6w6bBZ38IQobvopqA7ry08TocB2mvtkJoCYpL8CUEKCP1w5keUPqnIgE8Pnozg7xo16oT+LtZXUeNjKGsx7XKYgBsJ6Ske5aQx8/KgTXf6Mp5KlQidZauLgU7ttDvP8PbkLy2R7OEz/x5hqSiePBFSQ96o4knwWMu8dQwg3glefz49pJLVVk3Q/y3M7m07VFc4IiBd0ENPSnNMHemQoFh8kG6PPJZHvYedH8TFdWy0mfu67yfqAGEvLxwz4lGOd5d4I4Wajk52imxdSm0cA7Z1qziaorVf1XpYdzvjXTZFFvxnqG+hZTjFl1xLmiCF3XolbFTv4XpFp9+Mp9Np+lZUWHBe8GdllMXRLp8DsrfWl4z8BPIjgFK8l6o0XRsfICwDAdARAcY/PEveYrV8cgpGAbvtPl1de4IpU2htNUD1gK7A1z2c6kLcRj1rrWMZxMHq1O47N/CDjH/nPbBO0pRQOs/D2qYb4E9EWM1wNpSRRboJPr9w0+CQ4P+0qOshK6Ld6DTVv5RUzeJzKS6FcdBwNzBoEU4kV8dNsqmfgxz/l+UkoGTLTkBYD8MC6Dmcci8W7j8CaLIaQTi2PKVshD6IEH2zddXOzlBXbGUIzdWC5/61k318VGOAAd17tKLa/lDTXCdUUKcsEH6XGFxw+wqJdYwvYHBIIKbaHw83Z+2xaq9AG/sPkE5D+GQbXvDHKEje+I=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBAwTQOUPocIZrI3uOt0MyLvPaewYXN8j4QTuCda1AriR6aDlkECZWwjl10A+89pBa1h2ChpVk04fyGn+AmwN2Fq5EAL19p+4XDPW7zYvfTciCOBlVS9oEHoYRBKjVcMTXY6zi09tV2ra4lICUHKU+RIdFvKCy//Ca7wSoFTkogGbxJ+nZLw8DHKA4QQtbte/AfPfRw+ikydQiJVlfyBy/l4cPs3ptwTjyFRuM3iVvNf1x3bBYjG35IvlJeHLTflYyzb6SGuqrDVelCiRMJRqTtvm5sMc0OHoAAUohX+mmTjqnc14QfC/2eAMN+svvatj2/77LZjXPjQGNLkpVbXL05kXpQGiPabFIUm3ctbsYy3XNKg9F1ntd12bAf5Cj7Nsd6mPZ5ygANtLXTq+A9c7I9y511RoUCo7ab5FJsBd9sug/OkJOKj1vyHzE+UxIXjI+GKSgIkVjdYlgi+jk4mvuVIF+HaZeQnf7yK7d5jGp0z4dI/qEMSvwcXFnoayNQROE+i+DEfMvVuKwvcuGuZMgXIlEEAmlkFrrnU/1yTiU9MgbcPzSaqIshj95TOaywoz75a9Qq2mA1L5Fgx89s7buT567lT+zRcvmuHkyP9u1C6Y2+6h8NDS3dDCORc6xOsCPc8BrspA5meTZ3jfOSIjQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXFpdUZCdWZ3WGRoRGVhZnhSQ0NrN0N5R1EvM0YzMFB4NTNvNGNOa1JKUy85?=
 =?utf-8?B?alVvQ1hGWEVmbmYwMlBWV04ralZhSGF3T0hyYnN5WHZGRy9qUTVwSGYrdFdQ?=
 =?utf-8?B?MWJzRXJ1d2xFcEZqaG5tekRCOExxaXNXSGU4S0E4L0ptY2RMdmVCazNSUXpU?=
 =?utf-8?B?eG83bkpzeUdaallOc2FweGY2T2RIemhJQjBicjFuV2lpb1dnMURXRWpXazBy?=
 =?utf-8?B?U1JzSEQyN3NPRUo2Qkw0QkxlRzhxYjhiV3NSZDJRMWJTK08rTVFjSzVuSzN5?=
 =?utf-8?B?NDB4bkxZOUdhQ3VWNVZzczBVQXBzaFpaTDg2Z1VwZE10S3JqcmhZMERGelJI?=
 =?utf-8?B?alhtWUN3N2tNTGdxT2k4b3g1TGZWb2dvdWZtdXBMTnNpQlBhMnpLb1FpL1dW?=
 =?utf-8?B?djBKOG82MjRtOWpiMG45WjlQVnUrQ0ZLdDBMUVJFTG84MFY3UnNwbWFlSFov?=
 =?utf-8?B?VXF0eERwb3dhSVhuM2dPYUFXRG5hY3BzQjlrdjJKQit2aG9GZVd0dERtQlE1?=
 =?utf-8?B?a25mWFhGb2ZmN1JycElqdWNMQmdIdmZlTGpHaWRrdCtjeGlDbXlwZ2VGOW43?=
 =?utf-8?B?WGhRU3VZbkx6WEJxSFJuQnFEa2xPeGczejBpWm4xSGxOYnNmZ2M1WHFjK2hZ?=
 =?utf-8?B?Rko2Y291SWE4cEdmQkMxb0c5NjZSYnhPVmdTRFRoQ2swYktTR1ljc2pON0ox?=
 =?utf-8?B?c2pPU2RHdnFqb2wrYkZCRmhzQU40QVF6NW1SQkhCTTRDeHpBam9zdmpheVUx?=
 =?utf-8?B?ZE9uWmNneEx4U0F0K08vYVk2YnVWZjBQUjAxY1p6cVVkenNWV2hmcW15cjBR?=
 =?utf-8?B?UlUra0pFTXpHYXZjWktmK2JZQ0wxdU5vYVNHckpuaEZQbDlqTDFsb2p3a0xa?=
 =?utf-8?B?OS9lU1Z5RzRicklTQ3h5TFR3VjhYcXJ3YlFFNDRVSEtFbXV6Y2hXUnFuWFdV?=
 =?utf-8?B?aGdBOVB5eHZnaFczTmJZRUFOenkxSjFyQys1anRyYnlpa1I4YTRSS3E2aWRw?=
 =?utf-8?B?TXdEcHZBR3FPb1ZGSkpNZjFWamE5OEJKTzdSS0hHdEdjS2VKMGlVZ0FNdmY4?=
 =?utf-8?B?TEdLemJkOVoyZEQyZ2x0UUsraTZrYmhYNGpGdUFhZGZnMUw2cDBFcVJFRzdi?=
 =?utf-8?B?Qk5NaHRNZ2NiaGNrNjhkUWhhcHRZNFFESWZjMURDWHB3bzh2bHVMdW44V3ZK?=
 =?utf-8?B?eDBGRVloWEczS0IyaU42Z0NhclJJR1dBeW1ySmEwaDNlZ05Vbmt1dE9kRSsx?=
 =?utf-8?B?S2hUSFA5SHJpUk4vUWs2QmNEdW1vcEhUbEMwSnZYeVl5cnFaWTJlV2tUcTdZ?=
 =?utf-8?B?SWJ1Z0xCd0ZsdEwzdzdLTWJ0OEtPMi80UlFCRm5qVkgwaTNBSjdMOEtXdXJU?=
 =?utf-8?B?OXkrNjNRU1habUw5eGxidy9yZ0VpUEFJRDJYa2djMkRZd3pIOU04R1Q1V3pT?=
 =?utf-8?B?Yzh4eC9EeTVVK3lMUEhpQkVEQnNhUkZyeXFGMFRzVDZwbExiWEVTcGhQckgw?=
 =?utf-8?B?bmt3MW1SMmlEQ3hRN0pkaXlTWXMxNDBKK0UwWmpPaFpZcXFDc1dkMzlTUjNm?=
 =?utf-8?B?LzV1angveWpGZzAvMFlPS0FoMGZ4YS9ERTRGT29NZXZhK0hjMS9YT0ZGYnJh?=
 =?utf-8?B?UTQrNENjV2pKNVo5THBjK241UUhUV3Q1bjdvWmt6YU5VVmp1czNKZUxadTZY?=
 =?utf-8?B?K1drbUVlNmt1YmN4VUZXTlZSRFJRY3lFenpja3NIUXJia1N5WEFqcEtkRDh1?=
 =?utf-8?Q?B3zmQmU0qHxnhyL4jc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ba405e-ea1d-45d3-1f80-08da94b0f7c1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:42.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB3876
Received-SPF: pass client-ip=40.92.20.10;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210311135539.10206-4-niteesh.gs@gmail.com>
[PMD: Added ArduinoMachineClass::d13_led_portb_bit]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-9-f4bug@amsat.org>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/avr/Kconfig   |  1 +
 hw/avr/arduino.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index 16a57ced11..e0d4fc5537 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
 config ARDUINO
     select AVR_ATMEGA_MCU
     select UNIMP
+    select LED
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 48ef478346..73563a35d0 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -12,6 +12,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/misc/led.h"
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
@@ -21,6 +23,8 @@ struct ArduinoMachineState {
     MachineState parent_obj;
     /*< public >*/
     AtmegaMcuState mcu;
+
+    LEDState *onboard_led;
 };
 typedef struct ArduinoMachineState ArduinoMachineState;
 
@@ -30,6 +34,7 @@ struct ArduinoMachineClass {
     /*< public >*/
     const char *mcu_type;
     uint64_t xtal_hz;
+    unsigned d13_led_portb_bit; /* PORTB GPIO for D13 yellow LED */
 };
 typedef struct ArduinoMachineClass ArduinoMachineClass;
 
@@ -48,6 +53,16 @@ static void arduino_machine_init(MachineState *machine)
                              amc->xtal_hz, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
+    /* Onboard led connected to digital header PIN 13 */
+    ams->onboard_led = led_create_simple(OBJECT(ams),
+                                         GPIO_POLARITY_ACTIVE_HIGH,
+                                         LED_COLOR_YELLOW,
+                                         "D13 LED");
+
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]),
+                          amc->d13_led_portb_bit,
+                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
+
     if (machine->firmware) {
         if (!avr_load_firmware(&ams->mcu.cpu, machine,
                                &ams->mcu.flash, machine->firmware)) {
@@ -82,6 +97,7 @@ static void arduino_duemilanove_class_init(ObjectClass *oc, void *data)
     mc->alias       = "2009";
     amc->mcu_type   = TYPE_ATMEGA168_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 5;
 };
 
 static void arduino_uno_class_init(ObjectClass *oc, void *data)
@@ -97,6 +113,7 @@ static void arduino_uno_class_init(ObjectClass *oc, void *data)
     mc->alias       = "uno";
     amc->mcu_type   = TYPE_ATMEGA328_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 5;
 };
 
 static void arduino_mega_class_init(ObjectClass *oc, void *data)
@@ -112,6 +129,7 @@ static void arduino_mega_class_init(ObjectClass *oc, void *data)
     mc->alias       = "mega";
     amc->mcu_type   = TYPE_ATMEGA1280_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 7;
 };
 
 static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
@@ -127,6 +145,7 @@ static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
     mc->alias       = "mega2560";
     amc->mcu_type   = TYPE_ATMEGA2560_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
+    amc->d13_led_portb_bit = 7;
 };
 
 static const TypeInfo arduino_machine_types[] = {
-- 
2.34.1



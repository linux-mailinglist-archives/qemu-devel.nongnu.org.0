Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FFC701A22
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 23:56:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxxCC-0006rO-Dz; Sat, 13 May 2023 17:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pxxC9-0006r5-WC
 for qemu-devel@nongnu.org; Sat, 13 May 2023 17:54:30 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pxxC8-0002jl-2b
 for qemu-devel@nongnu.org; Sat, 13 May 2023 17:54:29 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E902E11EED7;
 Sat, 13 May 2023 21:54:26 +0000 (UTC)
From: ~rmsyn <rmsyn@git.sr.ht>
Date: Sat, 13 May 2023 19:32:36 +0000
Subject: [PATCH qemu] hw: add ATmega16u4 and ATmega32u4 MCUs
Message-ID: <168401486673.12341.14012259683871048547-0@git.sr.ht>
X-Mailer: git.sr.ht
To: Qemu-devel <qemu-devel@nongnu.org>
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-To: ~rmsyn <synchlsrm@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: rmsyn <rmsynchls@gmail.com>

Adds support for ATmega16u4 and ATmega32u4 MCU definitions.

Defines interrupts, memory layout, and machine types for generic
ATmega16u4 and ATmega32u4 MCUs.

Signed-off-by: rmsyn <rmsynchls@gmail.com>
---
 hw/avr/arduino.c |  36 ++++++++++++++
 hw/avr/atmega.c  | 122 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/avr/atmega.h  |   2 +
 3 files changed, 160 insertions(+)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 48ef478346..be04e412e6 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -129,6 +129,34 @@ static void arduino_mega2560_class_init(ObjectClass *oc,=
 void *data)
     amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
 };
=20
+static void arduino_mega16u4_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
+
+    /*
+     * https://ww1.microchip.com/downloads/en/devicedoc/atmel-7766-8-bit-avr=
-atmega16u4-32u4_datasheet.pdf
+     */
+    mc->desc        =3D "Arduino Mega 16u4 (ATmega16u4)";
+    mc->alias       =3D "mega16u4";
+    amc->mcu_type   =3D TYPE_ATMEGA16U4_MCU;
+    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
+};
+
+static void arduino_mega32u4_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    ArduinoMachineClass *amc =3D ARDUINO_MACHINE_CLASS(oc);
+
+    /*
+     * https://ww1.microchip.com/downloads/en/devicedoc/atmel-7766-8-bit-avr=
-atmega16u4-32u4_datasheet.pdf
+     */
+    mc->desc        =3D "Arduino Mega 32u4 (ATmega32u4)";
+    mc->alias       =3D "mega32u4";
+    amc->mcu_type   =3D TYPE_ATMEGA32U4_MCU;
+    amc->xtal_hz    =3D 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
+};
+
 static const TypeInfo arduino_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("arduino-duemilanove"),
@@ -146,6 +174,14 @@ static const TypeInfo arduino_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("arduino-mega-2560-v3"),
         .parent        =3D TYPE_ARDUINO_MACHINE,
         .class_init    =3D arduino_mega2560_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("arduino-mega-16u4"),
+        .parent        =3D TYPE_ARDUINO_MACHINE,
+        .class_init    =3D arduino_mega16u4_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("arduino-mega-32u4"),
+        .parent        =3D TYPE_ARDUINO_MACHINE,
+        .class_init    =3D arduino_mega32u4_class_init,
     }, {
         .name           =3D TYPE_ARDUINO_MACHINE,
         .parent         =3D TYPE_MACHINE,
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index a34803e642..292ad9a447 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -27,6 +27,17 @@ enum AtmegaPeripheral {
     GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
     USART0, USART1, USART2, USART3,
     TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
+    RESET,
+    INT0, INT1, INT2, INT3, INT4, INT5, INT6,
+    PCINT0,
+    USB_GEN, USB_EP,
+    WDT,
+    SPI,
+    ANALOG_COMP,
+    ADC,
+    EE_READY,
+    TWI,
+    SPM_READY,
     PERIFMAX
 };
=20
@@ -98,6 +109,30 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D {
     [GPIOC]         =3D {  0x26 },
     [GPIOB]         =3D {  0x23 },
     [GPIOA]         =3D {  0x20 },
+}, dev16u4_32u4[PERIFMAX] =3D {
+    [POWER1]        =3D {  0x65 },
+    [POWER0]        =3D {  0x64 },
+    [TIMER4]        =3D {  0x4c, POWER1, 4, 0x72, 0x39, true },=20
+    [SPM_READY]     =3D {  0x4a },
+    [TWI]           =3D {  0x48 },
+    [TIMER3]        =3D {  0x3e, POWER1, 3, 0x71, 0x38, true },
+    [EE_READY]      =3D {  0x3c },
+    [ADC]           =3D {  0x3a },
+    [ANALOG_COMP]   =3D {  0x38 },
+    [USART1]        =3D {  0x32, POWER1, 0 },
+    [SPI]           =3D {  0x30 },
+    [TIMER0]        =3D {  0x2a, POWER0, 5, 0x6e, 0x35, true },
+    [TIMER1]        =3D {  0x20, POWER0, 3, 0x6f, 0x36, true },
+    [WDT]           =3D {  0x18 },
+    [USB_GEN]       =3D {  0x14 },
+    [USB_EP]        =3D {  0x16 },
+    [PCINT0]        =3D {  0x12 },
+    [INT6]          =3D {  0x0e },
+    [INT3]          =3D {  0x08 },
+    [INT2]          =3D {  0x06 },
+    [INT1]          =3D {  0x04 },
+    [INT0]          =3D {  0x02 },
+    [RESET]         =3D {  0x00 },
 };
=20
 enum AtmegaIrq {
@@ -117,6 +152,17 @@ enum AtmegaIrq {
         TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
     TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
         TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
+    RESET_IRQ,
+    INT0_IRQ, INT1_IRQ, INT2_IRQ, INT3_IRQ, INT4_IRQ, INT5_IRQ, INT6_IRQ,
+    PCINT0_IRQ,
+    USB_GEN_IRQ, USB_EP_IRQ,
+    WDT_IRQ,
+    SPI_IRQ,
+    ANALOG_COMP_IRQ,
+    ADC_IRQ,
+    EE_READY_IRQ,
+    TWI_IRQ,
+    SPM_READY_IRQ,
     IRQ_COUNT
 };
=20
@@ -184,6 +230,44 @@ static const uint8_t irq168_328[IRQ_COUNT] =3D {
     [USART3_RXC_IRQ]        =3D 55,
     [USART3_DRE_IRQ]        =3D 56,
     [USART3_TXC_IRQ]        =3D 57,
+}, irq16u4_32u4[IRQ_COUNT] =3D {
+    [RESET_IRQ]             =3D  1,
+    [INT0_IRQ]              =3D  2,
+    [INT1_IRQ]              =3D  3,
+    [INT2_IRQ]              =3D  4,
+    [INT3_IRQ]              =3D  5,
+    [INT6_IRQ]              =3D  8,
+    [PCINT0_IRQ]            =3D 10,
+    [USB_GEN_IRQ]           =3D 11,
+    [USB_EP_IRQ]            =3D 12,
+    [WDT_IRQ]               =3D 13,
+    [TIMER1_CAPT_IRQ]       =3D 17,
+    [TIMER1_COMPA_IRQ]      =3D 18,
+    [TIMER1_COMPB_IRQ]      =3D 19,
+    [TIMER1_COMPC_IRQ]      =3D 20,
+    [TIMER1_OVF_IRQ]        =3D 21,
+    [TIMER0_COMPA_IRQ]      =3D 22,
+    [TIMER0_COMPB_IRQ]      =3D 23,
+    [TIMER0_OVF_IRQ]        =3D 24,
+    [SPI_IRQ]               =3D 25,
+    [USART0_RXC_IRQ]        =3D 26,
+    [USART0_DRE_IRQ]        =3D 27,
+    [USART0_TXC_IRQ]        =3D 28,
+    [ANALOG_COMP]           =3D 29,
+    [ADC_IRQ]               =3D 30,
+    [EE_READY_IRQ]          =3D 31,
+    [TIMER3_CAPT_IRQ]       =3D 32,
+    [TIMER3_COMPA_IRQ]      =3D 33,
+    [TIMER3_COMPB_IRQ]      =3D 34,
+    [TIMER3_COMPC_IRQ]      =3D 35,
+    [TIMER3_OVF_IRQ]        =3D 36,
+    [TWI_IRQ]               =3D 37,
+    [SPM_READY_IRQ]         =3D 38,
+    [TIMER4_COMPA_IRQ]      =3D 39,
+    [TIMER4_COMPB_IRQ]      =3D 40,
+    [TIMER4_COMPC_IRQ]      =3D 41,
+    [TIMER4_OVF_IRQ]        =3D 42,
+    /*[TIMER4_FPF_IRQ]        =3D 43,*/
 };
=20
 static void connect_peripheral_irq(const AtmegaMcuClass *k,
@@ -427,6 +511,36 @@ static void atmega2560_class_init(ObjectClass *oc, void =
*data)
     amc->dev =3D dev1280_2560;
 };
=20
+static void atmega16u4_class_init(ObjectClass *oc, void *data)
+{
+    AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);
+
+    amc->cpu_type =3D AVR_CPU_TYPE_NAME("avr5");
+    amc->flash_size =3D 16 * KiB;
+    amc->eeprom_size =3D 512;
+    amc->sram_size =3D KiB + 256;
+    amc->io_size =3D 64;
+    amc->gpio_count =3D 32;
+    amc->adc_count =3D 12;
+    amc->irq =3D irq16u4_32u4;
+    amc->dev =3D dev16u4_32u4;
+};
+
+static void atmega32u4_class_init(ObjectClass *oc, void *data)
+{
+    AtmegaMcuClass *amc =3D ATMEGA_MCU_CLASS(oc);
+
+    amc->cpu_type =3D AVR_CPU_TYPE_NAME("avr5");
+    amc->flash_size =3D 32 * KiB;
+    amc->eeprom_size =3D KiB;
+    amc->sram_size =3D 2 * KiB + 512;
+    amc->io_size =3D 64;
+    amc->gpio_count =3D 32;
+    amc->adc_count =3D 12;
+    amc->irq =3D irq16u4_32u4;
+    amc->dev =3D dev16u4_32u4;
+};
+
 static const TypeInfo atmega_mcu_types[] =3D {
     {
         .name           =3D TYPE_ATMEGA168_MCU,
@@ -444,6 +558,14 @@ static const TypeInfo atmega_mcu_types[] =3D {
         .name           =3D TYPE_ATMEGA2560_MCU,
         .parent         =3D TYPE_ATMEGA_MCU,
         .class_init     =3D atmega2560_class_init,
+    }, {
+        .name           =3D TYPE_ATMEGA16U4_MCU,
+        .parent         =3D TYPE_ATMEGA_MCU,
+        .class_init     =3D atmega16u4_class_init,
+    }, {
+        .name           =3D TYPE_ATMEGA32U4_MCU,
+        .parent         =3D TYPE_ATMEGA_MCU,
+        .class_init     =3D atmega32u4_class_init,
     }, {
         .name           =3D TYPE_ATMEGA_MCU,
         .parent         =3D TYPE_SYS_BUS_DEVICE,
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index a99ee15c7e..37d36b9b69 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -22,6 +22,8 @@
 #define TYPE_ATMEGA328_MCU  "ATmega328"
 #define TYPE_ATMEGA1280_MCU "ATmega1280"
 #define TYPE_ATMEGA2560_MCU "ATmega2560"
+#define TYPE_ATMEGA16U4_MCU "ATmega16U4"
+#define TYPE_ATMEGA32U4_MCU "ATmega32U4"
=20
 typedef struct AtmegaMcuState AtmegaMcuState;
 DECLARE_INSTANCE_CHECKER(AtmegaMcuState, ATMEGA_MCU,
--=20
2.38.4


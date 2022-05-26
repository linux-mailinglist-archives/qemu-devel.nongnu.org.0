Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40574534E9A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:52:07 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuC2A-0004Gv-2e
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuBWh-0001iO-VX
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:19:36 -0400
Received: from mout.gmx.net ([212.227.15.15]:51177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuBWe-0006Ap-Ts
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653563968;
 bh=Xt2yHy9ul/2ceiOLYn7Cudp4EdYsss0CVOqNY9KiYyI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OXR0bKbv/rWngDSsjMl91teoscPqyGoxOjOKXDDdN9/l7qCJwP/Ba20eRYAx72bGA
 z2Q9hJxGwuPRsoyIEABzqQG+6yw7oLCuUyUJMgfsodYe4lQPyhgo0QLFmTozCpktyM
 shtF4c/UjNOL/AtL7p6YH8Zb6x2Rob3wI/1YJ7ow=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.164.234]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ3n-1oNWlB2eG5-00WDaI; Thu, 26
 May 2022 13:19:28 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] hppa: Fix serial port pass-through
Date: Thu, 26 May 2022 13:19:26 +0200
Message-Id: <20220526111926.19603-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526111926.19603-1-deller@gmx.de>
References: <20220526111926.19603-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ByvHp1mVCCf89wrkTBYrq5+IbkX2lWvu3g9r/+OYr1AEwy+IqD2
 syvnNPA48GvR0nUc2M4tszOdEuHaoPEvau5iyUFFgCw1KIqNYw+XVPQxjjQhT4d2x9ky5Pp
 Gs5NcWj6tY3HgqMEM143P0v3YLIxl9v9k+SFda8tNBStItrb2t3FhkpOJrLf+nk+EX4KC0H
 SH4zdEqsUKBD5C2DguUMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sgdo1zxtHJs=:dxqKUzcLuzqaZB5qxAr8lV
 TSMwJAzbX2CDabLLIH3BPBFZlF/abbvZDxa+QcnUnC4MRYI4yuEw/nq2JZUIMwlk3sr6HytSh
 7LPU9WLtvCmTmoNPs5Og/L++kC88Q0LjjVP+LdbSUVmsLu9/98r+7adXR9vcyu6I7uLgQmv0K
 02n7cSX4w8nItZcnznUbS4EHhebk4Yb4Qms2bPkk+QN08Rf3Fz8nN0uV8QFEkdt0u6thtcmO2
 X+00SyZ9K3q/mhsSBadQ4pooMh11m2Vl6rUbNCAyt25Fxu8F7OlJaCECBqeV1VemXCcMSPO9Z
 HN5ablvQ4tZH5Ett6FwQp6hvmIXgWutTFp75fP9OUsvU8uv0XAs1RMajRoz/BbN109+Yr90Ui
 Q/qxz7fkm05FPSQB/i+hL+UtcXV7ilF/JRc5cm4B89+Dw0miR85OlFyP2/ao4T2BC+T2lLVZl
 Vq67WVsNcZWtryCvYL4XGda3V+tzxRSWhBdkgkwr/lmdOEkua4eZHMuQmPMp6DiscqR5NsONJ
 xrAw0aX5YZVP0CWYPtDADN36MkguNULW2uVZ13J2jbnjC6av+7FQ6sAqz86KEpe2gxAmByF28
 Fm8VH1A0kukHJ0IHeE2S4CYEEWJhmXfdvqJWaklUFYmmF/1AQJ21v7lroBCtGPH2+Y2K6/DsX
 6ZID88ELcCrZ6vxD43o4NwuRr+PwToIBLu0ZHHRX4acFZB7mTTIUx2jo++thfTQ13gMeM+Yom
 7xR4ZYaSPZ2/sCA5UFBaad+qWETW9jlnedECLwjT5fVOZYlqLph4RVclXeVU84HPaHgEGhOh6
 4l5A8dMngFq0GabIfEuuNN1AL5DfCMK6z6xY7ZL14ncVQHcWSeATFjjQmrVeQspVWps4mjC5v
 fNkBv5CuyUwjob0zOrtGNogdeQHbcCs3wrIDd+I2W3zJRcCbKoQLytdvMp19eG3lIoxUq8CBV
 yMpJzBmzeUcGOkZiqXG0ucDDJkLiXDFxerMG/gts9GQyCpFW7KaBLUVI2MrL8yWil8SBp7Sqe
 mVcm1beksofPjUEQB+W4X0WSZy8vqDtAmFeUNhydsNsXfW9XQg8gsHjXfPP/oOOcPppzSUfym
 fPxZgFKkX4AU2AI7BdoW/RF2QOHgBhEWYRcZlo+K9dSTWrTwYd4jfHegQ==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This fixes the serial ports in the emulation to behave as on original
hardware.

On the real hardware, the LASI UART is serial port #0 and the DINO UART
is serial port #1. This is fixed in SEABIOS_HPPA_VERSION >=3D 6, which is
why the latest firmware is required.

The serial port addresses in hppa/hppa_hardware.h are swapped and the
file is synced with the version in SeaBIOS-hppa. Please note that this
file is shared between qemu and SeaBIOS-hppa, which is why a comment was
added at the top of the file.

When creating the virtual serial ports the correct port addresses are
now used.

Finally, this patch now allows the user to give:
    -serial mon:stdio -serial /dev/ttyS4
to use emulated ttyS0 in the guest for console output, and pass ttyS4
from the host to ttyS1 in the guest.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/hppa/hppa_hardware.h | 10 ++++++++--
 hw/hppa/machine.c       | 17 +++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index 8b6b9222cb..c036d467f3 100644
=2D-- a/hw/hppa/hppa_hardware.h
+++ b/hw/hppa/hppa_hardware.h
@@ -1,4 +1,5 @@
 /* HPPA cores and system support chips.  */
+/* Be aware: This file is shared as-is with seabios-hppa. */

 #ifndef HW_HPPA_HPPA_HARDWARE_H
 #define HW_HPPA_HPPA_HARDWARE_H
@@ -30,13 +31,18 @@
 #define PCI_HPA         DINO_HPA        /* PCI bus */
 #define IDE_HPA         0xf9000000      /* Boot disc controller */

+/* offsets to DINO HPA: */
+#define DINO_PCI_ADDR           0x064
+#define DINO_CONFIG_DATA        0x068
+#define DINO_IO_DATA            0x06c
+
 #define PORT_PCI_CMD    (PCI_HPA + DINO_PCI_ADDR)
 #define PORT_PCI_DATA   (PCI_HPA + DINO_CONFIG_DATA)

 #define FW_CFG_IO_BASE  0xfffa0000

-#define PORT_SERIAL1    (DINO_UART_HPA + 0x800)
-#define PORT_SERIAL2    (LASI_UART_HPA + 0x800)
+#define PORT_SERIAL1    (LASI_UART_HPA + 0x800)
+#define PORT_SERIAL2    (DINO_UART_HPA + 0x800)

 #define HPPA_MAX_CPUS   16      /* max. number of SMP CPUs */
 #define CPU_CLOCK_MHZ   250     /* emulate a 250 MHz CPU */
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d1e174b1f4..5d23b9e528 100644
=2D-- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -32,7 +32,7 @@

 #define MAX_IDE_BUS 2

-#define MIN_SEABIOS_HPPA_VERSION 1 /* require at least this fw version */
+#define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */

 #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)

@@ -236,18 +236,15 @@ static void machine_hppa_init(MachineState *machine)
     /* Realtime clock, used by firmware for PDC_TOD call. */
     mc146818_rtc_init(isa_bus, 2000, NULL);

-    /* Serial code setup.  */
+    /* Serial ports - Lasi and Dino use a 7.272727 MHz clock. */
     if (serial_hd(0)) {
-        uint32_t addr =3D DINO_UART_HPA + 0x800;
-        serial_mm_init(addr_space, addr, 0,
-                       qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT),
-                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
+        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
+                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 7272727 / =
16,
+                serial_hd(0), DEVICE_BIG_ENDIAN);
     }
-
     if (serial_hd(1)) {
-        /* Serial port */
-        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
-                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / =
16,
+        serial_mm_init(addr_space, DINO_UART_HPA + 0x800, 0,
+                qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT), 7272727 / =
16,
                 serial_hd(1), DEVICE_BIG_ENDIAN);
     }

=2D-
2.35.3



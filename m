Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4783536C25
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:50:04 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nut59-00066L-VL
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx3-0007mM-7M
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:42 -0400
Received: from mout.gmx.net ([212.227.15.18]:43277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx0-0006lN-Uh
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653730896;
 bh=TIoeIMAXLpgNl8wi8olfeJJjctMeiO8INirResQFQGA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SvIeGP0U/abkm7X7WVWVSSCVtyvxnpjoG3nCt5TesrEr27InLkLyYKyNkHLjzpL2e
 /+u8luGKoFFQr/hCz9SBqipzYsJ3iRDJRtVlKtx7sa3+oUtzsCCL2/421detKivP+R
 yMRffv3ZgXgQhPRuqi60fb4MXaQIIQDhgI9vzzMo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1oB2tB0g73-00PZhC; Sat, 28
 May 2022 11:41:36 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 3/3] hppa: Fix serial port assignments and pass-through
Date: Sat, 28 May 2022 11:41:34 +0200
Message-Id: <20220528094134.16513-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220528094134.16513-1-deller@gmx.de>
References: <20220528094134.16513-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pVL08YWjIECE/Q7Sz81H9CuDZnnCx2cVeQ4cA9pl1mdqorsQUFf
 2IUdyDAYb2r1e8nUcLJ/c1Hp3eEfslzNE+8S4uBCjDW499aAKymaUwKUUd+6CAD7KZUSMhp
 jBx5PzBx6mDFFOfCzgm2vB4J/2IYZrunY3zCku1O3Swrk6vWWbpv24xjylanQpZex2+5Y3l
 oqZsqhzioBBhaWtyxvvYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KCfdBMO88yU=:DdugYeSpaDreVO4m392N1H
 GrXlwCgq8PZ8ApHzIrhvG+woALNURdcmBRdNW3Heez68hsOC1DHXDY/UrnJv34wgdDhzx3orL
 nRu/PGM6qe0Tlok2/r3uzBlb6zo9iUH6Z9P3hdEkimWnKrz8BHDgUfRdEh40mHoF9SBqjSMhU
 WX703yCXzcp2iq6baCRIHdExx1FO/yXn+O+8nr71BKfmO5oHkznxQdZsODU3FCyffcCd7Gots
 Sw1ufAUyyWXb6n09hJ3mOx6sCN6T4/IjqpJVfU/plJkkBqedxnKYPLajcT0xsWdLbMR29I61I
 I65A/n37NmJ6uYB6u2hYPtsWF2lt2gvreTvYmSn/t+UIR0YqaZ9xmWxP55d0fjZVuE5vKwkW2
 4cD9oOoItcS74haeez17sdwEL1vCQ6a3m/XGQzi4msnk3++w18w6fWWUQnwCfu47KJfgLqDxe
 vf0lwiFLUDiDW8ot2qQpcuuoB8U66Fa/l+sF8qKA9Kx6GYjOzBc0CS5o1Jl2QqC76eqpZg9JO
 AfBqpk4YBrewSJ8MdL8oo77LNY50VmPW8rodqf3TIc07fGxvkPC9tVx7YCZ6+C0Rn1vMqxiH4
 zFm/n2D74PSxCpRCAw4QxffRdRUrqBZjgtDuHjvs9j4zHXintvIqk958cDuuEV7Vmmrk+I0m7
 Fd/dsDrNgUxygpy8ObqC74U9JaiWg9GmkpgNNPbqKeBg0BfmjzJxjqZ+4+Jg08rXGBuCvd78F
 AEogeL2HgPnE4cZErZJgTpH31E5mmMMnPIg+J6NppOMhM4MKrEcg2d0diaVEkUAF1uIKW4Aqd
 kkmbILPtmti9JgZBgZxH54jaYfiYD136Jusv07HB5UZXbL0d7P5DpgNUe+OCVa4Chn/DSktHZ
 Y0rddxyIjz7M8xA+T4ZJrhkezdMtV/1cTGDP4p5MRMFYCnSAWsjmHpb3ruBMktuz03Sfl5dv4
 ofIygk1rsrURsxed5aOUBl+SAfhToVKzlm6cF7mV60e9bEyhnwpn65HgBeC/6lwJjKNZcSX+H
 3Pm3ZJplf/lcGAFDuu14dTw1v1ufu3gwX9gnL1rjj21HIvtbboMl8gyBjKzyFBX1TQXcysBsR
 1NwrLoiH/GN1ARTW1LO1Fm1YtXEuXdrKbYsU6IUYNy0rtqlTtPkTzsLQw==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
is serial port #1. This is fixed in SeaBIOS-hppa firmware v6, which is
why at least this firmware version is required.

The serial port addresses in hppa/hppa_hardware.h have to be swapped,
and when creating the virtual serial ports the correct port addresses
are used.

This patch now for example allows to specify on the qemu command line:
     -serial mon:stdio -serial /dev/ttyS4
to use the emulated ttyS0 in the guest for console output, and pass
ttyS4 from the host to ttyS1 in the guest.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/hppa/hppa_hardware.h |  4 ++--
 hw/hppa/machine.c       | 22 ++++++++--------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index 37bafff1ed..e4b0b142d9 100644
=2D-- a/hw/hppa/hppa_hardware.h
+++ b/hw/hppa/hppa_hardware.h
@@ -41,8 +41,8 @@

 #define FW_CFG_IO_BASE  0xfffa0000

-#define PORT_SERIAL1    (DINO_UART_HPA + 0x800)
-#define PORT_SERIAL2    (LASI_UART_HPA + 0x800)
+#define PORT_SERIAL1    (LASI_UART_HPA + 0x800)
+#define PORT_SERIAL2    (DINO_UART_HPA + 0x800)

 #define HPPA_MAX_CPUS   16      /* max. number of SMP CPUs */
 #define CPU_CLOCK_MHZ   250     /* emulate a 250 MHz CPU */
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d1e174b1f4..63b9dd2396 100644
=2D-- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -32,7 +32,7 @@

 #define MAX_IDE_BUS 2

-#define MIN_SEABIOS_HPPA_VERSION 1 /* require at least this fw version */
+#define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */

 #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)

@@ -236,20 +236,14 @@ static void machine_hppa_init(MachineState *machine)
     /* Realtime clock, used by firmware for PDC_TOD call. */
     mc146818_rtc_init(isa_bus, 2000, NULL);

-    /* Serial code setup.  */
-    if (serial_hd(0)) {
-        uint32_t addr =3D DINO_UART_HPA + 0x800;
-        serial_mm_init(addr_space, addr, 0,
-                       qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT),
-                       115200, serial_hd(0), DEVICE_BIG_ENDIAN);
-    }
+    /* Serial ports: Lasi and Dino use a 7.272727 MHz clock. */
+    serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
+        qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 7272727 / 16,
+        serial_hd(0), DEVICE_BIG_ENDIAN);

-    if (serial_hd(1)) {
-        /* Serial port */
-        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
-                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / =
16,
-                serial_hd(1), DEVICE_BIG_ENDIAN);
-    }
+    serial_mm_init(addr_space, DINO_UART_HPA + 0x800, 0,
+        qdev_get_gpio_in(dino_dev, DINO_IRQ_RS232INT), 7272727 / 16,
+        serial_hd(1), DEVICE_BIG_ENDIAN);

     /* Parallel port */
     parallel_mm_init(addr_space, LASI_LPT_HPA + 0x800, 0,
=2D-
2.35.3



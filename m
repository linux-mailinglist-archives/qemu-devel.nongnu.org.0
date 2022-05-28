Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25716536C51
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 12:32:26 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nutk9-0002hi-8j
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 06:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgJ-0000ho-64
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:28 -0400
Received: from mout.gmx.net ([212.227.15.18]:60335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgG-0005Xa-3k
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653733701;
 bh=lZfv+gNTJdIsyDLhO1fRXmiuS8vjQ5DWtqOm1dXUiUY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=acWpnkmUJSZiqP2omUYFN3doKftv5j161U+PPX6cQR3QN5fLOOXdNVy5PmpFiK5UE
 L+yADMRkQ+v4TQz/KeeaaXovy6ATRDvTDGNBCJCf1hJ4ApEDrcDf6uVUebp7Gshi7z
 +rFx3vpFZsF0U4sbyLdsjRsmqCzW9jIfivlRfeJA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1o686A2E4B-00Bu81; Sat, 28
 May 2022 12:28:21 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] hppa: Fix serial port assignments and pass-through
Date: Sat, 28 May 2022 12:28:19 +0200
Message-Id: <20220528102819.21983-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220528102819.21983-1-deller@gmx.de>
References: <20220528102819.21983-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ykvXhR3h2luOrUx/aMuwMToStJDGx1MK98g4uWzEzb1WKRuSWi5
 nZBOqzWHdvQBW6bX1Y6uQoz9y8UguH5dYU8h2nQ7rD3Ma8D08c6ftTgvOPD+fMEjYHbiZnu
 u324vAfbxttpYT1WkUOw4YVV09UtaqPoVcbK8lQ31uWCSe3wan9cett1wGXKsiHNiuiHDCa
 ees2MpOfGoh9DzTK6lZNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OA3whFx5jfg=:CYHH/xvDhFeqoTg8v8RZdt
 wcH2yan4oz4k16vXW5ggSd9Y8BmzSfiotSniKd3/cpR+JY7Yuyk8IH2F4qNx9Xnh+0SGNpNKh
 +ZBkiW+o00AzmeidjN6vlC1qht77Ezc7O6bTGBRiUuPdXOVG6LAoy09GDbL5H2qka3Tnb/VXC
 24ZUc3I5S4Ep/Tvq5l3CXwIzTpAuO/xaGeCYwMp7RthQXuAI4xR91P0sh23s24lwExk58OhxV
 uUOLDO3KTAAOzxphbje3freS//0yV7brV3G9h95EizMQmuvGgZVzcxY8HTaVQHTENdS4nVOCu
 dOGKvns4JGwepX+9kZvt0YwwzbL6W+g+eNNxdXXbQiC1p6/uVSxD9Bodz/BVStP0LMuL4Ctnd
 xzhneDRKQQJ4PV9oJHB2S7xYjWPdT/cJN64eS9DFUWoNfp3XoxKm3bO64rY6Oy2GdL5DO0Z9K
 9HMyAksVqIkRqNSRiMhmhDAswyYOM62Db/LQdBjJOPF3dcaYDrY+et68OJtHYUP/Kbgt1e5sY
 34CwEdSNiLc0K3rmS9yHnBzItPIcVvBXysxqiEwJTfCuIJGt4/VGfecMJmYtfjiZDHYEq4a6L
 e5eYdpx7r0ndj1Yaq8v674cuCnNnUgUoQ/9zlU20OA6l/4S8QUthZFZVep4hDh4uYVEF1PvIR
 qxYK7FC79DJlLWpgJYKoIcGyXwSdJJ9+mN36kAHTrucmbV1ElWEjj7tTxM7qIYJFXXV8KMA1i
 3jvRsq4y9lB1QoAMxv6sZWOfko7pgFr1U9HzIWqk5xP3ur0CJjEgQLuM7P0YfQbiDcdo1BaZj
 XIHQfwANYLkRqtsCS0bUDgwBTrd4QmucDNrSnIe7lOoTuMTt4jF8Rkvm1rr2GqQFkaQo+LbGD
 6rl1oUEauh7NVD8PJ2E8gLp21qUsYvvRlQ9Lpw5UoC32ULprBR5Il7hB43EYZLK1G8pplAoiS
 vEPF14v46JR/pYThGj8JD6UBOnDDzUgp1HwBf4ACJq7kNuHDcY61jIHavApVxb7z+NCFSbfeT
 JhJT4chi/Pe0v/yPq8AX6icTyoa2mOd7mrMUfSmdfcp43p6wI+hDRzLY6mW3xox6KSAOzkdB5
 fhuXipxqrM60NOIsMQ0XTnmXuO/zCEjLIzpBC4PGict5cTsDHRPdFdfZw==
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
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/hppa/hppa_hardware.h |  4 ++--
 hw/hppa/machine.c       | 22 ++++++++--------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index 3f7627b98f..a5ac3dd0fd 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F841C1B4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:37:28 +0200 (CEST)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW1n-0002Nl-M0
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtk-0002BF-IA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:08 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVti-0005wZ-Kp
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:08 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MNcYX-1mCbIT47xL-00P5dl; Wed, 29
 Sep 2021 11:28:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] q800: wire up nubus IRQs
Date: Wed, 29 Sep 2021 11:28:42 +0200
Message-Id: <20210929092843.2686234-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wjb4GEAEu3mxz3dqWc7ncrr8Lk6xDRkOYv11AnReZzaEwqrfXyW
 mFdvyyV871kOjrfUe0WXT9vin5QambjWXqkwlblD+JAI2jAUfis0jNP4aI/ljCi5RmyqD6K
 nLT9effwAwXbVmCm0fk7pk8gAuBLxF/KTrQ8uj2MnQF7Itvop7MXQbQpkuSruoDTme2hmXg
 vHCA1i3IxyrSZC1Qqv44A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XhtQASqi0CQ=:uBGwyGWHvp0UsMQGZCVkPc
 F5doLZbN+O0cnLrGXFwEilMxoZKyUy9qKH6YikVn92ByskD8sdnajlKq0dWWnedu7EjpJGnGS
 flzvREezaNw8T0HHZjc/GEwd91Zd0ZmiLmFSdEc292O2aqaktU1uH7TMYZdarn180HRpYkpuN
 tGD39vKrHDIftapT8Tp0HWc1PX2F9c7MOCM0EPb+BX6kUpuqgWEZ9gHP12XfQVXqk7gUVyHFU
 7n/dermW1uBGQn+ifwc9Ss+VI6/88wCUOPUHqKlRG28EHUesSeescmpa8nlW1MG+PQOJUcPWs
 gWqC8Qil1FxKHASXl9eFZVJ9sIsIXRDlvYtKgoXfIMefW3Sxe21eiHWfv48jpzSUoTMZpmcxI
 pOHiSb2yEDmeBcHz27YFOxSFq/wiktJE7jm3MhPW/w7ghoOsDiCOomX6T7rYgVoOfVLrcPN3g
 7wB4+bERP0vpw4S45ZWMvRdMu9fzi4tlXiIqVkLQCop6q1qt19cfBt6OduB05M8X6AmMfQsjx
 ZkWWaa4aS/sppoiU/ohz3ANPTqK2MMtWWLy4owRrbcVWyC2OCMfTKpguJp222dKOsNTTH3DP7
 /S/W51BP9dRtXYmSboUfixh+LsXj7ScxvXAB1eE9YOK/atjYAX+jjWouWn8YIRMCRlOh+aD0U
 Dtqvbf8Q5mhaTNDd7sOZVutx+diXlFJGsZNwsgo2VmyIWODBYId+e3zrnSnyVDSWoxdniPkMX
 eaOCjeG+rFwGhd0t2pm201TMq2cH1AFWDXiKHQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Nubus IRQs are routed to the CPU through the VIA2 device so wire up the IRQs
using gpios accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-20-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 074acf4fdc75..5bc9df58a097 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,6 +398,12 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
+    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
+        qdev_connect_gpio_out(dev, 9 + i,
+                              qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                                                     VIA2_NUBUS_IRQ_9 + i));
+    }
+
     nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
-- 
2.31.1



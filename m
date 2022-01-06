Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B4486456
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 13:26:16 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5RqP-0007wh-1O
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 07:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5RnM-0003bP-Dk
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:23:04 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5RnK-0006fs-Bd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:23:04 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MuluP-1mEAPq1LEJ-00rs2I; Thu, 06
 Jan 2022 13:22:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] q800: fix segfault with invalid MacROM
Date: Thu,  6 Jan 2022 13:22:47 +0100
Message-Id: <20220106122247.771454-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OaT/qC2GZfyL+fSA7q8tEGrxYgkfZ6obV4raA/UKdVZ/UdaLJn/
 l7AUAtO0hbUq/qZK9X1uYHLpe8lJV+ltDoH1lox2ij1NIvjQMA5cMNhMoXgvnznakYC5H3h
 FlyKg0OFdsAXw0Xt02K34wnbm+Jzl+BXEocj6L8ALnQOyHkZitLK+HKBTKiIUo9PF2nykAC
 I78mceDgpTG0cYjuQcdlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8U2llL0YPm8=:PPHUDrgcrb0ROuoabUOk11
 X0yvlDc7VmXlWIjanp/+i6+oz2rZHAHvcvqchmg4U97kGiLPqXOwGb+lDkKeEUf+zQpbjMdHd
 iIJAzuAHnsZ82ignJ8qU4lqO48AJV7XYDtatQQjlHMQ5mgjOo/zB2n+4PAFHElNBaJBLILlEi
 orPvONuX6FeotUmfkLfXiy0Bw6a9Ctq8hkvAggVkmb0msNleBsNwZsZSg2twlsflplGezAAyy
 Ynq9DQR6Pc/J18D5wRArOVlCAp7w1Sm4ec/+WFGjTUjRxqbvQ28oqduzC/S4rdRkqlD6Os5Ta
 JKGV3UDtJryLdIWLX0/v62ZMfJei7l4W3imbYgyCuUP/1iyt+rQnsArbTO/yVJx8oFv5hkwub
 VIyNFIBHVBdgYpODVX+GYO6Qz2P9OIoZ9l8pgdNONU1FSXg94rhxOdkq3oKuaNL+veB5TCmVH
 P4+cGcC5mdbkLbWdmfqd4H2kfO7eU7MykIvCcoqUyWLt6R1Kd/hGfRFToCreL28v+vWRnJpSb
 ruhcMGk3cZcUzmMJ3beIoeocj9XUPTe7/cIpZGm1el96Js+p84l7KQoZ5Hne/zi1MGtKlBKTe
 qWIFpr9l4boWVZh474g8x1+cF8oXUmQjF2KSbSArCthd9dd9wHnDMArxE4du7CcA1TlCW1BCQ
 Cq2WDTwYWqJf8pZM+94AD67vnOWLTCIjKsEjvA5bGS0TifsdgK9lboBpuaLUW1tUmeV4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
in q800_init().
This happens because the code doesn't check that rom_ptr() returned
a non-NULL pointer .

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index e4c7c9b88ad0..6261716c8f7e 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
 
         /* Remove qtest_enabled() check once firmware files are in the tree */
         if (!qtest_enabled()) {
-            if (bios_size < 0 || bios_size > MACROM_SIZE) {
+            if (bios_size == -1) {
                 error_report("could not load MacROM '%s'", bios_name);
                 exit(1);
             }
+            if (bios_size != MACROM_SIZE) {
+                error_report("Invalid size for MacROM '%s': %d bytes,"
+                             " expected %d bytes", bios_name, bios_size,
+                             MACROM_SIZE);
+                exit(1);
+            }
 
             ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
             stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
-- 
2.33.1



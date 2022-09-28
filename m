Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1805ED841
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:53:06 +0200 (CEST)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSoT-0000Jo-Ph
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-00087j-Vk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:30 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE3-00089v-O9
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:29 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKsf5-1owVk6190n-00LHKE; Wed, 28
 Sep 2022 10:15:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 09/38] linux-user: Fix strace of chmod() if mode == 0
Date: Wed, 28 Sep 2022 10:14:48 +0200
Message-Id: <20220928081517.734954-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wW157dSxuI13Lk7itxP3LXL55v3ZsD3RLA6W1kNLy42PoMm7fAC
 5i6/+VB9lmFjdeO6gCX4NNV7yRl/V2UOVJbjaSpXY6IvrntRGJFzqx4wRiJo8rx66Os4718
 rJZ7+ZVt+VZo2HIHfxBe1XhSNu0l/xSqKE+aD2GiDjDLeFn1HlTN/vtE7/G3J6RGEboBba7
 XcHngg8y7kwEFDM4SKkQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wZjjziwp3Pc=:eaq13rPcZesd89pSyIo6PR
 Vnr1qA9QSAQUT0R+L1nxrPvmh8u/iQ+cd/YvQB/o2Cj0RJ6UfR2cEZ3A+nm2NqHx6xG3k4VYS
 PISi8SiyyvdWYCm/uSTo0bn57ANRMIFIraaLy9eV1wbTtSgP3NdHayfqzKWrPmI0NrYFMD9nq
 Dbk9E3hJlotPeTdvUL+rZDHgDtxCa/QYfa4b4/v8DPVZrHa4xk+TaGw9gu17N7MlYZNKEImSQ
 XOf5699cFwzUngMrupC6biS/936Z+lTjzKg6UBVlTVNv1LVi/iHnX9IFN2DFV0hq8x0RPLpYi
 fLHX8yj9UU+ZRnRRQ5ORrOfxGqJnDyQ7ows9eNmtToLuIwNICqHL7eOmPIcoBqsKV0rLA1M9m
 7KDsOk1Ei12CuTgI/GX2RePVGCnx3wtzg8Uv4BeEggiJSrbLV3awNLRn2ZyUpj6o3/xx5D3DZ
 Zhzt99A9RCBSNbNizk6RUDrV7DCtcnWhum6Erhun5Ci4AboDnFDggpD5IfpJ4W537PMvAYUBc
 8S4Zjh7H/pXzLoQqQq6A2JosRqv3J5A2C7AQiePnVrqXmrzStYfk7y81uxiMSBhDP9aT3IdB5
 zOiRPgINnadFSjGwg7WpJCKbG6iztHlONwja6oKc6KloRkKu3V1ASNZsPhotBw7rt+r1JDLgu
 x19AHGtsppU+nZormUj9TIq7ys4LNrGD8tbkMEm5kI6BQKFU5lRMwAcZR1FL6ZuSNljhR9iC9
 GDcBklrfUqCWk2DtRLgqVdpUslEK8mUloOS62FsBJ/ut6KsjHxac8+yNBMr8ywSkcMbXdO7Vk
 3ToRFxG
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

If the mode parameter of chmod() is zero, this value isn't shown
when stracing a program:
    chmod("filename",)
This patch fixes it up to show the zero-value as well:
    chmod("filename",000)

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220918194555.83535-8-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 5ac64df02b85..2f539845bb90 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
     const char *sep = "";
     const struct flags *m;
 
+    if (mode == 0) {
+        qemu_log("000%s", get_comma(last));
+        return;
+    }
+
     for (m = &mode_flags[0]; m->f_string != NULL; m++) {
         if ((m->f_value & mode) == m->f_value) {
             qemu_log("%s%s", m->f_string, sep);
-- 
2.37.3



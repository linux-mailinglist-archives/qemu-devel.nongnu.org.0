Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF403712BE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:56:44 +0200 (CEST)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUNf-0005Ry-SO
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4o-0003Xa-PP; Mon, 03 May 2021 04:37:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4d-0000vG-UU; Mon, 03 May 2021 04:37:13 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mqal4-1lHITP2ymm-00ma3l; Mon, 03
 May 2021 10:36:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] hw/rx/rx-gdbsim: Do not accept invalid memory size
Date: Mon,  3 May 2021 10:36:23 +0200
Message-Id: <20210503083623.139700-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sdg1lQBYuBMC6XmHZzlr0tm71fxLBAYqdUj8vLn32LuQ6BDJdl5
 +7pDlbTMilJtcSYU1wa/sWK9a7bbUb0apYVFG2QPTMGm9LRHnV+EDfsD5cE73U8xExO88tX
 kgDBL0Fft33wZeY44DJCBwJhTM6tfpQiyy0dfWCMoKqH6BjnByQrTp2TJ6Iow9U6hWKN49c
 JhO3Iwo++rkox0BwDqwHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ags4tNE0cHI=:CvU5NBesvq1rxpL+w6c/GE
 AZ0G6zoaz/d4DeV+IRCrrFBjWofysJrTDBhOeD/Jp1ilaO5ysMEQH3EP0Tuf9LL+ddhFv8HYf
 UEWk/aJS/HpJkpQ9YZM8r4l5A12Xij1+aMDBnvdEqst/ptRXIP2YKHRgp/DNovnniAD9lYf31
 XU9taQ0VCukMPbWti/FUnIoT3H8XjDD8s1kRX1JVhkfM9iH+oMEb8EAISrpasGL+8JjFCsj/V
 6bLClkd7le/CQ7CutkgZ8HLguVAxpTmn73/FXhbC/mKu0j05fn2Rt8z3uZNDh35v9SRGnIi63
 X3Cmt96OLCb8aNzyyBCYWzgMqddC79qC5kWzkjemEIZazanGAMWVISv/MqE3uCIjIw5JJqnFE
 rajyM8soPcBlwv8rdqBQU/vygZT/UEvEiU1aYtgFI9z+Ka6ecPTKBAhM/dQDuCScc8I/R10TV
 kCowe2aDRgLQ/Mtco+Memr1edSFkg9QuaeqFCCbiqXE4dEPyrjod0OLCX1eaxjc7izCBgWYgB
 /aU9yetpkmvbb6sUUbb2jg=
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We check the amount of RAM is enough, warn when it is
not, but if so we neglect to bail out. Fix that by
adding the missing exit() call.

Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20210407223056.1870497-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rx/rx-gdbsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index b52d76b9b681..75d1fec6ca46 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -89,6 +89,7 @@ static void rx_gdbsim_init(MachineState *machine)
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be more than %s", sz);
         g_free(sz);
+        exit(1);
     }
 
     /* Allocate memory space */
-- 
2.31.1



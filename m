Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D048B826
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:17:46 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NaT-0005TT-Pr
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:17:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCf-0008BL-6D
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:09 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCc-0008Ig-Sk
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:08 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5wTt-1n14rs0DvP-007TW9; Tue, 11
 Jan 2022 20:53:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] linux-user: Map signal number in PR_GET_PDEATHSIG
Date: Tue, 11 Jan 2022 20:52:45 +0100
Message-Id: <20220111195247.1737641-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gusD8WIwIvT6sfPsy+wgSrGjAmw9BZN9GyF3Je8/mm9QeXTCLfd
 xRWxwjl+z1ibrqVmzTJ1+Xee1BJ1QyEtaCIPoQzn4RuX3nTNSMEmuarywduSn+8B9IRo4oO
 vdQVE5Ce7b6blFo6gSU5ysrS3RCdwV+MYcjiLIcgKOzTNlJiYcxWdfoCB+rn7eQgaA6r5B6
 CVaXpAhZUjqpnhqQK+QrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DTrfcVDfJTg=:sAwGH8P64avVf8ZB/ycmOh
 9W/1CNykr5p92oKHrsBY3VeuitypcX7DpPUq9/g5wnxVYDtLT5mw7KN8jkKkoJ+OomihFi6aC
 tWfqqKj/ICeRcefyW3uh+I9uKSpXYBYggOrLavV61M5VM8SchUKacM+cDslj6qRa8fe3/K2Tj
 z1+iEIdvHCZBf6zguItZj8eljsNAaXI3NGhSsUgOyfd2fUTZRRGEnR1PK311PFYig7XXmUREK
 vFyEhe7e3PSBK6BhdkxUF7+Vwe+l+khs625AMgcdwlJ7LozR1toPk05+GgrxxsyKCJB3UqD/Q
 1cHFlBMw/SCdORy6Lv9vrWwVS0eociawp5jNmggmVNVoHdfXMZPgjyH/pHoVLQBBAB3+btdnE
 2ceSuBNYIauZ4rwTntc6HJGM4CEjRk91rSCFnjDcOpM3oBzoUfND+zEp8ncM1EMDjLMWr0im6
 onvMje87J9WYmYATCjcelv1QH0yGzQGO75TqEg62VXCzl1YhHTwtc3aYhBTVez4HLSIjUMjkn
 JJ251cA6Y162xcfBU5NnpLaIGonuT+6/pnDRxRLiBfRDPVGAL6b0fpZs0i4fVltYtNwkJiDxD
 UfoNmreLCONW2eiLu0DRG4h9MtuzqIpN79VvqHP//KoLQ4DcrmikRLTKjLEYfowGk3FaUJHEN
 favmGy1ZIYvodzxFe40PQDpyJmqd8vhWDBjE3AIXAmRir4VCNiv8V6ZvW/M2m/moCAR8=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Convert the host signal number to guest signal number
before returning the value to the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220106225738.103012-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index eff107b8bcfd..b17cfe31c8b4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6444,7 +6444,8 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             int deathsig;
             ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
                                   arg3, arg4, arg5));
-            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
+            if (!is_error(ret) &&
+                put_user_s32(host_to_target_signal(deathsig), arg2)) {
                 return -TARGET_EFAULT;
             }
             return ret;
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382205EDA94
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:52:53 +0200 (CEST)
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUgO-0005vM-58
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008FC-M0
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSED-0008Fe-HP
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiZof-1p88Po0xmB-00ff0P; Wed, 28
 Sep 2022 10:15:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 32/38] linux-user: Implement FUTEX_WAKE_BITSET
Date: Wed, 28 Sep 2022 10:15:11 +0200
Message-Id: <20220928081517.734954-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NpZNtQbKCA1kTY97l8yx3W+Jmt0aNr87dA16Lk07ICBAGSvJ94t
 uSYpo5hQcaSbwW+qHoka07z97/ccXvc+iJI2+i6V438mW8nwiRWrS4x0T0JbfXKxbGIRa8Z
 O9LtG7PvgQuxebxmOtLw48IH4rrjwNo/JLmM4WtEIiBJ0NbwGhlbEvyrnKz/+wpUm0EfvlS
 guBL+LpOd8qZ3k0MnAhLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HeA2M+Tmnx4=:TdDxkzPfdFE44YE0EfI8Ex
 wUMvmnObwkCScqpQb+VqSXbEkawjCVZ2iL50OKlI5IHoHaHh6mToNhzG4RgSi2DmvoMi9zR19
 ySF27To38LN6yonioF6CCleemLCvyTHk7R7pNW6zW0jH0INp5j8WY00MclvKRoiemMU5iZ3Nt
 2Ecga2dSa+gCAESfzChnJ9hDDH7pEikKCpB+JWSSE69RIMIux2uayraxjyr0aGd3rswLy24q8
 9A0CCKjOmfviEcSCBMb0l0L1bzt2hzOsyTomR9KMeCMkXiuxEL7WAEjkQnjIhYKh4WAuXYUPS
 9qnhfs2uxuoMNqdrrE/m5U3ZOYJsWTbF+nFvMgCMmVzPF5YiAjWMtiM8xEyaizLBBVzfMqnRs
 F5WB8UJlXci5szVzbTHCq4w2E0WTyv8zxPZ2zeHRo5xuUQeQSgJ3cve1ZPX5OqgvywdoHUE/H
 kL/4EnRRNxa8DxafS8F+zyEz9l83l9r1B4mrDG2OW1M9CqTHAgQGeG5jgZ+G0jG9eje7pyhyQ
 OD7VvfPZTyInOPbuFjthW2U04Gt1q/25915oW7f1+i7XFWbE5+URfCd9Wmv1ZGiUCdq0Ryt3b
 blowzwF87EH/Xn2DeHjg8icb1tHEqJBDITc8bxTGKrFWMLddHJNv7eR1xHZp/L5qTMUEQmqy6
 9lRS/SG3zMA1YwunU3rYKJunskdxMVjFKmTRaMC07gl2dGG9nMpvqsGdd8iTFciGWiqxOcR5y
 A2QxOREmVKj5le9blaIeaBPcEUx0WGKQjEzs12e/sCnA/AM89XVwI2yEHodm9b4bwsnR3xNiM
 vIWEAHj
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 17e17f480456..e2b6b564e6cb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7789,6 +7789,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         val = tswap32(val);
         break;
     case FUTEX_WAKE:
+    case FUTEX_WAKE_BITSET:
         timeout = 0;
         break;
     case FUTEX_FD:
-- 
2.37.3



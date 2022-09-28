Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DC5EE81C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:15:40 +0200 (CEST)
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeP5-0003sV-HP
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0000aL-9X
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf2-0006Xp-En
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MRT6b-1oq5yB1gmL-00NPKB; Wed, 28
 Sep 2022 22:28:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 32/37] linux-user: Implement FUTEX_WAKE_BITSET
Date: Wed, 28 Sep 2022 22:27:32 +0200
Message-Id: <20220928202737.793171-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:agDZ5w13uWTXRVud1+gyB8UI2xF8y6S1qbUxxTUhx7Qf4H0VeIe
 INTtSpmrYzmghA+z5CYN21MW+k4t6Luf6+6Jv1MvP8SrVos9hQMV3woJj9tnKRCKkuKOafT
 xgwbU2+tQ3Dmti60jl/k4mXoiKxn+HtqP4yDq1Zm14q9yGUzItb9igzcJaU8vvnKrPLOf+I
 DnG1ZqaNrd/gBBpadHb2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/BeXZgQ+A0M=:1ZTPUsNwlJGTtR6yzmEQ1a
 zlvzWATXOGFubmUu2vxYDG+V4p7AZ5c3MyhGoGEo3zJwzG7xrHwddkuGktG2GZZuwOHJzKDxp
 tUF1QlE5cLuiT7ljWsqT48ekWjskYtD0Nl5F7o32H2f/yv90ZHP7K0uXpxNq2nTaJwTO5SBrO
 1W3hPeDbx++pNF1tS1cRt+C23PmDEHd0f4p/x/aWzUlAPlJJWH6IEDzqZeo4smzw82NkXKRf6
 TcBoEez/2MrsrkBQgYHYtoh5NI7ZKmQWkJRmeKGtLUhb147STprFeOc05IZz9ZX6UuPtsJi/o
 JW39pga3f1ekUg+LadgWimZLusiKilq3n4VqRqfJhrhjqA6te+jYRzOyIXRnYnICwtMIzofpS
 8rq1LTTINDvuP7kkLoCJFKzfZYbBWSoHUqZsnANcfcDzcr8eMsIUBmuW7XQb0z9yAZ9UPv38L
 QCRpDNzR2EDhcE1TJWENSyCYT72RD4A5559MkEEhKmgypCHHOBeS4S28GUDaORY8oHt9+vxOt
 ZNVWDL9lTu4MNGyerh8k4pLv5fCyOXJowNOUhRnkifHJMfR6NpHSnXaPP6cjI/nwxRPZ//2Ik
 oY3M3irP02V9O577e7YgPHi1rvJ+oS7a/clihqaVrbSPj+q1NcNxXPWVKl6mzqYC1TmoVLwIP
 DQNfJ6SQIuEJSqj1ALB2fYO0stE9NjOnDoT9UWiT5UNnX7dKWjaKSjluY802G4pGW2HLwZxOu
 wEg/1juswKTQdkjGEv2dC1oEjs5o5dMCW11sYEnhkHmfPFzSKEv21BvZhppmyZmfHcPNoTnS7
 AkpCOSj
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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



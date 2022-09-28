Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56C5EDBA8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:23:05 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odV9a-0000EM-U9
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008FA-Kk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEE-0008G8-Aa
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:43 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEFCF-1oTryE2ld7-00AEFz; Wed, 28
 Sep 2022 10:15:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 33/38] linux-user: Convert signal number for FUTEX_FD
Date: Wed, 28 Sep 2022 10:15:12 +0200
Message-Id: <20220928081517.734954-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3RAJaY3DtebYhEIu4IehU09BFpQeaT0lT0hcZ11RWkvrE/cQFsa
 wEyMBPp6rNu4hxk3Hsm/Oc1wDTOjfayGdZwIaI7I4CsjG2Kr51+uSz/80VTOCAAsEngcMEj
 fEmXGzyI5yd0spRz6HLsg45bmwZLjZmOe7QcUKsfKAPkH/ZMH/b3892Om7RcglDzfOK0lNS
 iuBSmWqGkbkhaRAhp11Jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LpcVzUnbprI=:xQnRAUpukqNi71hEwKBelt
 JcYzrXIJpAVr9KzFd48jtVbpVT11eqcIYGTj+XCmIuHDIlZgdTX8SJnmXMEtGt+aHv+rTrz+O
 PJjF4jGI45zgcs7zU+L6C8F56l+MPGOsdQkiqKZFqnyptGUwuFqdnuWjUTd+kGo1Ke/9pnQB1
 cMOJ5CT6KTe4wk3YAfvsypjZLjsZBrUdpHnbtS41S5pFVsHPvQ+NJSlGVQB4L4UnAW4HsBZ6L
 +SZRsZYVUKOv1VAe4gT2iS3EDpMbnO0XOh9kVVxNAdvYib2mLtrZ89kK/37IfPmK742J1RjLk
 /HpV11j5UEf/teIR/klryrDBBl81Ec73yliCTe5loGz3Sgxz+36asK4+3pMKDFayQrC6Upjfw
 ny+ivHQV5mmS+ilFPSlruDxz+V3muApDl7dnKAWBCeYncf1laBypz0nCqxgEt8bT/Idrlygm0
 KHCgaH2j+Hd1Mq6ZA0VO0ZWtjJqWffwFe/unJVYoGXARui7Cy11t1hUOsyEKMHPq3KhFbQ2Jq
 OygLRtHYkY4KrZfXLwx4dgBagJLuaATK1Ftqz506vpSuYiwU3AdNRpjTT04YRb43Q11myFEU4
 B/vdNwSTNJHq1Klby2uHIoPvlQYOGdO060WU37t9ytY2vewR6Yt9er5FoY1/9dNEeH0vD8Kqa
 VPR3jyu0JWgn+kIGWsXqRBwbemXS8zjEpZB1bOqjMmsAjHFZuNThQKjYW1zgat8GctOld0H4W
 IYObqhTMb9C+rfK0pzCPETSlIFVsiJxoSRolAkk9vPmZoLdCSRmBLq8v77/93ownX+sqtis7B
 PHCO8KP
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The val argument to FUTEX_FD is a signal number.  Convert to match
the host, as it will be converted back when the signal is delivered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e2b6b564e6cb..3f144e3c1f5d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7793,6 +7793,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         timeout = 0;
         break;
     case FUTEX_FD:
+        val = target_to_host_signal(val);
         timeout = 0;
         break;
     case FUTEX_CMP_REQUEUE:
-- 
2.37.3



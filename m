Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F555EE807
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:10:59 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeKY-00063u-8J
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf7-0000nT-PA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf5-0006Z7-KV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M1YtP-1ogeb041sJ-0039yz; Wed, 28
 Sep 2022 22:27:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: fanwenjie <fanwj@mail.ustc.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 25/37] linux-user: fix bug about missing signum convert of
 sigqueue
Date: Wed, 28 Sep 2022 22:27:25 +0200
Message-Id: <20220928202737.793171-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s5SAW0hs2SybUInGuPJA1fbqKcvhWzjEVdsnvqmOTXiT+n0dtX7
 fsZaFCu8Yx2FPGKuxNdcb8H/0FU39G4M9wwjVvX2Ez+FlylZ4YUEiqn9wl/7adV+q0IuAOW
 ASarrUf8eApowYByfbQskM8EVMAOu+k3JPVBjc4GCNu/9+3hpC78jYVSzc8kVvRFAlkqt0b
 KOUtS1UNVVakaD+8lCFmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H5dY6hbiJP8=:npkvyoQKKaHZBnC3GsOA64
 xq0YFh8jfMpUSJ5eiV7Tjj6lO2dNNxenpdp/KzPWE6EQBSE5coybKSMSn3o7sTMpYriBiXIVT
 GjSEEE7EBmz2HypmOsmFgC0fTrTGYes6cFZ+gR8PuO3wldyUv0R6jE4FIFs25n38g/ERbIlYf
 JvS/04q9EKhBaD6YuDGujMLE0DvSaJDc6jpaVo5531V0wPSrFdQWOCk3TW3VwaTDrJAaqfR2O
 9ap/WUHu+a4V684WiCEIynLX/mHNXZEAwCezHI1TnohZAo/FECwnucXFRbbqi3/CFc0zpR8n5
 mAFcIj19bb9tAk81M8SkLOB0uxkthgm1LJyXVCg4BZ3t3Z1E1BM6yTOiub2N50MOo9VSHT9Jq
 X626fjcxpRqW64FivYJEqtPANby2OITIusrrtyLBqaQpm6EfBUIzG/+CeLzGD50Q+DH3HI8v2
 vbC6eUWFgIeJzD1lNyXWDTD/ykCVomNV57qwltlNP7KyK1B0+9/p+0XykPhdaStG/8P8AN7Hb
 rhNLbfFUPB15KoUwmehra98Tl8feG1puKmqLOJKt1An+LRghiyxzoYrhLZADdmiTUXcB9/6Mu
 g0m1V9H/WfEwH0Y3tZGTDDHO/pJApiw2CahgPDbSUgudPhETLcq0Z22ls5NXc2fmTyRt3bZrE
 wTM++PujtYWIEgrMLygEuwz3p6QldXafklwwdnIC0xIJIbUwsnvlKrp1aI1zrHN5I5Ju2xPT4
 GmAxfaUZAKFL94ehQnZoIk8Q7RkgB7EAeKNvH+lYjZSNJrfg8hFi14Ujt8It7qMV9MmzJgHW4
 FgZVG49
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

From: fanwenjie <fanwj@mail.ustc.edu.cn>

Fixes: 66fb9763af ("basic signal handling")
Fixes: cf8b8bfc50 ("linux-user: add support for rt_tgsigqueueinfo() system call")
Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f87b36b2491f..54b29f3b406a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9728,7 +9728,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             }
             target_to_host_siginfo(&uinfo, p);
             unlock_user(p, arg3, 0);
-            ret = get_errno(sys_rt_sigqueueinfo(arg1, arg2, &uinfo));
+            ret = get_errno(sys_rt_sigqueueinfo(arg1, target_to_host_signal(arg2), &uinfo));
         }
         return ret;
     case TARGET_NR_rt_tgsigqueueinfo:
@@ -9741,7 +9741,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             }
             target_to_host_siginfo(&uinfo, p);
             unlock_user(p, arg4, 0);
-            ret = get_errno(sys_rt_tgsigqueueinfo(arg1, arg2, arg3, &uinfo));
+            ret = get_errno(sys_rt_tgsigqueueinfo(arg1, arg2, target_to_host_signal(arg3), &uinfo));
         }
         return ret;
 #ifdef TARGET_NR_sigreturn
-- 
2.37.3



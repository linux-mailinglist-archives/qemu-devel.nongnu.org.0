Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683905EDB1D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:06:12 +0200 (CEST)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUtG-0000xh-HI
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEP-0008Fc-Ff
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008Im-DQ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MmU5P-1p4IeQ3qOP-00iT4t; Wed, 28
 Sep 2022 10:15:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: fanwenjie <fanwj@mail.ustc.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 25/38] linux-user: fix bug about missing signum convert of
 sigqueue
Date: Wed, 28 Sep 2022 10:15:04 +0200
Message-Id: <20220928081517.734954-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xfvhM1OdIVIPyXA9xQgjjSyHfK115+hH9/1qYPCGkYdqoiRwPw5
 Nt3wLyuni8ACsXkvkEC0Wrv9V6DApKsb2h4erFll5u0FNrpWfvJzTLSQpqNjrlj4k0ZaE+W
 lA8Ih3O6hnIClEhBCGzYFAZA4PTSJhhU2wMA48UQsEyLIEnqH1kPV5BxoZEGTJFhEJjRDkG
 kYEpkx9/A9HMKKtiZYv2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GDh9JVtQKAE=:1qSnC0cGO8KtqPqvHKQCGw
 TlRKkH2iUSlWIoMcuQsSlwiH47e0tCuDwHawWwf0tWNg1LCllVw9k7wGORGGGKidWC55T8CBd
 wLzv5mH3jdgteqbVBdLBEuLNoU9F6lF3l8AADuEE/RoJnwA4/U3RfrUM8nvddKzZ9R4tfDoFn
 QY4KZu3h2ZbdvYWMLT029kwpDgHmLKidf+KzIzj5NArMYNSL2Lk6Qjr9t/LGW4YskTy6t4dBD
 BFM1a5ess0xQoUr9ZKx7wmD9gn7aqGxyzQGQW/AI1PaDInLcpTe9zYMhPALV8s4r/qyK0VeJY
 8lyLlFsm8/qLhn+U8jVA81ZF+kqQEfr0QqsSxypyMgVBy5s3/MedPosC43Ch9Roi0chpnaM92
 MFRIKcn8DLMFgWHWel9Lf+UhYczlNNk4EvB1CbpU3jE5KXFcp4Ok0fg8/Ok8W4VT8sedLxoBD
 9zNL8TP/VU345GARCW+DkErLRQu4gG1wxlpjcRp4G/tUQFLrrFw0iHnG9oLT8nlSz6GAkos8j
 K4JfaT0/TZFNuFY81c8xb45twe3txIAT4isQImSQuWKRtE5Y3D/mcumSQf8b1ZFSXXf45cGZ2
 LsVcEEPI+vCCdIFYw453gzuR6GdKeQZHQd7ld82XRrSktEYrh4aV1RCVKvPphFc5or3sSDB0E
 1O7Ak1NaYjutT7sdLbx6I10bSJSEgKITAUgu3pDDHRHiDEcLYTSauCKHO47zU6vDGqMYG3j4d
 q82XCTx+BGxIQQVHut3QRnnyVkKbLWGynbaEoYq35FyqV+4Xv/DHUyC3S1mv7qVA1bnaUNDXO
 cclvHDB
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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



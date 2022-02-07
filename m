Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB984AB771
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:19:19 +0100 (CET)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0B4-0008QU-Ea
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:19:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00064G-LA
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-00079m-HJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:07 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKbc2-1nboaN1QrM-00Kx5Z; Mon, 07
 Feb 2022 09:28:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] linux-user: sigprocmask check read perms first
Date: Mon,  7 Feb 2022 09:27:56 +0100
Message-Id: <20220207082759.180431-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:046jjnAg86yT37kaNVqfVhU4AOjM4jVQNI8AxUXHhhm0LbfRZNL
 dq7grsNiDNhoRQPQ27V9VuHxW9ThPHVbUlcSpsjvvZ43s4dGgiLAygvs3lvrV6XWATxdBo2
 4OY+hlG28vabdL5eouqH//3Qs6qNhUzmzIaBJOWMW9vGrspANRejhSaPLOTCdexvhXeNBMy
 Oz8cKl4tHOY9fG5ebJl1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U3LhDQCJzEQ=:90MzH8gOjzoK2sHu/OL8Q6
 2/fRpJcGpF9FQGaOoRiUXFKCthXVDfqTJx7aZA78Mk3SDsJlWhIqb/N1xtx4gcM1nHPlTbPjf
 hP8t9QgUTZLil4XQ/bJZhdEbHQvsDOsOLf4c8rbD0BUf6Cf1CIoZbO5EOLVTcKDKPo6OdRLLn
 vEfVk97mwsYRu4BMB+0uswsj6yonbtCQJDCVvPigbbFNZqMLygR3cHgA7U10cAe8wqCa26GCq
 kuO+qa5a/xezh7rzzn/taiJ25blxKjkIUQHl4bxIV9FbIJkZcWaVKAeKATbTLC36OuT+ehnIw
 vs4DELIB/Lkt7BfkP0Rz6nlSZYaxXvpBXplQNNt8HBdrw1Ix1XpfakRSbWwHRTmbh/JlbIsXN
 OTmc4Ecr60Ma3Rzwo6i8AW7pri8VVptkYlufovAdFUkFXnwLG+/OMBCXWRm3gMRwYwWa/gCuW
 wJEoM/NZCmX7fZXYrVF1xFrQNvN0hwlklZ0ckU+G3EG6tytaHONUzWe+qseUmBWB9wuBh1WW9
 kEmhVgxBG6Scd5K24jlw2p4SkKXf1x6hv3E1FwPxpslQmGQe6/8X9fJyRXDs0lJbqD1dUEg0C
 DTuemVFc1ZUP2DVms98D+UPl0Ua78s7IUJglA1IK/0FbAeSPX2S7b5KSu4qW150i3EVA8FDuv
 p2t0XZDmi1+OZkmuJasbXtSyZVm3gh+kZVf8QkgwYjeyb3uwuLlhPJj9GRKuuHCZJal4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Patrick Venture <venture@google.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

Linux kernel now checks the read permissions before validating `how`

Suggested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220126212559.1936290-3-venture@google.com>
[lv: remove unneeded ")"]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9f8b497fa353..84cfa223df4e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9435,6 +9435,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             int how;
 
             if (arg2) {
+                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);
+                if (!p) {
+                    return -TARGET_EFAULT;
+                }
+                target_to_host_old_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch (arg1) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9448,11 +9455,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_old_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.34.1



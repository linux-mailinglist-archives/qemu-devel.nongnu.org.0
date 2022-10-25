Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63760C68B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:35:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMQ-0002d8-7q; Tue, 25 Oct 2022 04:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETx-0001JG-WC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:27 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETu-0003GM-Ie
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:15 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mw9Dg-1p3fN01ByO-00s5hu; Tue, 25
 Oct 2022 09:36:10 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/8] linux-user: handle /proc/self/exe with execve() syscall
Date: Tue, 25 Oct 2022 09:36:01 +0200
Message-Id: <20221025073606.3114355-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3StfFPlIReSm6A+oxQIyyz58djW7xGdZS0pdCg+AEOetKGflG9O
 ACY/haEe2aklj1phez5R8BcyChsd1bsbm/fNlD9Yit/AKKu+Ag0uzBArlXkQXwOLICu3BU+
 e6d9xHshpItxcVsBlncf1BcinD7HSIWUKoOs8tnDFKiBgrqx76ODiRiG3fZi0fynvgcGomx
 yCz/+Ub9PTWFtLq3PSkoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:enHGnr2kr1c=:PRM3nDTdbwjmu3ettL6/AM
 3fwiMZWIv8mrM4RIaWoNKytbr41APacHGK8uXzbS0OT8dwMQ2rn1eFyH/eAcdllmWBqS3vqG/
 qOP19JpvXqbtHEePy0TiLo9u8nvN8iLe1QxMkbn4+a8/RFyEmTN0XbMYF+zJPgy9GGwHU14+L
 KnOoGi1bC67eRSCdcaUsj+rEwV0k79TfvCNqkgAFQczIfHl59MSs/RAGngpxpVGvW+mHIy3HU
 H1S1r3PEaus2363rdIPHJUOtkecWVOSPnuVu18jCwUo3v/5l6G0AQppaQOEBtCdr9mzWT9vm+
 haPMGVcNZremzmZYd9wFl/NQ7XwuIJdsxdlTE882HGVYcIiYUFF1T7Kbi2rekqsNhq8OohBJG
 3iFjpKhA1yoTeG+dMReXIzuBsjA64r8wWUC3czEDLMdnd9Tniwtn84rcMH1wljyqeUFLGw5+w
 mZuEn3hVvR34e36BdJMn9TJBtsa8kqQApqW6ZOvz8NokmwGOyBUqvRb484dz6XZpZEr1WUGIl
 VLNcW/JrJgyrSXikEoQEKMZLjCjggrRl/xw9nY3TnQBLDf1X/hRRgHa5ywwR69fuaQXIdJZAb
 T97G/u7sFG5yYN91Pl2HnRppdnA7Jm4keuWd/kDGDlRwMo5B2CSUfv7iJQAMAMVufdrdLDRzh
 MPIIvjEZS5Q7Pzl+qJWruY/ONNzaabWq+rINNkMcg8aSyQ5wxku8UHkcVYCHOhX5aVvdL5CMi
 oVmSCwKVCUO5Dc4Ih473QL8nS8UMBhHPUFOX+OPgqMSdoSCRqFGyzGjpoxDRa/N3MJoXVCI5x
 3rpvZOf
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If path is /proc/self/exe, use the executable path
provided by exec_path.

Don't use execfd as it is closed by loader_exec() and otherwise
will survive to the exec() syscall and be usable child process.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220927124357.688536-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ad06ec7bd54c..a7a29091c91e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8860,7 +8860,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
+            if (is_proc_myself(p, "exe")) {
+                ret = get_errno(safe_execve(exec_path, argp, envp));
+            } else {
+                ret = get_errno(safe_execve(p, argp, envp));
+            }
             unlock_user(p, arg1, 0);
 
             goto execve_end;
-- 
2.37.3



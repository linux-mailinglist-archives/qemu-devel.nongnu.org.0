Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B7668AB13
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5y-0005MH-HV; Sat, 04 Feb 2023 11:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5t-0005FC-Al
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:49 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5r-0006yN-95
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:49 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MadGG-1omGFb2lBq-00cCkH; Sat, 04
 Feb 2023 17:08:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 22/22] linux-user: Allow sendmsg() without IOV
Date: Sat,  4 Feb 2023 17:08:30 +0100
Message-Id: <20230204160830.193093-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HwvZlHgdhGj0FPAZJbKBy4hIYt7gRR3TZfLWTInBGZUPZbM6GIf
 nDT+FvsPhPc7+Zt18j3xwS4EyX3svmPhomp7Cibegmtss1PuPcLlisorM+ywpy0EzLbDxKp
 YFNFiCZV1y5VYWhb+wshE3s6VGpQRvrwR6PdriAzk2itpDmHbP1ttRkKxDZEmJaWyC6qxe+
 BMgCNY/VW+cEEog9crlYg==
UI-OutboundReport: notjunk:1;M01:P0:3GJYaYXgG18=;mhcPZ89ojWj0PRKW3fuSxACYuSs
 yh6XKMktozDIWcP8C5VHhbH9bdepucZpGkJzgFQf87AwXCk5ZFzYJOLZalCNPmlOt8GaVG9bD
 E3YrzQoWvtggDIHhWrH48/2IKt9Uy6JgMSAv5tl9nyLe4y9UZMFnX8VdJZ9OVHmKN8ZzKfMrt
 G/rHxxBPSUob/CdA9ejD1H5C2bTWABdpusJeS50jZCLGCbbWhkvHqldmEU0B8JxjTef9GWgDC
 Q5J7d7cpXNb1NaXW/MNuL2ywolj+LFKjFW4VU+o1yK56OiAmB5KFGjdjdtKnxD7tQp0U9ncSU
 brDxWNTMNrwkFpr6raPdOi0ahZeO0FSsF9ocRAPvcDQEQxOqFqwPnE9K/ZkDMCY3eIC1i4EzY
 uBbB99yAeZOIVODoGmee3/l5EYQXHTtrlqVR8QQd1g0QUEUfgFHZ8JA7UHXOl2Hke2UdGqfku
 9lGkx7a07ITp+DxfpxGigVZPMxA3s9Ey3ZGWqhvoFlBcM3us7S6GJD8El7RT109C/3c7KcgDk
 tajisre8N39IDY6N+Jzx91RP7AF031qGEL5yc9VN9mTesumFYcOYIGCVlU+San+q9YlDisUma
 dwSvJtbrveQNHxSR5x1KS3W6UNw1+DZg+3V5cP8fzj2qAuRQK8PTN3g0NWm7gOdMoFnrEcdny
 mP0hYi+ZJGtp0beXdsCRA3bPyVaz0SZV8YDndZS/VQ==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Applications do call sendmsg() without any IOV, e.g.:
 sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=NULL, msg_iovlen=0,
            msg_control=[{cmsg_len=36, cmsg_level=SOL_ALG, cmsg_type=0x2}],
            msg_controllen=40, msg_flags=0}, MSG_MORE) = 0
 sendmsg(4, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="The quick brown fox jumps over t"..., iov_len=183}],
            msg_iovlen=1, msg_control=[{cmsg_len=20, cmsg_level=SOL_ALG, cmsg_type=0x3}],
            msg_controllen=24, msg_flags=0}, 0) = 183

The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
and calls lock_iovec() to lock the IOV into memory. For the first
sendmsg() above it returns NULL and thus wrongly skips the call the host
sendmsg() syscall, which will break the calling application.

Fix this issue by:
- allowing sendmsg() even with empty IOV
- skip recvmsg() if IOV is NULL
- skip both if the return code of do_sendrecvmsg_locked() != 0, which
  indicates some failure like EFAULT on the IOV

Tested with the debian "ell" package with hppa guest on x86_64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221212173416.90590-2-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a0d2beddaa4e..1e868e9b0e27 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3293,7 +3293,10 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
                      target_vec, count, send);
     if (vec == NULL) {
         ret = -host_to_target_errno(errno);
-        goto out2;
+        /* allow sending packet without any iov, e.g. with MSG_MORE flag */
+        if (!send || ret) {
+            goto out2;
+        }
     }
     msg.msg_iovlen = count;
     msg.msg_iov = vec;
@@ -3345,7 +3348,9 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
     }
 
 out:
-    unlock_iovec(vec, target_vec, count, !send);
+    if (vec) {
+        unlock_iovec(vec, target_vec, count, !send);
+    }
 out2:
     return ret;
 }
-- 
2.39.1



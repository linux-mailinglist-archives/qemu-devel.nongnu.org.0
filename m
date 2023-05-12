Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBE7006A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:23:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrG-0005yE-Vs; Fri, 12 May 2023 07:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrF-0005xx-8d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrD-0002NO-M1
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIKs0-1q0ieq3JX2-00EJ2r; Fri, 12
 May 2023 13:22:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/9] linux-user: report ENOTTY for unknown ioctls
Date: Fri, 12 May 2023 13:22:31 +0200
Message-Id: <20230512112238.85272-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nrDFSSlwAHBE+w+8jBtHunwlit12ol0VSyaFu9Mo51TNCoXZpz/
 UjdbAdV0LKUXIa4H5LFgb2+35zL0D6dCseMpyEGaq6ktiPQjYNk7rE4lYg6mqyd7B+FV2wA
 kR95VvNDwKKaKD3ytl30Zs1nmJman5r0oGbEKy+7qChUnZuw6x+jTaYJ3hHjYgR/7sS2PHq
 b/0yOud25JpNHhm6Pm1Rg==
UI-OutboundReport: notjunk:1;M01:P0:JOHsqeoBxeE=;vRo/FeZuOp/SQ2LSssMZCDFeoMz
 h3Z7i17YbpEiG/2v39sN83aO2Uyz+1lHjtEtXoUHcn4SA7rWI1hJLpAQfJHcdlgdeU+1LZLNP
 3IX4ZymnTMFkRmAjD9+BHIKUjWAjdAZbN0w3oOQHdZ61wREN0/QI7VzISD/ihlXl/KpcWjCRr
 72aqczefdyU+na12cidRw59fXntKKqokkXYQAi643t7KKsXexPWaxmtZbKMS6D+CL4JBEBdvx
 vcBfnz3N9D9m5IFjRa66M5BoZbAyyJrSo82o2vlZ9C7sAbBPC1ZUArLriJt2rCZSSN13aCaBS
 81jsqjG/p3EQE2SH3fyU63h7pHFh2rpF9VG2kHKoQmZWiupP2zqAnP36nSN6/S8wLjx4KBoXl
 /832WcpKsuE7xEOhqlcHaq2o5K3OZ3jAuOctfsM+eKRIW1NIKSvIYBzl0eNJoG93WqPvDbP6X
 W1LRpKy6Ht4Xrow/KdFpm/OckyTi8pIwybhQU7HOggomfH+PQytpcanfLKGC0vSEQ7b8w2K1O
 OJeueIToGMzZVbOPxIe7cBcmGSJ5siAxuwCpeXRJKDOWGf6cBpXz+YBgWyZwQVpL/QfQff0dO
 8Xesp9kaC0hbfIYVCU+o5kI0UVBE3Ixh1+hT04VV84GQTVe6nI+RBjM55ig9aiBv3ws09unKy
 sjvYlvjFe9iL0Z4xaxfWtKALL0gQIgMewtORfrH0MQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

The correct error number for unknown ioctls is ENOTTY.

ENOSYS would mean that the ioctl() syscall itself is not implemented,
which is very improbable and unexpected for userspace.

ENOTTY means "Inappropriate ioctl for device". This is what the kernel
returns on unknown ioctls, what qemu is trying to express and what
userspace is prepared to handle.

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230426070659.80649-1-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 085ce530213e..954ed14df4c0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5747,7 +5747,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         if (ie->target_cmd == 0) {
             qemu_log_mask(
                 LOG_UNIMP, "Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
-            return -TARGET_ENOSYS;
+            return -TARGET_ENOTTY;
         }
         if (ie->target_cmd == cmd)
             break;
@@ -5759,7 +5759,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
     } else if (!ie->host_cmd) {
         /* Some architectures define BSD ioctls in their headers
            that are not implemented in Linux.  */
-        return -TARGET_ENOSYS;
+        return -TARGET_ENOTTY;
     }
 
     switch(arg_type[0]) {
@@ -5817,7 +5817,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         qemu_log_mask(LOG_UNIMP,
                       "Unsupported ioctl type: cmd=0x%04lx type=%d\n",
                       (long)cmd, arg_type[0]);
-        ret = -TARGET_ENOSYS;
+        ret = -TARGET_ENOTTY;
         break;
     }
     return ret;
-- 
2.40.1



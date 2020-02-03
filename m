Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B0150EC3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 18:39:01 +0100 (CET)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyfga-0001Fu-Fo
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 12:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iyffN-0000Y1-I3
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iyffK-0002aF-Uy
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:37:44 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:34295)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iyffK-0002R4-F0
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:37:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MjSHc-1jNa5q0ChG-00l0Ma; Mon, 03 Feb 2020 18:37:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: implement TARGET_SO_PEERSEC
Date: Mon,  3 Feb 2020 18:37:24 +0100
Message-Id: <20200203173724.1601021-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MJ4kazHLBaO0nqE0HRDtWzjjljEosgIimjN7HyjDPY8ePAboeS8
 7ulrDNxtDmZSKPMJzvG0E+jwMZKYfEWpkIkApR9hJXUvS7JOenPioLXagBAqpjbtnGVql8K
 FoGxPrFq4ietvj7bStvQl6YbxQR6id8XR0rZG+UPP7PSTmNdpDJS+mFsD8miqd/1SZ9M9DG
 5+EnKkB2bMBXqRxf5gxAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lfinzv2pjb4=:erBTSYaBwNpfDwSWWzVBgv
 AKHBITV5EdKVeECw9kO94OSCHLIK8FkB0mAvcZKvxR0POjeCold+Ml/ObiLKeiavUH0ZBsfw/
 xGD+9dx3sP4/E3gsahj+PUJdHVJ5DSoT+YYaC5/6uB9K53gQmJTyEDwb/kLL+pFvxmgD6k5p3
 FzVE4Wj8bwb89QtlifX/C8vJ39Vovv/lZqVzXGITNO98YTotNMvcv0r6Vc+Koj8U9ibXG0k9u
 wzCidO5DWqXdou5Qt0iloxgIhMSAAbybtXExY9OUIqv5FSqQ1SG6Zza6U+bksBfj/MCtFNvig
 rlq45qNEtFWhr6uKhlo4brw8evAv58CEMVoWSU45AbSFL4XB9EmRh3z3b6XXrxGqtPqRfqkFm
 NJViXwEwtZSYkYNkn6dTC6xFCcp/UXgatIMDMgYgCBDi357d34wUj94ep5WLKfI4GAoSUPecH
 UF62vRaibbY7hak92C2hiKcSEsD4H9vawQQVgzpDXjoS4INK7X+jZ8qdaMcB7weuGLEySH0ng
 E0VOp3ViH8VcS1oOxTiAvaewuAPDM7nD6KR4L1GN/dUxzjiEaWIs5xye8epwUVKZH5681H/JP
 LKerqnUdpN7VqygaYViw+XhWXnEQxlrtT7dkAJzA/Wm8Xt/YLR2+byXLS0EjtJo2DAznOYt4v
 XILINABF0y0UNl3GDkRpHSDEhRj/Syz+IzJB6pQOFGbPZdn6aSyHc6j16VMkfjtzyaR54OQd2
 6T5g7+R6FtNceNPjeAS+hUcM/YRxLQbBN+WVdJrPT4gGjLCbvZfu/2n4KDwPpWSxyaYqjNdt7
 WaDSuDTMt7ukoEa+kppbJnG+a60CRnqYWbLK8CZ83H9vR6wEn3QI1EQgbsvbTEqPEmyzmcC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Matthias=20L=C3=BCscher?= <lueschem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"The purpose of this option is to allow an application to obtain the
security credentials of a Unix stream socket peer.  It is analogous to
SO_PEERCRED (which provides authentication using standard Unix credentials
of pid, uid and gid), and extends this concept to other security
models." -- https://lwn.net/Articles/62370/

Until now it was passed to the kernel with an "int" argument and
fails when it was supported by the host because the parameter is
like a filename: it is always a \0-terminated string with no embedded
\0 characters, but is not guaranteed to be ASCII or UTF-8.

I've tested the option with the following program:

    /*
     * cc -o getpeercon getpeercon.c
     */

    #include <stdio.h>
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <netinet/in.h>
    #include <arpa/inet.h>

    int main(void)
    {
        int fd;
        struct sockaddr_in server, addr;
        int ret;
        socklen_t len;
        char buf[256];

        fd = socket(PF_INET, SOCK_STREAM, 0);
        if (fd == -1) {
            perror("socket");
            return 1;
        }

        server.sin_family = AF_INET;
        inet_aton("127.0.0.1", &server.sin_addr);
        server.sin_port = htons(40390);

        connect(fd, (struct sockaddr*)&server, sizeof(server));

        len = sizeof(buf);
        ret = getsockopt(fd, SOL_SOCKET, SO_PEERSEC, buf, &len);
        if (ret == -1) {
            perror("getsockopt");
            return 1;
        }
        printf("%d %s\n", len, buf);
        return 0;
    }

On host:

  $ ./getpeercon
  33 system_u:object_r:unlabeled_t:s0

With qemu-aarch64/bionic without the patch:

  $ ./getpeercon
  getsockopt: Numerical result out of range

With the patch:

  $ ./getpeercon
  33 system_u:object_r:unlabeled_t:s0

Bug: https://bugs.launchpad.net/qemu/+bug/1823790
Reported-by: Matthias Lüscher <lueschem@gmail.com>
Tested-by: Matthias Lüscher <lueschem@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d60142f0691c..5f37e62772de 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2344,6 +2344,28 @@ static abi_long do_getsockopt(int sockfd, int level, int optname,
             }
             break;
         }
+        case TARGET_SO_PEERSEC: {
+            char *name;
+
+            if (get_user_u32(len, optlen)) {
+                return -TARGET_EFAULT;
+            }
+            if (len < 0) {
+                return -TARGET_EINVAL;
+            }
+            name = lock_user(VERIFY_WRITE, optval_addr, len, 0);
+            if (!name) {
+                return -TARGET_EFAULT;
+            }
+            lv = len;
+            ret = get_errno(getsockopt(sockfd, level, SO_PEERSEC,
+                                       name, &lv));
+            if (put_user_u32(lv, optlen)) {
+                ret = -TARGET_EFAULT;
+            }
+            unlock_user(name, optval_addr, 0);
+            break;
+        }
         case TARGET_SO_LINGER:
         {
             struct linger lg;
-- 
2.24.1



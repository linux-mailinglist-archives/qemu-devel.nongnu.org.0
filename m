Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61E61791A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVuz-0006cP-9y; Thu, 03 Nov 2022 04:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuq-0006YN-Hl
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVun-0004BQ-HY
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6pck-1oxhB81u18-008Fpa; Thu, 03
 Nov 2022 09:49:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PULL 4/4] linux-user: always translate cmsg when recvmsg
Date: Thu,  3 Nov 2022 09:49:25 +0100
Message-Id: <20221103084925.3860524-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103084925.3860524-1-laurent@vivier.eu>
References: <20221103084925.3860524-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ibC2P/ODJWldcRVmTBXwyDmlVCOm8KbgGwqgvpekqDfYeHBMSZ5
 Jq0YHJiOjbHHUL/2OMBO2gfhi8dGqunMajNhQFVOyeZBiMxofz9kZQ1Y88gG+IxzJepj4fT
 3aYbTQP13wW/kEfDNQ/Ah7NkXTC26a6sFMTUKCSF/3FYNL42Z/JujDDnHUk6dTf4yq0pqHQ
 OWG67hut4dP5JiNgTzzVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FN8iF9tiIzs=:oocMrKpJzUtJDqnbu1ogB8
 g5xVGvTIgEeWm83Hw591yXqWZR43Z9mQ2u5nDA5xfUW5WoSLcBDP+s8u+/CUGOfjPV7BIHA2h
 k1sg4atCGc/ndObXn/BvBFWodEc9OEiZckhp/b+gwi1PO4Miv8qjZmtlMT32mcQR+KSo7yWH3
 wKBtKorAnBZ/9ks+qb8avrOkP2ud597aUE3wywMv+bg6+XOLj4JWT5sUT8S0/dhJIGovNbq+F
 jOqBhwTkjZsI9yTJmPTcNjbOEy2orFsnyc4+S38IFfiAHZEUh/divCLec2XzUJHP4TFg157Nt
 hADdIwpGsm5VYUemQjmCKWCGUnv2nPBOBxKXf3UfXLSo3NWD1Fafk/4rCXFn43gBm3cKBTxC8
 QONG2uriNxpipvZLwFbrhW7vD1rN+hkY+k3d9OuM6mXYgwqyFUO5r81JrAashHWrT/xjIcwIM
 r0Kva29LGt2D8aJXFDDhiYoqwsTnTgrIdFqMzELANOMXNlOrQuu+V8wsLdasWTtcVNStDqTp3
 28OKrssjfnRaDoyU/RafVwfBEL5GnNkVSjAuOorC25C3TXfYeoMDJQjwUbqzZM/LfLtP3eLts
 ajPC0bFU0tfB99OnKtLJOoo5SwObFak0QW5JixcpA7QTJ+PJBLregzYog8HEddn4WrvwLwQip
 n8bHoinqXie6N3jQB6Q15mARijetBeCMXPJroKyY9E5cl5zpZL1N47zV7ei4SwMohsM8kkvBI
 zh6m7vFwLysMXW4Tg2B3/ik23fdcCB3UsLJQtPAFz8LKeR+VykNNK1bP/kbdV/BOCnrAXwMq+
 VdGG+eT
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Icenowy Zheng <uwu@icenowy.me>

It's possible that a message contains both normal payload and ancillary
data in the same message, and even if no ancillary data is available
this information should be passed to the target, otherwise the target
cmsghdr will be left uninitialized and the target is going to access
uninitialized memory if it expects cmsg.

Always call the function that translate cmsg when recvmsg, because that
function should be empty-cmsg-safe (it creates an empty cmsg in the
target).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221028081220.1604244-1-uwu@icenowy.me>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8b18adfba894..24b25759beab 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3353,7 +3353,8 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
             if (fd_trans_host_to_target_data(fd)) {
                 ret = fd_trans_host_to_target_data(fd)(msg.msg_iov->iov_base,
                                                MIN(msg.msg_iov->iov_len, len));
-            } else {
+            }
+            if (!is_error(ret)) {
                 ret = host_to_target_cmsg(msgp, &msg);
             }
             if (!is_error(ret)) {
-- 
2.37.3



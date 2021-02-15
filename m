Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4231B9CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:53:00 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdN5-00029Y-FQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdGA-0004BA-1m
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:51 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFz-0000j5-Mm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:49 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Md6ZB-1lkh9j27tb-00aAdH; Mon, 15 Feb 2021 13:45:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] linux-user/signal: Decode waitid si_code
Date: Mon, 15 Feb 2021 13:45:09 +0100
Message-Id: <20210215124519.720265-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aNd3FKayuVLgCsMObiLexFk29QyHeWVgSFkQ/onLx4VBSVc+/9/
 WWSoKUaVLeBKmxmo3bZutNybuFB1C7M4mfaKN5eDlb6aDHCMr5WKCk/Bxr66JjSDiEMxbV3
 QzdPoOmefepdhG9s3mDlUzp488j8OrXMoUfSxpYvEQSidn84OIcpF+xR26OZKYpKWSph+CN
 R6K7waq7A9OMWcSHSw2xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:feIV5dC12ZM=:/OAt6iGI6s4ykEkyOy+Yqa
 gw3Lw9n2uxt87YsZfxEPZWOitqIoJzzeFDv1tFuWI2VD30/RjqtFtdhSBjcbf57jCNDaws3w+
 r/qpIw1vLXUoKulpWuHaadIpuREDI+W9qe9958Ka3UmpGAghrhUy80pDC83L7nbuePwBv/oBF
 ecDeGWX6XZmz+SKLSMjH5F4KRAYbMWOZPnweYk+INe/U49PvABAOVEokKYQalkZ3SA2XBeytR
 +aEz2enou/qUG/QvqFQLGHkAPQ+mDR2MFlB2k4CeyiyfDr1OPLIkoGXrI/Rv/ZQrIDSXSBPk8
 6/uqj7MfZ79uApLRo4+o2BoP8j0NZsDZq8NCee7n9uV6/R/fM6A89PVP5IYgzyOnNQWHhoLe1
 Pygb1UwkUx8qdvjN7Lc+S54QB7jBhxxgooOeUIvCjSysK1Vzt+X3UTG9yVxzw
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
Cc: =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

When mapping the host waitid status to the target status we previously
just used decoding information in the status value. This doesn't follow
what the waitid documentation describes, which instead suggests using
the si_code value for the decoding. This results in the incorrect values
seen when calling waitid. This is especially apparent on RV32 where all
wait calls use waitid (see the bug case).

This patch just passes the waitid status directly back to the guest.

Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Andreas K. Hüttel <dilfridge@gentoo.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 73de934c6511..7eecec46c407 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -349,8 +349,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         case TARGET_SIGCHLD:
             tinfo->_sifields._sigchld._pid = info->si_pid;
             tinfo->_sifields._sigchld._uid = info->si_uid;
-            tinfo->_sifields._sigchld._status
-                = host_to_target_waitstatus(info->si_status);
+            tinfo->_sifields._sigchld._status = info->si_status;
             tinfo->_sifields._sigchld._utime = info->si_utime;
             tinfo->_sifields._sigchld._stime = info->si_stime;
             si_type = QEMU_SI_CHLD;
-- 
2.29.2



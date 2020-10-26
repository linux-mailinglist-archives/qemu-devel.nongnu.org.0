Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805F29995D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:11:23 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAi2-0005iz-D4
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAam-0005hq-L9
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:52 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAak-0005Gb-S0
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:52 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9FX5-1kQr4P2Dzj-006SYc; Mon, 26 Oct 2020 23:03:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] linux-user: correct errno returned from accept4() syscall
Date: Mon, 26 Oct 2020 23:03:38 +0100
Message-Id: <20201026220339.195790-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026220339.195790-1-laurent@vivier.eu>
References: <20201026220339.195790-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fR27cjAFa6FuWbM/QS2BYXrlqXPE0ozWyGxPSvR3AN4R/ga+vcB
 bDefKmDIG5T88l1vF2m2t5008k0FryLxhqNAmwF6mMTYjtcKTHINWcRD6CWydmUge8IuVrK
 p8estLXp8w+N/utyzFXroJt44VSfOL117R3h4RfjtvHTaGasF9XEgU5zOAxai02bFqUXgZe
 n6RBWjv5ZdeQgGbDfmBUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2NqcNlh0/Hw=:1TcqeMrfQRKwNga7b482Tf
 JziB9mJ80hlu8LwAankCLO/Hh/oYmHz84DOVy46QAOJkZP3ARohizPcnKp8lNt2OpHqLQLusV
 gc/sOA6+oSJCXIpv2EbIxyZ8hMEkDAFpqjbabb6hBR7RNGRuQR1KSC24BwAET2jieYSSQnC2r
 cy+B4r03bGv13/L5tBnj0ePsPMIYyn11gA3DWebLQJ0BPo3zzbMmLXMPcsLiPD67AxooVNWpX
 fmczzIUUBL5MVrmqcmwv8vOJXO/P/SZYwgBjYyDJi/tKEwl4iYk7tOHSvFkk5zWCaq4WfjXyq
 dxSD3xielxD84+rZLYOq6RVTVNiYw0+SGceeRjOwlM89U72xHw5dxvm2pC/3aNf+2esqbE4nh
 P8D9SPGNY8vco0izAF+ui8zzQqQXWNau8XBOE9K3K8ml0MeeIIj9gw6BIcmDJwIAeWUoSU7Ia
 ps1lSWz6bQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 18:03:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Laurent Vivier <laurent@vivier.eu>, Matus Kysel <mkysel@tachyum.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matus Kysel <mkysel@tachyum.com>

accept4() returned wrong errno, that did not match current linux

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200930151616.3588165-1-mkysel@tachyum.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f0df6aecef80..6fef8181e738 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3491,16 +3491,16 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return get_errno(safe_accept4(fd, NULL, NULL, host_flags));
     }
 
-    /* linux returns EINVAL if addrlen pointer is invalid */
+    /* linux returns EFAULT if addrlen pointer is invalid */
     if (get_user_u32(addrlen, target_addrlen_addr))
-        return -TARGET_EINVAL;
+        return -TARGET_EFAULT;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
     if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
-        return -TARGET_EINVAL;
+        return -TARGET_EFAULT;
 
     addr = alloca(addrlen);
 
-- 
2.26.2



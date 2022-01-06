Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD9A48635E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:01:12 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QW8-0000DD-1D
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:01:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDc-0007r4-Kq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:32915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0004nf-52
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:04 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGQ85-1nBFd62gJB-00GoZu; Thu, 06
 Jan 2022 11:41:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] linux-user/syscall.c: malloc to g_try_malloc
Date: Thu,  6 Jan 2022 11:41:34 +0100
Message-Id: <20220106104137.732883-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qtp+GW+R7zQfcw4EWrY/8LmY2s+BahHnM2ggoGxSvKVds44RRoy
 r5vOeXpvlmLzLMJ+c9192Z7GGFvAD+itFbQ7seC/YKc68RWNqFhY1R4AtAP+WQWC86RCkEj
 pegUYkxk9ZBgSpP1ruf9WqUzpJ8AHLsIi0nfhR6IQ8n3VFcET8pE6pQP2uC+dhiTt1ejGUA
 Ip4re/f+2mA/0V2Ucmd1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9WymBe0aqcw=:kMgAKhxSsB0oQkyR/d69AE
 RI+kiCo+etYGQxlSYm08C9FTw6Iaa+VrkEKjJ3bGw4eHZsa4i8puCAaNoY/xoX8c/65mn2Qtb
 jytA2dQ5npYe4XC+9xDehnQjHdgqKS86kk79dGZ7QRzbwAZb9KwOj1M5ma2J3OetXSkniQYiy
 dUPl1h58VUUGRYx2G1gkAu21ynyjpojO2Ig3o7jw8gn/KDp9RXjLOl16u+hCFdiOtFmSRwBn9
 WEvdhG7LHuO0sSf8nu5/peIbbktmy/uugMu35hokA9hRvfsD0mQtqDB130l35IP3HYGGM78d9
 3aS3agOsSh4g0Ur+J8aEXHvCWwHxxrmrrfs/5+fuqh+yAUyfmUx4B3C6ZL36g2k1fRSYM9JaW
 tTKV22yXH4tKrBuJlyflyrVhy6eRnck4dpTXGs4yJ59N7Ihq97Oe7bPkgiPeEoaLhnEO7lM3w
 DGKf/lbhyyQm/zTDGyx3+YG/tGu3nvykrx5TiDldK2AtwfQWuVVquYiaL/qRIHyKOHFjIghlb
 9qwJRAHTxvEqyrjs7hypg+vCpvQMi3qNjFN8x+wUjDLZ5Quu5Bt8lDFhbzYrMi7mxg/ano1DZ
 LeE1B3Hpc6IwOyY4mipnHqsNt9GiNo+i3uI7kvbL1o7yHgsemSVLgVxmrAT/53R6Ki7flyfe3
 0jh4okNzpeudnQqK1RQwo5e8TJ6aLHrGTbXnHHfmhcOemPvFnlFDuLukhZxfG/GuUcys=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ahmed Abouzied <email@aabouzied.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ahmed Abouzied <email@aabouzied.com>

Use g_try_malloc instead of malloc to alocate the target ifconfig.
Also replace the corresponding free with g_free.

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Message-Id: <20220104143841.25116-1-email@aabouzied.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3160d77154b5..ce9d64896cb8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
              * We can't fit all the extents into the fixed size buffer.
              * Allocate one that is large enough and use it instead.
              */
-            host_ifconf = malloc(outbufsz);
+            host_ifconf = g_try_malloc(outbufsz);
             if (!host_ifconf) {
                 return -TARGET_ENOMEM;
             }
@@ -4963,7 +4963,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
     }
 
     if (free_buf) {
-        free(host_ifconf);
+        g_free(host_ifconf);
     }
 
     return ret;
-- 
2.33.1



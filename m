Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CAD5EBEDD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:43:38 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od77p-0007yU-RR
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od70B-0005CR-EQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:35:43 -0400
Received: from mout.gmx.net ([212.227.15.18]:52269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od708-0004h9-Ep
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664271338;
 bh=yZmp5++0a9+eaXqZt6r/LL2YrvD6hvs54458JB1BYCg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ZgLgIyuX69qpxUtXZiqn47WGELr83kSdyt/b/BV5443YrwK4lA8OAg8vAb9IusN5Q
 fsTYYakFe26zBr/awzHP78MKL7765ZuqwS4b5/Hhi/mOZHqP4Ev2n5/xBKNroOHeqJ
 pOWz8ggjIohfbJKTwn7bwS3567nJwjaoyJc/Cev4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.255]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1p7El62va6-00eKKR; Tue, 27
 Sep 2022 11:35:38 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Tue, 27 Sep 2022 11:35:38 +0200
Message-Id: <20220927093538.8954-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927093538.8954-1-deller@gmx.de>
References: <20220927093538.8954-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N2SIUxhbivhFySfnk9jEUXGSNomN9i9256I3iMtDEstlxF4L4GV
 X0EilzCMvoTKHVOxZsKOkZVhg8rKIUnEhnhrgoE8HwramTw+BXHbr1vIWLjSpInjbptG7LC
 styrCHgCUh1ASJzNpmaqCjC7rp7y3fZCxU67z9gd/S0W86HlvwTnK5PXamC8YC3sBYoub6U
 RM1l75f/LEt4nwa9d9DVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eL4vz1dthrQ=:hqDG3jD2FUi1GRgBnFetul
 /6s0YDQWlTJr9EZYjt3KPKoHmP+sFKfusmje0TJpmuss0Xpz5PLQW1ALhLhl++ckfHYB7EoGc
 /NqF5+YCYe/Im2nCle/3z0Me3RX0ZrYNcMhuqHJ5lCWxLT090A2252vLEDQERA8CUfxMb2Q9D
 N1PO1RCPwPWpfAxQf28vVPdFDKVI6DxMwcllKjEEgGxzFK53mHJAf6YolmyIdVVjjN8bKl1pV
 EhaHd+7H4xwcmEPvt9C0i95jaGV2FhRsvMi/SJ9P4lHBjFiOM9NaGq/66q6LKcGxThw4lhSMO
 358x0d6IZOFieaAau6ybShFhemhU+qTtVokMZMPK+emlqiczRtLanloECIYmEnnRYvuF485NF
 s0e2wcqbTJUgf7+dYi37JfM/4P5QcT7ck/i2P3G5G5qaRiYZGEERFtFZlgzwOEJZ1suA25ppS
 lP9uT1RcBtB1x3D/NKPCwDjSHHXJuM8l9ZvdyMBlP8pmRwDABUohEJmS8MLgin5/E8qwqmdK/
 nBk0HZyYoecO1MJhOcw2GjOG5iVxKLFQupBL10kQUclYR45pV4c79Z2TtTS42lVsVU2LWxn6r
 slMs+5Q4g9DjFHIVxjJcJqzt/iAy+FYvt+2CPbZaI65Of1fZ3DGyz5el1oKHKdPsR7SsWFsaA
 gqep32WunmLOMfZFA13q+paVwTiYQY2F2k+C/UyGUgQFZSvLKDH4eWlxQTNTnTIYmYLuMhevP
 AEpYdp6UTnwQzJGsAmthBNQDQw13zyynDug5pBytePX0OFLwDvsqRNtvurEeJ4mwffJSCbxZt
 rE6Aht2c5jm43pMh8jlwDIg5nqNP6WgrTlTFTLG2S7BjAu21Ck6ZBRhtH3rHeRycfu4/O8VGW
 mnOG3dJfE5eYm7ffYbn4ZgUqfvEmZaJDfOoLa/8jdD953PK/HjfMTB9fT4GuMIu8J0FLsYPUK
 iy8qH9CKKnCteScefiN3jPomN7/PoZRPYLIgxK3KJhrKp/FoFTzstCUFObmGPuz75TmpX7QHA
 sQ7pxn1liVOjh0TZJ8UYV6pb0UAqZYwnd13Z6ifR029NRzKOSsl/CBfNJIanFSkECeZyspH3c
 tXyNQoRPasj23DLfMmecYuCCq6TgKfgiS8rwz0YCAXkB4MXQY053ed9La5BgssBYoLGwHWf0n
 ueBX/1rWeuBdSUDTEoUGWbLtut
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 31a2ccd76d..9bb234a584 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -358,7 +358,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.3



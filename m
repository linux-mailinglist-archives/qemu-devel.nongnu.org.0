Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C225BEFBC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:08:21 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalPg-0004nz-6D
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6M-00049g-AJ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:09 -0400
Received: from mout.gmx.net ([212.227.17.22]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003Ii-V2
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695115;
 bh=cs05Q1ht9PiLq7agrRMMSzOgL2oo2VY1N/Ee55XqK88=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ccMRL76p6MxynGZ6G4XxdDNnfN0n5jtH9Q+KJXiVWastqhU5CeoxO0i5rB4CbyR+y
 e5qTt51eJO5ilZYspWdRn6BIw+koiG+9NopzsFTu5ipyLg7gGJCnwCa2YuFDEkdJIs
 Ud/QMgUu8GoBR6v7Ql3o6MKBPgXW9RL2xbYDpiTo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1pWlw62jPY-00wYxV; Tue, 20
 Sep 2022 19:31:54 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 09/12] linux-user: Add strace for clock_nanosleep()
Date: Tue, 20 Sep 2022 19:31:49 +0200
Message-Id: <20220920173152.199359-10-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hHc/k24NENLWwS5GPMapwfGlA896zoLOCuSmQ8DUnfNPcOqHdKs
 saG7gh5ec/0BPqSbgSd+LlUYH4wRuSJ1ZhvLyrHDkssvWou9Q4HAhfLKlKU006TGsNb248R
 LqybSsTgoXAuY2ERyUt3REI8itOn3di41hWVP9GZgnWtBUFaN6s/50m8xzXu88EUm4SsXoF
 VFzVOdUyVlcdU3/ZmjCWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DNYqATqkD3E=:VPatlAGIl/aK8j6VAQGTw2
 ekIhKjVV4VXCzNg4t/Prj1JBdGjaeMljdnL7IlERQKoJ2Cie/BNQPJgJrLy2az+k1VrSNAIy/
 F2P0NsNWeenaV6FKJxHR+j0Mv3kG3z2x7ES4yWngjvgPCQHznbilxJxswSW0YKNLjYzyNGlzt
 Jv4yOKe/wjDJR/G/cEjbggpf8vMebU6a8LU1q+lab6nAnUbBkE+XCEy6ym/Q6YDpxvVlG33Lh
 lsmlVDafI9iHcXCtHtv9KzbFxvQOJTzH6/cBy6AI9PthOfV9rjs6kZh1Luow4AS7MA/3F3Pj5
 k4CA9WQ5ltKPPmkArIF3bdrximdgKZaMTbNgQxS2HyW8jEWIqAxhxn5FMcVc7KGSyGf9Mr1uQ
 iXwo/ybKTWWHkCQSv/aA2oMh4WYB8nlGbVFGVh7rZ/xdr/r8xV5+1GfT40Dfh+hdkwOc3fub3
 8JyTK4Gk2r+U9sZy1E+sYBFhLkIG8FS17PONHpeHlZUKd4mfV8NiV5xy32PltOA+3057MEZbg
 UFjBPyRSGHQjJG0RO9TvTEbK3HBSmKtWS07B3pBL4hZSR5WHCCDTeZxukNF6X4lc0OxqWj9kc
 qXMuKepbz2WPS9CdI73ruyWJRkYFbnfgqV0JsEXm1Awa4uPmPulExtBEKOttCBanFezY7jdoj
 dgHnkqxbXt+P+ZVOTv7I8szg015XK7PjCH89Mq+T9zEfQaCpEklnarkcax1Tfy+s2YouumGDa
 z/15U4oir8qBk14uttZqyB2Mina9oDFaiyc6JxLmbTizwPt3EOJ4guZlxbWaXtMsdJ8HcKVUI
 T7r48+5Au4gC45eaPSCzXBfIYn3IZyFHFfg5FZp+eUnYoniBqTSxmMapjCBM+/6argYUI/dO9
 R/I34Iogfef/Zk2hoEVAIo1BGTd6UuLvZtNXCTekLI3CC6woG+nnke5aMtN0yoiZRF1rQ+JK2
 QSFxZsIurW0cvOB+xendXr6UJHh19zYzaEBt4Er7OIzLR5YbY+D8tOKJV06R4n88REPVvHZI4
 nFD84rrj4XZ3121q7ex8jDzBdg0uxjVOOHd8hf0nh/B8F6E/izotIqR4GVZhTQtbq5wYDbQZW
 sK3sBwEwCGffxbUz0nmuB/CsMD6Qq6LZesVWFJHsodTbnfTnJNsT0fXEMiF7zPxt4Zyu3rXDb
 QwhVrsNit7sf63dJPp85ghb0Ke
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 linux-user/strace.c    | 15 +++++++++++++++
 linux-user/strace.list |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2f539845bb..6f818212d5 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3567,6 +3567,21 @@ print_unshare(CPUArchState *cpu_env, const struct s=
yscallname *name,
 }
 #endif

+#ifdef TARGET_NR_clock_nanosleep
+static void
+print_clock_nanosleep(CPUArchState *cpu_env, const struct syscallname *na=
me,
+                abi_long arg0, abi_long arg1, abi_long arg2,
+                abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_timespec(arg2, 0);
+    print_timespec(arg3, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 4d8b7f6a5e..215d971b2a 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -91,7 +91,8 @@
                            print_syscall_ret_clock_gettime },
 #endif
 #ifdef TARGET_NR_clock_nanosleep
-{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, NULL, NULL },
+{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, print_clock_nanosl=
eep,
+                            NULL },
 #endif
 #ifdef TARGET_NR_clock_settime
 { TARGET_NR_clock_settime, "clock_settime" , NULL, print_clock_settime, N=
ULL },
=2D-
2.37.3



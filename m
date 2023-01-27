Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F167EF6F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:20:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVBw-0002Q2-SW; Fri, 27 Jan 2023 15:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVBg-0002OG-D7
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:19:18 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVBe-0000ET-Ir
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674850740; bh=ucSMNOYXtWAc3g4ro/grKPQaQ+lrS5Q6gZo8m6ObcVw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=dtJOwna2nXuJYV/VrCLucouGbaIvFV4ZsQJpVR9sh0ghqLXPYerogXZuvEyy7QqIS
 eF8ZYRW1ACSz9x4+SSgFsRsWSNitJi4VXGv2x2auRG8DyBod77/1SfgtdzxH/CFw7Z
 2q7fnFN8P3dDEKwkNXNquUfFRppyDXsTRBBUqlzWej1aFUMEmlgNp4rP4q5Z+aH+Jw
 PJ/ociYVY6AYQ8CiGAjYnrch63VuSub03A+maxO5yFAG9y40lHytj6x5KWML5Etx3y
 YIj1mJzwvcRC9RNP85HtyW+A2vBVSRJTQmIzJ5xyPBwQxfDxs/x7IzKvga9053DJdj
 kBxBn/UXIlAeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.191.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRVb-1pBM2y3VGt-00XqHt; Fri, 27
 Jan 2023 21:18:59 +0100
Date: Fri, 27 Jan 2023 21:18:58 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Improve strace output of personality() and
 sysinfo()
Message-ID: <Y9QxskymWJjrKQmT@p100>
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
 <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
 <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu>
X-Provags-ID: V03:K1:R6mlAEd7YE7rdtI16HVX7LJS6TMx+DIlvQNyF5Sy+3GU3KCwS1V
 Xjx6epr8jNPSvjSzhRyT3lT9c1ZjHMA+e5Jr7WzhSxAupwTieIH5MMrqj++FuMP7Pj1G1wr
 ThDMSnH/bR0u/DlyCLTFDUv0fPn51/zt2OVo26Q6N8HgRa9NtUsZyJQDaL4EKysJJCXsqCg
 3zFkockqpSLFwY+UHhxgQ==
UI-OutboundReport: notjunk:1;M01:P0:zCmroayVhZY=;RuyHxeGMmgSLpU7ACNq9EZfBCGL
 AU7bYAcOhebZQcoqO8uttzYK2eiEe+hfOJHcFrbJLXkoCRtIYIdpRAWtBAXMl3xXIdxO4tNY9
 eIjCNTFa4hg0zuoltpfdPY4BYjI26pW8sf69dU26KZTtNSS1RymaKpLaEwU1pUmPvGco7qJXz
 nxBNsyXZNy2e4hKvlS7zQwlsoAQOhcxV/wHoFeOaPm+uTjRAMiIlMHb7DoJDChDQkOMJRft3A
 dA5yaAHw8fG3wvmrcUG380OMvR2R5h+qMHmPtymMNjvppOYZfurxDx+vRhW93tZdKzEfU5szl
 AVi6rN3h42vqf3rA7zxW5QTl/jEWP6AdAptv51UeddckIeRFOMYhDa3QSG+/Fb+EQXAcI6fUa
 v4uEAA0D8akD89ejVrdNA1h7RXi2tEZ6u2tqjQfrc+cHpvtK3y8NNifczN1JTpijZ2P6iy8U/
 3kvoCzriTzrBRzWiTdp1lYps+8biZ1a5JiaCoVrOCfi0CoR/3kBsh7q5QTiB/qApL5I81akXy
 d4KZwhjdbUDZTX+rDnSd+FBwXJaZTGI9uWbTQQU4NDLEphxAB4qv0EPuaSei+WHy37Ww2HSv0
 AEF3BK1sz68NXqvOfQeEs3iSXX5x6+ru3pj7Ctpup5jiCYFZYrbcoC1zE261eOvkf99gIKg85
 oH+SUwofL36S+JiDogqZNb0wX7aXk6kVSgZ3bQjK6lomfwgjGameRu4gFgkG347iCbQY7eo6B
 jZv7Ir9dPuCnTioVHaRsTS5InNUEYucLK3+mTO19SbSJ3pV9wfkJriI4e5wrHAgUICIe58WCi
 S5wj21utvn9SPoJbfAw3ttUU9+Wszs34/t7N36iSplwZ1+mCVfqTHcLvdxfmOdm5kHFPi827z
 AL7areMu++saITiLK7l7wpDZ9Pf1EOiOucBEr7nnBvBWeqHlFwLA3C24YlQ/2WFneY3xGRwpA
 2RWOSv35D50hcsM6d+VTh+e3WXE=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D-
v2: use TARGET_ABI_FMT_lx instead of %p in personality output
    as suggested by Philippe Mathieu-Daud=E9 and Laurent Vivier


diff --git a/linux-user/strace.list b/linux-user/strace.list
index f9254725a1..703c0f1608 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1043,7 +1043,8 @@
 { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_personality
-{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
+{ TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")", NUL=
L,
+  print_syscall_ret_addr },
 #endif
 #ifdef TARGET_NR_pipe
 { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
@@ -1502,7 +1503,7 @@
 { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_sysinfo
-{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
+{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sys_kexec_load
 { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },


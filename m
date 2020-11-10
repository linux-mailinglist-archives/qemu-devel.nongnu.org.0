Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646822AD153
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:32:59 +0100 (CET)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP5G-00024y-F5
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP38-0000lf-Kn
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP33-000733-Tg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:46 -0500
Received: from localhost.localdomain ([82.252.154.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M89P3-1kgXeO1PJT-005GG9; Tue, 10 Nov 2020 09:30:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] linux-user/sparc: Don't zero high half of PC, NPC,
 PSR in sigreturn
Date: Tue, 10 Nov 2020 09:30:34 +0100
Message-Id: <20201110083034.224832-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110083034.224832-1-laurent@vivier.eu>
References: <20201110083034.224832-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fTEwE+mQ3Xkaj3i71upGpFf6necyc4LgO4712/yqeVEG0otH7gO
 7U0g3Zd2TuNjOooYKHiNV3u/SuvVOxmWgdGv39NxkxEOsbA1mnXkq08yGdbKoOL5btM73F9
 pGiCG2uG1xIBswAgEph9ebuswLyqY2xYkcYkyEbfvhnsVh7OGcMx5n55KYoUdmmWUtl0VTe
 NpTpSTM7DQGlVB2VA6TJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ksDZc8uw4Wk=:jJLFMKcK/+CVtb2JE4+UZ8
 ZOcdvCuh5lqAZhcuCMBu3ji22ElpTwupe4v4YSfRTUHhX2OOeDRk+0tLXOGc1ImhdUxRZP/Jq
 a6AlJJNvbsMIL352SDvw5HnX2myxrjSTSwt3C2Gcs0BrnXqdVUb7TzQTePcl7JeNqgPQX3B16
 IX1OhBCG3ybRmOweOW9zAGhmOIxnQQMOut8XG8Nru1DJklZ6C0mVhQy1gQ9T72Y6s9EPYtY3V
 hjJMD6J2IlWztvKkqNjUPurAZcsGanFISfuBpS0Wvue6Dko4zUJEahimyztDaE/28PbnECNfp
 e/ecumXQ24Gm4Z0uG0NRMKsXoMcrnd/skQDoh11iEGwND9iDBNcqumPi6nOfaQsYEJ8W6Az5u
 xbNKFJHDs23WhXpJSLIQMpSzLX2FIww6kprmd9zOONLOwlGGj06q0MbdnIWUVvq0zgugNhSyw
 h6nMUd5aNQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 03:30:38
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The function do_sigreturn() tries to store the PC, NPC and PSR in
uint32_t local variables, which implicitly drops the high half of
these fields for 64-bit guests.

The usual effect was that a guest which used signals would crash on
return from a signal unless it was lucky enough to take it while the
PC was in the low 4GB of the address space.  In particular, Debian
/bin/dash and /bin/bash would segfault after executing external
commands.

Use abi_ulong, which is the type these fields all have in the
__siginfo_t struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201105212314.9628-4-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index c315704b3895..d12adc8e6ff9 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -247,7 +247,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    uint32_t up_psr, pc, npc;
+    abi_ulong up_psr, pc, npc;
     target_sigset_t set;
     sigset_t host_set;
     int i;
-- 
2.28.0



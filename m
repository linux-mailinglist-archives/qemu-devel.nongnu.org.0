Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79B38718E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:00:58 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lismn-0004K1-Fb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKd-0007NN-QP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:52 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKa-000748-8K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:51 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFKbB-1lgQR90nUn-00Flr3; Tue, 18
 May 2021 07:31:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 26/59] linux-user/sparc: Add rwin_save to signal frame
Date: Tue, 18 May 2021 07:30:58 +0200
Message-Id: <20210518053131.87212-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qYmK0xUYuefZzH0MoLWsHZA4pHRgoMrIzl1AqxqvLQrdwW102mf
 qKm3oHhZpf7PApBYYFUJzZ4u4mLlG4XvqjYoYpvlamziDGO+RWH1elC0cI1D55OaqsHShI2
 AKLxeDmqPF0Glz4WdzzXQGLsuMXAqz9/B82/l+Fy+xWvTs9/NTT78ziZ2itzqsuTAve8JWW
 0r3Q80GAkwjFrh7Og983Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pzp3nhEHQUg=:c3+smK89o9oAZLxyN2JU8e
 QXMH8y4dM6v4lTvtAvRQHIrhnZrbje0Z04Swmj9Rvs0kYihqran5v2op38cvQIRxVGrH07EjK
 74KjgVAX5LcqEpPbRukuAnAfCL1A+SaCgHp/wprdRgsf/KH5cNjhgmN2CsXtYfS+fOIJiTXGg
 SBMOpmFzHRY9NqnpxZKuDBH4jOwkqBUZacdGis5OGqZ5ALvc1HxNI9qPKHj8vqXMzEnxHHpmO
 4InASAmAHqBb/h6c0AyprVLsIyl/ESQp/V1KjkO0P44u+rGfoD3aTX7w/Sz1t3tcaukc8MHTx
 nv/0sDW4H0rnuDVGNuwlDRgiPWe9A0NuEk99fv9b+yiBO2fZ10ydf2hykgTwOvdVIhR/fSPsh
 uA9OnJyKCF2VjU1axXcL+TTaGdVabuoyzXDtzUCzHSJaYsdQh0z7xgRiMm6wNbBBIa1THjgkd
 WutCHaXrVoHJGtn6CBBkHSNKWfGoUedEINJNwLY7h/LjN2wBfGKjxhkfidEJhsW2IXly2NjDT
 nK0M5q3lRJiijN+Ve66KTs=
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Stub it out to zero, but at least include it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-20-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 59bb4495121e..4a0578ebf37b 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -62,6 +62,7 @@ struct target_signal_frame {
     uint32_t insns[2] QEMU_ALIGNED(8);
     abi_ulong extramask[TARGET_NSIG_WORDS - 1];
     abi_ulong extra_size; /* Should be 0 */
+    abi_ulong rwin_save;
 };
 
 static abi_ulong get_sigframe(struct target_sigaction *sa,
@@ -208,6 +209,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
     __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
 
+    __put_user(0, &sf->rwin_save);  /* TODO: save_rwin_state */
+
     __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
         __put_user(set->sig[i + 1], &sf->extramask[i]);
@@ -303,6 +306,11 @@ long do_sigreturn(CPUSPARCState *env)
         unlock_user_struct(fpu, ptr, 0);
     }
 
+    __get_user(ptr, &sf->rwin_save);
+    if (ptr) {
+        goto segv_and_exit;  /* TODO: restore_rwin */
+    }
+
     __get_user(set.sig[0], &sf->si_mask);
     for (i = 1; i < TARGET_NSIG_WORDS; i++) {
         __get_user(set.sig[i], &sf->extramask[i - 1]);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCD383CAA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:48:22 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiHt-0007VL-T8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihld-0006YX-1M
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:01 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlN-0004Rh-9d
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:00 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8QFi-1ln5TU0XEe-004PBe; Mon, 17
 May 2021 20:14:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 26/59] linux-user/sparc: Add rwin_save to signal frame
Date: Mon, 17 May 2021 20:13:51 +0200
Message-Id: <20210517181424.8093-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SQYdrlqjRBJRWMJzjUAAXDNmnmpo+lA16z1fMzYvufi2g5eygiH
 pzIGARdYXLJ3LjhpQhy1cOzZ0vZfrG3YqBEaXtb4U8XZdl4Yb0qIMCr6GnKtfOG7Cynxc1E
 /ptLX+mm2UZJ9+Lf1DOhUqBtlPNM1nL+vX8yTNvLyrFx2vxxvtCm8wXQpnol1zfXtMTZWb5
 7CZfJZbedK/lzwTVcnnkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7qWQAbbGx5c=:GeyVKpY4HG03z9bdSHbq5L
 x4poL1faWum95KJ9COH6Iob9iucsndDdC96rOYnnCNwUiR/hMJiHN1vgHGv7O0K9LSQtf1MW8
 x1ED5CcgSL6KqddamnF5gNC4nvy88qhhEK1MgbO194Tdmi6hgd105SPsZmkWFW1bkXtPb0MDT
 UaMHg9qoA0lgczUdZ9yfwHsRiKLS7agNfw2nrsBPd3/Xi3jJi7NYScHHaK5+Qasl96/LMmdC4
 M6Lk4AsqgVWG+z9WeMMF/tcpm217jivEsjAPdE4ZdGCNUKfZo3hHTygrj9E0npilz4Ox5EEOm
 ZrjAw1pCqB41yAf/NdHE/5nRVHkS2OoPo/NMfpjMS4iVJqUYX+f3Cg0y5s2swGOjeDXTtzhOV
 VVu4OCYXfAZPSp39VRvr9VDZlTC1An2IPZo3YNJMv+msFf+ceewjU+0EhGwWBk4uH0flbBTkf
 0D42xtaVnQLDVRBvy7z6ExW0/zGHX95i3w18kTkJ7c10MVuXCLJpBX0zAshYrES5Gz4hJFQ6Q
 0C8+klPUOyoRyVcOAosP8g=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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



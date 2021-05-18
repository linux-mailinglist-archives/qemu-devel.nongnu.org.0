Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796193871A4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:12:44 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisyB-0001y6-Hp
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKq-0007hy-B4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:04 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKj-00079u-0i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:04 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGzI3-1ldfXw1Frf-00E6tT; Tue, 18
 May 2021 07:31:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 37/59] linux-user/s390x: Fix trace in restore_regs
Date: Tue, 18 May 2021 07:31:09 +0200
Message-Id: <20210518053131.87212-38-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SgDryPu0UzDHpaSBa66ic8SRL9CsUkvHpgYIGBFBHels/EpfyxC
 BaBkkW4M9S4+b24E/dkBV2lxxIr5IyAbxPep0BLrZt4K0N3GZSZJ2iM+i0ZIToMy5QTU91Q
 5qZj1KZ7DuZYtLC6kwAaWgZXCuzKW9MD/01NdUEP9Pr1izVEIJjnnuikpa96irfPGYRMvve
 rwQ18wuD6qVi4113Q/c2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CEwRVVLYIMg=:g8cTkuPw1f8UQLf2pazmit
 ZBTzw/5wTWDB1e2cpB+ByiHg74IOK/ZzIrbbeYb0LQfMQo11dkSM2HFO4uo0pPcCxNu65lMZH
 QHkmQApP0vAkeI0xDjux0txNQbZffWPjiNMx5RXspGf5J+FV6UPBCS9FilhuV4AE4Ymj0XRF5
 9PQ1RZC7iYAeKDkQzvu/DXtzMG/bLMdT+YsASHRQVxcIP2hj3i8sGdNJ4cLocgEyhbMKxRnsX
 6dtGb5gdsx8UlTR6V3I3iaFekVKAuy6ZYj/eOV1bXs+QbEyIw1+yM70Pir2/bWVEO7cpc/5p8
 7NZCNfluSDeAxICHfoNXfAjjYvX9gatn3WebHq9kdOF6ToaeIh845FFR4cYv0VsYGpZAC1ubF
 K96j7tjUUeQVuUZ3RXB47n9pb4Xi0GlhPH+GjJlHmdE/7nno3MHiYhobllw1ny0lvJ1FvbGu9
 XRbeSfuvxnfVgxGtytTWrZ9J1PuOMb0HLB6O5FD2vDVb+6lUfvfosniWKx+GCB2edN07NuzoP
 ia79rjkF/ZPdXtrI176pVo=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Directly reading sc->regs.psw.addr misses the bswap
that may be performed by __get_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index e455a9818dea..dcc6f7bc0274 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -232,16 +232,17 @@ give_sigsegv:
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
+    target_ulong prev_addr;
     int i;
 
     for (i = 0; i < 16; i++) {
         __get_user(env->regs[i], &sc->regs.gprs[i]);
     }
 
+    prev_addr = env->psw.addr;
     __get_user(env->psw.mask, &sc->regs.psw.mask);
-    trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
-                                     (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
+    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.31.1



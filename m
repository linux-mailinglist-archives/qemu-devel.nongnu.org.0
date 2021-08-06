Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F53E2718
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:18:47 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBw06-0004Gj-4a
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvyg-0002tb-Uh
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:19 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBvye-00057v-56
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:17:18 -0400
Received: from quad ([82.142.6.46]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5FxN-1nASiw3eDt-01197s; Fri, 06
 Aug 2021 11:17:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] linux-user: fix guest/host address mixup in i386
 setup_rt_frame()
Date: Fri,  6 Aug 2021 11:17:08 +0200
Message-Id: <20210806091709.2465239-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806091709.2465239-1-laurent@vivier.eu>
References: <20210806091709.2465239-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o7hkCkfneED8CJrExvUShojfZw2otOwJn/VyMxlDJue0hJpsQ+r
 l6uu+/qhwpUWFNAitUOn1jrH3KEnpEgk/h1CKasGOUBNWYfFrSvwJDoxwn82c0SXYeeojF9
 ILTGpFX6idGKPUdRONHUU0PqJVFVLC1C/gSYJdyplHaE3A1lu/5ZQ7HX22LZBDKZY0QFShv
 XGovKCLjf29617QqJX5Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jVYpc5RaYcc=:CUKurxdyagh4F4fcnocr9F
 GY6oll9KvJr1C1uT9QAOfqKa2VtOvtO/h5DpnVu/9Lkm7CJW5FQaiX93uhlbYO+V0QpinEgDM
 elgUKE+GwR909qTeyYmwnTlzxoSdeJCpsMnfgRLKadArPhgWBlti99sUFYtf10/ku0IstWCmz
 E6h4JxrBWC+EbLrMjImfca1sOC71MEETP3BIcNNmyZJ/+fDFnK3j3SEINOvZY08Kn4lfQuEgw
 HPB8R8O/c4HeGRAZBBtGOAmLmYxG0cM/JqPJ1YNXL/u5esLhyjQP2pCLQyqwe/GN16fCXzrXI
 I38h4wdI9abU7Ee0SbbZ9y9sZPhc+t7j2koW1Ybq6CLUanBDM1Xt9djWZ0F59KvGH3ZuK5N5+
 to9z2SnLLd/sPEE/nw5gKmnLJE7gysBH9u/OOTVxB4IE7tslTPns1BHAz4DzuP6FTNlmQNFkq
 Hn9X37IB4spfhB7sN7vFYsPaCum67gcDG3QAxLGDmALyBVQZgnEWwDKBQ1bTbvmNr1285paKY
 dT6S7VLYqz/KwpRUHlWq71OlSlgcuEVa+lPxhcUrWZBlB4Q70XmAhWgt1W1Bby4V9bYDb2b9P
 1Zo/ZqGk54dZZ+EAdk04Q9Cg1lasDynb6pF39el/nf4shb4crqzLGXsjN2hrGFJGlvA1cVyaP
 HJzdI8fA7YA3j33niHlAzWY6SoEBVkNxD/SsEYj83bmo8C0ef8D3sBToaT63lwu857VImWfy0
 pbpsHUxX0tLU/EpPFLTSJmoZFmsKx8+K179TtKPSBoiDZKNCXNNS8PTeYc2vhp52W1JKozevZ
 73HRpGShUMmONIWUC2g+yBwvMoZxeK26T5q0+gxAXyoJswkDXFjult666UyBT6or0qXd0o9
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

setup_rt_frame() passes siginfo and ucontext host addresses to guest
signal handlers, causing problems when e.g. emulating x86_64 on s390x.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210803171858.148394-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/signal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 8701774e3791..841cd1965100 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -436,13 +436,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 #ifndef TARGET_X86_64
     env->regs[R_EAX] = sig;
-    env->regs[R_EDX] = (unsigned long)&frame->info;
-    env->regs[R_ECX] = (unsigned long)&frame->uc;
+    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, info);
+    env->regs[R_ECX] = frame_addr + offsetof(struct rt_sigframe, uc);
 #else
     env->regs[R_EAX] = 0;
     env->regs[R_EDI] = sig;
-    env->regs[R_ESI] = (unsigned long)&frame->info;
-    env->regs[R_EDX] = (unsigned long)&frame->uc;
+    env->regs[R_ESI] = frame_addr + offsetof(struct rt_sigframe, info);
+    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, uc);
 #endif
 
     cpu_x86_load_seg(env, R_DS, __USER_DS);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FC417662
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:58:56 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlj5-0005iU-6p
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgt-0002z7-2t
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:39 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgq-00058z-DW
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:38 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MysBI-1mq61g1e9C-00vsyT; Fri, 24
 Sep 2021 15:56:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] linux-user: Zero out target_siginfo_t in force_sig()
Date: Fri, 24 Sep 2021 15:56:28 +0200
Message-Id: <20210924135631.2067582-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ppNP15x2czCuvY1892z6woD8TKTsVrnHpcpOymAF7UVDRkS0kdD
 aJyaezdd2d6rYS1IypNuHESeZdx/tkLUAk4DmOc7DQbt8EcPE32HeJtJOuqlzOkvPaZ+29R
 IxEtwq5S3OIKUfeAS3oLKyWy0/u+lOBQ6r1+1ZLqSv5TqgwLm2Gb+N5u+Hhom8gipPU8pKx
 wYbvctDM0/THCs8jCmNxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u4Nog+Vvs6g=:tIgHdiMIfaivEYr4b2N9WS
 J4k+vg+jt5GtuguGq6xEs85iEPW6QCpiHck3x/k6W26jISGRWOvXDI+dZ2AudQLC9Zc5kg15e
 vHOthc/oqWJTmzJcUCGSans3PcAqorYaLgEycDZ86jqceC8d1Yo2LVEYnn5AbnWOvfmXIQeQp
 AB+HpMsW+NUNNJfHHm0XLh7adtunHcmLXaEpHjLbBwA7MN4ugWuMhlZttarWaGpgtCv3G1erE
 fVC8Es/lA9OUpZgqQRWAlrsKR5cvIFx/TyYkuEE8wiO3r6pFS+3Ur8gM+cvm4L68nOn8mrgNF
 TZSO6k2L1m+rk0Ccdbi2HA0eSd3+MkN9y3tCm/mKiNnKd3ND8ZL/azXyDg7SAYjog7p7pZ457
 3JR+jOsdL3Fv9xmX1RFaD0DbxeQ4Osb6yYCMn5Gi16cxGuT3tn6vIRU+FkrGj2X4PsI8nLDUn
 WkzknjygjZQmHKTAgbJg4fzKkMiolfll0JXcuecRztqGawD5TyQjFa/db4ecHeZ1sa5GIr5Lk
 jE6JcPDP6FcHsNB83EVtw9y+bCJrPWAWfwaxfVPsJ86Rkq+dp+y0F4rsB2fJPZUNba9tKy4ie
 Ab/PDun4S8eF/Ew4u2Xh6XFIyq5G8VVFcVu088XqPtSHUp3kqDKkPgDWq/gmyvVxZNBvALfp0
 VKZVQO0X0zmI5/7GGB0EwHeZuxBHU1TGn7x7OkRdIJero2UQfs1v4B2cLl2TH6OjjsARK7tbA
 3YK3A1rzrtnZ//l1kOI9OLsp0o/G47fNoysQ7g==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The target_siginfo_t we populate in force_sig() will eventually
get copied onto the target's stack. Zero it out so that any extra
padding in the sifields union is consistently zero when the guest
sees it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-5-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index f8346f5ec5fd..910b9dc6f7d1 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -641,7 +641,7 @@ void force_sig(int sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
-    target_siginfo_t info;
+    target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
-- 
2.31.1



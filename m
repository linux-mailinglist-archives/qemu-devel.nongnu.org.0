Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FC2DE0F7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:27:55 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCzK-0007uk-SA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvv-00032N-OR
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:23 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074d-T6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:23 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRTEp-1kTTNd1fmP-00NV9V; Fri, 18 Dec 2020 11:24:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] linux-user/sparc: Don't restore %g7 in
 sparc64_set_context()
Date: Fri, 18 Dec 2020 11:24:06 +0100
Message-Id: <20201218102407.597566-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bhY+mFh4+79meoAigyLRoy7nfbcBXT9YT0XkjqwgRpkXBO8kAHo
 cSGLSopnN3QQafTXqtdUu2Ar7boCUawUF1+T5Y9t7Bi78zkUxljAbWi0nlc0CKLw1g6u5Z0
 sSjSOhNw5qDQRLLFb2jbJyYzOGOVoKNVS8VpKCjaY2Zspr8VolmcrT+FeS72TEZ/Va7I+v7
 7S7SeoZMPSFgvNL1JFy6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q2Kw8nzRnxg=:6Ocwacmuloa0YLKVmTV7su
 HL0kr91dcwog4oqgYwF+N+qB7xLr2cGFgbBkUw7I9gcrQsvxjVgH2zuouNoCMokOLGGXG2nX0
 NOKY0DncEQ6DJnZJgTG/qMyXvmYdQyic0DZeyl7s+HP5zMSA3cPqxkYLZAPxLe2tDQUKlyKH/
 uTesRmLyyerBLlSI4foLXjnMSZiQHRwFwfwPQUYeoT7AtAr3a7RJNSwheGG7XzTcpTLglHCrX
 fA9cxBcvDGsEOsXqZjvI84E0GgtQSh9z3Xs8bZlfDm25q+1ljNlp0WnB5QsXTMYXjinwb/VTc
 AnWHxVRlVFrGCNpReI2oZFj+9ndvJJD7uaGGjaFVahaHzjTqGAlYaotOHyghYYSn1VCaM4r++
 A9/tYXZ+efrlW1mCuZMPXt7SuMZLk1ZCBeiLPO24pwN3q6KsI0cpVTGiRjyuIYt4hvUZ8m46u
 14+W3K2LzA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The kernel does not restore the g7 register in sparc64_set_context();
neither should we. (We still save it in sparc64_get_context().)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201106152738.26026-4-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 58b48afe29c9..d92e096cafa7 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -447,7 +447,7 @@ void sparc64_set_context(CPUSPARCState *env)
     __get_user(env->gregs[4], (&(*grp)[SPARC_MC_G4]));
     __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
     __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
-    __get_user(env->gregs[7], (&(*grp)[SPARC_MC_G7]));
+    /* Skip g7 as that's the thread register in userspace */
 
     /*
      * Note that unlike the kernel, we didn't need to mess with the
-- 
2.29.2



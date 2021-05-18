Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF88387192
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:03:27 +0200 (CEST)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lispC-0001AL-Er
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKz-0008K9-Pg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:13 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKq-0007Ck-1r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:13 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQ8OG-1m4muF1Vaa-00M5ra; Tue, 18
 May 2021 07:31:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 51/59] linux-user/alpha: Fix rt sigframe return
Date: Tue, 18 May 2021 07:31:23 +0200
Message-Id: <20210518053131.87212-52-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e5OnsQY3zjS3zMosdWV40i3jmzJBdzyTDdM9Ze2ij5XIG1i0Afk
 AAkOS2tzxmWJZ1rNUVcFzabr1zmT34HqiswPWiVFDAKITH9ErFNE7oeGOeYiStc8sh9TxZm
 S3Wlds/asirNWFqb8Y17v8AkTVJqyb++gEx9gxn7CpoERtHNaMSV6RPSFkVCiQujdroa0tn
 Rk5gnaleSsvYKMOMaLbRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qqe6ScYZYxc=:Do0dWQqs2sCC/rxhNQUVGH
 vY+xf+PnauMLfJdX2IXVNyklQqSvcb6An6Bc4GKDiGAvytfwHag1bOzW66FhGKCvQN4eu6zhN
 AeuLCTyqMSMLq4xzAAWw+0FeeoRhaj5RubKyryCuSp3OGc0I5btO66VuF2FAWWXHX00zLkBmF
 AevO7S3y9KasA5GH0/dOIxjdRY68I1a4F0XIpd/WKKjpYTn6ALCC7T0MspVwE22jEExkofFBw
 NzgVzsAxxWZ7qdjXaGMezit/j8Uw127qxzurOsVHM0mLZoB0Z+M/J527vhne05UATh16r24LC
 6KeKbciBII+YuMpqMKR8hH++QA2rMRTPAiAd7X7kTjyQ1Z+R7/ZhYXi4uBVoQWb5WFOsGX4Ef
 pkJmAZOgXMsOTIK6sEY4QNI8WNDGgRyR7Ab0WkD3ZiBwyRrYb5hhuHI6ZDFbiVOI8DvRSLunS
 YDzsa9uCvp0GLmNtGsc2FGu1l6VvBkerNZfBcFwP6m5wGTMLsPyabblcC7a8ziD1BaKG2XRH1
 ZpUayWrL9CfTCdfCkNvROw=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We incorrectly used the offset of the non-rt sigframe.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422230227.314751-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index d4e4666874e3..0eec9ba3fd82 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -200,7 +200,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                    &frame->retcode[1]);
         __put_user(INSN_CALLSYS, &frame->retcode[2]);
         /* imb(); */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
     }
 
     if (err) {
-- 
2.31.1



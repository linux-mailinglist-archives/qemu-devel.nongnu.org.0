Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0738383CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:57:04 +0200 (CEST)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiQJ-0004BK-O4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm4-0006z0-6j
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:52007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihla-0004Zd-9e
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:27 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MI41P-1lf58V34Lf-00FAwA; Mon, 17
 May 2021 20:14:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 51/59] linux-user/alpha: Fix rt sigframe return
Date: Mon, 17 May 2021 20:14:16 +0200
Message-Id: <20210517181424.8093-52-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PDrwoQWrAJ5uiLKFzRiKLygC5ZQN+i5naumYjs2xRijmcAuAgeH
 nu2qW1H3t8/DN5mqgxm36WLmjdKYEMQ/v+t0P6UE4ZlqxzEjeOKf0P/R4H+Ug/5GVVQlngC
 YupS1Zdu9RgTME7yS39TNwkjwbB66epmzIMAi7l4bhApuy6bwYiNnuQODbrq3RSoO5ARy4V
 D+O5W+22OXjX/pH4sRhcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KoGqCJkR/34=:2whZOlpfd65nD1CZDoaNvU
 XxmH+hm0IEyLNlSUg7b+vnzJy5HPAkTm2/4+TboVIl20qZfnoXNixk3wZNKs/LZ++T6zgYf2G
 7xRLgeXvFtSSQa2A3rfK7rrv62ZyIB7fsrWBlVGdeEn6j27l+FtmNoAACQtiHwuyOWSb82979
 wQL9+GodD+lzYDpbZZXgwTnJUe3A2y8JjoXKv88T+Px2RcS9MShOLrJyC76LJ/0nRydvLER/0
 00fyliQQJRSgYM7Ud2YB/LGm8aFNgQ1Q8eP7vopEAiGj1YHn2fdeOgPgxK4esbIBi4TxVWSrs
 7S6uEcTgDM8f7C1L3gvrDNEWT+P1L8Qnp2wVwADeBRA8zaoDTtYQjbGMXxHyggmhea9hWHzQu
 WAFSrQxN5FRVfHRsBNTYiwhU5hAnmb+yUNgHu049rLoqCg8KXukiPcYUstrggxkCxGzijjY2E
 qgoAjd/k9LIrZnbaPWgGrOfQqaBWb1MpKNdqDWGRvaBDi4d16VzrYux/6cDAYJZU+m58ynITU
 RyxfWNugdp8iAGMfwOvACA=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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



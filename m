Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130703AE7F5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:14:12 +0200 (CEST)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHsZ-0005To-6G
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHoR-0007fg-EC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:09:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:47379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHoP-000744-ER
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:09:55 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M9nhF-1lsFSW1Bav-005qgK; Mon, 21
 Jun 2021 13:04:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] tests/tcg/linux-test: Check that sigaction can query
 SIGKILL/SIGSTOP
Date: Mon, 21 Jun 2021 13:04:42 +0200
Message-Id: <20210621110445.231771-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5lI0GCLZ5dVEZwktP+sjPrNyWICp6tdXiK5ty/e2h7SG887t0zX
 J8IEnLZHDkI4QBvomXLRlnclVcF3WXOmeKsh21xnaSMzBoQViWkUxgSDPIREv+WG7oyIOYh
 gBqCeybSBwKaKuzNz9NrtptJKd7nkjFcLkgmn0bePFCto2xiW0RP225bjFjShnooZoaMxo6
 NokRhQFS+5+sJI0UpyvdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+rln/cO3u+0=:T4fuVEp74cGWKIOKvpptYQ
 H5PPw0phea2oXBvVIBY5FCIww6xNyjs0rVWjYY4cfsMhOqziuAmrifvOXnGMpv8unBVZu+1uE
 elH41qAI3MKMoqakM8nDDKUfNezKXrzYjgNheHxquxcUBqf4mEvNeJ7sWwoZfYIfizR6FBolO
 g+R2yo28OZNeXw4JN/GFFch7SP3dL5g+j9I3jKaAb+MICc2GS+B8ngUXbJwiCQN4Z7LPP0u0/
 hybpetPjhrqEMbSmHeWwHBBVWEhl0R7TxhrSJpuuCG4Ig2wdfdd8t1ViG4z4PjeYquF3IHDQh
 B5g2bp3H8eOw5oNwWQOCXTPKDMTB0omVlSyopJra5UF3NNK3hIFgiFHO3uLkeED0xkcgA4nkG
 kmvFhPoWLLW9KVPkRl9wGF5OBzvxLCMt/4t5ZahxDdPi4vbQgIrfPT4lKLINKfy8MZ/tFc62T
 jCDCtjoSi7ud47Q3vwDau2KltR8mdO6xlGuVR0De89zyez/Q87HciFP53zrQLbDT4z42uAq+F
 Ufi2rvJ1sMHPpBuM/o4Phg=
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
Cc: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Verify that querying is allowed, but making changes isn't.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210601145600.3131040-3-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/multiarch/linux-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
index 96bbad582318..c8c6aeddeb36 100644
--- a/tests/tcg/multiarch/linux-test.c
+++ b/tests/tcg/multiarch/linux-test.c
@@ -496,6 +496,15 @@ static void test_signal(void)
     sigemptyset(&act.sa_mask);
     act.sa_flags = 0;
     chk_error(sigaction(SIGSEGV, &act, NULL));
+
+    if (sigaction(SIGKILL, &act, NULL) == 0) {
+        error("sigaction(SIGKILL, &act, NULL) must not succeed");
+    }
+    if (sigaction(SIGSTOP, &act, NULL) == 0) {
+        error("sigaction(SIGSTOP, &act, NULL) must not succeed");
+    }
+    chk_error(sigaction(SIGKILL, NULL, &act));
+    chk_error(sigaction(SIGSTOP, NULL, &act));
 }
 
 #define SHM_SIZE 32768
-- 
2.31.1



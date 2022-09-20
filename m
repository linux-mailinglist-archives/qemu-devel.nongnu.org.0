Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BEF5BEFD3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:11:08 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalSN-00026k-Fo
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6M-00049m-KA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:09 -0400
Received: from mout.gmx.net ([212.227.17.22]:50373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6E-0003In-Cx
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695113;
 bh=/gVeQ5FY1ri9znOnzbjiflH84LDpU0qJIjCnWz3aFc0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bb9Kb3eCxErhLqMinjhO5mDW90YsW4IC+L8UdDJ8H9QLJgUGe1WWKTHGN8HB7cmVt
 UO8hC4weoPPFtztgSf8k4ln5o7tHWLQOZWjkxBk+6bf2zfju34V6nUO9JUn1aE28Qx
 cN2/Z4D8QmidnIafINUOb4DpErW+4idpB2VWTy9w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1oyiFl2zyy-00kL65; Tue, 20
 Sep 2022 19:31:53 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 04/12] linux-user: Log failing executable in EXCP_DUMP()
Date: Tue, 20 Sep 2022 19:31:44 +0200
Message-Id: <20220920173152.199359-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9LeJrD9DbzjFKQV2QbmY6MKjTqOiY8XLWtO0g15Oja8D/1mmvBl
 VUigYbjiN+Uu4pbCJJwZSZrf46a8qayIm1m2NFjJA/kazzJlTMqDbba49TEmFvljGERL5lq
 PdOUS4eS9HqwiBG43/9nwkMZx7y0n3ie82CbWpXvA1EP6DocSXXY7Qazv2OJI/xWvlPN5y2
 +DsXszE9rR/IZVlQFDDyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n6SsS6B+HrQ=:5E3ZPoFsJJzywKY3nEdKU8
 6mi8Tmu/iqYeFpWoc5jVbw/aAjwiDqckl22Xw82eAkgCZm1rGIvVgIU0HyiovxopKyS2QivQC
 PZatWZ+Zc7ht8tvOJQT1saabkXNMXpTWb3R9/qwZDBZOeHjRJzwzhGsOafUSwFwrD4grBXOEC
 s4TmuAv3+GiJPxDZ56mbXm9KdVYargPkNtF7qWXXgQsebaBHS+yNwNaG7v/+Ho3ArhwUEW1KL
 vI5tLkUh+Oj8gdZGnqBoSN1gJelYVgiGNhEV8TLftmmIrIIc9uFWgLCL4dpHQBKpx3WCCZXRw
 tRwYy/pppYz9aw8b6OlTxtoxMOGt7iAyHz9Od/S5WEurvpCjOHPq2czq+Nm/2hQUjUqJ9Z6Nj
 ncDKBQZtwU2QSq420yS3M4kCsN1kXGHovsRl65z6qaO1RCeuTL/eeV9TBfLY5n3qQQDBTOFu2
 6N5gcpRUYyXVq0yVZ7JFmp7/zkL7jPykdFG8P6Q6R0NWMdjU4mmYKN1TxsL7zImhEnN9iNSvz
 XwoALIO/AKd5utWx1KcsU/KyYeqrl8F9z8YyU3CQlqyQjpv1Exp58Y5CNQs9kRDKpUb83Ucho
 DMnT/sMCfgMNS5rpUmIhcRaf5ddUtaCxO9vXXu7hsIMIbzVrrRb/GbEedFSAPAPTB+LaH/zHq
 MtYdE5NMB6wa5mhm9fxPoeQV2ie2zMOrcaOO7vzE52MrAvVx1BIkk1if+pDTD46y2+n3PBzUX
 pkGG1Bz/pbxGS5wQvHMaQwUF8ayBq/ZfsmpgYRAp5NTt5rnK6t1QvtMaLCOKza62yoxLJYADX
 JH3j7woq8FzoSbUu8QwlZz+pegu77j8u2Z2PvsU66n2v0GmUM00wUBHYBpnEM/oIA1wlom+yj
 HFgbGap9Reu9b0c//7exH8KVSZGMZ3frKPfnuAhqLb2uLpv8WyR9UND+lzFW/LBl9O7p3xZDE
 vOFdaTGAPz+0V7iRsApc0tVOgBDdPtlajmBc6gutjdUH/LMBOSDuI5/uISvFTdiC9Eps0Piqi
 in8Aql3xhn8iVTbhifwPRxjedx433kNbmo00zDJJh0+vKrytXn+SndPh/hMSPuHjmy/N8RWs7
 YP3p0A7FiZETB8i15AMxPOC2vfkF0f9AKKBfhSAvef1eaqAppQI1XRJZGXD5W4VWvAZUacPh6
 hhMbtfkZlOJBYEoEu9D584Kl4D
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance the EXCP_DUMP() macro to print out the failing program too.
During debugging it's sometimes hard to track down the actual failing
program if you are e.g. building a whole debian package.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/cpu_loop-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index dc0042e4de..36ff5b14f2 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -27,9 +27,11 @@
 do {                                                                    \
     CPUState *cs =3D env_cpu(env);                                       =
 \
     fprintf(stderr, fmt , ## __VA_ARGS__);                              \
+    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
     cpu_dump_state(cs, stderr, 0);                                      \
     if (qemu_log_separate()) {                                          \
         qemu_log(fmt, ## __VA_ARGS__);                                  \
+        qemu_log("Failing executable: %s\n", exec_path);                \
         log_cpu_state(cs, 0);                                           \
     }                                                                   \
 } while (0)
=2D-
2.37.3



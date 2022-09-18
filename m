Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5913D5BBFB2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:56:26 +0200 (CEST)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0Ot-0006gT-DZ
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ev-00071d-Uf
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ep-0007ah-QO
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=oRRfJEPedHy0ArZycxyZNEYilcWidKpRZKOQkRgiKrg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZIUrlmfe+9PCrd6Wx1ZU385Uvu7DWN8wC1H2UCaOxHdLVF3uj0R5uaMMa+ceJVzaw
 G/ohYMsWLRAdTEZfj6aTqlHklm06Xy2nJ3NNyFBOXmbtYpWFo49HBKzceGdLMTYX+O
 JrombeQc4NfeRPpCUn9asF2GT0Mskt1s4tYilaJA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1pMyPj0M2g-0184k5; Sun, 18
 Sep 2022 21:45:57 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 05/12] linux-user/hppa: Use EXCP_DUMP() to show enhanced
 debug info
Date: Sun, 18 Sep 2022 21:45:48 +0200
Message-Id: <20220918194555.83535-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yAWQjvXUH7yhPGt2iH1gKGXNe+t829gIoCxZMd7rkr2ApghgxVb
 QnFHH+gH48UoPNLOAtbUj22Z0lHNB7zb/W3OonpA9jqyj7Bog4z2xjoB95cw2Axoftitqol
 Ibfbp/a4osraQNcA+C7UNsBRBf7KTvyisClxKyXp0j5k0D8UcE4AHUt6EIWOF6JH+MUcg5J
 f+g0LRzwEr3qdZBblH+ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/YhtBFFxXXw=:nzR3aCQRsl1mmeZAZ0yig1
 KGNLJPdcP6SAgfxt8m4FuUdZT0PFWa91lAtzyV6qAZNhYNlXYB7IJuNgIyLevH0zukQJDDNxk
 YkWMEj2xBfQWrSEyYUZtktJc/S4xFl2Yfg2rPGL5yIPguaxwilX1L0XbT3babH5OLQ0yWb3fb
 u/3zgApnalqUUjEkrbV2toqDDFChW/GWDT3PIrzkS/avoYQKdUfm52euyrcXZQ5OEX52CP6tw
 Emzys+TfNzxpzB0pq7pgf3gpzdBFjSJKabGVOHvp+Tdo0ADPib6dy0L5RiOVZapNEzA6TQifn
 dyP8TKmC9Ng4SSzVUAypR0hLxUzqDxxwrRD9t/OIR1vvZ2enwqnv7KbMODwyB5JpFko9M0Hu6
 sZSNEjnUiGs7AzUR23zSJePq+ccJuDi5R87zYQZ2/e7O/GmMoUBdZrWUF+IkLkwMZ1VIUAFZd
 AjrTZIf5NsI+HNvkmKTjlsJus5n4sI+fgwX+N3Sb9EKPmIjRM1JBBos6DvTK6z1PZglC4l09R
 jpz+g4JeBva7pPlDX1SNtiHX96/3t+JHOUUsUpVvigOVpJstyH5qnu8AB1SmEUtptVDIw8TKl
 IW5yUeu6bcRVtP/xwwRUny7zAUx5KBLLbwUohQhgdPam/3aBG/lyWN2qsudc+S89B1Fmwgrfm
 nITkV/kpN0V8s9n8674tDV0ofNZoB1VnN9EKa1LjySzIeNPmP+iaC528AM8fcdRC9pMMPWLBZ
 PdrKteljqGvsbo1FydekUmJbPH0+lCT6nqZpvFQX5zT0gLZfCGMhD6WxIdYUUCiGHR/m3tGCV
 NJrDAdwqw1459Nmb0LXCEgC2/e8UzW5xHi7Gr92/kWSQWyKYsES4wlNfMSfRyarVmdHUN6Y83
 luyOSDi1hW3Zc0KCbPwSsvJes0ANskGClVKH/eVyh7QcS8VGhnuY+mN8nVZpAvzz3nV2Z17lB
 Ec9IpJ+LqilykdxcXDSLPTWkGZBUpp0tEqKHOXk7e+Gt4BaRysTagIljkmK+ypDIS7H8lSsxt
 PPBNIHGuM8HImvp9n7Oh2KtnnjjAdTOxQg9N6JfeBdztUZ89SAhHKSxCLpSplj8EIufGALcu/
 5sDQzR8Ea79di6+HJeaUmQhDlz05+CjJOtahdKKAaesY2ChyU84skaHpz/mNGyxfz4wEJ9zaW
 S1rbUKk5JeYQSS887SXlg52M/T
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Enhance the hppa linux-user cpu_loop() to show more debugging info
on hard errors.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/hppa/cpu_loop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 64263c3dc4..1ef3b46191 100644
=2D-- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -147,12 +147,15 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq=
_f);
             break;
         case EXCP_ILL:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f=
);
             break;
         case EXCP_PRIV_OPR:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f=
);
             break;
         case EXCP_PRIV_REG:
+            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", t=
rapnr);
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f=
);
             break;
         case EXCP_OVERFLOW:
@@ -171,7 +174,8 @@ void cpu_loop(CPUHPPAState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            g_assert_not_reached();
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting=
\n", trapnr);
+            abort();
         }
         process_pending_signals(env);
     }
=2D-
2.37.3



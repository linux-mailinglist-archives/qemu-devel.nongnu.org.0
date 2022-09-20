Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79925BF0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:57:43 +0200 (CEST)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamBS-0006zA-Ta
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6L-00049c-0V
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:09 -0400
Received: from mout.gmx.net ([212.227.17.20]:57149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6F-0003IC-Qk
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695114;
 bh=oRRfJEPedHy0ArZycxyZNEYilcWidKpRZKOQkRgiKrg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ROjgJsTAPJCz9rRMVfQZvMgKl15kqBHOdTjhUM5pEP75VM5sks+/wlh0iO6XkaFef
 1mznmDYs8JSR/G+idTQRqoNTD5gdfd3aJNhiF/hyACc6uuH78+tXEaMFDA+fmRuEaq
 5K69bem7pCpdrXJC9cqOJ5sdphJMrYHvsc5JFOIA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1p68FQ3kw9-00nvzU; Tue, 20
 Sep 2022 19:31:53 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 05/12] linux-user/hppa: Use EXCP_DUMP() to show enhanced debug
 info
Date: Tue, 20 Sep 2022 19:31:45 +0200
Message-Id: <20220920173152.199359-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7jsej/kcpjCxY4jqRcQv521jZyxC9zNhT0n9KqRoHUYNbraMF8C
 JztzDb4ef0U6ade0aWMTF4Dfaq9mu6xPxgpTn5KoWyB9yUhZxw/kw8RJj700gF1CPquog+6
 zrxlkU+PmKfTuSJOCq0fMVidb1pYXGgM7mXSnCP/eD6nE1sgv+9+yABvj0RNgcLhZUiHCIc
 OJ2w6ONDQZbm9y+dmULuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4BiD1RUmvi8=:bnqbensPicaKEVEPmW08Wx
 4AEas0gybDsQF3IPc9n063+sfU/yHzJgOcx6d5CaN5WIkVLs0h8GWJjTsS85YBsYc8HdFz/QX
 4FgP9NtRcR/azJuO+fRZqT5RCnBlwC1yIGOJZPrC7s6/fa1vDefYtmUvIPi2ERy9C8PpQ6Mk/
 vWwb+aa9wmSqtIg9fES/w/JnbSXW1C7Tblf4+PRLamnnbIUeVDeTf8Tn9kufdU6R3qV6H2rzH
 gs/nERO+0vfnOrc3NQxQEHq/jlZnpBYoMgYFytV/SYQNknUPx7drUnz4B9fg2kgKtEflvDec+
 jU+zsyUP5A5IQhwX5f/Ol0txSZmpjyPrEoGrHgkPP/plk29o1VHVlEa1aw+STSgn9MiRlT70D
 CF+6r9aN4ROG5jUtOyXgag0T2Ws2Obav9p4yhfoi2YTA202gMDN3dZJNgJh5oplbAcD4tHgrl
 KpgYOE7yQk7PYewRlvomVVSUewzoqtf5OZHlPTEF752MRPxpJ3EzJeNH7J0B9RyfmZqAJFweg
 JqPE5S9J08PW1B1DFDmKbMEfLGHSUPeilW4p2RjIpL2x3D4MAsKFc7tAIY4PUweBHkLL3i6Ka
 kfqfiznI3DItN1aHcejvjU804NEVtWKAM0UdByQXAcZtTQNkBE4RiLDvDRo8ABzQbOfKGSc3r
 AbPu0B9/mE+WeZxrpuciy0xxMYnmdwaBhJVtf5QhFcRQWsKooOV/bJx+rS2XoId303mXEKJUO
 Qmllkhwm7QWw8fWWmuFqdOSVmyBYvvB5ZLiCEx7I6E2ysKuogJVHJFLvsF8EwdssmccStuK8P
 H5Oc6CsV+VaQPd6027s3mAxvI0SZfFvsGNh5ulp7OqAjYGVf6sLFzPttYxI9Z/O50iJhty+gx
 UE+pKEEh0dEazfSqlOTlgyR3KwvjdVX3aOs1SZiFYM3+akXxhu1VABisU+JQ5Rp/VzwxksW7v
 GSUmJNNOXY7alEER5qxEIueEVqnUuwgM0eSJGwujuvybf24U6NoGwI9AdTuzkdWgNKNviN2Gf
 t02EFV5A/Iuofmqe6mmuSSa+0/9hzK8869DDkZQKw5MPIB4qKc0hD+gjO5ipSC/URobUYG4Cw
 8pv7D1ZaA3ybHX9iIyxMAO7/RsBmalZZmbpu2DG1TKQuRf+Cp5b8XPWWo4EfqclXZMgNogFTH
 eRKeu510FGlKV3W647cPFrszAP
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



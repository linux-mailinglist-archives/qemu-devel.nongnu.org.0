Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF765A2A0A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:52:45 +0200 (CEST)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRahQ-0003Fx-JD
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAn-0000c1-AY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
Received: from mout.gmx.net ([212.227.15.18]:41217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00054z-7d
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=tsWpoxJDqEFn2aJCQOHCSQoZo/RrIQWl5fmyVXL9kNY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FW7hkPfe+fIUrbMhM9/zedRvHt2rxLqeh1KPdOxU0CVmyQrb1SijSvxvIsIIN7vsF
 HvyyeWGeAuTQwK+lupp2DhlBlXYlgbUAgPlAzUof3Cnagck4lIc6j8oTkqpPjRFCE7
 EPlCvr6MI3QtK29J+7fv9q2GEYujZc/0onBe2OZI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1pKMeU3e9Y-00xbmU; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 06/13] linux-user/hppa: Use EXCP_DUMP() to show enhanced debug
 info
Date: Fri, 26 Aug 2022 16:18:46 +0200
Message-Id: <20220826141853.419564-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bHp3KDukoq63jdGetbZKUcdtiOwY2gXydhsTV2dUEBgtSS+Gcqy
 XKxCpeVI6qW4777+U9BV+Bp6BoQqDiqsf0ACqcjYuSjHNCJJrX9fcYH8DQGqPw9kQXs9QJD
 nT37UFmM5OJDmohojj1Jaz/OFaVE2AevxRfp3u75ibLPBmHbsM4nwS//Ol5n33nDLBHQbZc
 AAlR2J1OKJUU64vi0KzNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9kqfFQ+WLrw=:oYIHZLhw8Jm62qrxKLvhdW
 qtTkytZHAwyJ4jnBK1PrdXKKDvUXsE5xG0LHbdaGpoRkQ7cgRWQIMVeNM1buyY/7w0Ma930cb
 b5OM7QIvxyAI9ZU2obY/q3RaM6AN5+pKJHjJzITQswUaDjTIfFPsSBFFtICBJoGg0VJLaJGzh
 KEkJMopASkM7mYKziKT8C0kCA1cCH43J+s3i3O3Ho2qsMpFtrkp94GFZigDInpc07SRfDxwLe
 HXrRWcosEKBHa83GVA3zvgKvbUWf49B82XcqwTK8vJVC+Z+KTpWysOk26Zed3jc7YnFXaXPm7
 JrdM6ku0tgFcx9+b6mS+hP/Dr7o/KAKNh7DqqEhoYI+ZvW8gz/79mtY3q0At4JZfYiP+0xTlb
 EqM1P+pA3Ta/VgWEulDkPJ2KgrlyktmJMkhKcBfga1OzX5V4oQQjCUeMgMEZKqc95zgiVhwzw
 fUwSZbpQLdamSxidqQ0jnrvsxZpAxvS7gy3sC6UUw1HBcYq75n/U8E6rw60ijNNUpG8Sl2/Qv
 d5xV3PZxmdM2f3t6dwm0MwnDnyRv864bO7zkXQfwXWksNbvgCvfrN7H6KlFrJqxFW2lMqw35c
 WzCuKP39etTtdPd3omnuOsJcxIU2z4TBLu4/uQsNEq6DGduuWwMbs9fOpvkP7buG2cFEgKWhy
 N59TlF5z2DIyB+seOF1dMtej6hCl9Polkz5bwT9bdFrFjWADGrQNR0XLyCd6uVNAmp7o9J8RE
 P9VYOwlJzzXbMLFfBE+9QsXkC0oPQPZpqWWVbRFIxv//4p1Je96Tdac35Xy222xoXpOCnmBKy
 K6fXNvVVRgZsoPH9fJAqIp3YMO12FSehCD4kuepoCluGC4dB41fahO8jui7ECL65sEqcxmHK+
 L/Su8pt1uabE9CToOh3cNxb7AOcWB/UHz6f4kiKv3VIe8r+AolRw5S7gDCjGUxDQahdfov8A+
 nz0lvLHuNn7XL50w8INJhzFiyu37mC3W9W1sm3OQwEG3PY8Fm9WwQJHSvyT3r3cd8RNaAV3cS
 uW6NIEXRMSxGGbBBnmG8S5dYO776oBYec23VnJjPyatdAJ14ogjJRkwzkVbBX1IppMRbVk/9A
 xwDmJKWy6z4CxrRzzIWx6EpRmigNUXGeo2EEe3wspT/4ZxX3BWqmWVz2A==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
2.37.1



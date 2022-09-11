Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427985B508C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:21:46 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRaR-00083t-7p
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002RP-RL
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
Received: from mout.gmx.net ([212.227.15.19]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXR-0002lM-Kq
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=gOzGCQ60hMjauReMswDRPOey73euwoUtnmC0Mkn8oTk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EXGOT3XelEsieeqBQOrgsoJ9Ypkz19i8ywQNOCM2Gtc4QdBGZs8kGKTaswQYX9qv2
 9zgTZazea5Tf5fe9G/U9BO9zcTKej9yYjLyUJMzaZoc8b5C/zWwQi/tmga3cbl45qT
 Qc+JAWA3vgBCgKhtr/ZpOcmomiVavawEbidwupUA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1pCWZj0V4v-00ljOK; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/12] linux-user/hppa: Use EXCP_DUMP() to show enhanced
 debug info
Date: Sun, 11 Sep 2022 20:18:23 +0200
Message-Id: <20220911181830.15851-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mnifReIl8FMW9AgPGN1s4xEUXI/l+1UvzIF5bIRvY0okmHrPF2r
 66lU4ONOixqtKBJzaJ7DmgWXPOwiR/1suTCDqQY+7VzQ3uH9pLfRJGfU2vFLVE3bAISSG3z
 0grXg+fDXtQWrejYBRw3J6s3vDLRlJgMKFibrVMMJlhDrg7Hfd5JR6ah3yrVUPCiona8dih
 F+lyQZi7mtzLMkqcVOllg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1UizG2KzTQA=:Pqd0bfgAFjP9Y0bNDUlays
 Qz/SB7xKW+Npzion1ufWb8eYdPTjG9PXztcbIwzXylxAI8MZNSvzwuGuW7hU+9IgSNo2gNzaY
 QoWVTHG2mqSyVYDphE/4E1ewePMxLwW/yo2BfelI0TN510JkMSUiAclrxEjMPmbpWuz79tzWi
 /UncyXLDYIcKf7OgylMvAvHQPCQ2h+7DJecIjv5M2cU4XLYLiSvPeLew+o5n2FGOfH+3qw+0i
 oXUoqKczvZfqYF0BckndvuG5g0AQWNXKocSFfVbtWET6YbTEwnr3PLARdey49o5V7EXEXzURA
 esh0HHl+l3QEz2hcQ4KO1oFjXRpbWYvd5nseH4gmoza+u9ZAiFXCF9T85cuFPzJOrTMu9N7jX
 wDV8oH45oOey5AlwH0+kJBQj9szWyYxnHWneFdI/joSkWJfzvG5NCtAekrpqSfNkJEjpglYg0
 BRJuREaWJqLW7qOHSCypGv8ObSyCPXQLCqdfgnWpFM0GzasDRUwwgn62fUqfOFaBbQyoxrWns
 RBpM0LoKM2hrA1Yknk4Smx3o1atWl4VJCeaKk+w1/WlqKAjlmFGMwmnBpj8s/jMh38nNaJwAB
 FNDIRADGeabdldkYw5iP/b3k/kgKg5RQcWmIxIfJH8oP4xWnMVG3kzsh1iHTGfdADrN4vy35e
 1L+cp1/KBMzLUncGT9hFiTrEndKc5a6TOwv5T97pzsBTuqa/Da8vCjS1ULEwR0jMM5MVE3EDp
 1oRjPi9Gb00H4tCQ+u/MRQVSAEjAmkconR0L49WeMXy0ASMDAN4e6wrlEnb/UFTVSqqjTRjf4
 Yo8beU2Kqp1qsURxxQANkZbg9fqKaTzlOMwRyrvdkUY00N/EDybcwMXdEuMVHg6h01tli0OYl
 2zr/AaHQkk3tOs9M+Xgd83DvepJ4HCNPTnrKdox0N4uS1MmjAyyRlWGQEC6p+cpqFTDxPpj18
 OKE6FlgU8GKS2PHSPW5nWOr7KgzWOE7b9kx0Qn9fIZZQJ4P2TsDal+EDYeRHtun/fPAju0uFH
 MlZM8pJFyWjGBWhi+cvFDPtTt4tlth1pbqDF5IDs4Bd//iVHZNTbS4n9Qw/xjqe+VHvVNYq4V
 rYHXeyNsCuiKSd+wNWp9M6ZjVtsB/3Y9cCD+77TfoTLyOyCkL/eTFdBw5vrDtRsMT1Pd2LG7K
 4cPRa4EhAYOg8ermbWDpisyONf
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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
2.37.2



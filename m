Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93B67B3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKgHz-00033R-8o; Wed, 25 Jan 2023 08:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgHx-00032n-3Q
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:58:09 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pKgHu-00023z-PW
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674655085; bh=0DTPqiouwkgZb3DOr4QhBfwTo7jvCTPyvBLG+ds2xo8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NQ14QWhn7g/hXcFVWh1asRrQURgvPUVYhZ8x4nJo0bukdOXpa2pGF+KjOttA+hB9X
 Kz2ExZAGYhSaBlFVXfIHr5am+ByPM6+HNxCY38Z2Hq1+/zAY4/HiOzEvj39lZhqLsX
 xIj7x6u5+Jvxn/CnaxmiOupUVkGVLM3L9PuLpRzuoO7Csf0ey2n9jGoIlxLis8zJ0n
 KRs5Q3tfVTXj4UXf5g+bC6qFdn8KprT2cuIkBzNuHvPfC+3Z6Mbvga9EWhpnF5x7yZ
 QSeJW4l/be36raA87MTBfbHanbE7y+XtjqwoXMFhjPOtLJUDtyeeCZWWKb29lZZ0Rf
 A2SGg1lNCW3ew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.173.109]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MirjY-1oiIfY3hnY-00exSp; Wed, 25
 Jan 2023 14:58:04 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/2] linux-user: Show 4th argument of rt_sigprocmask() in
 strace
Date: Wed, 25 Jan 2023 14:57:49 +0100
Message-Id: <20230125135749.4594-2-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125135749.4594-1-deller@gmx.de>
References: <20230125135749.4594-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PwrtwJNGrODDDQ7FUYirqezTcviydq0LNr7nr77x6wbZHAwrlC5
 3wjIRJz83ZP6ELSdmBN0xFIPJybENmYB9n+g9D+x4Qoo7Kg0x0QF1i0AqaFG1xM3iM/JD/7
 2kDSVt7PU7141zTr45gWjs50+Y3I6dLjegQnmJ/LGKUzWM1k7SY9ertvJTzh3QtxoUxX9O3
 HRSvdTqLSGZsHF+nWM8jA==
UI-OutboundReport: notjunk:1;M01:P0:Z4YwYJBfXew=;LNW400RvWmqX495k6x2nL2gBK6r
 no6Pibex3DxzK2/k+Lz3jwWvgV6VgKmgNfOr2eQxam4V+hD5YELoXL5UrWUfXHHaLbF3fwMtR
 bRZ7PKjQQLFGVFenhsy7XZ1bpdjC/49JbopxJcXuChQTBplIKA0KFmjmetX8Kv4m6x+NRmRZz
 Q/Fin9x6lgHDavjGBZs5OdADaymLUq3RNlzL1/BfWeeH/Sd52Cdqrm0c/5gwdOcNrc/N2hFns
 s769BmIbEZzAnjzDoUCTDPSI49ZdTh2eP091Yk7dWTGMVrt4uLc0CyMcUbIJZOthxWMLOp4Zt
 OUSTd+JQXFGJgQIzSfeE7Uc//xwmQoz6G/48LpWN1JQDlDJFZvjwORWraht8HS45JxminZPmi
 sAvtkojIGqpEEsUq3vbtBoFHU7qzAnhpzwTomNJ1zPqPCsQoHDxsncZdigmrcpzexr6t+P0NU
 15olj5XIPAKOyNC0WXvjyuSpe6UuspgKFi3h3/syhGeRuugnvz8QEo3GhCpsDCmvjMh20kKuW
 jUthMeB6H2E3zpS7EYPCF4TbDuwN7r/Pb1iQBctKEL2F+lDAltaT4yx6+6V3mbnM0D5Gq1g5Z
 vqkQuAgUnID07UbxiO4MhR/v8iaceKtSfSZ9yfW1ECc955G8rspSCKlOJ/LBwnSy9SFe4B6Fd
 sY7IMTjnSiaWPP0uyz1d5PHEp4+RbRMw16x/tLja/eLMgXuDumzlNEL2YfIgn3cgozGUsdD2c
 QR1eag7UrnYiXvhjYQkZxrEgqmBXVYHIuqNvR3otuwvX/Mki1uOZDV5ooZ46wTCB49XLd+Pdw
 xkl0eN6PdWhWQu+dS2CsOFplfRQSNDFFi0rGj+oYizQwI+B3VV+Y7TeVOfjexFETD6GFVXd5c
 R4lnTRqTGQ7XKUVl9sG6Rde6IEgiu8ycBuELtsoC82MSycaJXdmas6eclX/0vbk75uTOa90p6
 4pTy8iXcxLGJAcsIwXJ5LRZTe+c=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add output for the missing 4th parameter (size_t sigsetsize).

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 3157e4b420..e3aa994678 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3146,7 +3146,8 @@ print_rt_sigprocmask(CPUArchState *cpu_env, const st=
ruct syscallname *name,
     }
     qemu_log("%s,", how);
     print_pointer(arg1, 0);
-    print_pointer(arg2, 1);
+    print_pointer(arg2, 0);
+    print_raw_param("%d", arg3, 1);
     print_syscall_epilogue(name);
 }
 #endif
=2D-
2.38.1



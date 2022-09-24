Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE25E8BED
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:53:32 +0200 (CEST)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3it-0002As-Fn
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3at-0004Lh-Ng
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qx-2A
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019905;
 bh=iBQTvRWn/tCi0bI0VQceSHERcxvx6dX6scs3iCTZovE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YhR/yQ/zu5oKFc9t9CYtioejfU5cQYmXcjz0MLAUnYHpnh1/8eRM4yDMEOmGN4Rff
 BRSPDlPZDzYlt61EqV2zPvRuPfSjikSinCP9nD5RwQgP2CYVTNlNE3enp57hRjJ5Mq
 kfsqjvVqk60sqqLgwCaIqNyQkalGi4OaTS0XLkh0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1ootco0FDH-00VhrR; Sat, 24
 Sep 2022 13:45:05 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 6/7] linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN in
 mprotect()
Date: Sat, 24 Sep 2022 13:45:00 +0200
Message-Id: <20220924114501.21767-7-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eiwKm/IQDzRHmIlm4FfbWTu4y8kDkpq5MA84r66KZ1Pc3xdBf1Y
 xVhpEcP8H7WQHBfJPCTriQJ6ruGiS1OXeRxXp2ZcAIPBhG8RUAWAWg1yh8dn1kpbiNkh2my
 4vZ3HvVC3CPLDPV95hxvBGqYcgKFTwhzr7mN4+FzYXgfo6KLLdOMTN7yDhtniRePa1wudJI
 6K8bBFZqglT5LhTGPXwQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/aH2kct9kuc=:HCNiVWbBXvUmdGWS4kRb1U
 4hATUkC5THIJ5AmPvevnA6UZDuG/b3YmKoE+jaMompbfl2wbu73vN7m91u42wMl/PB865d7p1
 MijirJa2AFi8ZvWx5fKn7lpzHyx0zJr+LX/UHhiEEEqZen7lb+pEpIfMyt6+J+ZHgbSLNZTLH
 6qnjH5ZDYTRFk2vhlhrrXsKwXp3lh/T9gqVjqvwhOufweHXo2xAK1TGJRS1a3u11m/I/AcvIv
 SPngzItg1ZtlcJqfyJ2B55f5TCa4hWwvgPwrECVbQjnMoCUgjICB798YouVJj97swrGGPFmGJ
 cFxey7T6o2kpfuyRGp1Nw1Gyp92ZNNib1d1rY9Kdqhemq0pBfCOOUahgrQVKRd4VHYhfx/lrZ
 dDF3Ttnh1ckNOfINJ36XQLEunoXY/qLYGcUfEVYCkz/WGkLM1UyqeFPce/zVr48u5beVfXvzY
 E8mPgdWondjUhJe01hMsmuWfAT44o8L7lc/t85SCvcqZsLl/Y0r2K6auDj38ppu1eJCbB/WNa
 C3N1YD6mb9RCj/f0Jv+K+H0zqZKHI1ZpX5xzSM55WVu2v4h2FfpvPJRDDZM6UEL9Wtx48AgVL
 Tdfk5vtT3luQPSxFVrLQen/8t5ivbsYaZo6slHYMAd2XtegmhFXh6xEoq9C7XL41LTQ+Yetdu
 k237Moe9SUCFn8O4zjoiJtaDbEClQDhFk2Aq3jL2BZ9QyCXhG5CfLf44AySrn/L64ZBzBHnUh
 6VwJo7KtlbjiwgJk27ZU9zeEyZ8H1Q/Zzfew1uRCGwEyFCV9lcyEkBnyYTPBDUUZxRzmUgz6/
 bsB9pTqipT+lq2ovVNIdVxGRAqkfbKI07seQ53t9uIl2+9jis+dnvKzIXkZM7HNfNEn9GTvfu
 /GYlC3vbCg4vQszi9UIH4GSY975BMLlgQtueuP28D2COj10pIhO3ESNLIwtviiMFk9TuRNntI
 vC/mSTHF5ZDI93qBxYA3jh39whPGPruhhzlYPtyhjn8ltfjrpHb0jG6vHH9EvcQgmupMBA/ON
 BzHkgR48mQsW8hMA3WF43GDL7B0Yz1eiDNLtsDgOSNZ1bPWXsX+XdHdqLfGXlmYqn7YA3bTpe
 4HmBr0U2uEdHF7yH9JDBDUsZRo9UUX8lpHLs6AGe4Nmc+mOF61ogWbCTpm40pog9vZhUcSVzq
 1bK+60hiyBgnwJ12E7pc0VaB5X
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

The hppa platform uses an upwards-growing stack and required in Linux
kernels < 5.18 an executable stack for signal processing.  For that some
executables and libraries are marked to have an executable stack, for
which glibc uses the mprotect() syscall to mark the stack like this:
 mprotect(xfa000000,4096,PROT_EXEC|PROT_READ|PROT_WRITE|PROT_GROWSUP).

Currently qemu will return -TARGET_EINVAL for this syscall because of the
checks in validate_prot_to_pageflags(), which doesn't allow the
PROT_GROWSUP or PROT_GROWSDOWN flags and thus triggers this error in the
guest:
 error while loading shared libraries: libc.so.6: cannot enable executable=
 stack as shared object requires: Invalid argument

Allow mprotect() to handle both flags and thus fix the guest.
The glibc tst-execstack testcase can be used to reproduce the issue.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index dba6823668..b7478ad0fa 100644
=2D-- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -105,6 +105,8 @@ static int validate_prot_to_pageflags(int *host_prot, =
int prot)
             page_flags |=3D PAGE_MTE;
         }
     }
+#elif TARGET_HPPA
+    valid |=3D PROT_GROWSDOWN | PROT_GROWSUP;
 #endif

     return prot & ~valid ? 0 : page_flags;
=2D-
2.37.3



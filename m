Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D432577731
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 18:10:17 +0200 (CEST)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oD6qV-0006Xx-SN
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 12:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD6oX-0005Ak-D5
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:08:14 -0400
Received: from mout.gmx.net ([212.227.17.22]:57345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD6oV-0001eT-Ha
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658074088;
 bh=oDASAazxa/hMyZrtzdn9IQj1R8avtPpMZC2TFGZPpeo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=YWh3sa7qzbpFAI2cETe6r0STttc62ZKnV0hi7GLbcGsvTRxeSkDHG1+gAUJBDCtHp
 pk7p/msD1vn0XVSOVps96+QyIbAMBrpdqf5ys/wkutLtJIn27mWxMKXRi3R0Zvrek3
 /LSHd7tOhDoiiApZRUCAolRcoyXxXlCtQG1Djwcw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.150.104]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1o3FQS0shY-00RcIn; Sun, 17
 Jul 2022 18:08:08 +0200
Date: Sun, 17 Jul 2022 18:08:06 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS,
 SH4 and SPARC
Message-ID: <YtQzMUuBOfBiMNlY@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:TTnwX4xUcWPm50uKzrFtu7Pjw3xo/NB5GgbrLEBs/hjUR8KQhYe
 LMDcuxuXbwZbxxGGkrFMUc7kxcn2rFORsKZRXiKAAAc7IhLpgxv6EPLJCATr0WxRkghWhid
 5NSxl9Ac4JZzLR+HciltRgz6kST5kBcTk6lJFi86ISmHhzv3/3IfIwfRq9h/x37JEFoimod
 vFGPlMGVAIBno0sUPg/5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:346xW7mhkjE=:WUABVdxEw3qoXXk/zzewYs
 OjovjdaMNduz/pm/xCMNTqU1g1YHArBJdLdr8ipq/CNr1cDABjVgMH5r72y8ZCvAr2KDXeWq1
 SadsjlOw9qmA2PXW0H2qDg56qJ21hYIqQyagyTaJE0kI20cekpK9/CbOTxbI3PcmRgvCnF21w
 rPfIb8jcd1ih8wjqqloyRKAQKAfddAuskMbCkCzGS9dnZkC/heGB2v7IFSoPrS+ZnDCr2D9Db
 d29DB1mBVibpGQfzHLjyEehGVBg5RDHblYVOCVy6f/pQdvJZc9A/SuFqeAii7W+NQszP6KyoW
 IOSF7qUJ7tZzZLDSj6tvJxLyUlBbLvDuSoD/o6er69GvLRCVpYA10SotcCIsa3Qmculfp07VV
 62E7rqzxK79RmyYvpKuF7NLuM9mmFkI9hoXX+2uz+sgU5aus2ryp7k019hsTr0pxSx5bs/lhO
 rIEw/67TfolaKW6Vqc0rh7pZTUZTolMlHCY1iihwjs1JAs2UCvd2pR1TjRtlvGPttD04tx3HA
 n2QlzNhG0zercNLU4WBPKs+7Xvsj7Kk79AWmAjyeT2Za78a/POFxdrjhuPtm00w6IfgWjWZha
 4AcLS6UMfm4/qHVxzU64s4u6ZewxH+VzdJ761S1BgM9hVKHG6xjo7wYbUiNz0czRE3mhYoLfr
 H33lEnQXLbyB2oxERWdO6/kOrLIjStUH8tGu+K+BSqmS1FWDTJaOzzs2mpeoxc2G2ewleBp2d
 +1PWk5PhlGWQObTqW/jqaE1hyHccvdiTljtfqUhVeEmkWdLKJfz80QVMidlZZWb4gkERvEttV
 V9dp7idXkJBajpWnaNa3ftwbDRWsSbtMTdr6H3LlJ+MOFgEISqjlPOjZlX1DVhSM1DX1DChnV
 ngl8AvjyjGnHJimiCPgPcr1tOhegGLO0bCfC+hiOsH+3/kqtBVrC9aYsGl1prPY46WUXKUsLr
 SShzkjhamNExzphb/Krt7r5lqstdou/1pCIvdEZRiXG/b1HO00srwhcAbPuRNAuj0N0UVa8cy
 m5+GM3G4ErQMl5ift2CZ6awW6WM04E5L2yW+fgj2Tp84uVwwuKcYCg0LOX8j4EdC4jLW7BKvM
 a9P93KAHOyre3hvfgwEo+6UBjPU2DdI3btLvL4NnzYmKhyhMMgn4gBO/A==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

In 2010, the commit b41a66edd0c added a thrird parameter "is_pipe2" to the
internal do_pipe() function, but missed to actually use this parameter to
decide if the pipe() or pipe2() syscall should be used.
Instead it just continued to check the flags parameter and used pipe2()
unconditionally if flags is non-zero.

This change should make a difference for the ALPHA, MIPS, SH4 and SPARC
targets if the emulated code calls pipe2() with a flags value of 0.

Fixes: fb41a66edd0c ("alpha-linux-user: Fix pipe return mechanism.")
Cc: Richard Henderson <rth@twiddle.net>
Cc: Aurelien Jarno <aurelien@aurel32.net>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4..1e6e814871 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1600,7 +1600,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_u=
long pipedes,
 {
     int host_pipe[2];
     abi_long ret;
-    ret =3D flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
+    ret =3D is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);

     if (is_error(ret))
         return get_errno(ret);


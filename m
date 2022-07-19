Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA057A421
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:23:10 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDq04-0004jN-M9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDpxr-0000T0-0D
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:20:51 -0400
Received: from mout.gmx.net ([212.227.15.18]:51109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oDpxo-0004eK-UR
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658247644;
 bh=yWeGNUsme9QtNtOs2PC96LsvCqKBgtq0MiBKSHU8ZZE=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=KPHWmFR93yMJvkJRZio2v2ouR8BGS4HhjS3yTtSRGagQt4xjerIEuGNP5EUYJXzep
 pNZJ6yj3jkQNOnqbka0wZ2fsBECMHBeuYpZBeD06jVpl749uSNziMrR3Eh53DrWHbq
 f2NpOOET9RynvZGsFZwsfqjGK7VHxOK4kLom/LKA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.145.26]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1o4jHD13ch-00RIDo; Tue, 19
 Jul 2022 18:20:44 +0200
Date: Tue, 19 Jul 2022 18:20:42 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] linux-user: Unconditionally use pipe2() syscall
Message-ID: <YtbZ2ojisTnzxN9Y@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:aR0YP7UziQ1Z/I4Zz04gHAfPH5gIXEFx71Tg6b2Mfm2mVVYrLjW
 Z47TplTw0mQYAMOP0eShKfDEIIFw4NYp6t7n9j9lHbfu+HgDrTrRi1BfwAhqRyenGX/7DMd
 T/G7Ccj2gbk7q3D+sRdX5DYNsLs96fBvQa1QEF5B+Zukwk9wOvenxhE1BX6yDy3oQxKaIV8
 X7hTQPmpK8mwUQFpeszxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6beG+m0bws=:l1IDCuI80aGStxJhNQqMxH
 oDTs87ZHzUHuGIBIgriF/jtywKgzYJS+/qCGmFroXkodMnC7hjiC/1JREGCCJqM/RYRkQS4BE
 cmr4XF/f7S6PAWGh/N6bmSF7WJNwHTVzGiYY1ppTQc7fpWo2MAsuWz2dlCq694KF0F3i4ZWqH
 zu8JbZoTgtNaB3So/ggwJJArlC0XKWlY+liVfRbmfbmj9Tm6j6XAsz1l3cD1sGOxPOEpeP1ro
 hA6eN2OtJqsFMBtvjvH+qZrrvR4/NFhkQC0zFPE7Qhs2/xjWtrX7NlOu9O4DBYeLFwuqNRtAO
 m/EbmLT8o2WKX2dI02kuHUyUt/iplVNEBFhX17olaQgf5x+wUlmucM2kX7IKtMjCI4MsMP/NR
 WOXdsqUq+EXiNoMgrYAbDgA3rCXCSXwxRzXs07hjk9zNG01zybi/TWW4ctZBaCfj/xEE3g5JO
 507z19itLGv1fS0mf6QhVPbrTjF9Gh6jsAZIUJAUmX9jfAgwReA6kCJ4C5hHRq8rFjayxKzZv
 AYQ1EoeoSs/JJ34mZ1ZvLIMt0UfgmDeNQfKY0saXcuBPe8fge9G72oPyCQxS5md3iO/tNO6A5
 i1FWjpruNTcf0xtMJ8hb0nq31TCq+Ot1iU0+K26LFpG95p2wsGOnFc+JCxBdwg4SDBx6ufRR+
 gXMudlLzfwKhc0EDH+O7AUMlf7NnrjNyGSPv4ErzXgiBkSuOce0G92F0NuTOUUcgqPbTxxYHq
 auPNmhTWQpaBmE6uHOlXrdUKq1Sy0oQkST1HGIoQ8MD0hsRXBmHEjJyL3aZ3oYIMjJjiAc7Dg
 xNRB01q2zwqFePCs/D3XcXoI1xEbHwQ/6m1RBg9hfy3PsncdGJ0RvfpvohmlIv1zZAzUkG1u6
 aqD5SMC3HXu7Vp1K7MEAbYSDlXi7z7X/vwp5B2PDjMF69HCQbVkMik1rFDPbdiJVE7OoLA8g/
 O3U7CX7oLNV8WPPRuL4xccVLvexZ3ZGA9BlifMNCBWJscdVT6XeOUGJQU7cKfR3yI9sW2BEYL
 ztbtvdsLJGg02r50qtDAZWp411rC1BOM5NN1Oj4V8FvCIcPl8AO6JJef0OM8obsQuQvckcDAd
 trL/uvXeblil4bPhWSacHP1GSoEHG1Znqihj7skOONygBmnS16NKkydqA==
Content-Transfer-Encoding: quoted-printable
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

The pipe2() syscall is available on all Linux platforms since kernel
2.6.27, so use it unconditionally to emulate pipe() and pipe2().

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
=2D--
Changes in v2:
- added Reviewed-by: from Peter
- new diff against git head
- no functional changes


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4..4f89184d05 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1586,21 +1586,12 @@ static abi_long do_ppoll(abi_long arg1, abi_long a=
rg2, abi_long arg3,
 }
 #endif

-static abi_long do_pipe2(int host_pipe[], int flags)
-{
-#ifdef CONFIG_PIPE2
-    return pipe2(host_pipe, flags);
-#else
-    return -ENOSYS;
-#endif
-}
-
 static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
                         int flags, int is_pipe2)
 {
     int host_pipe[2];
     abi_long ret;
-    ret =3D flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
+    ret =3D pipe2(host_pipe, flags);

     if (is_error(ret))
         return get_errno(ret);
diff --git a/meson.build b/meson.build
index 8a8c415fc1..75aaca8462 100644
=2D-- a/meson.build
+++ b/meson.build
@@ -2026,15 +2026,6 @@ config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.li=
nks(gnu_source_prefix + '''
   #else
   int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh=
, 0); }
   #endif'''))
-config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
-  #include <unistd.h>
-  #include <fcntl.h>
-
-  int main(void)
-  {
-      int pipefd[2];
-      return pipe2(pipefd, O_CLOEXEC);
-  }'''))
 config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix +=
 '''
   #include <sys/mman.h>
   #include <stddef.h>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210E6427A8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:39:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29oY-0008OO-54; Mon, 05 Dec 2022 06:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p29o9-0008Hy-SL
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:38:51 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p29o0-00072V-M3
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670240314; bh=zQp4z/oP5oSCjNRaCmecIy2nFCeo26p5adFmYvc2itQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Kf3zt6ZCq6VJs6NO7Bo1dRKCvAhImH8QzPWPlwTlyVIAtLb5SF7pQazCjnusZoICJ
 KdEARpqaZLWbx5Ln9HVNlZ9a77w2mmgQYolnN2Y0gUNdrECeFYEAKrN9t3FTEbJR0c
 uycHyYSKDziRip9GI6NJkapOQq0qEXSqXzbyTBmOonU2S/San/g11tadIg8brlgmYX
 4kvKzwTwVCizg4qym/gzwxlEMglYVjCEYluFRCcFskQAoQiHuiBz/FlEujKiudYqnu
 Y5BCQ6OWot7MacqrI2Z8PfRzJYeE2blzcf3AcbaCCs1ePh+GKANuJk3itliJokHrTE
 EIXi0FIbJCn/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.161.205]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1ofUku2YTu-00oHRW; Mon, 05
 Dec 2022 12:38:34 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Fix access to /proc/self/exe
Date: Mon,  5 Dec 2022 12:38:25 +0100
Message-Id: <20221205113825.20615-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sXUdf+SaYk9CKbm6X4yp3teVvR5gHz6qi3VI2hkkj6Jhp0cKodp
 VvCY+7H9nXAe6EXrc1kfiJs0CFrLn/f08Lu0lxKk915l3Zth87fqMh93df3gzVG+ueObD4l
 55SdBTFYG0R9iflqZpjf4z74klsEeRpqP8fCftSsMl364XLDY3G2YLjWODd0ypNEVc2+HVw
 qmKfKtAkouH5uoUaF0rEg==
UI-OutboundReport: notjunk:1;M01:P0:unpU4SWChqI=;NwcZ39ReWYka920UX1c1cW4WuzN
 iYmUVgv2Cr3gmc6UK/GzmRryxwXI0vg2Nh0dgaNtc172EBWr77DdQCa1SyJloX4G4BYZ5iAiQ
 IV7R8kGgd8olL2k1SfeOMsZuFSmS95TllQBFiajl3nD6f/WA3LYX0IUid3491Vd3WdHUkIXUU
 3Q/Oi9yzJbR9jUc/TRkBwALFZFsXkDJ4EsDlvIA0aqbId50fLKeyhIVSL3zjBwcnQAHOT57/Y
 omG5+Yq3w6pZFlmTWeqKXw1luu8f86W6vuVohEH1wI7P/nDU7n+lzpnMAgUnZgh50KS8KM+Vo
 vZbPHTjhB4vLEcf6I7oQhXKqbyoLv71mWfbdRwtpBxxnwK1XoAyzqUXBL20nQIULAidYR+q3I
 99guBa7b4Hen6oCwCFLCb9OSVX5QgKe/v3cciw8z/04liPJ1f148P/WSHEDAxOu6DYp/4Kw4R
 AUq7yATgEzFHFG/Y7Qp+MYenEu/Pp+VthYoRK5jMT2aDWqrG3eApbWGO3JU/5DS8kGlOPC5WT
 idUNgayYGfcf7aG0YnaC46RYd5W03tgB8qVKh+Eoky9XJNbDc8qfMTcUQi/E75oHpvVNC1xJi
 QMZTcfTBsZ5e91LMlChonC6IrGf9B2KRZZxNbxHgfu6TdxF/kcsCScq1Kh2AgPGdxowIT6AbK
 HTZfPXBJFuiPuIWlYviNe9hJjKyGup8d/B102P8YO1GMQkgfhR6+s6cwAlRSBnxlpzmNf7HGC
 nUAMM4tgefxB52I5q5tSX9fR324BIIChzrqH4tLI0ZW60kgV91nlxGY2PzRGUOPiLTvRY1wsa
 1tEv8G++76UkmXRKGBUdwnGETLBR94thHqDb9q9KyXFmabxqg84tyKkozPMveA07mQEAMAyif
 i8hk6WC4jF7Cjj0uoET0oq6a+1/a+xdUBWwZTl2uUJ9oHvzwjaLpTfvzErmGBpDFPh7OUOqBT
 fjS7zA==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

When accsssing /proc/self/exe from a userspace program, linux-user tries
to resolve the name via realpath(), which may fail if the process
changed the working directory in the meantime.

An example:
- a userspace program ist started with ./testprogram
- the program runs chdir("/tmp")
- then the program calls readlink("/proc/self/exe")
- linux-user tries to run realpath("./testprogram") which fails
  because ./testprogram isn't in /tmp
- readlink() will return -ENOENT back to the program

Avoid this issue by resolving the full path name of the started process
at startup of linux-user and store it in real_exec_path[]. This then
simplifies the emulation of readlink() and readlinkat() as well, because
they can simply copy the path string to userspace.

I noticed this bug because the testsuite of the debian package "pandoc"
failed on linux-user while it succeeded on real hardware.  The full log
is here:
https://buildd.debian.org/status/fetch.php?pkg=3Dpandoc&arch=3Dhppa&ver=3D=
2.17.1.1-1.1%2Bb1&stamp=3D1670153210&raw=3D0

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/main.c    |  6 ++++++
 linux-user/syscall.c | 34 ++++++++++------------------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index aedd707459..e7e53f7d5e 100644
=2D-- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -64,6 +64,7 @@
 #endif

 char *exec_path;
+char real_exec_path[PATH_MAX];

 int singlestep;
 static const char *argv0;
@@ -744,6 +745,11 @@ int main(int argc, char **argv, char **envp)
         }
     }

+    /* Resolve executable file name to full path name */
+    if (realpath(exec_path, real_exec_path)) {
+        exec_path =3D real_exec_path;
+    }
+
     /*
      * get binfmt_misc flags
      * but only if not already done by parse_args() above
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0468a1bad7..71ae867024 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10011,18 +10011,11 @@ static abi_long do_syscall1(CPUArchState *cpu_en=
v, int num, abi_long arg1,
                 /* Short circuit this for the magic exe check. */
                 ret =3D -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
-                char real[PATH_MAX], *temp;
-                temp =3D realpath(exec_path, real);
-                /* Return value is # of bytes that we wrote to the buffer=
. */
-                if (temp =3D=3D NULL) {
-                    ret =3D get_errno(-1);
-                } else {
-                    /* Don't worry about sign mismatch as earlier mapping
-                     * logic would have thrown a bad address error. */
-                    ret =3D MIN(strlen(real), arg3);
-                    /* We cannot NUL terminate the string. */
-                    memcpy(p2, real, ret);
-                }
+	        /* Don't worry about sign mismatch as earlier mapping
+	         * logic would have thrown a bad address error. */
+                ret =3D MIN(strlen(exec_path), arg3);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret =3D get_errno(readlink(path(p), p2, arg3));
             }
@@ -10043,18 +10036,11 @@ static abi_long do_syscall1(CPUArchState *cpu_en=
v, int num, abi_long arg1,
                 /* Short circuit this for the magic exe check. */
                 ret =3D -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
-                char real[PATH_MAX], *temp;
-                temp =3D realpath(exec_path, real);
-                /* Return value is # of bytes that we wrote to the buffer=
. */
-                if (temp =3D=3D NULL) {
-                    ret =3D get_errno(-1);
-                } else {
-                    /* Don't worry about sign mismatch as earlier mapping
-                     * logic would have thrown a bad address error. */
-                    ret =3D MIN(strlen(real), arg4);
-                    /* We cannot NUL terminate the string. */
-                    memcpy(p2, real, ret);
-                }
+	        /* Don't worry about sign mismatch as earlier mapping
+	         * logic would have thrown a bad address error. */
+                ret =3D MIN(strlen(exec_path), arg4);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret =3D get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
=2D-
2.38.1



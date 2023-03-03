Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B56A97AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:57:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4xl-0003Tm-1U; Fri, 03 Mar 2023 07:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4xc-0003SE-F9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:56:34 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4xa-0001eK-JY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:56:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f11so2148082wrv.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4n+ZWqQtmGwopfIQYdr0AkR8BUDkJPpgMr1U5Vtcjo=;
 b=H6FYD6si63vlzuP3nJNPwTcOQoFk13Hyx+ehKHSAnWeFRQzBI8ZqK/kD2/k3SBZhA1
 0sWPR3EMZPJUbja4mSZyqFaZEKL78Ty9H3xG0xn4BaHMoIh0zWi0CC1Xlh0O7GP+tLbl
 vaDbLy8YOF2AS96pxbaylvj6FYTgglOwh1JN2P12bTerhSjj7gcenXez36plN1jqJ0SJ
 mmjULaXncjxATp2pl0lgpNhn5kEDQ3szTn8ug+/raQ+yRmdCcsVWk+JNkACIxQ96JCjX
 adg50OSU0PUPMiaTT/uNxFHfr6WrIiJpwnBBG6TMFQAuJCbDRyX/OB694E8eXGdtu2Xq
 Ayhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C4n+ZWqQtmGwopfIQYdr0AkR8BUDkJPpgMr1U5Vtcjo=;
 b=vzn3AiAkjwEavVZntxzIb/smVu99bn46sZftM95lxmveVdnVFVqXjV90+ST4I9dDAK
 HscVEHumm++flvc7S/CY83Xam4265uoD7szk8PK1muNsE9HzxcGb4nS1XaWCWyH9gpjP
 XQXbs78Q4yZE+yAGDMz+fhvOc1Zeiz6ytA9jj4FgXVa+YMBK/albcnGcpJWfE483xXcD
 kG5ZeBRRw3W4XJgDG8Ft9ZJgXSP+5Ze5JMURNm/N8HF3+mOwrCNGGMYAgC/VVCKZeL4+
 Rc0dckJZHOIAQQXLVWd173zli7z5U+csGKj38rDEjZ1qln53rrtZAzbjpZXyOd1hDyW1
 gB8w==
X-Gm-Message-State: AO0yUKU3pMiRqOUOvqebtfAYyr+ejBicuqQDrsfDlzrMDZys2VuY+AH1
 SVb9+nhl+qVj5tKVmhAXv3QC8A==
X-Google-Smtp-Source: AK7set+ogQuhmp09f6mYopjk4LKkXTUDaolV8QgO9Grrs/p/VvUkBG6zeIIEURgPb3Vew9roBpEi/g==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id
 r4-20020a5d52c4000000b002c7390e163cmr1341713wrv.47.1677848188619; 
 Fri, 03 Mar 2023 04:56:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d58ec000000b002c71b4d476asm2120664wrd.106.2023.03.03.04.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:56:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9E461FFB7;
 Fri,  3 Mar 2023 12:56:27 +0000 (GMT)
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-2-berrange@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] iotests: explicitly pass source/build dir to
 'check' command
Date: Fri, 03 Mar 2023 12:55:26 +0000
In-reply-to: <20230302184606.418541-2-berrange@redhat.com>
Message-ID: <877cvy9eo4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The 'check' script has some rather dubious logic whereby it assumes
> that if invoked as a symlink, then it is running from a separate
> source tree and build tree, otherwise it assumes the current working
> directory is a combined source and build tree.
>
> This doesn't work if you want to invoke the 'check' script using
> its full source tree path while still using a split source and build
> tree layout. This would be a typical situation with meson if you ask
> it to find the 'check' script path using files('check').
>
> Rather than trying to make the logic more magical, add support for
> explicitly passing the dirs using --source-dir and --build-dir. If
> either is omitted the current logic is maintained.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/qemu-iotests/check      |  8 +++++++-
>  tests/qemu-iotests/testenv.py | 17 +++++++++++++----
>  2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 9bdda1394e..806abc21d6 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -113,6 +113,10 @@ def make_argparser() -> argparse.ArgumentParser:
>                         'middle of the process.')
>      g_sel.add_argument('tests', metavar=3D'TEST_FILES', nargs=3D'*',
>                         help=3D'tests to run, or "--" followed by a comma=
nd')
> +    g_sel.add_argument('--build-dir', default=3DNone,
> +                       help=3D'Path to iotests build directory')
> +    g_sel.add_argument('--source-dir', default=3DNone,
> +                       help=3D'Path to iotests build directory')
>

I'd be tempted to push all the automagic stuff into the options so you
have something like:

--8<---------------cut here---------------start------------->8---
modified   tests/qemu-iotests/check
@@ -27,8 +27,23 @@ from testenv import TestEnv
 from testrunner import TestRunner
=20
=20
+def get_default_path(follow_link=3DFalse):
+    """
+    Try to automagically figure out the path we are running from.
+    """
+    # called from the build tree?
+    if os.path.islink(sys.argv[0]):
+        if follow_link:
+            return os.path.dirname(os.readlink(sys.argv[0]))
+        else:
+            return os.path.dirname(os.path.abspath(sys.argv[0]))
+    else:  # or source tree?
+        return os.getcwd()
+
+
 def make_argparser() -> argparse.ArgumentParser:
-    p =3D argparse.ArgumentParser(description=3D"Test run options")
+    p =3D argparse.ArgumentParser(description=3D"Test run options",
+                                formatter_class=3Dargparse.ArgumentDefault=
sHelpFormatter)
=20
     p.add_argument('-n', '--dry-run', action=3D'store_true',
                    help=3D'show me, do not run tests')
@@ -113,9 +128,9 @@ def make_argparser() -> argparse.ArgumentParser:
                        'middle of the process.')
     g_sel.add_argument('tests', metavar=3D'TEST_FILES', nargs=3D'*',
                        help=3D'tests to run, or "--" followed by a command=
')
-    g_sel.add_argument('--build-dir', default=3DNone,
+    g_sel.add_argument('--build-dir', default=3Dget_default_path(),
                        help=3D'Path to iotests build directory')
-    g_sel.add_argument('--source-dir', default=3DNone,
+    g_sel.add_argument('--source-dir', default=3Dget_default_path(follow_l=
ink=3DTrue),
                        help=3D'Path to iotests build directory')
=20
     return p
modified   tests/qemu-iotests/testenv.py
@@ -213,23 +213,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode=
: str,
         # Initialize generic paths: build_root, build_iotests, source_iote=
sts,
         # which are needed to initialize some environment variables. They =
are
         # used by init_*() functions as well.
-
-        if os.path.islink(sys.argv[0]):
-            # called from the build tree
-            self.source_iotests =3D os.path.dirname(
-                os.readlink(sys.argv[0]))
-            self.build_iotests =3D os.path.dirname(
-                os.path.abspath(sys.argv[0]))
-        else:
-            # called from the source tree
-            self.source_iotests =3D os.getcwd()
-            self.build_iotests =3D os.getcwd()
-
-        if source_dir is not None:
-            self.source_iotests =3D source_dir
-        if build_dir is not None:
-            self.build_iotests =3D build_dir
-
+        self.source_iotests =3D source_dir
+        self.build_iotests =3D build_dir
         self.build_root =3D os.path.join(self.build_iotests, '..', '..')
=20
         self.init_directories()
--8<---------------cut here---------------end--------------->8---


>      return p
>=20=20
> @@ -124,7 +128,9 @@ if __name__ =3D=3D '__main__':
>                    aiomode=3Dargs.aiomode, cachemode=3Dargs.cachemode,
>                    imgopts=3Dargs.imgopts, misalign=3Dargs.misalign,
>                    debug=3Dargs.debug, valgrind=3Dargs.valgrind,
> -                  gdb=3Dargs.gdb, qprint=3Dargs.print)
> +                  gdb=3Dargs.gdb, qprint=3Dargs.print,
> +                  source_dir=3Dargs.source_dir,
> +                  build_dir=3Dargs.build_dir)
>=20=20
>      if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] =3D=3D '--':
>          if not args.tests:
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index a864c74b12..9bf37cd381 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -177,7 +177,9 @@ def __init__(self, imgfmt: str, imgproto: str, aiomod=
e: str,
>                   debug: bool =3D False,
>                   valgrind: bool =3D False,
>                   gdb: bool =3D False,
> -                 qprint: bool =3D False) -> None:
> +                 qprint: bool =3D False,
> +                 source_dir: Optional[str] =3D None,
> +                 build_dir: Optional[str] =3D None) -> None:
>          self.imgfmt =3D imgfmt
>          self.imgproto =3D imgproto
>          self.aiomode =3D aiomode
> @@ -213,12 +215,19 @@ def __init__(self, imgfmt: str, imgproto: str, aiom=
ode: str,
>=20=20
>          if os.path.islink(sys.argv[0]):
>              # called from the build tree
> -            self.source_iotests =3D os.path.dirname(os.readlink(sys.argv=
[0]))
> -            self.build_iotests =3D os.path.dirname(os.path.abspath(sys.a=
rgv[0]))
> +            self.source_iotests =3D os.path.dirname(
> +                os.readlink(sys.argv[0]))
> +            self.build_iotests =3D os.path.dirname(
> +                os.path.abspath(sys.argv[0]))
>          else:
>              # called from the source tree
>              self.source_iotests =3D os.getcwd()
> -            self.build_iotests =3D self.source_iotests
> +            self.build_iotests =3D os.getcwd()
> +
> +        if source_dir is not None:
> +            self.source_iotests =3D source_dir
> +        if build_dir is not None:
> +            self.build_iotests =3D build_dir
>=20=20
>          self.build_root =3D os.path.join(self.build_iotests, '..', '..')


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


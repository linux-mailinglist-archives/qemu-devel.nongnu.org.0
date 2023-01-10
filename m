Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062F664FD5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 00:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNtL-0001wC-6E; Tue, 10 Jan 2023 18:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFNtI-0001vp-MN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFNtG-0007nh-N9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673392724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdolFpw4mxY4QwuNbXP5WK+vsEPYya78XuncoryD140=;
 b=WfQwjRnFC/U+57dxwjJfO+LvnK4ArwiquZRcwm3FRCtVGPavsAoWzX2UpJGbSNi9bHpC6T
 HpA5LHbNn91ra5QuZn/VhsnI11HoJywgf27J//aacTlc+uA9ZWb9KKIuyEDjTWYZ00wc+n
 uVcudr1yl5NxcuvRyfDCC4LameGArtY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-WFo9FJu0NNmR3nVsXvhseQ-1; Tue, 10 Jan 2023 18:18:43 -0500
X-MC-Unique: WFo9FJu0NNmR3nVsXvhseQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 o18-20020a05651c051200b0027a0ee63d4aso3470833ljp.21
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 15:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdolFpw4mxY4QwuNbXP5WK+vsEPYya78XuncoryD140=;
 b=wyyi9AXrDHDVtfB0GtvikHVpIjAi+KUixFd3YtFhodxO2IjyZ4VpxM972Dz7c1M8TP
 SzrACSxkxsVHKLmtqXN47frspkttbsMX/kegcLBoFnYlf0NDWh34HOUhUqYaiOtRU4ni
 HWIQH3zr9gs3sfIu/ioawKew3NMr55JkHUYXsmqer6r8pBJwe2tBn0yHRGHeyNUCZ4V6
 FWOOvupvVCDshwyA2Qw81RuPkQ2mqE62fq+vfWuDqA8w76c4PO6QjztIrDX5oIqcUbB9
 IPA5Cyg4P9MPT3eHMJmFNFtlQMFFV793m2lS4X13YmsVW9b7mVGRwIxngM+NU1Ndy7uP
 M6Qg==
X-Gm-Message-State: AFqh2krm8rj0zwmoq6Ys8b4TGKz7S/cVK4DHTQjfAzlF/oZPsYewVdTA
 wrMqFW+6e7kE8uQdR33S7spc3KJNEk1GANjKDjrAuWbZjfgL4Cndj03fwvVbKz8MvK+XQL0F+8f
 vjv8Z19c6Ks0v9/zyXZW3wNWHjIDbvIM=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3103541lfp.621.1673392721581; 
 Tue, 10 Jan 2023 15:18:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3O+3ldjeUdVjABaAfWv4ForfE0aotLncYXei+seWToi7o2nMRqUxzNdp1J4uHXpWwIs2bDtZN8Dy3paFF2Q4=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3103536lfp.621.1673392721290; Tue, 10
 Jan 2023 15:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
In-Reply-To: <20230110080756.38271-2-peter@pjd.dev>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 Jan 2023 18:18:29 -0500
Message-ID: <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
To: Peter Delevoryas <peter@pjd.dev>
Cc: crosa@redhat.com, bleal@redhat.com, philmd@linaro.org, wainersm@redhat.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Jan 10, 2023 at 3:34 AM Peter Delevoryas <peter@pjd.dev> wrote:
>
> On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> generated from a user's unix UID and UUID [1], which can create a
> relatively long path:
>
>     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
>
> QEMU's avocado tests create a temporary directory prefixed by
> "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> The QMP socket is unnecessarily long, because a temporary directory
> is created for every QEMUMachine object.
>
>     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
>
> The path limit for unix sockets on macOS is 104: [2]
>
>     /*
>      * [XSI] Definitions for UNIX IPC domain.
>      */
>     struct  sockaddr_un {
>         unsigned char   sun_len;        /* sockaddr len including null */
>         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
>         char            sun_path[104];  /* [XSI] path name (gag) */
>     };
>
> This results in avocado tests failing on macOS because the QMP unix
> socket can't be created, because the path is too long:
>
>     ERROR| Failed to establish connection: OSError: AF_UNIX path too long
>
> This change resolves by reducing the size of the socket directory prefix
> and the suffix on the QMP and console socket names.
>
> The result is paths like this:
>
>     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
>     $ tree qemu*
>     qemu_df4evjeq
>     qemu_jbxel3gy
>     qemu_ml9s_gg7
>     qemu_oc7h7f3u
>     qemu_oqb1yf97
>     =E2=94=9C=E2=94=80=E2=94=80 10a004050.con
>     =E2=94=94=E2=94=80=E2=94=80 10a004050.qmp
>
> [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-=
directory-in-weird-path
> [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/s=
ys/un.h
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

I'm tentatively staging this with a benefit-of-the-doubt [1] -- my
tests are still running -- but I do have a question:

> ---
>  python/qemu/machine/machine.py         | 6 +++---
>  tests/avocado/avocado_qemu/__init__.py | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine=
.py
> index 748a0d807c9d..d70977378305 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -157,7 +157,7 @@ def __init__(self,
>          self._wrapper =3D wrapper
>          self._qmp_timer =3D qmp_timer
>
> -        self._name =3D name or f"qemu-{os.getpid()}-{id(self):02x}"
> +        self._name =3D name or f"{id(self):x}"

Why is it safe to not differentiate based on the process ID?

... I suppose the thinking is: by default, in machine.py, this is a
temp dir created by tempfile.mkdtemp which will be unique per-process.
I suppose there's no protection against a caller supplying the same
tempdir (or sockdir) to multiple instances, but I suppose in those
cases we get to argue that "Well, don't do that, then."

Does that sound about right?

--js

[1] staged @ https://gitlab.com/jsnow/qemu/-/commits/python


>          self._temp_dir: Optional[str] =3D None
>          self._base_temp_dir =3D base_temp_dir
>          self._sock_dir =3D sock_dir
> @@ -167,7 +167,7 @@ def __init__(self,
>              self._monitor_address =3D monitor_address
>          else:
>              self._monitor_address =3D os.path.join(
> -                self.sock_dir, f"{self._name}-monitor.sock"
> +                self.sock_dir, f"{self._name}.qmp"
>              )
>
>          self._console_log_path =3D console_log
> @@ -192,7 +192,7 @@ def __init__(self,
>          self._console_set =3D False
>          self._console_device_type: Optional[str] =3D None
>          self._console_address =3D os.path.join(
> -            self.sock_dir, f"{self._name}-console.sock"
> +            self.sock_dir, f"{self._name}.con"
>          )
>          self._console_socket: Optional[socket.socket] =3D None
>          self._remove_files: List[str] =3D []
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avoca=
do_qemu/__init__.py
> index 910f3ba1eab8..25a546842fab 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -306,7 +306,7 @@ def require_netdev(self, netdevname):
>              self.cancel('no support for user networking')
>
>      def _new_vm(self, name, *args):
> -        self._sd =3D tempfile.TemporaryDirectory(prefix=3D"avo_qemu_sock=
_")
> +        self._sd =3D tempfile.TemporaryDirectory(prefix=3D"qemu_")
>          vm =3D QEMUMachine(self.qemu_bin, base_temp_dir=3Dself.workdir,
>                           sock_dir=3Dself._sd.name, log_dir=3Dself.logdir=
)
>          self.log.debug('QEMUMachine "%s" created', name)
> --
> 2.39.0
>
>



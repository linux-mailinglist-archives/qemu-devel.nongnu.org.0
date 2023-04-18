Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA86E6CF0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 21:30:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1por1E-0006Ja-Ab; Tue, 18 Apr 2023 15:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1por19-0006JP-5w
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:29:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1por10-0004hn-1W
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:29:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so391957wmr.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681846160; x=1684438160;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn4CsAXgiiBciWO+QN6y2iCp2q/8eBsfQPpTcITw7QY=;
 b=Zir7QIQQotcAXbQW3H1ZkYZTkPr1ZY+VC/kkaGxO3gFYypqjECjKiWKm6ItA8HgLlp
 Tr+8bYr0dgzBBFhc7P4ASg7QdBJsLIlzlPNQlTNBOvTCPipBtMnliPxAljspUJ+Ahq4n
 Ac9cQmqBGeQscJz2v4az+V9Y1nJt/BymeqW75DgWiXFn40ruTabOu/2FMLAFxNM+YBlw
 fQOreS6GOOeEY2QF8PetRk6NjSWFzbjj8tq5+WJ/lO63VnmTXvDZJVBpKE32tvll2K2F
 dlgjmbkfbuu4zAICqSS7ZlN+CbANlko+nlOFlPZaOWORImYOyXFgYi9CGl+cVG6gdhrp
 UDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681846160; x=1684438160;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xn4CsAXgiiBciWO+QN6y2iCp2q/8eBsfQPpTcITw7QY=;
 b=FjBke3vtxE57t0S1+rXLMBEBCkM9XgBfkbQkD5vSX7S869LQCqhK2G7eWsIvxDAT1Q
 Q/5fGjXlxwTpvLJbR+u/qvppSRoR7XtdTVsJcluY0M3VMzhQC2A23PRuLwPO5B1uIF+U
 eqxzqoyLsocpkG/zzkdW+2riQHsIGPIUHJDq6ZQqa5rLu+ElgE0EupJPrAYdmWAVSHQG
 3YyL1E0P2mEAS57pRAt79p8vc+cLoC03r6wP3zjhNPMLkQQ1skYgntafNfnpNkUGfG0K
 6PdFA9vZifxqwZIIJjscds0ZE/IELHjY/6xrv1+VA54YeExz6pvtqYleb9HRl/mAyv4S
 I6HQ==
X-Gm-Message-State: AAQBX9cKlLb/xMCmuvbvKvsbY4y5fosH8ZsIEDIgoa/9eGBmNfOTJu22
 za3b1c1I5DBbZ+nTqSPBIsNcSA==
X-Google-Smtp-Source: AKy350aiaGrr+oc3Y0Rq5glHB8/Ywncw7lAO/477I3m+KpjpiOQ+7C44eBcSrpBhril2chrlPujbuQ==
X-Received: by 2002:a1c:4c08:0:b0:3ea:d620:570a with SMTP id
 z8-20020a1c4c08000000b003ead620570amr14156634wmf.38.1681846159911; 
 Tue, 18 Apr 2023 12:29:19 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b003f092f0e0a0sm303010wmo.3.2023.04.18.12.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 12:29:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 161011FFB7;
 Tue, 18 Apr 2023 20:29:19 +0100 (BST)
References: <20230418160225.529172-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>, Kyle Evans
 <kevans@freebsd.org>
Subject: Re: [PATCH] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
Date: Tue, 18 Apr 2023 20:28:48 +0100
In-reply-to: <20230418160225.529172-1-thuth@redhat.com>
Message-ID: <87cz41dm5s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> FreeBSD 13.0 has been released in April 2021:
>
>  https://www.freebsd.org/releases/13.0R/announce/
>
> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 in our CI now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

> ---
>  We should likely also update tests/vm/freebsd ... however, FreeBSD 13
>  seems not to use the serial console by default anymore, so I've got
>  no clue how we could use their images now... Does anybody have any
>  suggestions?

Don't we have ssh support for all the test/vm images?

>
>  .gitlab-ci.d/cirrus.yml             | 13 -------------
>  .gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------
>  tests/lcitool/refresh               |  1 -
>  3 files changed, 30 deletions(-)
>  delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
>
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index 502dfd612c..1507c928e5 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -44,19 +44,6 @@
>    variables:
>      QEMU_JOB_CIRRUS: 1
>=20=20
> -x64-freebsd-12-build:
> -  extends: .cirrus_build_job
> -  variables:
> -    NAME: freebsd-12
> -    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> -    CIRRUS_VM_IMAGE_SELECTOR: image_family
> -    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
> -    CIRRUS_VM_CPUS: 8
> -    CIRRUS_VM_RAM: 8G
> -    UPDATE_COMMAND: pkg update; pkg upgrade -y
> -    INSTALL_COMMAND: pkg install -y
> -    TEST_TARGETS: check
> -
>  x64-freebsd-13-build:
>    extends: .cirrus_build_job
>    variables:
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/fr=
eebsd-12.vars
> deleted file mode 100644
> index 44d8a2a511..0000000000
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# THIS FILE WAS AUTO-GENERATED
> -#
> -#  $ lcitool variables freebsd-12 qemu
> -#
> -# https://gitlab.com/libvirt/libvirt-ci
> -
> -CCACHE=3D'/usr/local/bin/ccache'
> -CPAN_PKGS=3D''
> -CROSS_PKGS=3D''
> -MAKE=3D'/usr/local/bin/gmake'
> -NINJA=3D'/usr/local/bin/ninja'
> -PACKAGING_COMMAND=3D'pkg'
> -PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-ge=
nisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3=
 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt l=
ibjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meso=
n ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py3=
9-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl=
2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer =
vte3 zstd'
> -PYPI_PKGS=3D''
> -PYTHON=3D'/usr/local/bin/python3'
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index c0d7ad5516..4c568242d2 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -182,7 +182,6 @@ try:
>      #
>      # Cirrus packages lists for GitLab
>      #
> -    generate_cirrus("freebsd-12")
>      generate_cirrus("freebsd-13")
>      generate_cirrus("macos-12")


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


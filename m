Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C6D4848B7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 20:42:24 +0100 (CET)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4phO-0008Sf-U2
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 14:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4pfu-0007Zv-EB
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:40:50 -0500
Received: from [2a00:1450:4864:20::42f] (port=44797
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4pfs-0004gQ-2q
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:40:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id k18so41553970wrg.11
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tpRktyZ1LWipudfBpJuMPfwzlk5qEM+f5zYt1qyeybw=;
 b=JdAyOjwQ2H1rVqETJGDh+M5kCFica59dspzs1JHHpfjBXZ21VfJVQVIVPtxTA4SFuA
 9ZeASsfjsU28TOU0W4OpY/LLWKufbYOB1nv3OZYeykH2CN8YSSdaLw5jITp/7O/PdXz4
 Nj0shAWQLxrdVfOJwy8P8RL7ofilxlnK/6CzWNje/K9xdtQtkD5aw9RunArLnUdOaxXw
 Zk/C+DeoC7zhgI9Vf/rCHeob1RBkjwzWwr4ZKvlbFDA3Ac6kIYQU7BaOBmXTkbIfrn8m
 2B93ws+4ngqvMCOFy3XJsP58nMReVJI0zvwQkY0805qluyv8phmfJ5aAd4CC4RZYxLtp
 fNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tpRktyZ1LWipudfBpJuMPfwzlk5qEM+f5zYt1qyeybw=;
 b=tKQH10n94geITmzjXSx0WwpzIoLt4PakT+07ClU98QrH/rHG1nfM7kBayMbcHCfkmy
 nGwEHzHYQ0SSwtZOWhNsIUBY9KmvUOeFh0a7sOy78rjMt5aaKGsDQ4HR8ND0gkcs7Xz4
 4oAXZ84XVxyPHIPq70XsjjUDnTnN/HSqASw77PLx7SDVIqmyvgmnw8sHAXe0GV0lUPrh
 lFjaSpFalanQNaxJSnNNoTmzkHpTe7uQ94kUSdmWMuQtNnt5EGRNG2tjw5WOTdppRl37
 3aGkceXwuf6oYCM5G9DJKR5zCAQw3M5tAjtGoKlkRuzRqA48kmFkegy96mA79gRnvqDp
 XLDQ==
X-Gm-Message-State: AOAM531ULp0/c4IJDp62F9XEjCrsg3j00DZw/wv08igJmNO/1StVK6da
 5p+xMpf9ggJXb2VeTPOZzJGPQg==
X-Google-Smtp-Source: ABdhPJw/f5dCTr2lg6TqHI3DvUllzfXcS7zcZOKoh3yDDjU5qx5AafP1UC3s5E/lQMWZ7ppIsTA3PA==
X-Received: by 2002:a5d:54d2:: with SMTP id x18mr43262977wrv.701.1641325246066; 
 Tue, 04 Jan 2022 11:40:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm16409273wrz.82.2022.01.04.11.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:40:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CE361FFB7;
 Tue,  4 Jan 2022 19:40:44 +0000 (GMT)
References: <20211229062204.3726981-1-git@xen0n.name>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH] tests/docker: Add gentoo-loongarch64-cross image and
 run cross builds in GitLab
Date: Tue, 04 Jan 2022 18:31:27 +0000
In-reply-to: <20211229062204.3726981-1-git@xen0n.name>
Message-ID: <87fsq3l26b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


WANG Xuerui <git@xen0n.name> writes:

> Normally this would be based on qemu/debian10 or qemu/ubuntu2004, but
> after a week-long struggle, I still cannot build stage2 gcc with the
> known-good LoongArch toolchain sources, so I chose the least-resistance
> path with Gentoo as base image. As this image is not expected to be
> re-built by CI, like hexagon, it should not take much maintenance
> effort; also it's expected to be replaced as soon as Debian is
> available.
>
> As the LoongArch *target* has not been merged yet, a check-tcg job is
> not added at the moment, but cross builds with the TCG *host* port are
> already possible, and added to CI matrix.
>
> Due to constant flux of the toolchain sources used (especially that of
> glibc), the binaries built with this image may or may not work when
> run on actual hardware, but still useful for ensuring things correctly
> build. This image is expected to be updated every once in a while,
> before everything settles down.
>
> As a reference, the image takes about 25 minutes to rebuild on a
> Threadripper 3990X system with Docker operating on HDD; YMMV but it
> probably wouldn't become significantly shorter, as everything needs to
> be built from source in our case.
>
> (In the original submission along with the rest of LoongArch TCG
> patches, I forgot to make the dependency to the container build job
> optional, thus CI was passing in my own fork but broke upstream. Fixed
> for a 2nd take, and I also took the chance to update base image versions
> and such.)
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>
> (Note to CI maintainers: obviously this image has to be built and pushed
> manually, for everything to keep working. Sorry for the extra work
> early-on, but the community around LoongArch still hope to upstream most
> things during 2022 so eventually we will transition away from this.
> This work is no hurry though, and Happy Holidays everyone!)
>
>  .gitlab-ci.d/container-cross.yml              |  27 +++++
>  .gitlab-ci.d/crossbuilds.yml                  |  25 ++++
>  MAINTAINERS                                   |   2 +
>  tests/docker/Makefile.include                 |  21 ++++
>  .../gentoo-loongarch64-cross.docker           |  21 ++++
>  .../build-toolchain.sh                        | 109 ++++++++++++++++++
>  6 files changed, 205 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/gentoo-loongarch64-cross.doc=
ker
>  create mode 100755 tests/docker/dockerfiles/gentoo-loongarch64-cross.doc=
ker.d/build-toolchain.sh
>
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cr=
oss.yml
> index a3b5b90552..7a8cc556cc 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -82,6 +82,33 @@ hppa-debian-cross-container:
>    variables:
>      NAME: debian-hppa-cross
>=20=20
> +# Similar to hexagon, we don't want to build loongarch64 in the CI eithe=
r.
> +loongarch64-cross-container:
> +  image: docker:stable
> +  stage: containers
> +  rules:
> +    - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project"'
> +      when: never
> +    - when: always
> +  variables:
> +    NAME: gentoo-loongarch64-cross
> +    GIT_DEPTH: 1
> +  services:
> +    - docker:dind
> +  before_script:
> +    - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> +    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:lat=
est"
> +    - docker info
> +    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_=
PASSWORD"
> +  script:
> +    - echo "TAG:$TAG"
> +    - echo "COMMON_TAG:$COMMON_TAG"
> +    - docker pull $COMMON_TAG
> +    - docker tag $COMMON_TAG $TAG
> +    - docker push "$TAG"
> +  after_script:
> +    - docker logout
> +
>  m68k-debian-cross-container:
>    extends: .container_job_template
>    stage: containers-layer2
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 17d6cb3e45..ef19ade554 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -68,6 +68,31 @@ cross-i386-tci:
>      EXTRA_CONFIGURE_OPTS: --target-list=3Di386-softmmu,i386-linux-user,a=
arch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
>      MAKE_CHECK_ARGS: check check-tcg
>=20=20
> +# Upstream LoongArch support is still incomplete, but toolchain is alrea=
dy
> +# usable and partially merged, so the host support is already testable; =
but
> +# don't let failures block CI.
> +#
> +# Similar to hexagon, the container image is built outside of CI and man=
ually
> +# uploaded at the moment, so make the dependency to container build job
> +# optional.
> +cross-loongarch64-system:
> +  extends: .cross_system_build_job
> +  allow_failure: true
> +  needs:
> +    job: loongarch64-cross-container
> +    optional: true
> +  variables:
> +    IMAGE: gentoo-loongarch64-cross
> +
> +cross-loongarch64-user:
> +  extends: .cross_user_build_job
> +  allow_failure: true
> +  needs:
> +    job: loongarch64-cross-container
> +    optional: true
> +  variables:
> +    IMAGE: gentoo-loongarch64-cross
> +
>  cross-mips-system:
>    extends: .cross_system_build_job
>    needs:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5456536805..6b42fe16c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3148,6 +3148,8 @@ LoongArch64 TCG target
>  M: WANG Xuerui <git@xen0n.name>
>  S: Maintained
>  F: tcg/loongarch64/
> +F: tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
> +F: tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/
>=20=20
>  MIPS TCG target
>  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index f1a0c5db7a..a2cdf193bb 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -176,6 +176,27 @@ docker-image-debian-hexagon-cross: $(DOCKER_FILES_DI=
R)/debian-hexagon-cross.dock
>  				qemu/debian-hexagon-cross --add-current-user,		\
>  			"PREPARE", "debian-hexagon-cross"))
>=20=20
> +#
> +# Same for loongarch64-cross.
> +#
> +docker-image-gentoo-loongarch64-cross: $(DOCKER_FILES_DIR)/gentoo-loonga=
rch64-cross.docker
> +	$(if $(NOCACHE), 								\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) build -t qemu/gentoo-loongarch64-cross -f $< 	\
> +			$(if $V,,--quiet) --no-cache 					\
> +			--registry $(DOCKER_REGISTRY) --extra-files			\
> +			$(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker.d/build-toolchain=
.sh, \
> +			"BUILD", "gentoo-loongarch64-cross"),				\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
> +				qemu/gentoo-loongarch64-cross $(DOCKER_REGISTRY),	\
> +			"FETCH", "gentoo-loongarch64-cross")				\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
> +				qemu/gentoo-loongarch64-cross --add-current-user,	\
> +			"PREPARE", "gentoo-loongarch64-cross"))
> +
> +

Can this not use debian-toolchain-run (possibly renamed) like the
microblaze and nios2 toolchains? The hexagon only has the legacy setup
because we never merged the more traditional image due to signal issues.

>  debian-toolchain-run =3D \
>  	$(if $(NOCACHE), 						\
>  		$(call quiet-command,					\
> diff --git a/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker b/t=
ests/docker/dockerfiles/gentoo-loongarch64-cross.docker
> new file mode 100644
> index 0000000000..59846223d3
> --- /dev/null
> +++ b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
> @@ -0,0 +1,21 @@
> +#
> +# Docker LoongArch64 cross-compiler target
> +#
> +# This docker target is used for building loongarch64 tests. As it also
> +# needs to be able to build QEMU itself in CI we include it's
> +# build-deps. It is also a "stand-alone" image so as not to be
> +# triggered by re-builds on other base images given it takes a long
> +# time to build.
> +#
> +
> +FROM docker.io/gentoo/stage3:20211229
> +
> +ADD build-toolchain.sh /root/build-toolchain.sh
> +RUN cd /root && ./build-toolchain.sh
> +
> +# Specify the cross prefix for this image (see tests/docker/common.rc)
> +# Also gcc 12 currently produces spurious warnings under our condition so
> +# disable Werror as well
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Dloongarch64-unknown-linux-gnu- =
--disable-werror
> +# We don't have target support at the moment, so just verify that things=
 build
> +ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user
> diff --git a/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/b=
uild-toolchain.sh b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docke=
r.d/build-toolchain.sh
> new file mode 100755
> index 0000000000..654f1394e9
> --- /dev/null
> +++ b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-to=
olchain.sh
> @@ -0,0 +1,109 @@
> +#!/bin/bash
> +
> +set -e
> +
> +TRIPLE=3Dloongarch64-unknown-linux-gnu
> +CROSSDEV_OV=3D/opt/crossdev-overlay
> +LOONGSON_OV=3D/opt/loongson-overlay
> +CROSS_EMERGE=3D"${TRIPLE}-emerge"
> +
> +# this will break on non-SMP machines, but no one should build this image
> +# on such machine in the first place
> +J=3D$(expr $(nproc) / 2)
> +echo "MAKEOPTS=3D\"-j${J} -l${J}\"" >> /etc/portage/make.conf
> +echo "EGIT_CLONE_TYPE=3Dshallow" >> /etc/portage/make.conf
> +
> +# these features are not supported in Docker
> +export FEATURES=3D"-ipc-sandbox -network-sandbox"
> +
> +# populate Portage tree
> +GENTOO_MIRROR=3D'https://bouncer.gentoo.org/fetch/root/all'
> +PORTAGE_SNAPSHOT_FILE=3Dgentoo-20211228.tar.xz
> +pushd /tmp
> +    # not every mirror will have this file synced yet, so retry until su=
ccess
> +    i=3D0
> +    max_retry=3D5
> +    while [[ $i -lt $max_retry ]]; do
> +        [[ $i -gt 0 ]] && echo "Retrying ($i of $max_retry)..."
> +        wget "${GENTOO_MIRROR}/snapshots/${PORTAGE_SNAPSHOT_FILE}" && br=
eak
> +        : $((i++))
> +    done
> +    [[ -f "$PORTAGE_SNAPSHOT_FILE" ]] || exit 1
> +
> +    mkdir -p /var/db/repos/gentoo
> +    pushd /var/db/repos/gentoo
> +        tar -xf "/tmp/${PORTAGE_SNAPSHOT_FILE}" --strip-components=3D1
> +    popd
> +
> +    rm "$PORTAGE_SNAPSHOT_FILE"
> +popd

This seems a little excessive. Wouldn't a straight emerge --sync do or
even just sticking to the state of portage in the source docker image?

Maybe:

  emerge-webrsync --revert=3D20211228

> +
> +emerge -j crossdev dev-vcs/git
> +
> +# prepare for crossdev
> +mkdir /etc/portage/repos.conf
> +crossdev -t "$TRIPLE" --ov-output "$CROSSDEV_OV" --init-target
> +
> +git clone https://github.com/xen0n/loongson-overlay.git "$LOONGSON_OV"
> +pushd "$LOONGSON_OV"
> +    git checkout 20b9c9f96fb5ed596bbab6bd6f274932492fb12b
> +popd
> +
> +pushd "${CROSSDEV_OV}/cross-${TRIPLE}"
> +    rm binutils gcc glibc linux-headers
> +    ln -s "${LOONGSON_OV}/sys-devel/binutils" .
> +    ln -s "${LOONGSON_OV}/sys-devel/gcc" .
> +    ln -s "${LOONGSON_OV}/sys-libs/glibc" .
> +    ln -s "${LOONGSON_OV}/sys-kernel/linux-headers" .
> +popd
> +
> +cat > "${CROSSDEV_OV}/metadata/layout.conf" <<EOF
> +masters =3D gentoo
> +repo-name =3D crossdev-overlay
> +manifest-hashes =3D SHA256 SHA512 WHIRLPOOL
> +thin-manifests =3D true
> +EOF
> +
> +chown -R portage:portage "$CROSSDEV_OV"
> +chown -R portage:portage "$LOONGSON_OV"
> +
> +# make cross toolchain
> +crossdev -t "$TRIPLE" --without-headers \
> +    --binutils 2.37_p1-r1 \
> +    --gcc 12.0.0_pre9999 \
> +    --libc 2.34-r4
> +
> +# prepare for loongarch cross emerges
> +TARGET_PROFILE=3D"default/linux/loong/21.0/la64v100/lp64d/desktop"
> +pushd "/usr/${TRIPLE}/etc/portage"
> +    rm make.profile
> +    ln -s "${LOONGSON_OV}/profiles/${TARGET_PROFILE}" ./make.profile
> +
> +    # util-linux needs this to not depend on pam, causing circular deps =
later
> +    sed -i '/^USE=3D".*"$/s/"$/ -su"/' ./make.conf
> +
> +    mkdir repos.conf
> +    cat > repos.conf/loongson.conf <<EOF
> +[loongson]
> +priority =3D 50
> +location =3D $LOONGSON_OV
> +auto-sync =3D No
> +EOF
> +
> +popd
> +
> +# add build deps for qemu
> +
> +# gawk seems to have problems installing with concurrency, and its deps
> +# include ncurses that needs disabling sandbox to correctly build under
> +# Docker, so just turn off sandbox for all emerges
> +export FEATURES=3D"$FEATURES -sandbox -usersandbox"
> +$CROSS_EMERGE -1 --onlydeps -j$J gawk
> +mkdir -p "/usr/${TRIPLE}/bin"
> +MAKEOPTS=3D'-j1' $CROSS_EMERGE -1 gawk
> +
> +# then build the rest
> +$CROSS_EMERGE -1 --onlydeps -j$J qemu
> +
> +# clean up downloaded files and Portage tree for smaller image
> +rm -rf /var/db/repos/gentoo /var/cache/distfiles


--=20
Alex Benn=C3=A9e


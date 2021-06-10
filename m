Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB93A340D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:28:39 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQM2-0002r9-5y
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQL3-00024a-D0
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:27:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lrQKz-0001AC-Kz
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623353252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TeAAmUVaa19lrKItr3AQjoe9QxbILFm4YGD7chbais=;
 b=NkteJo2K85qxkP7Yu1wtqaYGOrx464n0bpYckUp6bSbnabCjqpBpWp4Bqq0M+NxzT9OXUb
 71IRG5uAzNOnE+zlKwvUH8vBB7hiVsQT/NCA9UR6+OMDIWqrY4uGjYnWWM//cJ3ycF4y56
 34AyUkT4LyMms45Nd5m5UsfUdDknaaQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-i3nEOzDPOI6PW6d-hi2jsQ-1; Thu, 10 Jun 2021 15:27:28 -0400
X-MC-Unique: i3nEOzDPOI6PW6d-hi2jsQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 w127-20020a1f62850000b0290200994bf3c9so1959323vkb.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8TeAAmUVaa19lrKItr3AQjoe9QxbILFm4YGD7chbais=;
 b=V4DLUfodgfbC9VgiuBnWYfU1/A/ceHqIu23w0OUUd20b7gT2wFmw2edNY1+zF5sQ6X
 XYbrkKRFcRYjaEex43nVbzPwtZvS/Tad+Lq30rJVTxezs52Cj31ZGPbOInYhIz1i3b/W
 SvEDnzU7GC87kcxCzWkSOe8Vkd/DQtnPICgdcUa5uXWIiip2ivV+yiAIFN8lwa017QyI
 xRq8XEt6X/iyuyYxfifWEuNWBtJ/7dXs6bDoLx1+SRuYLvdXrpzNUNMv9T2ORj1514fx
 qLUYumPb3xRA+xfF/cATigeOy+L/QTqjG/Ugv7DJshVmsewFeBsxEIPtuhIdAaNGV0Wo
 kCYg==
X-Gm-Message-State: AOAM5309cAa3Cma5VVI9ULLwDiKYpLOLoEVN+TFbKxTxN6OLx4+EksR5
 307ar4zcDPzCydtWLk4GjOCxN2EZdfYrdq+4VCtZ9Itr0yc0O9rPg1QY40WezhifgKVrQWBz7cF
 lls9GAkbkDzPwUGke0WeVVOl94c1NzEw=
X-Received: by 2002:a67:ba05:: with SMTP id l5mr7084211vsn.50.1623353247946;
 Thu, 10 Jun 2021 12:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS8psxtaeOgVeZU7vinIS9q1CtUQkxNJnNpUIe1/xhlnCSzy3VC2+5qXbOigSSn9Ha5Dnlaq6qmopSnjkw89A=
X-Received: by 2002:a67:ba05:: with SMTP id l5mr7084168vsn.50.1623353247514;
 Thu, 10 Jun 2021 12:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-5-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-5-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 10 Jun 2021 16:27:00 -0300
Message-ID: <CAKJDGDa2Fge9O_EY4R8_gRYy=4ij2XzV1MZ+uO4ZCy8C=Uxbww@mail.gmail.com>
Subject: Re: [PATCH 4/4] Jobs based on custom runners: add CentOS Stream 8
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 11:10 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> This introduces three different parts of a job designed to run
> on a custom runner managed by Red Hat.  The goals include:
>
>  a) serve as a model for other organizations that want to onboard
>     their own runners, with their specific platforms, build
>     configuration and tests.
>
>  b) bring awareness to the differences between upstream QEMU and the
>     version available under CentOS Stream, which is "A preview of
>     upcoming Red Hat Enterprise Linux minor and major releases.".
>
>  c) becase of b), it should be easier to identify and reduce the gap
>     between Red Hat's downstream and upstream QEMU.
>
> The components themselves to achieve this custom job are:
>
>  1) build environment configuration: documentation and a playbook for
>     a base Enterprise Linux 8 system (also applicable to CentOS
>     Stream), which other users can run on their system to get the
>     environment suitable for building QEMU.
>
>  2) QEMU build configuration: how QEMU will be built to match, as
>     closely as possible, the binaries built and packaged on CentOS
>     stream 8.
>
>  3) job definition: GitLab CI jobs that will dispatch the build/test
>     job to the machine specifically configured according to #1.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml        |  29 ++++
>  scripts/ci/org.centos/stream/README    |   2 +
>  scripts/ci/org.centos/stream/configure | 190 +++++++++++++++++++++++++
>  scripts/ci/setup/build-environment.yml |  38 +++++
>  4 files changed, 259 insertions(+)
>  create mode 100644 scripts/ci/org.centos/stream/README
>  create mode 100755 scripts/ci/org.centos/stream/configure
>
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runner=
s.yml
> index 061d3cdfed..ee5143995e 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -220,3 +220,32 @@ ubuntu-20.04-aarch64-notcg:
>   - ../configure --disable-libssh --disable-tcg
>   - make --output-sync -j`nproc`
>   - make --output-sync -j`nproc` check V=3D1
> +
> +centos-stream-8-x86_64:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - centos_stream_8
> + - x86_64

What happens if another organization wants to add its own custom
runner with its own set of tests based on centos stream 8? My
suggestion is to add an organization tag to the custom runners. If
this job runs tests important to Red Hat, we should name it and tag
the runner with it.

Unless Red Hat is willing to add other tests that are interesting to
other organizations and run it on its custom runner. If that is the
case, who should check those tests in case of failure?

> + rules:
> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
> + artifacts:
> +   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +   when: on_failure
> +   expire_in: 7 days
> +   paths:
> +     - build/tests/results/latest/results.xml
> +     - build/tests/results/latest/test-results
> +   reports:
> +     junit: build/tests/results/latest/results.xml
> + script:
> + - mkdir build
> + - cd build
> + - ../scripts/ci/org.centos/stream/configure
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=3D1
> + - make get-vm-images
> + # Only run tests that are either marked explicitly for KVM and x86_64
> + # or tests that are supposed to be valid for all targets
> + - ./tests/venv/bin/avocado run --job-results-dir=3Dtests/results/ --fil=
ter-by-tags-include-empty --filter-by-tags-include-empty-key -t accel:kvm,a=
rch:x86_64 -- tests/acceptance/
> diff --git a/scripts/ci/org.centos/stream/README b/scripts/ci/org.centos/=
stream/README
> new file mode 100644
> index 0000000000..f99bda99b8
> --- /dev/null
> +++ b/scripts/ci/org.centos/stream/README
> @@ -0,0 +1,2 @@
> +This directory contains scripts for generating a build of QEMU that
> +closely matches the CentOS Stream builds of the qemu-kvm package.
> diff --git a/scripts/ci/org.centos/stream/configure b/scripts/ci/org.cent=
os/stream/configure
> new file mode 100755
> index 0000000000..1e7207faec
> --- /dev/null
> +++ b/scripts/ci/org.centos/stream/configure
> @@ -0,0 +1,190 @@
> +#!/bin/sh -e
> +../configure \
> +--prefix=3D"/usr" \
> +--libdir=3D"/usr/lib64" \
> +--datadir=3D"/usr/share" \
> +--sysconfdir=3D"/etc" \
> +--interp-prefix=3D/usr/qemu-%M \
> +--localstatedir=3D"/var" \
> +--docdir=3D"/usr/share/doc" \
> +--libexecdir=3D"/usr/libexec" \
> +--extra-ldflags=3D"-Wl,--build-id -Wl,-z,relro -Wl,-z,now" \
> +--extra-cflags=3D"-O2 -g -pipe -Wall -Werror=3Dformat-security -Wp,-D_FO=
RTIFY_SOURCE=3D2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-s=
trong -grecord-gcc-switches -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc=
1 -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric -fa=
synchronous-unwind-tables -fstack-clash-protection -fcf-protection" \
> +--with-suffix=3D"qemu-kvm" \
> +--firmwarepath=3D/usr/share/qemu-firmware \
> +--meson=3D"/usr/bin/meson" \
> +--target-list=3D"x86_64-softmmu" \
> +--block-drv-rw-whitelist=3Dqcow2,raw,file,host_device,nbd,iscsi,rbd,blkd=
ebug,luks,null-co,nvme,copy-on-read,throttle,gluster \
> +--audio-drv-list=3D \
> +--block-drv-ro-whitelist=3Dvmdk,vhdx,vpc,https,ssh \
> +--with-coroutine=3Ducontext \
> +--with-git=3Dgit \
> +--tls-priority=3D@QEMU,SYSTEM \
> +--disable-attr \
> +--disable-auth-pam \
> +--disable-avx2 \
> +--disable-avx512f \
> +--disable-bochs \
> +--disable-brlapi \
> +--disable-bsd-user \
> +--disable-bzip2 \
> +--disable-cap-ng \
> +--disable-capstone \
> +--disable-cfi \
> +--disable-cfi-debug \
> +--disable-cloop \
> +--disable-cocoa \
> +--disable-coroutine-pool \
> +--disable-crypto-afalg \
> +--disable-curl \
> +--disable-curses \
> +--disable-debug-info \
> +--disable-debug-mutex \
> +--disable-debug-tcg \
> +--disable-dmg \
> +--disable-docs \
> +--disable-fdt \
> +--disable-fuse \
> +--disable-fuse-lseek \
> +--disable-gcrypt \
> +--disable-gio \
> +--disable-glusterfs \
> +--disable-gnutls \
> +--disable-gtk \
> +--disable-guest-agent \
> +--disable-guest-agent-msi \
> +--disable-hax \
> +--disable-hvf \
> +--disable-iconv \
> +--disable-jemalloc \
> +--disable-kvm \
> +--disable-libdaxctl \
> +--disable-libiscsi \
> +--disable-libnfs \
> +--disable-libpmem \
> +--disable-libssh \
> +--disable-libudev \
> +--disable-libusb \
> +--disable-libxml2 \
> +--disable-linux-aio \
> +--disable-linux-io-uring \
> +--disable-linux-user \
> +--disable-live-block-migration \
> +--disable-lto \
> +--disable-lzfse \
> +--disable-lzo \
> +--disable-malloc-trim \
> +--disable-membarrier \
> +--disable-modules \
> +--disable-module-upgrades \
> +--disable-mpath \
> +--disable-multiprocess \
> +--disable-netmap \
> +--disable-nettle \
> +--disable-numa \
> +--disable-opengl \
> +--disable-parallels \
> +--disable-pie \
> +--disable-pvrdma \
> +--disable-qcow1 \
> +--disable-qed \
> +--disable-qom-cast-debug \
> +--disable-rbd \
> +--disable-rdma \
> +--disable-replication \
> +--disable-rng-none \
> +--disable-safe-stack \
> +--disable-sanitizers \
> +--disable-sdl \
> +--disable-sdl-image \
> +--disable-seccomp \
> +--disable-smartcard \
> +--disable-snappy \
> +--disable-sparse \
> +--disable-spice \
> +--disable-strip \
> +--disable-system \
> +--disable-tcg \
> +--disable-tcmalloc \
> +--disable-tools \
> +--disable-tpm \
> +--disable-u2f \
> +--disable-usb-redir \
> +--disable-user \
> +--disable-vde \
> +--disable-vdi \
> +--disable-vhost-crypto \
> +--disable-vhost-kernel \
> +--disable-vhost-net \
> +--disable-vhost-scsi \
> +--disable-vhost-user \
> +--disable-vhost-user-blk-server \
> +--disable-vhost-vdpa \
> +--disable-vhost-vsock \
> +--disable-virglrenderer \
> +--disable-virtfs \
> +--disable-virtiofsd \
> +--disable-vnc \
> +--disable-vnc-jpeg \
> +--disable-vnc-png \
> +--disable-vnc-sasl \
> +--disable-vte \
> +--disable-vvfat \
> +--disable-werror \
> +--disable-whpx \
> +--disable-xen \
> +--disable-xen-pci-passthrough \
> +--disable-xfsctl \
> +--disable-xkbcommon \
> +--disable-zstd \
> +--enable-attr \
> +--enable-avx2 \
> +--enable-cap-ng \
> +--enable-capstone \
> +--enable-coroutine-pool \
> +--enable-curl \
> +--enable-debug-info \
> +--enable-docs \
> +--enable-gcrypt \
> +--enable-glusterfs \
> +--enable-gnutls \
> +--enable-guest-agent \
> +--enable-iconv \
> +--enable-kvm \
> +--enable-libiscsi \
> +--enable-libpmem \
> +--enable-libssh \
> +--enable-libusb \
> +--enable-libudev \
> +--enable-linux-aio \
> +--enable-lzo \
> +--enable-malloc-trim \
> +--enable-modules \
> +--enable-mpath \
> +--enable-numa \
> +--enable-opengl \
> +--enable-pie \
> +--enable-rbd \
> +--enable-rdma \
> +--enable-seccomp \
> +--enable-snappy \
> +--enable-smartcard \
> +--enable-spice \
> +--enable-system \
> +--enable-tcg \
> +--enable-tools \
> +--enable-tpm \
> +--enable-trace-backend=3Ddtrace \
> +--enable-usb-redir \
> +--enable-virtiofsd \
> +--enable-vhost-kernel \
> +--enable-vhost-net \
> +--enable-vhost-user \
> +--enable-vhost-user-blk-server \
> +--enable-vhost-vdpa \
> +--enable-vhost-vsock \
> +--enable-vnc \
> +--enable-vnc-png \
> +--enable-vnc-sasl \
> +--enable-werror \
> +--enable-xkbcommon
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/bu=
ild-environment.yml
> index 664f2f0519..b1e01b1025 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -96,3 +96,41 @@
>        when:
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>          - ansible_facts['distribution_version'] =3D=3D '20.04'
> +
> +    - name: Install basic packages to build QEMU on EL8
> +      dnf:
> +        # This list of packages start with tests/docker/dockerfiles/cent=
os8.docker
> +        # but only include files that are common to all distro variants =
and present
> +        # in the standard repos (no add-ons)
> +        name:
> +          - bzip2
> +          - bzip2-devel
> +          - dbus-daemon
> +          - diffutils
> +          - gcc
> +          - gcc-c++
> +          - genisoimage
> +          - gettext
> +          - git
> +          - glib2-devel
> +          - libaio-devel
> +          - libepoxy-devel
> +          - libgcrypt-devel
> +          - lzo-devel
> +          - make
> +          - mesa-libEGL-devel
> +          - nettle-devel
> +          - nmap-ncat
> +          - perl-Test-Harness
> +          - pixman-devel
> +          - python36
> +          - rdma-core-devel
> +          - spice-glib-devel
> +          - spice-server
> +          - systemtap-sdt-devel
> +          - tar
> +          - zlib-devel
> +        state: present
> +      when:
> +        - ansible_facts['distribution_file_variety'] =3D=3D 'RedHat'
> +        - ansible_facts['distribution_version'] =3D=3D '8'

I had set up 3 different systems. One with Ubuntu 20.04, one with
Centos Stream 8, and one with Red Hat 8.4. Running the
`build-environment.yml` playbook all steps succeed, except `TASK
[Install basic packages to build QEMU on EL8]`. There seems to be a
problem with the DNF parameter:

TASK [Install basic packages to build QEMU on EL8]
***************************************************************************=
*********************
fatal: [192.168.122.41]: FAILED! =3D> {"changed": false, "msg":
"Unsupported parameters for (dnf) module: when Supported parameters
include: allow_downgrade, autoremove, bugfix, conf_file,
disable_excludes, disable_gpg_check, disable_plugin, disablerepo,
download_dir, download_only, enable_plugin, enablerepo, exclude,
install_repoquery, install_weak_deps, installroot, list, lock_timeout,
name, releasever, security, skip_broken, state, update_cache,
update_only, validate_certs"}
fatal: [192.168.122.236]: FAILED! =3D> {"changed": false, "msg":
"Unsupported parameters for (dnf) module: when Supported parameters
include: allow_downgrade, autoremove, bugfix, conf_file,
disable_excludes, disable_gpg_check, disable_plugin, disablerepo,
download_dir, download_only, enable_plugin, enablerepo, exclude,
install_repoquery, install_weak_deps, installroot, list, lock_timeout,
name, releasever, security, skip_broken, state, update_cache,
update_only, validate_certs"}
fatal: [192.168.122.168]: FAILED! =3D> {"changed": false, "msg":
"Unsupported parameters for (dnf) module: when Supported parameters
include: allow_downgrade, autoremove, bugfix, conf_file,
disable_excludes, disable_gpg_check, disable_plugin, disablerepo,
download_dir, download_only, enable_plugin, enablerepo, exclude,
install_repoquery, install_weak_deps, installroot, list, lock_timeout,
name, releasever, security, skip_broken, state, update_cache,
update_only, validate_certs"}

> --
> 2.25.4
>



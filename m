Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED23B59C1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:30:34 +0200 (CEST)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxliz-000841-6q
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlh2-0006ec-64
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlgv-0000sd-7B
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624865304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9IVACT7b7pYFxZL4x4byej+xef6l90a4gPM5/Pj+4U=;
 b=M2UPgmYaLVKCI9YwLlT9RRSSOEiimf2N5FHkZHPLFytv3VtIiIEj2G9/6eA6Ym2HL08GZT
 TfnIgUI9GcFsp0q/0hY0jQuhDtJkram13Z0eerpkbe+XG/llMqCQ0iOmbes7YSCThsvi/a
 cUWRZYFxEtEDR5NqzrJW6t8Np1JJU7U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-D5KfRdB9NMm0b-jKEULvyw-1; Mon, 28 Jun 2021 03:28:21 -0400
X-MC-Unique: D5KfRdB9NMm0b-jKEULvyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r204-20020a1c44d50000b02901e993531cf2so4425213wma.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 00:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h9IVACT7b7pYFxZL4x4byej+xef6l90a4gPM5/Pj+4U=;
 b=nh+qgnUSLGPMCRz+wvQ0l7auZY3amrbQezEdK2gWb1BYcKRAAYZxcbZhwVEOLebB9t
 wjTeFJfVtjKPLVUZnbC4R1n5GQnuw5hj73JpXaCw7t0HLsP6sK1ywKp9GUpZMCpjmBH/
 NNAgZ3mNT72NfmljNBUjQBevTTBNf2zVEHeZ14l+qSNex+5FlUoGuba3d/31QDiIgzJp
 zCSeTfaiUojcr3J8mAZGhHO0iXCJYvuG6SXs562SnW1VZ7zoDwYUz/0NWi1rYm/wBCjd
 Bt0PEm51nJSrwNqJ1TDNXhCdkDZTa0PIghqkR+7sBol5A4+iRSFyGYzPoRnCIOHt418y
 vSoQ==
X-Gm-Message-State: AOAM532C8Q1ZfOfLoF3qBeTpeN5MTbnOwspzYFjUS2WeGKUODAUAppIQ
 FFMPLTo0E/XEb11Rspxd2FlDWrLcY/Bm23CbAhhycHF4uHgXNungCZqCPDiM5UPbDxbtkq1Wy7O
 VnPPzvTTDlRVwMdU=
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr24615851wma.96.1624865300183; 
 Mon, 28 Jun 2021 00:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/ePhK6hWFl0PX1ibHcNwc9P5S/K+gp/XfRNJV1wEX7y2IaENmhpG+4eTZMy3BLkycCHPJYg==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr24615832wma.96.1624865299908; 
 Mon, 28 Jun 2021 00:28:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ea7.dip0.t-ipconnect.de.
 [217.87.94.167])
 by smtp.gmail.com with ESMTPSA id w3sm548275wmi.24.2021.06.28.00.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 00:28:19 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] gitlab: support for FreeBSD 12, 13 and macOS 11 via
 cirrus-run
Message-ID: <bc459548-6afa-dc35-696f-4757431fbb46@redhat.com>
Date: Mon, 28 Jun 2021 09:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172211.451010-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 19.22, Daniel P. Berrangé wrote:
> This adds support for running 4 jobs via Cirrus CI runners:
> 
>   * FreeBSD 12
>   * FreeBSD 13
>   * macOS 11 with default XCode
>   * macOS 11 with latest XCode
> 
> The gitlab job uses a container published by the libvirt-ci
> project (https://gitlab.com/libvirt/libvirt-ci) that contains
> the 'cirrus-run' command. This accepts a short yaml file that
> describes a single Cirrus CI job, runs it using the Cirrus CI
> REST API, and reports any output to the console.
> 
> In this way Cirrus CI is effectively working as an indirect
> custom runner for GitLab CI pipelines. The key benefit is that
> Cirrus CI job results affect the GitLab CI pipeline result and
> so the user only has look at one CI dashboard.

Cool, thanks for tackling this!

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml             | 103 ++++++++++++++++++++++++++++
>   .gitlab-ci.d/cirrus/README.rst      |  54 +++++++++++++++
>   .gitlab-ci.d/cirrus/build.yml       |  35 ++++++++++
>   .gitlab-ci.d/cirrus/freebsd-12.vars |  13 ++++
>   .gitlab-ci.d/cirrus/freebsd-13.vars |  13 ++++
>   .gitlab-ci.d/cirrus/macos-11.vars   |  15 ++++
>   .gitlab-ci.d/qemu-project.yml       |   1 +
>   7 files changed, 234 insertions(+)
>   create mode 100644 .gitlab-ci.d/cirrus.yml
>   create mode 100644 .gitlab-ci.d/cirrus/README.rst
>   create mode 100644 .gitlab-ci.d/cirrus/build.yml
>   create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
>   create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars
>   create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> new file mode 100644
> index 0000000000..d7b4cce79b
> --- /dev/null
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -0,0 +1,103 @@
> +# Jobs that we delegate to Cirrus CI because they require an operating
> +# system other than Linux. These jobs will only run if the required
> +# setup has been performed on the GitLab account.
> +#
> +# The Cirrus CI configuration is generated by replacing target-specific
> +# variables in a generic template: some of these variables are provided
> +# when the GitLab CI job is defined, others are taken from a shell
> +# snippet generated using lcitool.
> +#
> +# Note that the $PATH environment variable has to be treated with
> +# special care, because we can't just override it at the GitLab CI job
> +# definition level or we risk breaking it completely.
> +.cirrus_build_job:
> +  stage: build
> +  image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
> +  needs: []
> +  script:
> +    - source .gitlab-ci.d/cirrus/$NAME.vars
> +    - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
> +          -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
> +          -e "s|[@]CI_COMMIT_SHA@|$CI_COMMIT_SHA|g"
> +          -e "s|[@]CIRRUS_VM_INSTANCE_TYPE@|$CIRRUS_VM_INSTANCE_TYPE|g"
> +          -e "s|[@]CIRRUS_VM_IMAGE_SELECTOR@|$CIRRUS_VM_IMAGE_SELECTOR|g"
> +          -e "s|[@]CIRRUS_VM_IMAGE_NAME@|$CIRRUS_VM_IMAGE_NAME|g"
> +          -e "s|[@]CIRRUS_VM_CPUS@|$CIRRUS_VM_CPUS|g"
> +          -e "s|[@]CIRRUS_VM_RAM@|$CIRRUS_VM_RAM|g"
> +          -e "s|[@]UPDATE_COMMAND@|$UPDATE_COMMAND|g"
> +          -e "s|[@]INSTALL_COMMAND@|$INSTALL_COMMAND|g"
> +          -e "s|[@]PATH@|$PATH_EXTRA${PATH_EXTRA:+:}\$PATH|g"
> +          -e "s|[@]PKG_CONFIG_PATH@|$PKG_CONFIG_PATH|g"
> +          -e "s|[@]PKGS@|$PKGS|g"
> +          -e "s|[@]MAKE@|$MAKE|g"
> +          -e "s|[@]PYTHON@|$PYTHON|g"
> +          -e "s|[@]PIP3@|$PIP3|g"
> +          -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
> +          -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
> +          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
> +      <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
> +    - cat .gitlab-ci.d/cirrus/$NAME.yml
> +    - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
> +  rules:
> +    - if: "$TEMPORARILY_DISABLED"
> +      allow_failure: true
> +    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
> +
> +x64-freebsd-12-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: freebsd-12
> +    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image_family
> +    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
> +    CIRRUS_VM_CPUS: 8
> +    CIRRUS_VM_RAM: 8G
> +    UPDATE_COMMAND: pkg update
> +    INSTALL_COMMAND: pkg install -y
> +    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> +    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> +    CONFIGURE_ARGS: --disable-gnutls
> +    TEST_TARGETS: check
> +
> +x64-freebsd-13-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: freebsd-13
> +    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image_family
> +    CIRRUS_VM_IMAGE_NAME: freebsd-13-0
> +    CIRRUS_VM_CPUS: 8
> +    CIRRUS_VM_RAM: 8G
> +    UPDATE_COMMAND: pkg update
> +    INSTALL_COMMAND: pkg install -y
> +    TEST_TARGETS: check
> +
> +x64-macos-11-base-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: macos-11
> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image
> +    CIRRUS_VM_IMAGE_NAME: big-sur-base
> +    CIRRUS_VM_CPUS: 12
> +    CIRRUS_VM_RAM: 24G
> +    UPDATE_COMMAND: brew update
> +    INSTALL_COMMAND: brew install
> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
> +
> +x64-macos-11-xcode-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: macos-11
> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image
> +    CIRRUS_VM_IMAGE_NAME: big-sur-xcode
> +    CIRRUS_VM_CPUS: 12
> +    CIRRUS_VM_RAM: 24G
> +    UPDATE_COMMAND: brew update
> +    INSTALL_COMMAND: brew install
> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64

Not directly related to your patch, but I wonder whether we really gain much 
by having two macos build jobs in our CI ... they seem to be very similar, 
e.g. compare the output of the "configure" step of the "macos" and the 
"macos_xcode" job here:

  https://cirrus-ci.com/build/4919300914937856

The diff basically looks like this:

diff -u /tmp/macos.txt /tmp/macos_xcode.txt
--- /tmp/macos.txt	2021-06-28 09:18:48.218698482 +0200
+++ /tmp/macos_xcode.txt	2021-06-28 09:21:01.811348076 +0200
@@ -1,6 +1,6 @@
  mkdir build
  cd build
-../configure --python=/usr/local/bin/python3 --enable-werror 
--extra-cflags='-Wno-error=deprecated-declarations' || { cat config.log 
meson-logs/meson-log.txt; exit 1; }
+../configure --extra-cflags='-Wno-error=deprecated-declarations' 
--enable-modules --enable-werror --cc=clang || { cat config.log 
meson-logs/meson-log.txt; exit 1; }
  Disabling PIE due to missing toolchain support
  Submodule 'capstone' (https://gitlab.com/qemu-project/capstone.git) 
registered for path 'capstone'
  Submodule 'dtc' (https://gitlab.com/qemu-project/dtc.git) registered for 
path 'dtc'
@@ -23,18 +23,18 @@
  Build type: native build
  Project name: qemu
  Project version: 6.0.50
-C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 
12.0.0 (clang-1200.0.32.28)")
-C linker for the host machine: cc ld64 609.8
+C compiler for the host machine: clang (clang 12.0.0 "Apple clang version 
12.0.0 (clang-1200.0.32.27)")
+C linker for the host machine: clang ld64 609.7
  Host machine cpu family: x86_64
  Host machine cpu: x86_64
  ../meson.build:10: WARNING: Module unstable-keyval has no backwards or 
forwards compatibility and might not exist in future releases.
  Program sh found: YES
  Program python3 found: YES (/usr/local/opt/python@3.9/bin/python3.9)
  Program bzip2 found: YES
-C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 
12.0.0 (clang-1200.0.32.28)")
-C++ linker for the host machine: c++ ld64 609.8
+C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 
12.0.0 (clang-1200.0.32.27)")
+C++ linker for the host machine: c++ ld64 609.7
  Objective-C compiler for the host machine: clang (clang 12.0.0)
-Objective-C linker for the host machine: clang ld64 609.8
+Objective-C linker for the host machine: clang ld64 609.7
  Program cgcc found: NO
  Library m found: YES
  Library util found: YES
@@ -238,7 +238,7 @@
  Program diff found: YES
  Program dbus-daemon found: NO
  Program initrd-stress.sh found: YES
-Build targets in project: 534
+Build targets in project: 556

  qemu 6.0.50

@@ -273,7 +273,8 @@
                user-mode emulation: NO
                        block layer: YES
                      Install blobs: YES
-                   module support: NO
+                   module support: YES
+          alternative module path: NO
                     plugin support: NO
                    fuzzing support: NO
                      Audio drivers: coreaudio sdl
@@ -293,8 +294,8 @@
    Compilation
                           host CPU: x86_64
                    host endianness: little
-                       C compiler: cc
-                  Host C compiler: cc
+                       C compiler: clang
+                  Host C compiler: clang
                       C++ compiler: c++
               Objective-C compiler: clang
                            ARFLAGS: rv
@@ -376,7 +377,7 @@
                             pixman: YES
                        VTE support: NO
                      slirp support: internal
-                         libtasn1: NO
+                         libtasn1: YES
                                PAM: YES
                      iconv support: YES
                     curses support: NO
@@ -403,7 +404,7 @@
                     xfsctl support: NO
                  smartcard support: NO
                        U2F support: NO
-                           libusb: NO
+                           libusb: YES
                      usb net redir: NO
                     OpenGL support: NO
                                GBM: NO

... IMHO it's not worth wasting precious CI minutes here just because of 
those small differences, and I'd like to suggest that we continue with only 
on macos job in the future.

> diff --git a/.gitlab-ci.d/cirrus/README.rst b/.gitlab-ci.d/cirrus/README.rst
> new file mode 100644
> index 0000000000..657b0706d7
> --- /dev/null
> +++ b/.gitlab-ci.d/cirrus/README.rst
> @@ -0,0 +1,54 @@
> +Cirrus CI integration
> +=====================
> +
> +GitLab CI shared runners only provide a docker environment running on Linux.
> +While it is possible to provide private runners for non-Linux platforms this
> +is not something most contributors/maintainers will wish to do.
> +
> +To work around this limitation, we take advantage of `Cirrus CI`_'s free
> +offering: more specifically, we use the `cirrus-run`_ script to trigger Cirrus
> +CI jobs from GitLab CI jobs so that Cirrus CI job output is integrated into
> +the main GitLab CI pipeline dashboard.
> +
> +There is, however, some one-time setup required. If you want FreeBSD and macOS
> +builds to happen when you push to your GitLab repository, you need to
> +
> +* set up a GitHub repository for the project, eg. ``yourusername/qemu``.
> +  This repository needs to exist for cirrus-run to work, but it doesn't need to
> +  be kept up to date, so you can create it and then forget about it;
> +
> +* enable the `Cirrus CI GitHub app`_  for your GitHub account;
> +
> +* sign up for Cirrus CI. It's enough to log into the website using your GitHub
> +  account;
> +
> +* grab an API token from the `Cirrus CI settings`_ page;
> +
> +* it may be necessary to push an empty ``.cirrus.yml`` file to your github fork
> +  for Cirrus CI to properly recognize the project. You can check whether
> +  Cirrus CI knows about your project by navigating to:
> +
> +  ``https://cirrus-ci.com/yourusername/qemu``
> +
> +* in the *CI/CD / Variables* section of the settings page for your GitLab
> +  repository, create two new variables:
> +
> +  * ``CIRRUS_GITHUB_REPO``, containing the name of the GitHub repository
> +    created earlier, eg. ``yourusername/qemu``;
> +
> +  * ``CIRRUS_API_TOKEN``, containing the Cirrus CI API token generated earlier.
> +    This variable **must** be marked as *Masked*, because anyone with knowledge
> +    of it can impersonate you as far as Cirrus CI is concerned.
> +
> +  Neither of these variables should be marked as *Protected*, because in
> +  general you'll want to be able to trigger Cirrus CI builds from non-protected
> +  branches.
> +
> +Once this one-time setup is complete, you can just keep pushing to your GitLab
> +repository as usual and you'll automatically get the additional CI coverage.
> +
> +
> +.. _Cirrus CI GitHub app: https://github.com/marketplace/cirrus-ci
> +.. _Cirrus CI settings: https://cirrus-ci.com/settings/profile/
> +.. _Cirrus CI: https://cirrus-ci.com/
> +.. _cirrus-run: https://github.com/sio/cirrus-run/
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> new file mode 100644
> index 0000000000..857bdc5536
> --- /dev/null
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -0,0 +1,35 @@
> +@CIRRUS_VM_INSTANCE_TYPE@:
> +  @CIRRUS_VM_IMAGE_SELECTOR@: @CIRRUS_VM_IMAGE_NAME@
> +  cpu: @CIRRUS_VM_CPUS@
> +  memory: @CIRRUS_VM_RAM@
> +
> +env:
> +  CIRRUS_CLONE_DEPTH: 1
> +  CI_REPOSITORY_URL: "@CI_REPOSITORY_URL@"
> +  CI_COMMIT_REF_NAME: "@CI_COMMIT_REF_NAME@"
> +  CI_COMMIT_SHA: "@CI_COMMIT_SHA@"
> +  PATH: "@PATH@"
> +  PKG_CONFIG_PATH: "@PKG_CONFIG_PATH@"
> +  PYTHON: "@PYTHON@"
> +  MAKE: "@MAKE@"
> +  CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
> +
> +build_task:
> +  install_script:
> +    - @UPDATE_COMMAND@
> +    - @INSTALL_COMMAND@ @PKGS@
> +    - if test -n "@PYPI_PKGS@" ; then @PIP3@ install @PYPI_PKGS@ ; fi
> +  clone_script:
> +    - git clone --depth 100 "$CI_REPOSITORY_URL" .
> +    - git fetch origin "$CI_COMMIT_REF_NAME"
> +    - git reset --hard "$CI_COMMIT_SHA"
> +  build_script:
> +    - mkdir build
> +    - cd build
> +    - ../configure --enable-werror $CONFIGURE_ARGS
> +      || { cat config.log meson-logs/meson-log.txt; exit 1; }
> +    - $MAKE -j$(sysctl -n hw.ncpu)
> +    - for TARGET in $TEST_TARGETS ;
> +      do
> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
> +      done

You seem to try to enable ccache in the other files (e.g. by extending the 
PATH) ... however, I don't see where you try to save the ccache directory 
between the runs... so I guess that ccache won't be working with this setup 
yet? In that case, I'd recommend to rather drop the other ccache changes 
again, since the initial run with ccache (where the cache gets populated) is 
rather slower than compiling without ccache.

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0249B1B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:33:42 +0100 (CET)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJ8v-0004PK-DD
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCJ0K-0006F4-0f
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCJ0E-0004f8-E4
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKmRQGJ3Az1ePxP0DdygxtWNE2BbFYBTFDWYXr/iEXE=;
 b=WSDGfQlKj0Y/++5AvMvmKtJ6Q36qiKloA0BdTbFSaecCt+cGDobPPsxrsOEjRjARy+GEa+
 Bj/JCMl4080O+6NgUSxXDERO77mp0xulIrcnXlc9fboqBjjxdD2bfS8WF5z3EUQe2SSzPn
 DHppoF/1Dc5PJHnDqV9db+c23cc6CYo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-mpsB_RxqNS2_lui3OcSmBA-1; Tue, 25 Jan 2022 05:23:43 -0500
X-MC-Unique: mpsB_RxqNS2_lui3OcSmBA-1
Received: by mail-wr1-f72.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2837881wrr.13
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fKmRQGJ3Az1ePxP0DdygxtWNE2BbFYBTFDWYXr/iEXE=;
 b=ZmVrUtRMS1TXzS1uYw3ifnx7W7UD/9kqj0a91HDnalvL5IFVH3wWdPoQhA+Tw5loE+
 8pk/ea+VLj0Rf2cBybS09TofNGzvRIotff8kX/onesVVW3LLX/5l2mP7/sq7VjxBW91D
 MRIsifJm2n/IEt0XV8Uuh+Wb3IsRZ3vI64fmrkTbRji/v4HRZYKB51cYG74MXbt6MaWI
 3FpaMHxt30geBzP96UQ0Rm4DTsAO8oT6t3NFkVuXyA/bTMlUDlJhZww/jyue7Ygz4s+E
 Gvq9GFpii8UrbAJ4jmbEB3BQAs+fxlzX2DcT98dWGLuXVSvbUAzrX4B+FeKDYI/42B3b
 Nn6A==
X-Gm-Message-State: AOAM531x5QziQ2Viie0t6vCXZh+1ai8tDL8PoIaxPzqigQojM3k28ZsI
 tEsuiRmWpl8XuF1s913+c1yixilo6PgYnGa7PjtCEL+p6AjwK0l0cSEforDTIlho2bJQsm0mlba
 0UcZESrgLzwlk3ao=
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr5914900wry.486.1643106221945; 
 Tue, 25 Jan 2022 02:23:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhx5Ur7d1nTBFsWG2Squ5DtgiZw4WW6XXBsBGM43a6hQDIdEu9plp6lqko1IlvKfjPgyuuWQ==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr5914883wry.486.1643106221749; 
 Tue, 25 Jan 2022 02:23:41 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id y15sm20107789wry.36.2022.01.25.02.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:23:41 -0800 (PST)
Message-ID: <bc4a5a11-ad31-0e63-072e-39b49628c77d@redhat.com>
Date: Tue, 25 Jan 2022 11:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 09/22] tests/lcitool: Refresh submodule and remove
 libxml2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124201608.604599-10-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Warner Losh <imp@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 21.15, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The previous commit removed all uses of libxml2.
> 
> Refresh lcitool submodule, update qemu.yml and refresh the generated
> files by running:
> 
>    $ make lcitool-refresh
> 
> Note: This refreshment also removes libudev dependency on Fedora
> and CentOS due to libvirt-ci commit 18bfaee ("mappings: Improve
> mapping for libudev"), since "The udev project has been absorbed
> by the systemd project", and lttng-ust on FreeBSD runners due to
> libvirt-ci commit 6dd9b6f ("guests: drop lttng-ust from FreeBSD
> platform").
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220121154134.315047-6-f4bug@amsat.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>   .gitlab-ci.d/cirrus/macos-11.vars             | 2 +-
>   tests/docker/dockerfiles/alpine.docker        | 4 ++--
>   tests/docker/dockerfiles/centos8.docker       | 4 +---
>   tests/docker/dockerfiles/fedora.docker        | 4 +---
>   tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>   tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>   tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>   tests/lcitool/libvirt-ci                      | 2 +-
>   tests/lcitool/projects/qemu.yml               | 1 -
>   11 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 9c52266811..07f313aa3a 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>   PYPI_PKGS=''
>   PYTHON='/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
> index 7b44dba324..8a648dda1e 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>   NINJA='/usr/local/bin/ninja'
>   PACKAGING_COMMAND='pkg'
>   PIP3='/usr/local/bin/pip-3.8'
> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'

Seems like this now also added fusefs-libs3 on FreeBSD which causes the 
build to break:

  https://gitlab.com/thuth/qemu/-/jobs/2012083924#L3454

Any ideas how to best fix this?

  Thomas



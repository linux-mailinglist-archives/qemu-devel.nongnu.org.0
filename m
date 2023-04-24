Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B416ED63A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:42:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr30V-0002H7-0k; Mon, 24 Apr 2023 16:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr30S-0002Gj-Aj
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr30P-0001Q4-Ql
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682368908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhb+5BS3xz4WdYrLb/K7d4befNgGZRqpAPj6EArGY90=;
 b=XzjFsAAjpfJ8VEFaSm0dfktJR6O+4oWBJoVEQSj5H5fdZXGhnLhqS2mkdt5YJwQ4wfsNsV
 3H98XFLVI7gijK7T3CF1Xh8K0/X5rt4sIYS6sHPNemT3YE5AsE2KKAxwVv/NPxkxMU9PfM
 TwQCTXOUFCYgyPcL7dRDQCwBMS0MGO0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-n86qqYgvO9a5sZ-4jNhsOw-1; Mon, 24 Apr 2023 16:41:47 -0400
X-MC-Unique: n86qqYgvO9a5sZ-4jNhsOw-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-63d30b08700so25751882b3a.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 13:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682368906; x=1684960906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhb+5BS3xz4WdYrLb/K7d4befNgGZRqpAPj6EArGY90=;
 b=LlJlwt4v+MYYQqZSIIhgwq/9W0CnKULpizcVH44wAXWhiDwjyklxraAa2S/VvlRyPq
 /CaJwQjP8wWTSbZO9QvH4oBW8N7ZBNK7rbEDCosD7Byd2g1luPy08nlYhBDKBNix5DXI
 MAX+ySK0KTZmbVMHsrffbbChFJXKVCfHsH+hgQQrhSh5O8r4UiCQObZFGZN5Q4GE7YSg
 fE4yknuQ5R1tB9y941MfQcl2qyNj2aecbp7pi4rqPivoyhWnDvWzGhKJm/WEaWeSLTU0
 X3RjaXscCCHMnH4NLgXVv9MFzO3xSH5ye/FYJ2bfA3nluz+4U4gVjzktKVP1v2avXoV5
 AoDQ==
X-Gm-Message-State: AAQBX9chptcDbt/qloJZqEj8FbTa8VZAVlF/gTWbBLdoBbH+47WNKGLx
 2VMLCtopTzuL7H9UoZ3M5A0BpHrA4B8LFNVsK4iUyEMqcJTCQ/5kuQWje+dooLTp1czMagDrYlC
 mnlkH4ZqRJPaK61VdleCSSiVuVpwNCpc=
X-Received: by 2002:a17:90a:9285:b0:246:5787:6f5d with SMTP id
 n5-20020a17090a928500b0024657876f5dmr23350777pjo.10.1682368905926; 
 Mon, 24 Apr 2023 13:41:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350bPBtvwbDNj5gD5JHsKt78RZe1K3E227trDr9IzwqzdNt9rrroeZQkUSQqsgRhkgvn4Zd2HjWDjOGoWi08YDcw=
X-Received: by 2002:a17:90a:9285:b0:246:5787:6f5d with SMTP id
 n5-20020a17090a928500b0024657876f5dmr23350736pjo.10.1682368905514; Mon, 24
 Apr 2023 13:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-15-jsnow@redhat.com>
 <CANCZdfrmJtZBCf55hvQ48k9jguEvhrntVCYiqkjDx2BwYJOa-Q@mail.gmail.com>
In-Reply-To: <CANCZdfrmJtZBCf55hvQ48k9jguEvhrntVCYiqkjDx2BwYJOa-Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 24 Apr 2023 16:41:34 -0400
Message-ID: <CAFn=p-ZJkEZaujHfCdgNYvTw70rMTrFLgB0EW32a-v0UexgVRg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 14/20] configure: use 'mkvenv ensure meson' to
 bootstrap meson
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 24, 2023 at 4:36=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Mon, Apr 24, 2023, 2:03 PM John Snow <jsnow@redhat.com> wrote:
>>
>> This commit changes how we detect and install meson. It notably removes
>> '--meson=3D'.
>>
>> The previous patch creates a lightweight Python virtual environment
>> unconditionally using the user's configured $python that inherits system
>> packages. If Meson is installed there and meets our minimum version
>> requirements, we will use that Meson.
>>
>> In the event that Meson is installed but *not for the chosen Python
>> interpreter*, not found, or of insufficient version, we will attempt to
>> install Meson from vendored source into the newly created Python virtual
>> environment. This vendored installation is considered to replace the
>> mechanism from prior tarball distributions.
>>
>> This commit restores the ability to use a system meson, but in turn
>> temporarily removes the ability to use a meson as obtained from the
>> internet at configure-time (git submodules, as it stood prior to this
>> patch); that ability will be restored in the next commit.
>>
>> As a result of this patch, the Python interpreter we use for both our
>> own build scripts *and* Meson extensions are always known to be the
>> exact same Python. As a further benefit, there will also be a symlink
>> available in the build directory that points to the correct, configured
>> python and can be used by e.g. manual tests to invoke the correct,
>> configured Python unambiguously.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  configure                           | 72 ++++++++---------------------
>>  .gitlab-ci.d/buildtest-template.yml |  4 +-
>>  2 files changed, 21 insertions(+), 55 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 462fe604d6..e9947369b2 100755
>> --- a/configure
>> +++ b/configure
>> @@ -731,8 +731,6 @@ for opt do
>>    ;;
>>    --skip-meson) skip_meson=3Dyes
>>    ;;
>> -  --meson=3D*) meson=3D"$optarg"
>> -  ;;
>>    --ninja=3D*) ninja=3D"$optarg"
>>    ;;
>>    --smbd=3D*) smbd=3D"$optarg"
>> @@ -1016,7 +1014,6 @@ Advanced options (experts only):
>>    --cross-prefix-ARCH=3DPREFIX cross compiler prefix when building ARCH=
 guest test cases
>>    --make=3DMAKE              use specified make [$make]
>>    --python=3DPYTHON          use specified python [$python]
>> -  --meson=3DMESON            use specified meson [$meson]
>>    --ninja=3DNINJA            use specified ninja [$ninja]
>>    --smbd=3DSMBD              use specified smbd [$smbd]
>>    --with-git=3DGIT           use specified git [$git]
>> @@ -1089,7 +1086,8 @@ fi
>>
>>  # Resolve PATH
>>  python=3D"$(command -v "$python")"
>> -explicit_python=3Dyes
>> +# This variable is intended to be used only for error messages:
>> +target_python=3D$python
>>
>>  # Create a Python virtual environment using our configured python.
>>  # The stdout of this script will be the location of a symlink that
>> @@ -1101,7 +1099,6 @@ explicit_python=3Dyes
>>  # - venv is cleared if it exists already;
>>  # - venv is allowed to use system packages;
>>  # - all setup is performed **offline**;
>> -# - No packages are installed by default;
>>  # - pip is not installed into the venv when possible,
>>  #   but ensurepip is called as a fallback when necessary.
>>
>> @@ -1116,58 +1113,27 @@ fi
>>  # Suppress writing compiled files
>>  python=3D"$python -B"
>>
>> -has_meson() {
>> -  local python_dir=3D$(dirname "$python")
>> -  # PEP405: pyvenv.cfg is either adjacent to the Python executable
>> -  # or one directory above
>> -  if test -f $python_dir/pyvenv.cfg || test -f $python_dir/../pyvenv.cf=
g; then
>> -    # Ensure that Meson and Python come from the same virtual environme=
nt
>> -    test -x "$python_dir/meson" &&
>> -      test "$(command -v meson)" -ef "$python_dir/meson"
>> -  else
>> -    has meson
>> -  fi
>> -}
>>
>> -if test -z "$meson"; then
>> -    if test "$explicit_python" =3D no && has_meson && version_ge "$(mes=
on --version)" 0.61.5; then
>> -        meson=3Dmeson
>> -    elif test "$git_submodules_action" !=3D 'ignore' ; then
>> -        meson=3Dgit
>> -    elif test -e "${source_path}/meson/meson.py" ; then
>> -        meson=3Dinternal
>> -    else
>> -        if test "$explicit_python" =3D yes; then
>> -            error_exit "--python requires using QEMU's embedded Meson d=
istribution, but it was not found."
>> -        else
>> -            error_exit "Meson not found.  Use --meson=3D/path/to/meson"
>> -        fi
>> +if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
>> +     --dir "${source_path}/python/wheels" \
>> +     "meson>=3D0.61.5" ;
>> +then
>> +    # We're very out of luck. Try to give a good diagnostic.
>> +    if test -e pyvenv/bin/meson; then
>> +        echo "Meson is too old:
>
>
> Does a minimum version still get printed? I've needed to know that in the=
 past when I got the error...
>
> Warner
>  $(pyvenv/bin/meson --version)"

At the end of the series, here's what happens if i change the meson
requirement to a fictionally too-high version that would be impossible
to fulfill:

---------------------------------------------------------------------------=
-----
jsnow@scv ~/s/q/b/git (python-configure-venv)> ../../configure
--enable-debug --disable-pypi;
python determined to be '/usr/bin/python3'
python version: Python 3.11.2
MKVENV pyvenv
MKVENV ensure meson>=3D2.61.5
ERROR: Could not find a version that satisfies the requirement
meson>=3D2.61.5 (from versions: none)
ERROR: No matching distribution found for meson>=3D2.61.5

*** Ouch! ***

Could not ensure availability of 'meson>=3D2.61.5':
 =E2=80=A2 Python package 'meson' version '1.0.1' was found, but isn't suit=
able.
 =E2=80=A2 No suitable version found in, or failed to install from
'/home/jsnow/src/qemu/python/wheels'.
 =E2=80=A2 mkvenv was configured to operate offline and did not check PyPI.
---------------------------------------------------------------------------=
-----



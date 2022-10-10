Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B95F9FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:54:46 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtEz-0007Pe-6Q
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oht9m-0003ca-6c
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:49:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oht9g-0007Vk-Lj
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:49:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f11so17158495wrm.6
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhJXZKi9i836/v6eLeGNGvows+myixEcDMRhAAY3sCk=;
 b=lsO9NvW+XOjuhXNACAhAw1IrJUA6BTflhk5Nd+XBMYu8ANTbp9KnCIPzSNrE4qRFap
 l3XobFMUxiQyn4tAp8Q8hF2tBpu6nIvA00RHLyfGHi3v7uqkx1ycSHzRyFEdng44XxvY
 3sH4FHmKGnaSINcDe726d6+Qb4/Jel5yhj5ZbkG85Ztl56dBHnWVPfH68YFKBBr52dg3
 VJ2Wq/zh1xX4/SWmwHg/StjYLdhsdBfylB19c/crxp9GpxTraGQJ5MrqPiuhZ36SEsq1
 dkh0PUn590SweS8Oz02mPl20FNnXt5YdPmyZv2sgrfLF+3Kexgyh+dqC+KQjSaBDR5XD
 g4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HhJXZKi9i836/v6eLeGNGvows+myixEcDMRhAAY3sCk=;
 b=mPZT4LJ8FvVRYeIPkVocsEPXkKEjTylhx6+F8JwjBzof+xyG7jqNhGXrMLShR6rxHh
 IOLI+QlmWlT6iass+r8iikF305lwTePfXIzDhaXYzg6pIzGhAV+TNhNmDnE/kOricvoW
 oT9mKuZXZO7kEBEA3u/3NiQN9W77tKvRVdq2XwVPUMedexBDUqvpVAmEnxBPGdTJUyMG
 +1KPsonJcjfzYEoJUAMNnzJwO1lxWcynAShnSztxiuJe+FWHkxoQwxbIIKxVlicM6sGr
 bbeR38Y1IuSLn7ZmYryZo4WO4QLjmNF3PL9G2eHW5gC7gL/vRY2D0UnAp0V6AjRS5V19
 x+Xw==
X-Gm-Message-State: ACrzQf0tUG4GzgYx98Duppt8SDeoqQLE33YQ/dVwKHYr2zw+Jsbr+P6c
 qE1T51AwDOZfWUkNOesKyIX05DmpGZ9c4Q==
X-Google-Smtp-Source: AMsMyM6msD/hyio733YLEcLSvm0IejawXcUkcZNH3EgoEgliqjf+q6u7goordkuaOKSp+/nQkMFstw==
X-Received: by 2002:a5d:474b:0:b0:22e:3180:f748 with SMTP id
 o11-20020a5d474b000000b0022e3180f748mr10840265wrs.504.1665409754184; 
 Mon, 10 Oct 2022 06:49:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020adfe805000000b00228cd9f6349sm8934861wrm.106.2022.10.10.06.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 06:49:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF3541FFB7;
 Mon, 10 Oct 2022 14:49:12 +0100 (BST)
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-29-alex.bennee@linaro.org>
 <Y0QV+B+Wz6fxceh1@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PULL 28/54] configure: build ROMs with container-based cross
 compilers
Date: Mon, 10 Oct 2022 14:47:15 +0100
In-reply-to: <Y0QV+B+Wz6fxceh1@redhat.com>
Message-ID: <87v8orss9z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Oct 04, 2022 at 02:01:12PM +0100, Alex Benn=C3=A9e wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>=20
>> s390-ccw remains a bit more complex, because the -march=3Dz900 test is d=
one
>> only for the native cross compiler.  Otherwise, all that is needed is
>> to pass the (now mandatory) target argument to write_target_makefile.
>>=20
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>
>
> I'm not at all convinced this change was/is a good idea.
>
> First of all, it causes 'make' to now download about 1 GB of
> container images
>
>   $ ./configure --target-list=3Dx86_64-softmmu
>   $ make
>   ...snip...
>   BUILD   debian-powerpc-test-cross
>   Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-powerp=
c-test-cross:latest...
>   Getting image source signatures
>   Copying blob 2a205c8a1d36 [=3D>------------------------------------] 12=
.4MiB / 257.2MiB
>
>   ...
>   ...snip...
>=20=20=20
> Despite downloading this image, it then proceeded to rebuild the
> image from scratch, requiring another few 100MBs of downloads
> of dpkgs. This time the download was without progress information
> until it entirely failed due to a dead Debia mirror server, needing
> a retry.
>
> It then went on to download an s390x image which seems to have
> two layers, each with 360 MB.
>
>   BUILD   debian-s390x-cross
> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cr=
oss:latest...
> Getting image source signatures
> Copying blob fc8d65e34cd5 [>-------------------------------------] 12.0Mi=
B / 360.2MiB
> Copying blob bd159e379b3b skipped: already exists=20=20
> Copying blob 13224e2971af [>-------------------------------------] 12.2Mi=
B / 366.5MiB
>
> So overall it was more than 1 GB of downloads when typing 'make'
>
> I wasn't too amuzed by seeing this downloaded data , given that
> I'm usually running off a 4G mobile connection, and it took a
> very long time.

Yikes, sorry I didn't notice that (probably because I always have most
of the containers built).

I was hoping the next set of patches would reduce the total re-build
time to just the mirror operation by dumping docker.py and any caching
that breaks.

> The progress information printed by docker when downloading
> the images splatters all over the output meson displays, when
> doing a parallel make making everything unintelligible.
>
>
> Finally, I had requested only building x86_64, so we shouldn't
> be doing anything related to ppc or s390 at all, but even if
>
> AFAICT, it enables this downloading unconditionally merely by
> having 'docker'/'podman' binaries installed, if you don't
> otherwise have cross compuilers present.
>
> I'd really not want to see any of this stuff downloaded without
> an explicit opt-in choice at configure time.
>
> I'm also a little concerned at what happens if we have to stop
> publishing the containers at registry.gitlab.com in future. Are
> we going to break the default 'make' for existing released QEMU
> tarballs ?

We can easily move the registry around. The aim of this work is to
eventually stop local re-builds for most people.

>
> Generally we've only relied on the gitlab infra for our CI
> testing, so we have been free to change infra or alter the
> way we publish images at any time, without risk of impact on
> the released tarballs.
>
> This isn't a theoretical problem, because GitLab has announced
> their intention to limit storage usage in gitlab.com, and even
> having joined the Open Source Program, our quota is only increased
> from 5 GB to 25 GB.  I'd be concerned we're at risk of exceeding
> that 25 GB limit, when they start to enforce it, requiring us to
> move container image host to somewhere else such as quay.io
>
>
>> diff --git a/configure b/configure
>> index c175650eb9..a54e17aca9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2152,7 +2152,7 @@ probe_target_compiler() {
>>      target_ranlib=3D
>>      target_strip=3D
>>    fi
>> -  test -n "$target_cc"
>> +  test -n "$target_cc" || test -n "$container_image"
>>  }
>>=20=20
>>  write_target_makefile() {
>> @@ -2307,7 +2307,7 @@ if test "$targetos" !=3D "darwin" && test "$target=
os" !=3D "sunos" && \
>>      config_mak=3Dpc-bios/optionrom/config.mak
>>      echo "# Automatically generated by configure - do not modify" > $co=
nfig_mak
>>      echo "TOPSRC_DIR=3D$source_path" >> $config_mak
>> -    write_target_makefile >> $config_mak
>> +    write_target_makefile pc-bios/optionrom/all >> $config_mak
>>  fi
>>=20=20
>>  if test "$softmmu" =3D yes && probe_target_compiler ppc-softmmu; then
>> @@ -2315,25 +2315,31 @@ if test "$softmmu" =3D yes && probe_target_compi=
ler ppc-softmmu; then
>>      config_mak=3Dpc-bios/vof/config.mak
>>      echo "# Automatically generated by configure - do not modify" > $co=
nfig_mak
>>      echo "SRC_DIR=3D$source_path/pc-bios/vof" >> $config_mak
>> -    write_target_makefile >> $config_mak
>> +    write_target_makefile pc-bios/vof/all >> $config_mak
>>  fi
>>=20=20
>>  # Only build s390-ccw bios if the compiler has -march=3Dz900 or -march=
=3Dz10
>>  # (which is the lowest architecture level that Clang supports)
>>  if test "$softmmu" =3D yes && probe_target_compiler s390x-softmmu; then
>> -  write_c_skeleton
>> -  do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -c =
$TMPC
>> -  has_z900=3D$?
>> -  if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflags =
-march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>> -    if [ $has_z900 !=3D 0 ]; then
>> -      echo "WARNING: Your compiler does not support the z900!"
>> -      echo "         The s390-ccw bios will only work with guest CPUs >=
=3D z10."
>> +  got_cross_cc=3Dno
>> +  if test -n "$target_cc"; then
>> +    write_c_skeleton
>> +    do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 -o $TMPO -=
c $TMPC
>> +    has_z900=3D$?
>> +    if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $target_cc_cflag=
s -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>> +      if [ $has_z900 !=3D 0 ]; then
>> +        echo "WARNING: Your compiler does not support the z900!"
>> +        echo "         The s390-ccw bios will only work with guest CPUs=
 >=3D z10."
>> +      fi
>> +      got_cross_cc=3Dyes
>>      fi
>> +  fi
>> +  if test "$got_cross_cc" =3D yes || test -n "$container_image"; then
>>      roms=3D"$roms pc-bios/s390-ccw"
>>      config_mak=3Dpc-bios/s390-ccw/config-host.mak
>>      echo "# Automatically generated by configure - do not modify" > $co=
nfig_mak
>>      echo "SRC_PATH=3D$source_path/pc-bios/s390-ccw" >> $config_mak
>> -    write_target_makefile >> $config_mak
>> +    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>>      # SLOF is required for building the s390-ccw firmware on s390x,
>>      # since it is using the libnet code from SLOF for network booting.
>>      git_submodules=3D"${git_submodules} roms/SLOF"
>> @@ -2554,7 +2560,7 @@ for target in $target_list; do
>>        ;;
>>    esac
>>=20=20
>> -  if probe_target_compiler $target || test -n "$container_image"; then
>> +  if probe_target_compiler $target; then
>>        test -n "$container_image" && build_static=3Dy
>>        mkdir -p "tests/tcg/$target"
>>        config_target_mak=3Dtests/tcg/$target/config-target.mak
>> --=20
>> 2.34.1
>>=20
>>=20
>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e


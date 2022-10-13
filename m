Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C045FDD51
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:41:41 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0L6-0000s5-1X
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0Jo-0007Br-Kc
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:40:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0Jl-0005Ys-19
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:40:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u10so3478450wrq.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPy9JyyvDCwakG/a/3zSI/Y5Hr/T/fyfc0uohzD8Slw=;
 b=ZiY2sa3MRNiaNSZpy3zF4WMsCCVzGxRKo9mdgTmTz26PqMpCCJiiqG/+LSDbfj1r+A
 mqMcQquYvWUft8lR/T02QAvPGyCdkQH8EbuUTVlLtm4QoM8uhb0I5XQQIgJeeW0/KSso
 x5GDTRfg08WrEdA+xQXX27mOzIw6zi7Vk/ukh4zDol8E7icaPuzqffwH2KT9DWeMU95L
 mYnzw69yifCfJSX0R8rwV486p9TqiOWerIRcZLHrqmwqvoofWOyt5deB0PY78FYAg8Ft
 BEZjHcS+Vr6jbyvaHuG5isWOy3+SswmhDNh8xAvTyXk6jATcXSrG/2SDZDfx7MuXQyy9
 fJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UPy9JyyvDCwakG/a/3zSI/Y5Hr/T/fyfc0uohzD8Slw=;
 b=ViC6T2+aW13ojdb6jG3TRFBnoDrt8PnAXO+Q/puU8XF6DWygdAqcokwtkfToLtdge0
 ERTAofFvqJeXhnWEJgsdBpZsqMnLSCYMPqnpujSqHQeCS6TTX92Oej/uTNPtJE2FgcMe
 rL81vVRj/mRCuouJvIBeQi1hrIwuwWc1uP4qqtz6PprA47fiawj+IvK41pYBe9/vxAlR
 u2vFqOFRSFFPjXQ8ahlnId4SN6dzyN6Awi41fO85SGd7d7olvFgHiIvz8OxNHMlzQkqL
 KRp9LubIe5yvbWduhLPbtqKxqd/alX9/Xq7HjTCASYJOISwOQpBX1BW0+g+hxeiQhckf
 k7Dg==
X-Gm-Message-State: ACrzQf34bKceOyHYEJ+7ulZXs5V8Pilcy+dwVwstUIjET8jJgm1VURY+
 svWIEKjX458Y58gOLxx+a7rudg==
X-Google-Smtp-Source: AMsMyM7T+I3VOtnR1wU+SWCL0XUDHDELlc7eQ6U1zJ7UkXeb1Q7ifr23g6qDD4lJf8+6tbdY/ZA81Q==
X-Received: by 2002:adf:eb41:0:b0:22e:fb16:cc43 with SMTP id
 u1-20020adfeb41000000b0022efb16cc43mr362406wrn.489.1665675614511; 
 Thu, 13 Oct 2022 08:40:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h15-20020adffd4f000000b0022ae0965a8asm2224903wrs.24.2022.10.13.08.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:40:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71E691FFB7;
 Thu, 13 Oct 2022 16:40:13 +0100 (BST)
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <43330b01-01bb-e6db-1fb8-e737e1f92759@gmail.com>
 <87czaxqlvd.fsf@linaro.org>
 <469324d0-64d2-e794-8a9c-53afb7ec795f@gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Date: Thu, 13 Oct 2022 16:39:21 +0100
In-reply-to: <469324d0-64d2-e794-8a9c-53afb7ec795f@gmail.com>
Message-ID: <87fsfrpw9u.fsf@linaro.org>
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


Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 10/12/22 09:13, Alex Benn=C3=A9e wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>=20
>>> On 10/12/22 03:46, Paolo Bonzini wrote:
>>>> Il mar 11 ott 2022, 21:29 Alex Benn=C3=A9e <alex.bennee@linaro.org
>>>> <mailto:alex.bennee@linaro.org>> ha scritto:
>>>>      This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
>>>>      Unconditionally building all the bios for all arches was a
>>>> little too
>>>>      far too fast.
>>>> I would like to understand the issue better, because chances are
>>>> that it is preexisting and applies to the TCG tests as well.
>>>> Daniel, does building the TCG tests work for you? If not, I think we
>>>> should just disable containers by default.
>>>
>>>
>>> 'make check-tcg' never worked in this particular Xeon host I use. I nev=
er
>>> had the curiosity to find out why because I have access to a Power9 host
>>> that runs 'make check-tcg'.
>>>
>>> Using this revert patch on top of master in this Xeon box makes 'make -=
j'
>>> successful and 'make check-tcg' fails with the following error:

What are you running on the Xeon machine? I think it indicates you have
podman but it can't do rootless builds (which I think is the whole point
of podman). I can try an replicate your setup and make the docker.py
probe a bit more robust.

>>>
>>>
>>> $ make -j
>>>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp=
/berkeley-softfloat-3 dtc
>>> [1/24] Generating qemu-version.h with a custom command (wrapped by meso=
n to capture output)
>>>
>>> $ make check-tcg
>>>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp=
/berkeley-softfloat-3 dtc
>>>    BUILD   debian-powerpc-test-cross
>>>    BUILD   ppc64-linux-user guest-tests
>>> Traceback (most recent call last):
>>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 683, in <mod=
ule>
>>>      sys.exit(main())
>>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 679, in main
>>>      return args.cmdobj.run(args, argv)
>>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 657, in run
>>>      return Docker().run(cmd, False, quiet=3Dargs.quiet,
>>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 370, in run
>>>      ret =3D self._do_check(["run", "--rm", "--label",
>>>    File "/home/danielhb/qemu/tests/docker/docker.py", line 247, in _do_=
check
>>>      return subprocess.check_call(self._command + cmd, **kwargs)
>>>    File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
>>>      raise CalledProcessError(retcode, cmd)
>>> subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--la=
bel', 'com.qemu.instance.uuid=3Dcf15761c98884d0a9b4e37f631ba593f', '--usern=
s=3Dkeep-id', '-u', '1005', '-w', '/home/danielhb/qemu/build/tests/tcg/ppc6=
4-linux-user', '-v', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:=
/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:rw', '-v', '/home/dani=
elhb/qemu:/home/danielhb/qemu:ro,z', 'qemu/debian-powerpc-test-cross', 'pow=
erpc64-linux-gnu-gcc-10', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-ali=
asing', '-m64', '-mbig-endian', '/home/danielhb/qemu/tests/tcg/multiarch/fl=
oat_convd.c', '/home/danielhb/qemu/tests/tcg/multiarch/libs/float_helpers.c=
', '-o', 'float_convd', '-static', '-lm']' returned non-zero exit status 12=
7.
>>> filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3Dcf15761c98884d0a9b=
4e37f631ba593f
>>> make[1]: *** [/home/danielhb/qemu/tests/tcg/multiarch/Makefile.target:2=
6: float_convd] Error 1
>>> make: *** [/home/danielhb/qemu/tests/Makefile.include:50: build-tcg-tes=
ts-ppc64-linux-user] Error 2
>>>
>>>
>>> This is very similar to the error message I get when running 'make -j' =
on mainline
>>> without this revert.
>>>
>>> So yeah, I guess we can say this is a preexisting condition that I alwa=
ys saw with
>>> 'make check-tcg' in this particular host, and 730fe750fba just made it =
manifest when
>>> running a plain 'make'.
>>>
>>>
>>> Thanks,
>>>
>>>
>>> Daniel
>>>
>>>
>>>>      Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org
>>>> <mailto:alex.bennee@linaro.org>>
>>>>      Cc: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.co=
m>>
>>>>      Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com <mail=
to:danielhb413@gmail.com>>
>>>>      Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto=
:danielhb413@gmail.com>>
>>>>      Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org <mail=
to:20221011113417.794841-4-alex.bennee@linaro.org>>
>>>>      diff --git a/configure b/configure
>>>>      index baa69189f0..45ee6f4eb3 100755
>>>>      --- a/configure
>>>>      +++ b/configure
>>>>      @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>>>>       =C2=A0 =C2=A0 =C2=A0target_ranlib=3D
>>>>       =C2=A0 =C2=A0 =C2=A0target_strip=3D
>>>>       =C2=A0 =C2=A0fi
>>>>      -=C2=A0 test -n "$target_cc" || test -n "$container_image"
>>>>      +=C2=A0 test -n "$target_cc"
>>>>       =C2=A0}
>>>>       =C2=A0write_target_makefile() {
>>>>      @@ -2268,7 +2268,7 @@ if test "$targetos" !=3D "darwin" && test "=
$targetos" !=3D "sunos" && \
>>>>       =C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/optionrom/config.mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "# Automatically generated by configure=
 - do not modify" > $config_mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "TOPSRC_DIR=3D$source_path" >> $config_=
mak
>>>>      -=C2=A0 =C2=A0 write_target_makefile pc-bios/optionrom/all >> $co=
nfig_mak
>>>>      +=C2=A0 =C2=A0 write_target_makefile >> $config_mak
>>>>       =C2=A0fi
>>>>       =C2=A0if test "$softmmu" =3D yes && probe_target_compiler ppc-so=
ftmmu;
>>>> then
>>>>      @@ -2276,31 +2276,25 @@ if test "$softmmu" =3D yes && probe_targe=
t_compiler ppc-softmmu; then
>>>>       =C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/vof/config.mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "# Automatically generated by configure=
 - do not modify" > $config_mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "SRC_DIR=3D$source_path/pc-bios/vof" >>=
 $config_mak
>>>>      -=C2=A0 =C2=A0 write_target_makefile pc-bios/vof/all >> $config_m=
ak
>>>>      +=C2=A0 =C2=A0 write_target_makefile >> $config_mak
>>>>       =C2=A0fi
>>>>       =C2=A0# Only build s390-ccw bios if the compiler has -march=3Dz9=
00 or
>>>> -march=3Dz10
>>>>       =C2=A0# (which is the lowest architecture level that Clang suppo=
rts)
>>>>       =C2=A0if test "$softmmu" =3D yes && probe_target_compiler s390x-=
softmmu; then
>>>>      -=C2=A0 got_cross_cc=3Dno
>>>>      -=C2=A0 if test -n "$target_cc"; then
>>>>      -=C2=A0 =C2=A0 write_c_skeleton
>>>>      -=C2=A0 =C2=A0 do_compiler "$target_cc" $target_cc_cflags -march=
=3Dz900 -o $TMPO -c $TMPC
>>>>      -=C2=A0 =C2=A0 has_z900=3D$?
>>>>      -=C2=A0 =C2=A0 if [ $has_z900 =3D 0 ] || do_compiler "$target_cc"=
 $target_cc_cflags -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>>      -=C2=A0 =C2=A0 =C2=A0 if [ $has_z900 !=3D 0 ]; then
>>>>      -=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "WARNING: Your compiler does no=
t support the z900!"
>>>>      -=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0The s390-ccw bios will only work with guest CPUs >=3D z10."
>>>>      -=C2=A0 =C2=A0 =C2=A0 fi
>>>>      -=C2=A0 =C2=A0 =C2=A0 got_cross_cc=3Dyes
>>>>      +=C2=A0 write_c_skeleton
>>>>      +=C2=A0 do_compiler "$target_cc" $target_cc_cflags -march=3Dz900 =
-o $TMPO -c $TMPC
>>>>      +=C2=A0 has_z900=3D$?
>>>>      +=C2=A0 if [ $has_z900 =3D 0 ] || do_compiler "$target_cc" $targe=
t_cc_cflags -march=3Dz10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>>      +=C2=A0 =C2=A0 if [ $has_z900 !=3D 0 ]; then
>>>>      +=C2=A0 =C2=A0 =C2=A0 echo "WARNING: Your compiler does not suppo=
rt the z900!"
>>>>      +=C2=A0 =C2=A0 =C2=A0 echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The=
 s390-ccw bios will only work with guest CPUs >=3D z10."
>>>>       =C2=A0 =C2=A0 =C2=A0fi
>>>>      -=C2=A0 fi
>>>>      -=C2=A0 if test "$got_cross_cc" =3D yes || test -n "$container_im=
age"; then
>>>>       =C2=A0 =C2=A0 =C2=A0roms=3D"$roms pc-bios/s390-ccw"
>>>>       =C2=A0 =C2=A0 =C2=A0config_mak=3Dpc-bios/s390-ccw/config-host.mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "# Automatically generated by configure=
 - do not modify" > $config_mak
>>>>       =C2=A0 =C2=A0 =C2=A0echo "SRC_PATH=3D$source_path/pc-bios/s390-c=
cw" >> $config_mak
>>>>      -=C2=A0 =C2=A0 write_target_makefile pc-bios/s390-ccw/all >> $con=
fig_mak
>>>>      +=C2=A0 =C2=A0 write_target_makefile >> $config_mak
>>>>       =C2=A0 =C2=A0 =C2=A0# SLOF is required for building the s390-ccw=
 firmware on s390x,
>>>>       =C2=A0 =C2=A0 =C2=A0# since it is using the libnet code from SLO=
F for network booting.
>>>>       =C2=A0 =C2=A0 =C2=A0git_submodules=3D"${git_submodules} roms/SLO=
F"
>>>>      @@ -2488,7 +2482,7 @@ for target in $target_list; do
>>>>       =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>>>>       =C2=A0 =C2=A0esac
>>>>      -=C2=A0 if probe_target_compiler $target; then
>>>>      +=C2=A0 if probe_target_compiler $target || test -n "$container_i=
mage"; then
>>>>       =C2=A0 =C2=A0 =C2=A0 =C2=A0test -n "$container_image" && build_s=
tatic=3Dy
>>>>       =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p "tests/tcg/$target"
>>>>       =C2=A0 =C2=A0 =C2=A0 =C2=A0config_target_mak=3Dtests/tcg/$target=
/config-target.mak
>>>>      --     2.34.1
>>>>
>> Can you check what ENGINE is in your config-host.mak? If no
>> container
>> engine is defined we should be gating against running docker.
>
> Yeah. Running the case I mentioned above (revert is applied, 'make check-=
tcg'
> fails):
>
> [danielhb@kal1 build]$ grep ENGINE config-host.mak
> ENGINE=3Dpodman
>
>
> And with current master where 'make' is failing:
>
> [danielhb@kal1 build]$ grep ENGINE config-host.mak
> ENGINE=3Dpodman
>
>
> podman version:
>
> $ podman --version
> podman version 4.0.2
>
>
>
> Daniel
>
>>=20


--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321306A813A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhEC-0000bR-TR; Thu, 02 Mar 2023 06:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXhE8-0000aE-EB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:36:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXhE6-0002uM-6A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:35:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id l1so13153650wry.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9WUBJ9iS6kPfoD67X90JS4aVHJN2MDeu/hMrNpVnsk=;
 b=VAp5LAL1j80qJGXxwCLaCe+zQbAcq6u4dGwyvRVWWX5vn9Yw5JIBUDAKsPB8FBo0qI
 YKLaj2HFmn8uTTC5cFfniO2/iezu9PSTDMmlOfwyx+4NQneyVxpdNpQAkTJ9EmfpPyAE
 uvXPEfScqifYbZ1VvWHfwO/6Y+djHnYL6bXbG6wKB9m3uEb7FR2Enf6x5d4rxmJxOZ5K
 hDkw0mXdvqpKMTMxrRL818ll6Lq+jD19cQrKm09RZXLRM5toAY3469QUur2Q+qg5K3wQ
 vgvxrBj874UtMFTr/eX+OEc9B34XFf0fxqqbBObegr3OJkEqRAm21zkcbJtyTp+1UGY/
 KEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x9WUBJ9iS6kPfoD67X90JS4aVHJN2MDeu/hMrNpVnsk=;
 b=GsL4NfAH+VoDhjpY2KN9OcTpsMcF/78tTZe3bGO1Klx9/qpxK8oPjEd8D8xrIjnFxm
 CZ54OeWxvIIKtHaNs6OexoTXVLMA6AUARuKtLpZ92bVwyIfRg+aySx4df6ktIcgodLlR
 sZtvfH7YgpUJAQesLkBgqWsplHlnDxk9Kk9hvzKM0P2txmcSPfnEIrznaFXtXEdwCFym
 S6jtmRjeMAM3LTB3gnfz0uTXkqRzQvgPmqv/hrJeb8jnIatkkj+FbAGZm/yN8eL/gs80
 L1aqdYwOXVEU82UJGI5xJ2XvvnYp+JqoGx9lW5AGEUNyRJ9R9Ea2qJzVq9RMDoR4Ibnn
 1lzA==
X-Gm-Message-State: AO0yUKUuJFxfuJqjQGMQhQGUxjAJvBgg8g/P6mqoMjgvcVp5UU1aGRxS
 8A+zWcgNxrW97C0dBcVlHDq53Q==
X-Google-Smtp-Source: AK7set/bZtqEFF/K+Y+j8uFs74jaa0BUCW/kR+MnpUNqYuLJdOPkkvGBLDMP46n239NGn2tuHt9Bdw==
X-Received: by 2002:adf:e745:0:b0:2c5:a38f:ca3a with SMTP id
 c5-20020adfe745000000b002c5a38fca3amr1195586wrn.10.1677756956143; 
 Thu, 02 Mar 2023 03:35:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm3011658wmq.5.2023.03.02.03.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:35:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50C071FFB7;
 Thu,  2 Mar 2023 11:35:55 +0000 (GMT)
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
 <CAFEAcA_ztebfE1+nPx0X=3QJCssoDNceDsZ4=SBbAxywY7jO7g@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Date: Thu, 02 Mar 2023 11:34:35 +0000
In-reply-to: <CAFEAcA_ztebfE1+nPx0X=3QJCssoDNceDsZ4=SBbAxywY7jO7g@mail.gmail.com>
Message-ID: <87cz5rbd2c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 2 Mar 2023 at 11:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>>
>> On 2/3/23 11:56, Peter Maydell wrote:
>> > On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >>  From the other thread:
>> >>
>> >> I think the underlying config needs updating:
>> >>
>> >>    .git/modules/tests/fp/berkeley-testfloat-3/config
>> >>
>> >> I'm surprised the git config for submodules doesn't carry the metadat=
a.
>> >
>> > Yeah, in my local repo that I merge stuff with that file
>> > does still have a github URL:
>> > url =3D git://github.com/cota/berkeley-testfloat-3
>> >
>> > So I guess my questions are:
>> >   (1) why hasn't this been a problem up til now ?
>> >   (2) does this mean that if I merge this then everybody will
>> >       need to manually go in and update this file somehow
>> >       to be able to pull the updated qemu master ?
>>
>> I assume you are not passing --disable-git-update or
>> --with-git-submodules to ./configure.
>
> No, I don't do that. But this problem happens before we
> get anywhere near configure, when I try to do the
> 'git fetch' of the main repo!

c.f:

  =E2=9E=9C  git submodule foreach --recursive git config --get remote.orig=
in.url

  Entering 'dtc'
  https://git.qemu.org/git/dtc.git
  Entering 'meson'
  https://github.com/mesonbuild/meson/
  Entering 'roms/QemuMacDrivers'
  https://git.qemu.org/git/QemuMacDrivers.git
  Entering 'roms/SLOF'
  https://git.qemu.org/git/SLOF.git
  Entering 'roms/ipxe'
  https://git.qemu.org/git/ipxe.git
  Entering 'roms/openbios'
  https://git.qemu.org/git/openbios.git
  Entering 'roms/opensbi'
  https://git.qemu.org/git/opensbi.git
  Entering 'roms/qboot'
  https://github.com/bonzini/qboot
  Entering 'roms/qemu-palcode'
  https://git.qemu.org/git/qemu-palcode.git
  Entering 'roms/seabios'
  https://git.qemu.org/git/seabios.git/
  Entering 'roms/seabios-hppa'
  https://git.qemu.org/git/seabios-hppa.git
  Entering 'roms/skiboot'
  https://git.qemu.org/git/skiboot.git
  Entering 'roms/u-boot'
  https://git.qemu.org/git/u-boot.git
  Entering 'roms/u-boot-sam460ex'
  https://git.qemu.org/git/u-boot-sam460ex.git
  Entering 'roms/vbootrom'
  https://gitlab.com/qemu-project/vbootrom.git
  Entering 'subprojects/libvfio-user'
  https://gitlab.com/qemu-project/libvfio-user.git
  Entering 'tests/fp/berkeley-softfloat-3'
  https://github.com/cota/berkeley-softfloat-3
  Entering 'tests/fp/berkeley-testfloat-3'
  https://gitlab.com/qemu-project/berkeley-testfloat-3.git
  Entering 'tests/lcitool/libvirt-ci'
  http://gitlab.com/libvirt/libvirt-ci
  Entering 'ui/keycodemapdb'
  https://git.qemu.org/git/keycodemapdb.git

vs what .gitmodules says:

=E2=9E=9C  cat .gitmodules | grep url
        url =3D https://gitlab.com/qemu-project/seabios.git/
        url =3D https://gitlab.com/qemu-project/SLOF.git
        url =3D https://gitlab.com/qemu-project/ipxe.git
        url =3D https://gitlab.com/qemu-project/openbios.git
        url =3D https://gitlab.com/qemu-project/qemu-palcode.git
        url =3D https://gitlab.com/qemu-project/dtc.git
        url =3D https://gitlab.com/qemu-project/u-boot.git
        url =3D https://gitlab.com/qemu-project/skiboot.git
        url =3D https://gitlab.com/qemu-project/QemuMacDrivers.git
        url =3D https://gitlab.com/qemu-project/keycodemapdb.git
        url =3D https://gitlab.com/qemu-project/seabios-hppa.git
        url =3D https://gitlab.com/qemu-project/u-boot-sam460ex.git
        url =3D https://gitlab.com/qemu-project/berkeley-testfloat-3.git
        url =3D https://gitlab.com/qemu-project/berkeley-softfloat-3.git
        url =3D https://gitlab.com/qemu-project/edk2.git
        url =3D   https://gitlab.com/qemu-project/opensbi.git
        url =3D https://gitlab.com/qemu-project/qboot.git
        url =3D https://gitlab.com/qemu-project/meson.git
        url =3D https://gitlab.com/qemu-project/vbootrom.git
        url =3D https://gitlab.com/libvirt/libvirt-ci.git
        url =3D https://gitlab.com/qemu-project/libvfio-user.git

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


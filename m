Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B154A5C04
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:14:57 +0100 (CET)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEs3i-0002s5-FW
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:14:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nErIF-0003v0-LO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:25:51 -0500
Received: from [2a00:1450:4864:20::62c] (port=44906
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nErID-0005dQ-CI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:25:51 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ka4so53027313ejc.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BM4VBAfAZ+VxD9DpEE/b7F6Hg9GBruy8cMkgqixDj5k=;
 b=Sd/M7aolw/3mUuFXkMXIJgk5O8YdhzyRpoDajy7qS8mb4hJhhTwSdhl4De14SPFrNG
 O2VukXtw8Ayyavq9MzmOuQBmLFnnTN1qxPgD792J2v9C3h/AJiPsHfkv5pnPniO/IaFG
 /b7Fdp+6FJ8v7h4GgFB/4KfNxXSB93ScyPM5HUpJY0QBw0O/oWtEPkxTkpnB+bYqno1H
 mvm3dHvo4obnOw2wg5EIMUQroH0QigDX+EQ6FGT3wOwkElRB7geShJQYglc8J6w+3Ads
 U4by07gqIKBLwWAuxo8ZeIjTepVFwfzksFQupk5BLRexqA2+A+CtrOgtIHh5xME7d5F/
 cpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BM4VBAfAZ+VxD9DpEE/b7F6Hg9GBruy8cMkgqixDj5k=;
 b=WnyMCTdP07sjMCMD+UZ5wNMnXRo8q3rLW5mCQNQI35H97UnneRPjXSgKC2VIaCkLVo
 NvTy+0pP3+QwM5x4FPeElZm3IrFO+IUV2toTTB07u6Bm7sWtYch+mFvR+DsU49mi1Gp0
 9I6At5PqqezSlrEdSFGTc3cY0WEHIswf2Rglxfg/wF4F+IeVf1Ib7AuP5gQJEZTaFA98
 XQLKgiprChsPe22qe9AtU/qJ3YmgNoWfATPcUUO1VGVRvYrOwPZ5IWC6zIgaGOZXJhKo
 fdVGpPKzJRwTTy6XIPvAQ3nxju2fdjsgZgWeVMSh5bpUs+ohCeitbS9tJZV0Hk4S+lPn
 SXkw==
X-Gm-Message-State: AOAM533nuZIHaE9oGRhSpoIT2nMOUo+CKQYlXT/Emqpgq7toqAFnWoaj
 bbxmhChg2gD1KowGywFIMEMw4H+ZblX7PA==
X-Google-Smtp-Source: ABdhPJzAFEk+Q5XA9ND/qZskOUKioJqoaHuHeHjFsnV4cth8gaFhrSlUEwIbwOc9re08Rq6EWN3hhA==
X-Received: by 2002:a17:907:8a24:: with SMTP id
 sc36mr20285339ejc.318.1643714747944; 
 Tue, 01 Feb 2022 03:25:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d16sm14551288eje.131.2022.02.01.03.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:25:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 445E21FFB7;
 Tue,  1 Feb 2022 11:25:46 +0000 (GMT)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Date: Tue, 01 Feb 2022 11:17:12 +0000
In-reply-to: <20220201112720.4ac9b8df@elisabeth>
Message-ID: <87wnieygjp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefano Brivio <sbrivio@redhat.com> writes:

> On Tue, 1 Feb 2022 09:06:25 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>
>> On Tue, Feb 01, 2022 at 07:31:39AM +0100, Stefano Brivio wrote:
>> > Hi,
>> >=20
>> > On Tue, 25 Jan 2022 10:20:11 +0100
>> > Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >=20=20=20
>> > >   Hi,
>> > >=20=20=20
>> > > > IMHO the ideal scenario would be for us to have a kernel, initrd
>> > > > containing just busybox tools for the key arch targets we care
>> > > > about. Those could be used with direct kernel boot or stuffed
>> > > > into a disk iamge. Either way, they would boot in ~1 second,
>> > > > even with TCG, and would be able to execute simple shell scripts
>> > > > to test a decent amount of QEMU functionality.=20=20=20=20
>> > >=20
>> > > I have some test images based on buildroot which are essentially tha=
t.
>> > > https://gitlab.com/kraxel/br-kraxel/
>> > >=20
>> > > Still a significant download, but much smaller than a full fedora or
>> > > ubuntu cloud image and it boots much faster too.  Not down to only o=
ne
>> > > second though.=20=20
>> >=20
>> > I'm not sure you can recycle something from it, but my (ugly) approach
>> > to make this fast (for a different purpose -- I'm using qemu to run
>> > tests in guests, not testing qemu) is to build an initramfs by copying
>> > the host binaries I need (a shell, ip, jq) and recursively sourcing
>> > libraries using ldd (I guess I mentioned it's ugly).
>> >=20
>> > No downloads, systemd, dracut, etc., guest boots in half a second
>> > (x86_64 on x86_64, KVM -- no idea with TCG). Host kernel with a few
>> > modules packed and loaded by a custom init script.=20=20
>>=20
>> That is such a good idea, that it is exactly what I do too :-)
>>=20
>>   https://gitlab.com/berrange/tiny-vm-tools/-/blob/master/make-tiny-imag=
e.py
>>=20
>> it works incredibly well for the simple case of host-arch=3D=3Dguest-arc=
h.
>
> Ah-ha, I feel better now. ;)
>
>> It could be made to work for foreign arch easily enough - just need
>> to have a foreign chroot lieing around somewhere you can point it
>> to.
>
> By the way, stage3 archives from:
>
> 	https://www.gentoo.org/downloads/#other-arches
>
> get quite close to it ...no kernel binaries though.

We have up to now tried really hard as a project to avoid building and
hosting our own binaries to avoid theoretical* GPL compliance issues.
This is why we've ended up relying so much on distros to build and host
binaries we can use. Most QEMU developers have their own personal zoo of
kernels and userspaces which they use for testing. I use custom kernels
with a buildroot user space in initramfs for example. We even use the
qemu advent calendar for a number of our avocado tests but we basically
push responsibility for GPL compliance to the individual developers in
that case.

*theoretical in so far I suspect most people would be happy with a
reference to an upstream repo/commit and .config even if that is not to
the letter of the "offer of source code" required for true compliance.

--=20
Alex Benn=C3=A9e


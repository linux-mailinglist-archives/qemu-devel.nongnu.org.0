Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D6673CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWMH-0005Qx-Lc; Thu, 19 Jan 2023 09:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIWMF-0005QK-VN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:57:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIWME-0003Q9-0P
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:57:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso3739654wmc.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEtgV5A5TQgE6miITdvQ7MIFydv0OPph3dJHEqU8bmI=;
 b=uOgBskCVZg9n55V0rrV6AwGbi6KYB+Zjwy/RAS1VzBHB1CPgbO1smZSJ6F3x6KLPFi
 iG5EkB2DZE2c1j7p/Cbybm/baVTv73fp9gnIzYLc0iPG4bHr5G91ONHCMO3elQPj/+7H
 ySNPWP4wvfGsKwnKOQnUnm41oDYkyv7hLZn/6O+yzxa6ZzlEYkFhBhKaL2LYnpu/o3t7
 yKtkb0DcWT0XgyIZHvkVRngEUaoGJ/Pat3iX+WIJc09GqFii2vQf6ZrZG8aAFuriYsyo
 Nm1Hv/Dj1MELElDTz/afjUSH/EOeiJCdgWW9czm3ISUwJZMJnYnmQ2aXsd3UjhjWBKts
 qeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oEtgV5A5TQgE6miITdvQ7MIFydv0OPph3dJHEqU8bmI=;
 b=Lkx1KJriRFKSPNgsE4EvZ9pbqZVDFtSZslsQQTmNXzQ5GQ0n9zPX6n/W90SNvwZlL8
 jrcLAuRMuTShP1tZV+yfXy91qQHk0fuq67lkoRsV1Dbua8gasEjCU0RH7WNIkwUyTTi+
 WehqTqWGRLy/epqNGBjmD7u6onad1i2viHVnX0I98DtwFvZ8Z4z/BewdHiBSFd7qFluy
 eVlJqwfMy0ptj0x2TomFhWjdMdlTUsc2iER30furV4rM7ckyQ41eXRpbreRoeJuYZfwp
 xDh2rdLaEL89YPgLVMCKqxZiDFkfYQu7iD6MyST5MdQ2NgDSwD9HaZ3cx+Bz4kEG/nFz
 cNhg==
X-Gm-Message-State: AFqh2kpoA4mcY4gLTyQOf4nNmXasYk2Q9lrsji2eUkQKn22BcmuHn1QR
 D1/Ccs/XevYcIXATjKupomPn9g==
X-Google-Smtp-Source: AMrXdXvshXYnJW7jtfqwii9sjOMX0P4ju8puA4WYH0S3KhX5Y7waS3Lh1UoBZgghr4fJ+Qqyoqa8SQ==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr7606173wmq.7.1674140256130; 
 Thu, 19 Jan 2023 06:57:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003dafcd9b750sm5356670wmq.43.2023.01.19.06.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:57:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 431C41FFB7;
 Thu, 19 Jan 2023 14:57:35 +0000 (GMT)
References: <20230118153833.102731-1-dgilbert@redhat.com>
 <CAJSP0QU+o-R6ZKN8R1MHoUqFwfsQmpKt6KP5hqhyFrK5HJti6w@mail.gmail.com>
 <9474ce49-979d-f630-5f6a-754999db573a@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, "Dr. David Alan Gilbert (git)"
 <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 gmaglione@redhat.com, virtio-fs@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH 0/3] Remove C virtiofsd
Date: Thu, 19 Jan 2023 14:56:38 +0000
In-reply-to: <9474ce49-979d-f630-5f6a-754999db573a@redhat.com>
Message-ID: <871qnqzi5c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Hanna Czenczek <hreitz@redhat.com> writes:

> On 18.01.23 16:59, Stefan Hajnoczi wrote:
>> On Wed, 18 Jan 2023 at 10:40, Dr. David Alan Gilbert (git)
>> <dgilbert@redhat.com> wrote:
>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>
>>> We deprecated the C virtiofsd in commit 34deee7b6a1418f3d62a
>>> in v7.0 in favour of the Rust implementation at
>>>
>>>    https://gitlab.com/virtio-fs/virtiofsd
>>>
>>> since then, the Rust version has had more development and
>>> has held up well.  It's time to say goodbye to the C version
>>> that got us going.
>>>
>>> The only thing I've not cleaned up here is
>>>    tests/avocado/virtiofs_submounts.py
>>>
>>> which I guess needs to figure out where the virtiofsd implementation
>>> is and use it; suggestions welcome.
>> I see something similar in tests/avocado/avocado_qemu/__init__.py:
>>
>>          # If qemu-img has been built, use it, otherwise the system wide=
 one
>>          # will be used.  If none is available, the test will cancel.
>>          qemu_img =3D os.path.join(BUILD_DIR, 'qemu-img')
>>          if not os.path.exists(qemu_img):
>>              qemu_img =3D find_command('qemu-img', False)
>>          if qemu_img is False:
>>              self.cancel('Could not find "qemu-img", which is required t=
o '
>>                          'create the bootable image')
>>
>> Maybe find_command('virtiofsd', False)?
>
> It was supposed to be a test for virtiofsd, so it doesn=E2=80=99t really =
make
> sense to run it with the system-wide daemon, I think.
>
> Maybe there=E2=80=99s some way we can move the test to the Rust repo?=C2=
=A0 I=E2=80=99ll
> take a look.

Do you want to use cargo to install the daemons? If so could we make the
support generic enough so we could also start using the vhost-device
daemons for tests?

>
> Hanna


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09451650C9F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7G8n-0001RU-5D; Mon, 19 Dec 2022 08:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7G8l-0001Qv-17
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:25:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7G8i-0004Xh-9Z
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:25:10 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so6363082wmb.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 05:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adXd2ehJINqpQ1X8/mgHIHnXO2ZHZLViPxsztm7gS1k=;
 b=LPLkYf1XkjA0d33gvKFVe7Q38RJfEe0c204Zo20ccp6wSWTOqkU4vLeECWl37LKrZU
 oioqYJWKkZ+dDXPpiHbrr1AoNHpHFG/GXGBdi07u5dFkoZOZj8XhTc19AXmbNPCZi5h9
 YLBWJ4AT/q+a//nq0LnEtzS/JjIjSehuw9lAflBhuAlvc4TZ8NwUFbQw2sg+tslKwkcX
 0Vo2sLdgPOB3W6+NbtlHX4oOFYOQfcQCVnVJpj1vPgXnJyZpxbS7x2pyzs3hQ47KY5Rd
 BOYf+Rlu7ALV80wvr8VlpyB2TjXPP9sS4bGz2w2N6xeVqoU9CV0aAWwYEFT0ENE8N5ob
 VGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=adXd2ehJINqpQ1X8/mgHIHnXO2ZHZLViPxsztm7gS1k=;
 b=wrMhOStT1KhQIaWnUI8sXqpQ6EaDZkwVtC+DrVpyAH8b9MHsQhqgpwuxW5cDvUmCrf
 HlatdiRP0sZJ+Rs6XVNqgNNndJu0Js/f4lBZMcnISydSO9wWLkH9JKK8FDz2EOJtA/qU
 kc0g74Qua8IIdIJ4cStTlqbdLk/0SU3R7J9+4G38g5wAUUEiDejZdyYULgHufeEzNw2c
 gJf+pamvvJMvg9v+KgQzXO6SouNoTrF0z/t6+VAPVeM1t0p9hApkl4Pp64ZkPPombpH+
 clhQfwdPvyQR8vOoJkM1Yx1qDPOa/gvT3htMPXXmYCCfs23z1tM69GJTcLNWtWmXhHF4
 F9Bw==
X-Gm-Message-State: ANoB5pkDQUEOhtdj3RHmZqoKdoRPHBjDxFyOXlhzvTKpK1Ts52t+yCs/
 LVgUwoYxd/mhVrd2BamYriYLmA==
X-Google-Smtp-Source: AA0mqf6YcTtl2CCTJQ/Xqibr9oJ06pH2jmrHGa23RLdkWK2DrQU1W/PWpoWUhlXVN3W6o36a/BGjJg==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id
 n5-20020a05600c4f8500b003c6f732bf6fmr32997484wmq.13.1671456305747; 
 Mon, 19 Dec 2022 05:25:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c028800b003c6d21a19a0sm11939660wmk.29.2022.12.19.05.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 05:25:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4FB11FFB7;
 Mon, 19 Dec 2022 13:25:04 +0000 (GMT)
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Date: Mon, 19 Dec 2022 13:22:21 +0000
In-reply-to: <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
Message-ID: <87fsdble4v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Helge Deller <deller@gmx.de> writes:

> Hi Paolo,
>
> On 12/17/22 14:28, Paolo Bonzini wrote:
>> On 12/16/22 20:07, Helge Deller wrote:
>>> @@ -3581,7 +3581,7 @@ subdir('qga')
>>>
>>> =C2=A0 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
>>> =C2=A0 # when we don't build tools or system
>>> -if xkbcommon.found()
>>> +if xkbcommon.found() and have_system
>>> =C2=A0=C2=A0=C2=A0 # used for the update-keymaps target, so include rul=
es even if !have_tools
>>> =C2=A0=C2=A0=C2=A0 qemu_keymap =3D executable('qemu-keymap', files('qem=
u-keymap.c', 'ui/input-keymap.c') + genh,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [qemuutil, xkbcommon], install: have=
_tools)
>>> @@ -3596,7 +3596,9 @@ if have_tools
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [blockdev, qemuutil, gnutls, seli=
nux],
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 install: true)
>>>
>>> -=C2=A0 subdir('storage-daemon')
>>> +=C2=A0 if have_system
>>> +=C2=A0=C2=A0=C2=A0 subdir('storage-daemon')
>>> +=C2=A0 endif
>>> =C2=A0=C2=A0=C2=A0 subdir('contrib/rdmacm-mux')
>>> =C2=A0=C2=A0=C2=A0 subdir('contrib/elf2dmp')
>>>
>>> @@ -3611,7 +3613,7 @@ if have_tools
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subdir('contrib/vhost-user-scsi')
>>> =C2=A0=C2=A0=C2=A0 endif
>>>
>>> -=C2=A0 if targetos =3D=3D 'linux'
>>> +=C2=A0 if targetos =3D=3D 'linux' and have_system
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 executable('qemu-bridge-helper', files('=
qemu-bridge-helper.c'),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [qemuutil, libcap_ng],
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 install: true,
>>> diff --git a/tools/meson.build b/tools/meson.build
>>> index 10eb3a043f..740d572a94 100644
>>> --- a/tools/meson.build
>>> +++ b/tools/meson.build
>>> @@ -5,7 +5,7 @@ have_virtiofsd =3D get_option('virtiofsd') \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 error_message: 'virtiofsd requires libcap-ng-devel and secc=
omp-devel') \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .require(have_vhost_user,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 error_message: 'virtiofsd needs vhost-user-support') \
>>> -=C2=A0=C2=A0=C2=A0 .disable_auto_if(not have_tools and not have_system=
) \
>>> +=C2=A0=C2=A0=C2=A0 .disable_auto_if(not have_system) \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .allowed()
>>>
>>> =C2=A0 if have_virtiofsd
>>>
>>
>> These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
>> and qemu-keymap *are* tools; if they fail to build due to any
>> dependencies, or due to other compilation issues, you need to add
>> tests to meson.build and check for the cause of the issues.
>
> No doubt, those are *tools*.
> But aren't those only required when you run system- and/or user-emulation?
>
> Looking at the packaging of qemu in debian:
>
> qemu-system-common debian package consists of thse *tools*:
>   qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd

Well technically vhost-user-gpu and virtiofsd are usable (or should be)
without QEMU as they are vhost-user backends and could be used with
other VMMs that support vhost-user (kvm-tool, crosvm,
xen-vhost-frontend).

Not withstanding that virtiofsd is now a legacy binary as the production
backend for vhost-user virtio-fs is the rust rewrite:

  https://gitlab.com/virtio-fs/virtiofsd

>
> qemu-utils debian package consists of the *utilities*:
>   qemu-img, qemu-io, qemu-nbd
>
> IMHO this categorization makes sense.
> My patch was targetting at making "qemu-utils" possible to build
> and that's why I think the tools you mention should depend on "have_syste=
m".
>
>> The rest is okay.
>
> Ok, thanks!
>
> Helge


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


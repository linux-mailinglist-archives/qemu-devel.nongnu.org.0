Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F331D93D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:13:51 +0100 (CET)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLiI-0001Ce-C1
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLh5-0000kj-Kv
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:12:35 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLh3-0006i0-Rp
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:12:35 -0500
Received: by mail-wr1-x434.google.com with SMTP id n8so17121693wrm.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qTkfz5ujMLMb1nlqO8gSWOuA+oPPWobW+XSNpQJR3Q4=;
 b=e0EaQsUccz1164KC+GTIYjLVSqHTXpbe864VUwHs1A83My7IkBqWmae0UehLR5HWOz
 ko2/72sjT9eV2JsLjOQPHgkaC8RWp8KTH77HKbxFDXVW0+hzBBV5yfnPjmZU3JLj/dYU
 3stwHK8kUZ+xrgGQuG/IbL2Yvc6BHk/EB0P+7/MUjeNO3quUqc9BEsAkVru1PxyOz98y
 smAWDny2qBQLvjJ1jE77F9qPsYctzJqVTmHVt/qYTvER/nv3Y/J1my3gvl3GBhGyKKKn
 tkZt8s8KhFUNEeevy4Q2YGJAQNaTF9X1eO0onBR9U6VYF6RYRUkAq1pKFmjvDj5WHTJY
 zIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qTkfz5ujMLMb1nlqO8gSWOuA+oPPWobW+XSNpQJR3Q4=;
 b=rIyKgOQO0y99vHlfte8ErIqlJVwQYuOuQfybHN/9M+Im84AEZKIzscZuopfnR/QsY1
 DpS8m3J7jOPkIouHND8OY2rRBmrHdIbsp+lThsr/RiwEsFNq0yfn2UG/W0btTVD5J35n
 poxWpRFuSsR4y+QuIsaIBIB7iWaAkEZerOu4e7D2yS+yRvDl7EiMgv2SqpqxuHheID79
 s3CRHfDDuKLpoWng5+HD7aZ5Pn/lzFdM7gI9nd6bLK2VfBOAc3WXcDnKNdogh46kvikM
 0NaKyIPszQRXOnPZqDIAwwqzWKPlRu6h0ZOlWkokoYOZpigRA2NF4dFhRksfHyR3yNd+
 SmoQ==
X-Gm-Message-State: AOAM531e30Uuw53bJlXWOpHdEBNHs6w9VvLN5Bcc6tgn0EupNphDY9pN
 kE+7TdkW4dnZ/mrexYRwLC+EeMH/Q//3QA==
X-Google-Smtp-Source: ABdhPJwssu8YK2IWk+Z60gJcW40QVXUq3Xy+PNKBDlDxIDUV7WIqNJSbAdNxN+AGQGXqtUeY0JPytw==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr29066307wru.407.1613563951069; 
 Wed, 17 Feb 2021 04:12:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t30sm3723742wra.56.2021.02.17.04.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:12:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E90081FF7E;
 Wed, 17 Feb 2021 12:12:28 +0000 (GMT)
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-21-marcandre.lureau@redhat.com>
 <87ft1wt1dv.fsf@linaro.org>
 <20210216174319.GA168121@localhost.localdomain>
 <CAMxuvayaijdaS_Ba8N+w02Q3xV5JZJ=hG1TysuPOLtyuZ2Cyrw@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 20/20] tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Date: Wed, 17 Feb 2021 12:12:24 +0000
In-reply-to: <CAMxuvayaijdaS_Ba8N+w02Q3xV5JZJ=hG1TysuPOLtyuZ2Cyrw@mail.gmail.com>
Message-ID: <871rdeuc43.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Tue, Feb 16, 2021 at 9:43 PM Cleber Rosa <crosa@redhat.com> wrote:
>
>> On Tue, Feb 16, 2021 at 04:34:06PM +0000, Alex Benn=C3=A9e wrote:
>> >
>> > marcandre.lureau@redhat.com writes:
>> >
>> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > >
>> > > This will check virtio/vhost-user-vga & virgl are correctly initiali=
zed
>> > > by the Linux kernel on an egl-headless display.
>> > >
>> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > > ---
>> > >  tests/acceptance/virtio-gpu.py | 161 ++++++++++++++++++++++++++++++=
+++
>> > >  1 file changed, 161 insertions(+)
>> > >  create mode 100644 tests/acceptance/virtio-gpu.py
>> >
>> > This failed when I got to master:
>> >
>> >   2021-02-16 14:33:46,266 qmp              L0255 DEBUG| >>> {'execute':
>> 'qmp_capabilities'}
>> >   2021-02-16 14:33:46,441 machine          L0385 DEBUG| Error launching
>> VM
>> >   2021-02-16 14:33:46,441 machine          L0387 DEBUG| Command:
>> './qemu-system-x86_64 -display none -vga none -chardev
>> socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu
>> >   -29492-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -chardev
>> socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu-29492-co=
nsole.sock,server=3Don,wait=3Doff
>> -serial chardev:
>> >   console -cpu host -m 2G -machine pc,accel=3Dkvm -device
>> virtio-vga,virgl=3Don -display egl-headless -kernel
>> /home/alex.bennee/avocado/data/cache/by_location/892ae21f3ae7d04994d8
>> >   1e1c0bf204ecebe555bb/vmlinuz -initrd
>> /home/alex.bennee/avocado/data/cache/by_location/892ae21f3ae7d04994d81e1=
c0bf204ecebe555bb/initrd.img
>> -append printk.time=3D0 console=3DttyS0
>> >    rdinit=3D/bin/bash'
>> >   2021-02-16 14:33:46,441 machine          L0389 DEBUG| Output:
>> "qemu-system-x86_64: -device virtio-vga,virgl=3Don: Property
>> 'virtio-vga.virgl' not found\n"
>> >   2021-02-16 14:33:46,441 stacktrace       L0039 ERROR|
>> >
>> > I'm going to assume this is because the beefy server I was building on
>> > didn't have the VirGL headers to enable this feature. In lieu of featu=
re
>> > probing you might have to do what I did for the plugins test:
>> >
>> >         try:
>> >             vm.launch()
>> >         except:
>> >             # TODO: probably fails because plugins not enabled but we
>> >             # can't currently probe for the feature.
>> >             self.cancel("TCG Plugins not enabled?")
>> >
>> >
>>
>> While this pattern is indeed an improvement over test errors, checking
>> for "build time features" is far from a new testing requirement, and
>> its still not properly solved.  A long time ago I proposed a way to
>> look at the Makefile variables during test time, but it had a number
>> of shortcomings.  I guess it's now time to revisit this issue.
>>
>> First, I'm a strong believer in limiting the *probing* that the test its=
elf
>> does with regards to build time features.  The probing and authoritative
>> information should already be with the build system.  I'm pretty sure th=
at
>> meson makes it easy to grab that kind of information.
>>
>> Once it's understood and agreed that the build system will provide
>> that information, the question becomes whether tests will get that
>> information from the build system (and thus require a build tree) or
>> if that information will be persisted in the QEMU binary and be
>> available for introspection.
>>
>> Thoughts? Does this sound like something other people would be
>> interested in?
>>
>
> It would be more reliable and flexible to do runtime introspection. It
> would allow installed tests, and some runtime checks for example.
>
> Given the variability of builds, is there something that does introspecti=
on
> in avocado-vt already?  I think we could rely on qmp introspection,
> qom-list-types etc.
>
> In the meantime Alex, could you send a patch to ignore the test the way y=
ou
> propose?

Sure.


--=20
Alex Benn=C3=A9e


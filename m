Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6068A3FF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3BL-0003YA-UV; Fri, 03 Feb 2023 16:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3BJ-0003XR-Pw
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3BH-0002VR-He
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675458070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJ8/3BOZg3az8VdBFPhpWyaJam+MgQakK+DJon8P4XE=;
 b=I9AaSgo/0sH0Ip3PBYEo9x+Iz+0cfQQcdHKx9gdbVQFCQEIyK1U5KOlfLmxbT8rSnTinYZ
 OpQPpPyKLxD2FLFfy7jrq9y47E8f/d9n5kuGPfIjj/5mZ6j7l++gZjlaY7iGPLGEcXQDtp
 hCG+qp70cpKY5BXXLwioXVSyfCaQ6eY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-HPfsjpqTMhuuOBsJoSHgjA-1; Fri, 03 Feb 2023 16:01:08 -0500
X-MC-Unique: HPfsjpqTMhuuOBsJoSHgjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a20-20020a05600c349400b003dfecb98d38so1234185wmq.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tJ8/3BOZg3az8VdBFPhpWyaJam+MgQakK+DJon8P4XE=;
 b=Xl6tq+ZLmgHhCp/mVw3yTAMFx5mWeLomBGgmp8Y6p2ZbU+931VQoRUXucQh3u/kJh0
 /dMUbmQ16x6BrDAmQO1idzoQym9iuQ/q3J1IdXm/HExU9MztTMYDhaBE6zINv3bDWq8m
 AAT55e1olYawS343m0cOXZH5/LK/kvoPtrux2C+6Su9gKmDFfObZP05+OHXHN4C2Ucde
 kQTPFeBbRldzPvkJwV7d2zuspdJnVvkP6lZ5k1F3qhVPGbSpXBdhvH/RuGUFIqUjqEF4
 7AlX8CUUhd9fmsmcVK+8WD743YtvkS4W3apVBQGoWclRutazQ3KEm2PTnToKSzZ50XOm
 aeQg==
X-Gm-Message-State: AO0yUKUI+xIdV/tMM4g0LQvBVriObU+HpKK3e+Cd4U2TULbTQAjFU8F6
 IY4BpEg1iWW2X7yIhD9MKm5zG7a11KY/lvafkETLMRGY0cbx6UcEfuMBwtfREnhCZ5Qwd8mLwq9
 o5d4vEzmBb9HX4yg=
X-Received: by 2002:a05:600c:3542:b0:3df:eedf:df1c with SMTP id
 i2-20020a05600c354200b003dfeedfdf1cmr1544592wmq.38.1675458066396; 
 Fri, 03 Feb 2023 13:01:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+dU2wvrlySbaFf+M+OQt262+xokX48QqD2IZtgabV8cjURv10Pe7o2b30Opd4MM34QzDSsPg==
X-Received: by 2002:a05:600c:3542:b0:3df:eedf:df1c with SMTP id
 i2-20020a05600c354200b003dfeedfdf1cmr1544573wmq.38.1675458066101; 
 Fri, 03 Feb 2023 13:01:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc54344764sm9655809wmo.48.2023.02.03.13.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 13:01:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Michal =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
In-Reply-To: <Y9wf5AI4xmHhNCTM@x1n> (Peter Xu's message of "Thu, 2 Feb 2023
 15:41:08 -0500")
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-4-peterx@redhat.com>
 <87cz6stk4a.fsf@secure.mitica> <Y9wf5AI4xmHhNCTM@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Feb 2023 22:01:04 +0100
Message-ID: <87357mfoq7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Thu, Feb 02, 2023 at 11:52:21AM +0100, Juan Quintela wrote:
>> Peter Xu <peterx@redhat.com> wrote:
>> > Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
>> > system call if either it's not there or doesn't have enough permission.
>> >
>> > Firstly, as long as the app has permission to access /dev/userfaultfd,=
 it
>> > always have the ability to trap kernel faults which QEMU mostly wants.
>> > Meanwhile, in some context (e.g. containers) the userfaultfd syscall c=
an be
>> > forbidden, so it can be the major way to use postcopy in a restricted
>> > environment with strict seccomp setup.
>> >
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> > Signed-off-by: Peter Xu <peterx@redhat.com>
>>=20
>>=20
>> Hi
>
> Hi, Juan,


>> static int open_userfaultd(void)
>> {
>>     /*
>>      * Make /dev/userfaultfd the default approach because it has better
>>      * permission controls, meanwhile allows kernel faults without any
>>      * privilege requirement (e.g. SYS_CAP_PTRACE).
>>      */
>>      int uffd =3D open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
>>      if (uffd >=3D 0) {
>>             return uffd;
>>      }
>>      return -1;
>> }
>>=20
>> int uffd_open(int flags)
>> {
>> #if defined(__linux__) && defined(__NR_userfaultfd)

Just an incise, checkpatch don't liue that you use __linux__

This file is compiled under CONFIG_LINUX, so you can drop it.

>>     static int uffd =3D -2;
>>     if (uffd =3D=3D -2) {
>>         uffd =3D open_userfaultd();
>>     }
>>     if (uffd >=3D 0) {
>>         return ioctl(uffd, USERFAULTFD_IOC_NEW, flags);
>>     }
>>     return syscall(__NR_userfaultfd, flags);
>> #else
>>      return -EINVAL;
>>=20
>> 27 lines vs 42
>>=20
>> No need for enum type
>> No need for global variable
>>=20
>> What do you think?
>
> Yes, as I used to reply to Phil I think it can be simplified.  I did this
> major for (1) better readability, and (2) being crystal clear on which way
> we used to open /dev/userfaultfd, then guarantee we're keeping using it. =
so
> at least I prefer keeping things like trace_uffd_detect_open_mode().

The trace is ok for me.  I just forgot to copy it on the rework, sorry.

> I also plan to add another mode when fd-mode is there even if it'll reuse
> the same USERFAULTFD_IOC_NEW; they can be useful information when a failu=
re
> happens.

The other fd mode will change the uffd.

What I *kind* of object is:
- Using a global variable when it is not needed
  i.e. for me using a global variable means that anything else is worse.
  Not the case IMHO.
- Call uffd_open_mode() for every call, when we know that it can change,
  it is going to return always the same value, so cache it.

> Though if you insist, I can switch to the simple version too.

I always told that the person who did the patch has the last word on
style.  I preffer my version, but it is up to you to take it or not.

Later, Juan.




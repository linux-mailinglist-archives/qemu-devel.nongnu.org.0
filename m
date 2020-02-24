Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19816A9F4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 16:23:15 +0100 (CET)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6FZh-0003JG-R7
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 10:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <n54@gmx.com>) id 1j6FVa-0000l7-Q9
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 10:19:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <n54@gmx.com>) id 1j6FVW-0002rI-O5
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 10:18:58 -0500
Received: from mout.gmx.net ([212.227.15.18]:49175)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <n54@gmx.com>) id 1j6FVW-0002qI-Bm
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 10:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582557520;
 bh=33rn70Qqv7oqV4iDfEGsW4JNk1CCeuT+arJ5cfbX3b4=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=ihXqrDoXRdd+o2ziZeZLHv+K0RzVMxG+i60CbzI5ew/QKg2yZzD3N7zZwR2gctju/
 449RpN4rz7u8RZcqDPzqVVUq28SYpY3vyHE9RYZrBZbwuiNfymlpRoD6FVZPKxqLvs
 GgnE9nlFvqXp9p5XSMLugwvtPn8uF0aFeCz+ZuxA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.241] ([89.71.135.231]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MnakR-1jou3x15hl-00jcTn; Mon, 24
 Feb 2020 16:18:40 +0100
Subject: Re: [PATCH v4 0/4] Implements the NetBSD Virtual Machine Monitor
 accelerator
From: Kamil Rytarowski <n54@gmx.com>
To: rth@twiddle.net, ehabkost@redhat.com, slp@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 max@m00nbsd.net, jmcneill@invisible.ca
References: <20200206115731.13552-1-n54@gmx.com>
 <20200206213232.1918-1-n54@gmx.com>
 <3d63b5ea-2da8-499e-c617-c25a7d87106e@gmx.com>
Autocrypt: addr=n54@gmx.com; prefer-encrypt=mutual; keydata=
 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
 4XSbcg==
Message-ID: <b26b1c03-cb2b-9c8b-4796-24b3b296a103@gmx.com>
Date: Mon, 24 Feb 2020 16:17:42 +0100
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3d63b5ea-2da8-499e-c617-c25a7d87106e@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Oja4w6CoaOopq5Vp+Yr2lD7z/dM3+hDoABnC1xlyHp23/2MR83b
 gOd2gjBhTBrIn6zCFpk3QYIjpYMiUVI28uXtwaLHm46vOCXYiamJgh2yne3QU2PG5/sFlGJ
 YZE8nynEpKl2LraAAmdtdagmrlX9dkBjZj1FT8v5l75iciqVV0/6erPUZG/ygFb4BeZQxDY
 pgUWa9Kf4EK+jA4ZXWxog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OGanrk+SVKs=:nEFPag6Bt5eM8oMX1vkXl8
 jatZCQ9WfG3xH/2OxBjfWq2NJniZuvUVNesukBzDddRjho4KwxQOMIPbUenmu0zsDZLSvNNfb
 xKFZCb2iuT9IRkuilGVay9bRA5gWeBtmW3eBMQaDENi0MWyMbMp6mWYio4feyhgNNXnOuaF/z
 MICYAqXe+EhiU1KdWk4jvy5ZE6nlBZnFEjOSPN9FDg8Q50XDC3oTgnl7jumm2b3mNcEWZRAjd
 svE9nCb6IzcAbjhk9n4iy2xXXmDaA4yUBNDLKk5pNbE4C2qox97xR6Y+SJn/3K766y24qZuk2
 krUAEykx0UIa5jjTc0rL6zuVamEptLtYUREkdAlojEjnqXy2CRIMDJhkRw8tm5qCkXQAEDs1N
 s6YCAaUsagXCwMadGCoSKE8h9RFsaW/jMlBB/2fRFg1S9ZC9RWQ/pznKafbgIM7OBUc1UVn+7
 RtudYNnMkctF2z6NFt8H8vx0drpPqtDcKBrX5MGexY2Jnbs2hGHZqZ+swQpmzn4Aq4eItf0/I
 IjdehNgzyndzxw0BE8W+M0ekvE/j3Pp2g/UzfdQMcmawcbOEv0fOP+rEJOboXQv7r+Mys8RdB
 PmazdScLg775/psGCgArS/wz37EKxL9iAhqPNf7pQjPSS/4yR1fT6015wVqz550qdSn504LO3
 IzT3y8pUfeBEa9lEFhzXrZzAR4O4RJsg5tbT58rj1J4bncTRlrdiyldEGWQauFRoqBIcrxBno
 6FU5HDNQnY/izUjIF72yvDYXpTPwCUKqcFynLtQCZjv5Pe2wB+Dj98Z3HvByigjVy+YPFh6v3
 FMQN1K/9wbIZScP/ZXUETaI18lBwF8VWFEgUtuRBWy0ZcEqpzmd7wpOqbq6UR4P6MNZp0wzeV
 N9pEUBNsT45lp6yvzXiwBePw07TmqbXcbYInZBx2OxMRJ0clSw1Se8pncZY2TY7eM864Ms8hM
 xkIk5psEzj6G69YCHEeNsn9qIj3pny0qB5qdhDbLDu/HIhrVUPUHYbqvaeOWLyGVuM7VbR8ZU
 klXftJQz5tZUOy61EZGMuUY6hry+0xQYmq4qxwkn4zLAmBp195RehMPKbeAc29U6dKE1mcCNv
 SMTPdDKXTfOUDkNTzPMHib7SMpi+repo+LQYy1tYouAM86HgJBdoY5NjcXV0kJC4P10FAZPj2
 9dy2mJjsjaAdpzKQ0VG4OGU5trm3hekWHbSFDSVQjf4FLDWucXjRGWnYz84rE9596Dpew=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.18
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 17.02.2020 10:07, Kamil Rytarowski wrote:
> Ping?
>
> On 06.02.2020 22:32, Kamil Rytarowski wrote:
>> Hello QEMU Community!
>>
>> Over the past year the NetBSD team has been working hard on a new user-=
mode API
>> for our hypervisor that will be released as part of the upcoming NetBSD=
 9.0.
>> This new API adds user-mode capabilities to create and manage virtual m=
achines,
>> configure memory mappings for guest machines, and create and control ex=
ecution
>> of virtual processors.
>>
>> With this new API we are now able to bring our hypervisor to the QEMU
>> community! The following patches implement the NetBSD Virtual Machine M=
onitor
>> accelerator (NVMM) for QEMU on NetBSD 9.0 and newer hosts.
>>
>> When compiling QEMU for x86_64 passing the --enable-nvmm flag will comp=
ile the
>> accelerator for use. At runtime using the '-accel nvmm' should see a
>> significant performance improvement over emulation, much like when usin=
g 'hax'
>> on NetBSD.
>>
>> The documentation for this new API is visible at https://man.netbsd.org=
 under
>> the libnvmm(3) and nvmm(4) pages.
>>
>> NVMM was designed and implemented by Maxime Villard.
>>
>> Thank you for your feedback.
>>
>> Refrences:
>> https://m00nbsd.net/4e0798b7f2620c965d0dd9d6a7a2f296.html
>>
>> Test plan:
>>
>> 1. Download a NetBSD 9.0 pre-release snapshot:
>> http://nycdn.netbsd.org/pub/NetBSD-daily/netbsd-9/latest/images/NetBSD-=
9.0_RC1-amd64.iso
>>
>> 2. Install it natively on a not too old x86_64 hardware (Intel or AMD).
>>
>> There is no support for nested virtualization in NVMM.
>>
>> 3. Setup the system.
>>
>>  export PKG_PATH=3Dhttp://www.ki.nu/pkgsrc/packages/current/NetBSD-9.0_=
RC1/All
>>  pkg_add git gmake python37 glib2 bison pkgconf pixman
>>
>> Install mozilla-rootcerts and follow post-install instructions.
>>
>>  pkg_add mozilla-rootcerts
>>
>> More information: https://wiki.qemu.org/Hosts/BSD#NetBSD
>>
>> 4. Build qemu
>>
>>  mkdir build
>>  cd build
>>  ../configure --python=3Dpython3.7
>>  gmake
>>  gmake check
>>
>> 5. Test
>>
>>  qemu -accel nvmm ...
>>
>>
>> History:
>> v3 -> v4:
>>  - Correct build warning by adding a missing include
>>  - Do not set R8-R16 registers unless TARGET_X86_64
>> v2 -> v3:
>>  - Register nvmm in targetos NetBSD check
>>  - Stop including hw/boards.h
>>  - Rephrase old code comments (remove XXX)
>> v1 -> v2:
>>  - Included the testing plan as requested by Philippe Mathieu-Daude
>>  - Formatting nit fix in qemu-options.hx
>>  - Document NVMM in the accel section of qemu-options.hx
>>
>> Maxime Villard (4):
>>   Add the NVMM vcpu API
>>   Add the NetBSD Virtual Machine Monitor accelerator.
>>   Introduce the NVMM impl
>>   Add the NVMM acceleration enlightenments
>>
>>  accel/stubs/Makefile.objs |    1 +
>>  accel/stubs/nvmm-stub.c   |   43 ++
>>  configure                 |   37 ++
>>  cpus.c                    |   58 ++
>>  include/sysemu/hw_accel.h |   14 +
>>  include/sysemu/nvmm.h     |   35 ++
>>  qemu-options.hx           |   16 +-
>>  target/i386/Makefile.objs |    1 +
>>  target/i386/helper.c      |    2 +-
>>  target/i386/nvmm-all.c    | 1226 +++++++++++++++++++++++++++++++++++++
>>  10 files changed, 1424 insertions(+), 9 deletions(-)
>>  create mode 100644 accel/stubs/nvmm-stub.c
>>  create mode 100644 include/sysemu/nvmm.h
>>  create mode 100644 target/i386/nvmm-all.c
>>
>> --
>> 2.25.0
>>
>>
>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD09688736
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNelX-0003QP-Gx; Thu, 02 Feb 2023 13:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNelC-0003M0-2l
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:56:39 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNel6-0001J8-OF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:56:37 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 312IuLoo2095785
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 2 Feb 2023 10:56:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 312IuLoo2095785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2023010601; t=1675364184;
 bh=R0WU7xTxDMhtiRM27DLRQmV0jL/RBsAax18Ss3zsh44=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=GYwmZ+lWB3CHAksZVxlouRYAq+thh7slgY11gSa6sJZDK/soOb0sxVvA96RXxkrZC
 yFeOhuGbKc5dZerqqeWhmx7u36KBOLs94PvcEEiGDGPunfURYukRYYL3VccoQEYcId
 oFcyD7DcQcvs+0vyOeSyoZVxt4pw5P5vPmDN06riiFaxHHPFoU9VJOBPlp2N9Kbmdj
 23Jv2hIRWRqT1/SPTLcBW2MiHfexvswgRzdw31jchsStNqjqtILQnnYANElIZOdQSC
 2cVwHYNV4YyiJPjYEMTLYt0B16leBO8fth1hqxnu3VFrz8Nk4Bs1boyV/dJCOT4Md/
 vSxCM6lK6QQ7w==
Date: Thu, 02 Feb 2023 10:56:20 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: jejb@linux.ibm.com, James Bottomley <jejb@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86=3A_fix_q35_kernel_mea?=
 =?US-ASCII?Q?surements_broken_due_to_rng_seeding?=
User-Agent: K-9 Mail for Android
In-Reply-To: <352eb28a1d913db62421064fe50ec9c8f8afd050.camel@linux.ibm.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
 <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
 <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
 <4396778A-6520-4FB5-9227-1E8850753036@zytor.com>
 <352eb28a1d913db62421064fe50ec9c8f8afd050.camel@linux.ibm.com>
Message-ID: <CDBF8549-918C-4955-A7D1-D14663C7BEF6@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On February 2, 2023 7:17:01 AM PST, James Bottomley <jejb@linux=2Eibm=2Ecom=
> wrote:
>On Thu, 2023-02-02 at 07:03 -0800, H=2E Peter Anvin wrote:
>[=2E=2E=2E]
>> NAK=2E We need to fix the actual problem of the kernel stomping on
>> memory it shouldn't, not paper around it=2E
>
>This is a first boot situation, not kexec (I just updated kexec because
>it should use any new mechanism we propose)=2E  Unlike kexec, for first
>boot we're very constrained by the amount of extra space QEMU has to do
>this=2E  The boot_params are the first page of the kernel load, but the
>kernel proper begins directly after it, so we can't expand it=2E  The two
>schemes tried: loading after the kernel and loading after the command
>line both tamper with integrity protected files, so we shouldn't use
>this mechanism=2E  This is the essence of the problem: If we add this
>area at boot, it has to go in an existing memory location; we can't
>steal random guest areas=2E  All current config parameters are passed
>through as fw_config files, so we can only use that mechanism *if* we
>know where the area ends up in the loaded kernel *and* the file isn't
>integrity protected (this latter is expanding over time)=2E
>
>If we could wind back time, I'd have added the 32 byte random seed to
>boot_params properly not coded it as a setup_data addition, but now
>we're stuck with coping with existing behaviour, which is why I thought
>the retro fit to boot_params would be the better path forward, but if
>you have any alternatives, I'm sure we could look at them=2E
>
>James
>

The right thing to do is to fix the kernel so that it doesn't stomp on thi=
s memory, just as it cannot stomp on boot_params, initrd, or the command li=
ne=2E The kernel boot protocol defines a keep-out area, but physical kaslr =
violates it and so the kaslr code in the decompressor is responsible for ke=
eping track of the keepout areas, and apparently noone every did=2E

Adding it to boot_params and bumping the version number is a hack that doe=
sn't solve the backwards compatibility problem, so we should just fix the b=
ug instead=2E Adding it to boot_params and adding a setup_data pointer MAY =
be backwards compatible, but it also enables an absolutely catastrophic fai=
lure mode: an unaware loader may end up relocating boot_params without know=
ing that that data has a secondary pointer into it, with the result that we=
 now have a bogus pointer in a linked list=2E Not good=2E

Fixing the bug properly is also the only way forward for future setup_data=
 users, and we are running low on space in the fixed-size structures=2E

 


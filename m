Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5865882A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 01:47:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAh3X-0004eE-H4; Wed, 28 Dec 2022 19:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pAh3S-0004au-8B
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 19:45:56 -0500
Received: from terminus.zytor.com ([198.137.202.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pAh3O-0005kb-9m
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 19:45:53 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 2BSNwDZT740625
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 28 Dec 2022 15:58:14 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 2BSNwDZT740625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022120601; t=1672271895;
 bh=g+vUQSWM8S+CJcD539vqhAMG4lCGgJ1msfXsb2Kc1bw=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=SP9mXm3ejT+I8KWJp7ZU7QfEACk1fXjCLwlsr2JPh6kPi9vhWZyLPKUoDA7xez7Lj
 8mKL7hIh7LMUn+GDh4r3IL20SSFePUBHCj79Kdmm+ivgBlLmkBz3jMxk5j5lprW76Y
 4RionjIX8AniNu6B62nbeyVrI4zKOpabnl8x67U89CPZEVeWvW/i63LSu/kfSiHeeE
 LtelFnwDnjaGOOP5COPrE72KDcj9CZh5+4rm9JiyqWUPMXx4lsZK6U74GyOka5Q4A9
 BDPDdM/MVzJe1QovMZUoNWdk1yNeKU5Apd9EO0OZ0Rznt1fD7BK3oHyX6rJFan5Nby
 iGN3NMKleVkBg==
Date: Wed, 28 Dec 2022 15:58:12 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, bp@alien8.de, philmd@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_qemu=5D_x86=3A_don=27t_let_decomp?=
 =?US-ASCII?Q?ressed_kernel_image_clobber_setup=5Fdata?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y6x1knb8udpSyMSp@zx2c4.com>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
Message-ID: <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.137.202.136; envelope-from=hpa@zytor.com;
 helo=terminus.zytor.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

On December 28, 2022 8:57:54 AM PST, "Jason A=2E Donenfeld" <Jason@zx2c4=2E=
com> wrote:
>HELLO H=2E PETER ANVIN,
>E
>L
>L
>O
>
>On Wed, Dec 28, 2022 at 05:30:30PM +0100, Jason A=2E Donenfeld wrote:
>> > Fix looks good, glad you figured out the problem=2E
>>=20
>> I mean, kind of=2E The solution here sucks, especially given that in th=
e
>> worst case, setup_data just gets dropped=2E I'm half inclined to consid=
er
>> this a kernel bug instead, and add some code to relocate setup_data
>> prior to decompression, and then fix up all the links=2E It seems like
>> this would be a lot more robust=2E
>>=20
>> I just wish the people who wrote this stuff would chime in=2E I've had
>> x86@kernel=2Eorg CC'd but so far, no input from them=2E
>
>Apparently you are the x86 boot guru=2E What do you want to happen here?
>Your input would be very instrumental=2E
>
>Jason

Hi!

Glad you asked=2E

So the kernel load addresses are parameterized in the kernel image setup h=
eader=2E One of the things that are so parameterized are the size and possi=
ble realignment of the kernel image in memory=2E

I'm very confused where you are getting the 64 MB number from=2E There sho=
uld not be any such limitation=2E

In general, setup_data should be able to go anywhere the initrd can go, an=
d so is subject to the same address cap (896 MB for old kernels, 4 GB on ne=
wer ones; this address too is enumerated in the header=2E)

If you want to put setup_data above 4 GB, it *should* be ok if and only if=
 the kernel supports loading the initrd high, too (again, enumerated in the=
 header=2E

TL;DR: put setup_data where you put the initrd (before or after doesn't ma=
tter=2E)

To be maximally conservative, link the setup_data list in order from lowes=
t to highest address; currently there is no such item of relevance, but in =
the future there may be setup_data items needed by the BIOS part of the boo=
tstrap in which case they would have to be < 1 MB and precede any items > 1=
 MB for obvious reasons=2E That being said, with BIOS dying it is not all t=
hat likely that such entries will ever be needed=2E



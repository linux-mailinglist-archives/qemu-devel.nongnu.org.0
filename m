Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986B5F4263
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:52:00 +0200 (CEST)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofgSs-0006JJ-CJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofgHK-0006gm-0g
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:40:03 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:11203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofgHE-00084E-QY
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:40:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7177274632C;
 Tue,  4 Oct 2022 13:39:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0601274632B; Tue,  4 Oct 2022 13:39:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 03082746307;
 Tue,  4 Oct 2022 13:39:52 +0200 (CEST)
Date: Tue, 4 Oct 2022 13:39:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
In-Reply-To: <CAHmME9qDN_m6+6R3OiNueHc0qEcvptpO9+0HxZ713knZ=8fkoQ@mail.gmail.com>
Message-ID: <e687e447-c790-5628-377a-fa3ee8ad3@eik.bme.hu>
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
 <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
 <YzwM+KhUG0bg+P2e@zx2c4.com>
 <CAFEAcA9KsooNnYxiqQG-RHustSx0Q3-F8ibpQbXbwxDCA+2Fhg@mail.gmail.com>
 <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
 <CAFEAcA9-_qmtJgy_WRJT5TUKMm_60U53Mb9a+_BqUnQSS7PPcg@mail.gmail.com>
 <CAHmME9qDN_m6+6R3OiNueHc0qEcvptpO9+0HxZ713knZ=8fkoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Tue, 4 Oct 2022, Jason A. Donenfeld wrote:
> On Tue, Oct 4, 2022 at 1:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> What I'm asking, I guess, is why you're messing with this board
>> model at all if you haven't added this functionality to u-boot.
>> This is just an emulation of an ancient bit of MIPS hardware, which
>> nobody really cares about very much I hope.
>
> I think most people emulating MIPS would disagree. This is basically a
> reference platform for most intents and purposes. As I mentioned, this
> involves `-kernel` -- the thing that's used when you explicitly opt-in
> to not using a bootloader, so when you sign up for QEMU arranging the
> kernel image and its environment. Neglecting to pass an RNG seed would
> be a grave mistake.
>
>> I'm not saying this is a bad patch -- I'm just saying that
>> QEMU should not be in the business of defining bootloader-to-kernel
>> interfaces if it can avoid it, so usually the expectation is
>> that we are just implementing interfaces that are already
>> defined, documented and implemented by a real bootloader and kernel.
>
> Except that's not really the way things have ever worked here. The
> kernel now has the "rngseed" env var functionality, which is useful
> for a variety of scenarios -- kexec, firmware, and *most importantly*
> for QEMU. Don't block progress here.
>
>> -kernel generally means "emulate the platform's boot loader"
>
> And here, a platform bootloader could pass this, just as is the case
> with m68k's BI_RNG_SEED or x86's setup_data RNG SEED or device tree's
> rng-seed or EFI's LINUX_EFI_RANDOM_SEED_TABLE_GUID or MIPS' "rngseed"
> fw environment variable. These are important facilities to have.
> Bootloaders and hypervisors alike must implement them. *Do not block
> progress here.*

Cool dowm. Peter does not want to block progress here. What he said was 
that the malta is (or should be) emulating a real piece of hardware so 
adding some stuff to it which is not on that real hardware may not be 
preferred. If you want to experiment with generic mips hardware maybe you 
need a virt board instead that is free from such restrictions to emulate a 
real hardware. Some archs already have such board and there seems to be 
loongson3-virt but no generic mips virt machine yet. Defining and 
implementing such board may be more than you want to do for this but maybe 
that would be a better way to go.

Regards,
BALATON Zoltan


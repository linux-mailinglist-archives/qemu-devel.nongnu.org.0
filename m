Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366032E8D02
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 17:06:39 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw5tt-0001Ok-Ql
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 11:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw5sO-0000hi-3U; Sun, 03 Jan 2021 11:05:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:42309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw5sJ-0003qF-SM; Sun, 03 Jan 2021 11:05:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5B403747601;
 Sun,  3 Jan 2021 17:04:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E004A7470DD; Sun,  3 Jan 2021 17:04:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DDBE074645F;
 Sun,  3 Jan 2021 17:04:55 +0100 (CET)
Date: Sun, 3 Jan 2021 17:04:55 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 0/5] hw/mips: Fix Fuloong2E to boot Linux guest again
In-Reply-To: <e6f09fc9-0247-d99d-4823-9cae8f7a568f@ilande.co.uk>
Message-ID: <586540eb-1985-418f-d2fe-4da83f3be8c@eik.bme.hu>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <eb1af512-943e-f65c-d867-3ead1eccb5d5@eik.bme.hu>
 <e6f09fc9-0247-d99d-4823-9cae8f7a568f@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sun, 3 Jan 2021, Mark Cave-Ayland wrote:
> On 01/01/2021 23:56, BALATON Zoltan via wrote:
>> But Mark still considered that a horrible hack but after looking more 
>> closely he also found the difficulty of implementing a more faithful 
>> emulation so he would accept the flag at the end but still wanted registers 
>> to be set more consistently matching what the data sheet and whatever 
>> ideals would dictate. However I've spent a lot of time before finding these 
>> values that work with all clients and found some of these clients have 
>> assumptions instead of working in an ideal world following what data sheets 
>> say and I don't want to make any changes to this now before we also have 
>> pegasos2 upstreamed so any change can be more throughly tested and I don't 
>> have to retest everything for every small change just to find something 
>> broke,
>
> I'll reply briefly to this:

I'm also trying to keep on technical terms, will write a separate letter 
off-list about the rest.

> from the latest analysis the part that's missing 
> from QEMU is the ability to disable/enable PCI BARs. But this is only 
> something that has come to light during the past week from Guenter's bug

It did come to light (at least to me) in first iteration of these via-ide 
patches in March and I did tell you about it because I though it may help 
finding a problem with CMD646 that is used on a Sparc machine that to my 
knowledge you're interested in. See this thread:

https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg00776.html

(Probably that's how you got involved with the via-ide stuff in the first 
place, as otherwise I've only cc-d you for CMD646 related changes.)

> reports, as it is now clear the Gentoo image you were using for a test case 
> (which you also provided to me) was not sufficient to test the VIA IDE 
> functionality.

That's true. It wasn't easy to find an image for fuloong2e as this was 
only ever popular in China and has been long discontinued it seems so the 
manufacturer's site that everything linked to was down. Therefore I could 
only find this gentoo image that said it should work on real hardware. 
Later Jiaxun and Huacai came back with other Linux images that we did not 
have in March and Guenter updated his QEMU version now to find this 
problem so now we have new, better test cases which showed we can't keep 
the approach of only emulating (half-)native mode but also need legacy 
mode for fuloong2e because while the beta gentoo kernel worked with native 
mode other Linux kernels seem to want legacy mode on fuloong2e. (Pegasos2 
guests still want half-native mode so we need both and can't keep the 
original version that only emulated legacy mode.)

> I've already said that we can make use of a temporary hack for now, but the 
> patch in its current form is still not right. I'll send a follow-up again to 
> this thread so it is in one place for Phil's reference.

Thanks, I appreciate if this solution of having the legacy-mode flag can 
get in now, even if you think it's not perfect. But it would allow to get 
pegasos2 working while getting fuloong2e back the way it was and not 
making it any worse than it was already (in fact I think it does improve 
it a little even if not going the whole way). This can always be improved 
later but I'd appreciate if you could also test your proposed solutions 
with pegasos2 which will be easier once that's upstream otherwise I'll 
have to do all the testing again and get pushed back from being able to 
finally upstream this board that I've stared working on 2 years ago. 
That's why I get upset if you demand more clean ups than absolutely 
necessary to reach the minimum acceptable level.

If you can't wait until pegasos2 lands maybe you could experiment with 
CMD646 which I think may be somewhat similar and used by boards you 
maintain so it may be easier to experiment with without getting in the way 
of each other. That one I think only emulates native mode that may be 
enough for guests but also has a legacy mode that may be needed by some 
boot loaders or different boards so you could try to find a way to 
implement it cleanly in CMD646 then similar approach could be used for 
via-ide.

As for the way to solve legacy/native mode switching I think going from 
the ISA side is probably better than from the PCI side, i.e. instead of 
disabling PCI BARs that you mention above it would be better to fix the 
ISA emulation to allow deregistering previously added devices and allow 
changing their parameters. I think so for the following reasons:

- PCI BAR regions are already disabled until something programs their BARs 
and all of these IDE controllers start in legacy mode and guests change it 
to native mode and unlikely to change back to legacy so we don't really 
need to disable BARs once they are set up but we need to be able to turn 
off legacy ISA IDE emulation when switching to native mode.

- Other parts of the via south bridge have similar problems that are ISA 
devices that can be disabled or their base address changed such as serial, 
parallel ports and FDC (I've found these while cleaning up vt82c686 as 
part of merging my vt8231 emulation last week). So having a way to 
enable/disable ISA devices or set their parameters after they are set up 
could help better emulating those as well. (It may not be a problem though 
as most guests set it up once at start and either use default values or 
known values so we could map these there and get the guests work from 
where it's questionable if it's worth the effort to emulate this better 
but if QEMU had a way to do it in a simple way it could be done.)

- ISA is used by less machines then PCI so changing it probably has less 
risk of breaking everything so may be easier to do. Although it is used by 
the default pc machine and some fundamental machines so this should be 
done more carefully than what I have time for. That's why I did not 
attempt to do it and settled with what you call hacks to avoid having to 
change a lot of low level QEMU stuff that would take ages to test, review 
and get upstream. As long as those hacks work and not much worse than what 
we already have in QEMU then this should not be a problem and these can be 
cleaned up when somebody takes the time to clean up the other low level 
parts.

I did not think about it much but I think the problem may be because of 
ISA emulation dating back to the beginning and is still not fully 
qdev-ified so it's using globals and has an API that was only designed for 
creating devices at start but not change anything later. Qdev-ifying ISA 
may be the way to go but that's a road I don't want to walk down as I'm 
not interested in that apart from getting my guests boot and work so I'd 
leave that to whoever is bothered enough by it to change it. I still think 
cleaning it up now is not that high priority and could be done later when 
more high priority issues are fixed (which I think are better sound and 
gfx support for example) so spending time with those higher prirority 
issues would be better than polishing low level stuff that at the end 
don't make a difference in how guests run.

Regards,
BALATON Zoltan


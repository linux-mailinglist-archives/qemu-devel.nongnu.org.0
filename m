Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE992E7147
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 15:13:55 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFl2-0001iL-Ua
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 09:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuFhR-0008Nk-7Q
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 09:10:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:50469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuFhN-0000H2-Ev
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 09:10:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0294E7470E3;
 Tue, 29 Dec 2020 15:10:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BEFDE7470E0; Tue, 29 Dec 2020 15:10:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BD2D67470DF;
 Tue, 29 Dec 2020 15:10:02 +0100 (CET)
Date: Tue, 29 Dec 2020 15:10:02 +0100 (CET)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
In-Reply-To: <454e0750-7141-6daf-7917-259b2cb77cfa@ilande.co.uk>
Message-ID: <8459846f-6810-12fe-269f-7aa3e4b69df4@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
 <466edf59-2024-7eb1-3bce-924353add977@ilande.co.uk>
 <bc626ee4-f748-f1f-9a60-2477c35f752@eik.bme.hu>
 <454e0750-7141-6daf-7917-259b2cb77cfa@ilande.co.uk>
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Tue, 29 Dec 2020, Mark Cave-Ayland wrote:
> On 29/12/2020 12:01, BALATON Zoltan via wrote:
>>> Fortunately with PCI_CLASS_PROG at 0x8a Linux will keep the VIA IDE in 
>>> compatible mode and not attempt to switch to native mode: therefore if you 
>>> keep this as-is and add the legacy IDE ioports back, that just leaves the 
>>> problem with BAR4 (BMDMA). In effect your patch isn't setting compatible 
>>> mode anymore, it is just disabling BMDMA.
>> 
>> It's actually Guenter's patch so you're now bashing him not me...
>
> This is a deliberately misleading comment, and not a good introduction for

It's not deliberately misleading just stating a fact that you deliberately 
misinterpret. Guenter has contributed before (he also fixed up my sam460ex 
emulation) and his contributions are certainly appreciated. I'm sorry that 
he got unintentinally invoved in this disagreement between us two but I 
think he can ignore all this without a problem. I did not mean to drag him 
into it, just pointed out what you're doing and I think he got that.

> someone external becoming involved with the project. Guenter's patch was a 
> PoC demonstrating how to fix the fuloong2e machine, which is really 
> appreciated since it clearly locates the problems to allow a fix to be 
> applied upstream.
>
>> (But I also think your time could be better spent than getting rid of this 
>> hack when there are much more hacks or missing functionalities to get rid 
>> of in the part you maintain.)
>
> And comments like this are not appropriate for a technical mailing list 
> either. I've done my best to review your patch in good faith (including

Don't misunderstand this again, I did not mean to say that you made 
mistakes (although everyone does so that's not a problem) but what I meant 
is that there are a lot of things even in your areas that could be 
improved and that's time much better spent than discussing this patch 
endlessly on phylosophical basis when it's unlikely to get better.

> reading related specifications and testing your pegasos2 model) and explain 
> why it isn't reporting the correct information to the guest.

Yes I agree this should be brought to off list and clear up this between 
us I just don't have time for it now but I'll write to you later. As for 
your comments, we've been through all this in March and I get the 
impression that whatever I submit is criticised by you all the time so I 
really wonder if it's against me personally or you just getting old and 
grumpy :-) Don't take this as personal, no insult is meant just want to 
know if I did something that made you change your mind about my 
contributions or you do this to everything submitted to QEMU, because 
that's slowly becomes a burden discouriging me to contribute anything. I 
already gave up contributing to OpenBIOS but won't give up with QEMU, but 
I'm a bit tired having to fight for every little change to get past you 
(even in areas you're not maintaining like this one).

You can answer in private to this, I think others will be greateful to be 
left out of the discussion.

> Phil - I hope you find that found my review comments useful and that they 
> explain why the patchset is wrong by always claiming legacy IDE ioports exist 
> but not providing them unless the new option is set (and indeed indicating 
> some of the shortcomings of QEMU related to PCI BARs in this area that can be 
> improved in future). As I feel comments in this thread have become directed 
> at me personally, I am going to take a step back from this.

I'm sorry if you feel my replies got personal but I also feel your 
comments getting at me and you seemed to critique something that was 
addmittedly not perfect but working and demanded perfection where it's not 
feasible (without way more work that you can expect from unpayed 
contributors) and calling my patches wrong for that reason. I don't mind 
if you add comments, warnnings or change the commit message to say "this 
patch is all wrong but fixes Linux on fuloong2e and makes guests work with 
pegasos2 within the constraints of QEMU" as long as it gets in until a 
better fix may be available sometimes in the future. But:

- this patch is not mine now
- I did change what you asked in the first review but then you came back with this
- all this has been discussed to death and everyone but you seemed to accept it

I'll try to refrain from answering any more about this and let's continue 
off list if you want. I'd really want to avoid further confrontation but I 
happen to contribute to parts you also have an interest in so it's hard to 
avid each other so it would be better to get to some acceptable terms that 
allow me to contribute without upsetting you too much.

Regards,
BALATON Zoltan


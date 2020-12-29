Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5D2E70B2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 13:50:31 +0100 (CET)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuESM-0001QE-Bn
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 07:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuERG-0000ze-Ar
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:49:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49620
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuERE-0007Vt-77
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 07:49:22 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kuER7-0006dD-9P; Tue, 29 Dec 2020 12:49:13 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
 <466edf59-2024-7eb1-3bce-924353add977@ilande.co.uk>
 <bc626ee4-f748-f1f-9a60-2477c35f752@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <454e0750-7141-6daf-7917-259b2cb77cfa@ilande.co.uk>
Date: Tue, 29 Dec 2020 12:49:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bc626ee4-f748-f1f-9a60-2477c35f752@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.07,
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

On 29/12/2020 12:01, BALATON Zoltan via wrote:

>> Fortunately with PCI_CLASS_PROG at 0x8a Linux will keep the VIA IDE in compatible 
>> mode and not attempt to switch to native mode: therefore if you keep this as-is and 
>> add the legacy IDE ioports back, that just leaves the problem with BAR4 (BMDMA). In 
>> effect your patch isn't setting compatible mode anymore, it is just disabling BMDMA.
> 
> It's actually Guenter's patch so you're now bashing him not me...

This is a deliberately misleading comment, and not a good introduction for someone 
external becoming involved with the project. Guenter's patch was a PoC demonstrating 
how to fix the fuloong2e machine, which is really appreciated since it clearly 
locates the problems to allow a fix to be applied upstream.

> (But I also think your time could be better spent than getting rid of this hack when 
> there are much more hacks or missing functionalities to get rid of in the part you 
> maintain.)

And comments like this are not appropriate for a technical mailing list either. I've 
done my best to review your patch in good faith (including reading related 
specifications and testing your pegasos2 model) and explain why it isn't reporting 
the correct information to the guest.

Phil - I hope you find that found my review comments useful and that they explain why 
the patchset is wrong by always claiming legacy IDE ioports exist but not providing 
them unless the new option is set (and indeed indicating some of the shortcomings of 
QEMU related to PCI BARs in this area that can be improved in future). As I feel 
comments in this thread have become directed at me personally, I am going to take a 
step back from this.


ATB,

Mark.


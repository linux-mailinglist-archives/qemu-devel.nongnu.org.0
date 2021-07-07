Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691873BE635
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:13:56 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14Z1-00085C-Ga
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14Xe-0006i8-1o
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:12:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50610
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14Xb-0006Zc-T2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:12:29 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m14XU-000CXM-Ik; Wed, 07 Jul 2021 11:12:24 +0100
To: Finn Thain <fthain@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
 <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
 <d44ae2a3-112a-a84e-5900-bdfa7594cd1c@ilande.co.uk>
 <50e27af7-894f-8eb-426-1b3483fa3345@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0ca7c6e7-08e5-fd18-4af8-880d6a3b1da6@ilande.co.uk>
Date: Wed, 7 Jul 2021 11:12:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <50e27af7-894f-8eb-426-1b3483fa3345@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 02:30, Finn Thain wrote:

> On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:
> 
>> On 05/07/2021 02:36, Finn Thain wrote:
>>
>>>> Unfortunately I don't have a test mips64el image available to see if
>>>> this combination works for Linux. Phil, do you have a suitable test
>>>> kernel and rootfs image available to allow this to be tested?
>>>>
>>>
>>> You can build and boot a mipsel vmlinux by following the steps I
>>> described previously. In the kernel messages you'll see the jazzsonic
>>> driver attempt to probe the device. When it succeeds, you'll see the
>>> MAC address reported. You can also observe the regression I reported
>>> with regards to patch 2/6, "dp8393x: don't force 32-bit register
>>> access".
>>
>> Those instructions are useful, but since I am not a MIPS developer I
>> don't have an existing toolchain/kernel tree and rootfs available to
>> test this.
>>
> 
> You don't need a rootfs to see the jazzsonic driver messages. But if you
> still want one, you could try the mipsel builds from these distros (not
> the 64-bit ones):
> 
> https://ftp.jaist.ac.jp/pub/Linux/Gentoo/experimental/mips/stages/
> https://landley.net/aboriginal/downloads/binaries/

That's true, but then this wouldn't enable testing of Phil's proposed CRC changes. 
Having a simple shell with ping and wget/curl is a real help here.

>> If you can provide me with a link to your vmlinux and rootfs with
>> busybox or similar in it, I can take a look to see what is happening
>> here. Otherwise it's almost impossible for me to understand and debug
>> the problem you are seeing on your setup.
>>
> 
> Uploading kernels is a hassle (for me) as it brings a trust question and
> requires a file hosting service. I really should use PGP and organise a
> web of trust but that's very difficult given my rural location.

Given that these are only running in a VM I'm not too worried about trust. I also 
have a VPS with scp access that I could temporarily grant you access via an SSH 
public key if that helps?


ATB,

Mark.


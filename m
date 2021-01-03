Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD292E8C9C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 15:29:21 +0100 (CET)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw4Nk-0000ui-Ll
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 09:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw4MU-0008UZ-J4; Sun, 03 Jan 2021 09:28:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53672
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw4MR-0004d9-Dq; Sun, 03 Jan 2021 09:28:01 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kw4MH-0000go-NN; Sun, 03 Jan 2021 14:27:50 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <eb1af512-943e-f65c-d867-3ead1eccb5d5@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e6f09fc9-0247-d99d-4823-9cae8f7a568f@ilande.co.uk>
Date: Sun, 3 Jan 2021 14:27:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eb1af512-943e-f65c-d867-3ead1eccb5d5@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 0/5] hw/mips: Fix Fuloong2E to boot Linux guest again
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.262,
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
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/01/2021 23:56, BALATON Zoltan via wrote:

> But Mark still considered that a horrible hack but after looking more closely he also 
> found the difficulty of implementing a more faithful emulation so he would accept the 
> flag at the end but still wanted registers to be set more consistently matching what 
> the data sheet and whatever ideals would dictate. However I've spent a lot of time 
> before finding these values that work with all clients and found some of these 
> clients have assumptions instead of working in an ideal world following what data 
> sheets say and I don't want to make any changes to this now before we also have 
> pegasos2 upstreamed so any change can be more throughly tested and I don't have to 
> retest everything for every small change just to find something broke,

I'll reply briefly to this: from the latest analysis the part that's missing from 
QEMU is the ability to disable/enable PCI BARs. But this is only something that has 
come to light during the past week from Guenter's bug reports, as it is now clear the 
Gentoo image you were using for a test case (which you also provided to me) was not 
sufficient to test the VIA IDE functionality.

I've already said that we can make use of a temporary hack for now, but the patch in 
its current form is still not right. I'll send a follow-up again to this thread so it 
is in one place for Phil's reference.


ATB,

Mark.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8074582C7
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 10:42:08 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mojMN-0004tR-En
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 04:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mojLC-0004CS-6W
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 04:40:54 -0500
Received: from [2001:41c9:1:41f::167] (port=47610
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mojLA-0005Ig-1g
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 04:40:53 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mojKw-00052T-5Z; Sun, 21 Nov 2021 09:40:42 +0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9iCtdyprx7C_m0++TrUjTEEYPYGsA96cVQ4jZVR0hjzw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c60261f4-ba71-ad13-b0c6-bda4c3270ffd@ilande.co.uk>
Date: Sun, 21 Nov 2021 09:40:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9iCtdyprx7C_m0++TrUjTEEYPYGsA96cVQ4jZVR0hjzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.2 0/2] escc: fixes for STATUS_TXEMPTY and
 SPEC_ALLSENT
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.022,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2021 18:23, Peter Maydell wrote:

> On Thu, 18 Nov 2021 at 18:18, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This is another attempt to fix booting 32-bit QEMU SPARC machines in
>> qemu-system-sparc using a real Sun PROM based upon further experiments and
>> re-reading of the ESCC datasheet from a previous patch posted at
>> https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00324.html.
>>
>> It appears that both the Sun PROM and OpenBSD with OpenBIOS fail to send an
>> explicit reset command as recommended in the ESCC datasheet, which causes
>> hangs during serial port enumeration since the introduction of the recent
>> ESCC reset changes.
>>
>> The first patch always sets STATUS_TXEMPTY in R_STATUS on hardware reset
>> which wasn't documented in the "Reset" section(s) but is documented in the
>> "Transmit Interrupts and Transmit Buffer Empty Bit" section, whilst the
>> second patch updates SPEC_ALLSENT when writing to W_TXCTRL1.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Series
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks Peter. I've added this to my qemu-sparc queue and will send a PR shortly with 
both yours and Philippe's R-B tags.


ATB,

Mark.


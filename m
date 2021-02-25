Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FB324D46
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:56:02 +0100 (CET)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDNJ-0000oC-FI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFDLq-0008Lm-SE
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:54:30 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36944
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFDLo-0004Ce-Uj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:54:30 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lFDLh-0008HS-KL; Thu, 25 Feb 2021 09:54:22 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <e1eaa8e1-c3e8-478b-615d-3cf87542d357@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f0ba939b-b69f-5fce-e24a-5778aa29b59f@ilande.co.uk>
Date: Thu, 25 Feb 2021 09:54:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e1eaa8e1-c3e8-478b-615d-3cf87542d357@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2021 21:32, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>> This patch series comes from an experimental branch that I've been working on
>> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
>> far from complete, but it seems worth submitting these patches separately since
>> they are limited to the ESP device and form a substantial part of the work to
>> date.
>>
>> As part of Laurent's recent q800 work so-called PDMA (pseudo-DMA) support was
>> added to the ESP device. This is whereby the DREQ (DMA request) line is used
>> to signal to the host CPU that it can transfer data to/from the device over
>> the SCSI bus.
>>
>> The existing PDMA tracks 4 separate transfer data sources as indicated by the
>> ESP pdma_origin variable: PDMA, TI, CMD and ASYNC with an independent variable
>> pdma_len to store the transfer length. This works well with Linux which uses a
>> single PDMA request to transfer a number of sectors in a single request.
>>
>> Unfortunately the MacOS toolbox ROM has other ideas here: it sends data to the
>> ESP as a mixture of FIFO and PDMA transfers and then uses a mixture of the FIFO
>> and DMA counters to confirm that the correct number of bytes have been
>> transferred. For this to work correctly the PDMA buffers and separate pdma_len
>> transfer counter must be consolidated into the FIFO to allow mixing of both
>> types of transfer within a single request.
>>
>> The patchset is split into several sections:
>>
>> - Patches 1-7 are minor patches which make esp.c checkpatch friendly, QOMify ESPState,
>>    and also fix up some trace events ready for later patches in the series
>>
>> - Patches 8-13 unify the DMA transfer count. In particular there are 2 synthetic
>>    variables dma_counter and dma_left within ESPState which do not need to exist.
>>    DMA transfer lengths are programmed into the TC (transfer count) register which is
>>    decremented for each byte transferred, generating an interrupt when it reaches zero.
>>    These patches add helper functions to read the TC and STC registers directly and
>>    remove these synthetic variables so that the DMA transfer length is now tracked in
>>    a single place.
>>
>> - Now that the TC register represents the authoritative DMA transfer length, patches
>>    14-25 work to eliminate the separate PDMA variables pdma_start, pdma_cur, pdma_len
>>    and separate PDMA buffers PDMA and CMD. The PDMA position variables can be replaced
>>    by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used
>>    for incoming data with commands being accumulated in cmdbuf as per standard DMA
>>    requests.
> 
> I tried to help reviewing up to this point.
> 
> The next parts are too specific to me.

Thanks Phil - I understand that a set of 42 patches for a 25 year old disk controller 
is never going to be the top of most people's review list, and some parts are almost 
impossible to review unless you have a good understanding of the datasheet.

I'll see if Laurent has any comments over the next few days, but other than that I'd 
be inclined to send a v3 followed soon by a PR to avoid me having to update these 
regularly (I already see a slight conflict with Paolo's SCSI error handling changes, 
for example).


ATB,

Mark.


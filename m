Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EE2F536D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:37:31 +0100 (CET)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlxS-0006CY-MZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzlpi-0002S7-Mn
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:29:30 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40310
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzlpd-00062w-BL
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:29:30 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzlph-0002n9-Ey; Wed, 13 Jan 2021 19:29:29 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <5af57492-a070-b109-8daa-ba3eb2ea1855@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8ef74488-22f6-34e8-bf43-fea2e1706738@ilande.co.uk>
Date: Wed, 13 Jan 2021 19:29:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5af57492-a070-b109-8daa-ba3eb2ea1855@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/25] esp: consolidate PDMA transfer buffers
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

On 13/01/2021 14:39, Paolo Bonzini wrote:

> On 30/12/20 16:37, Mark Cave-Ayland wrote:
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
> 
> This is all esp.c, so if Laurent and you are fine just send a pull request.
> 
> Thanks!
> 
> Paolo

I sent a self-nak a little while back because I found an issue with address alignment 
in some requests coming from the MacOS toolbox ROM. I think I now understand what the 
issue is, so I hope to post a v2 with this fixed soon.


ATB,

Mark.


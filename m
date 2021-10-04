Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D3A4216AF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:39:27 +0200 (CEST)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSs2-0004SB-7k
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSqr-000399-JN
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:38:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35622
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSqq-0005WN-1s
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:38:13 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSqZ-0007n3-7n; Mon, 04 Oct 2021 19:37:59 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
 <2d85248a-bddd-c390-d0a2-356d57627786@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <57e06bdc-7e31-8aae-79d0-9d71c9778455@ilande.co.uk>
Date: Mon, 4 Oct 2021 19:38:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2d85248a-bddd-c390-d0a2-356d57627786@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/12] macfb: handle errors that occur during realize
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/2021 12:36, BALATON Zoltan wrote:

> On Sat, 2 Oct 2021, Mark Cave-Ayland wrote:
>> Make sure any errors that occur within the macfb realize chain are detected
>> and handled correctly to prevent crashes and to ensure that error messages are
>> reported back to the user.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/display/macfb.c | 11 +++++++++++
>> 1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 76808b69cc..2b747a8de8 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
> 
> There's one more in macfb_common_realize() after:
> 
> memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram", 
> MACFB_VRAM_SIZE, errp);
> 
> otherwise
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Ah yes, IIRC from the last patchset the outcome of the discussion with Markus was 
that these functions should use &error_abort. I'll make the same change here for v2.


ATB,

Mark.


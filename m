Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8251EC80
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:27:42 +0200 (CEST)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndCX-00089S-Gz
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndBF-0007Dn-LK
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:26:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndBE-0007tD-8P
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:26:21 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndAE-0009sy-LT; Sun, 08 May 2022 10:25:22 +0100
Message-ID: <f359536a-4dc2-ab7a-857f-95621187a7b8@ilande.co.uk>
Date: Sun, 8 May 2022 10:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, svens@stackframe.org, qemu-devel@nongnu.org
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
 <ede9e4f0-0972-c7dd-cc20-62579cac310f@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ede9e4f0-0972-c7dd-cc20-62579cac310f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/3] artist: minor fixes and performance improvement
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 05/05/2022 13:26, Helge Deller wrote:

> On 5/4/22 17:37, Mark Cave-Ayland wrote:
>> Patch 1 updates artist.c to fix some style issues and ensure that artist.c passes
>> checkpatch for the remainder of the patchset, whilst patch 2 removes the ROP8OFF()
>> macro which is currently unused.
>>
>> Finally patch 3 is the main reason for this patchset and improves the performance
>> of the artist framebuffer by only rendering the dirty scanlines to the display
>> surface, which noticeably improves boot times and makes the GTK UI usable on my
>> fairly modest laptop.
>>
>> [Helge/Sven: if you can provide a Tested-by or Reviewed-by tag for this patchset
>> before the weekend, I can include it in my PR containing all the other HPPA
>> updates]
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> I tested it and indeed, the GTK GUI is now really much faster, even with the
> GTK window forwarded over X11.

Excellent!

> Ideally, can the patch #3 (the GTK speedup) be backported?

I'm not sure that it would really make a difference in this case: if this were queued 
for 7.0 then that wouldn't be released until a few weeks after 7.1, and even then its 
likely that the stable distros would be using something older regardless so it 
wouldn't get picked up anyhow.

> I applied, reviewed and tested it. Please add:
> 
> Reviewed-by: Helge Deller <deller@gmx.de>

Thanks - I'll add your R-B to the artist series.


ATB,

Mark.


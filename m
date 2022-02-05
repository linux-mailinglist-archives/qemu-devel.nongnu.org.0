Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2994AA963
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 15:24:01 +0100 (CET)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGLyq-0002K9-7q
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 09:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGLuw-0000Jx-2P
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 09:19:58 -0500
Received: from [2001:738:2001:2001::2001] (port=23789 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGLut-0004Ly-GI
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 09:19:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D00FF745708;
 Sat,  5 Feb 2022 15:19:47 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 56159745706; Sat,  5 Feb 2022 15:19:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 50A547456E3;
 Sat,  5 Feb 2022 15:19:47 +0100 (CET)
Date: Sat, 5 Feb 2022 15:19:47 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
In-Reply-To: <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
Message-ID: <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
References: <20220203000550.36711-1-f4bug@amsat.org>
 <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-172194836-1644070787=:62768"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andreas Gustafsson <gson@gson.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-172194836-1644070787=:62768
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 5 Feb 2022, Mark Cave-Ayland wrote:
> On 03/02/2022 00:05, Philippe Mathieu-Daudé via wrote:
>
>> When resetting we don't want to *reset* the dirty bitmap,
>> we want to *set* it to mark the entire VRAM dirty due to
>> the memset() call.
>> 
>> Replace memory_region_reset_dirty() by tcx_set_dirty()
>> which conveniently set the correct ranges dirty.
>> 
>> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Supersedes: <20220122000707.82918-1-f4bug@amsat.org>
>> ---
>>   hw/display/tcx.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
>> index d4d09d0df8..90e2975e35 100644
>> --- a/hw/display/tcx.c
>> +++ b/hw/display/tcx.c
>> @@ -371,8 +371,7 @@ static void tcx_reset(DeviceState *d)
>>       s->r[258] = s->g[258] = s->b[258] = 255;
>>       update_palette_entries(s, 0, 260);
>>       memset(s->vram, 0, MAXX*MAXY);

Should checkpatch complain about missing spaces around * here?

>> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
>> -                              DIRTY_MEMORY_VGA);
>> +    tcx_set_dirty(s, 0, MAXX * MAXY);
>>       s->dac_index = 0;
>>       s->dac_state = 0;
>>       s->cursx = 0xf000; /* Put cursor off screen */
>
> I don't think the size calculation of MAXX * MAXY is correct when comparing 
> with above? I think it's easiest just to use the same approach as

Xonsidering that the memset has the same length it should be correct as 
that's what has been changed (assuming tcx_set_dirty works correctly), but 
maybe there's some trick here I don't know about.

> update_palette_entries() here e.g.
>
>    tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));

This may be an overkill. Although probably does not matter but it's still 
cleaner to only set dirty what has been changed otherwise you've just 
disabled dirty tracking. On the other hand, if this is a reset routine do 
you only want to clear the displayable part of vram or the whole vram?

Regards,
BALATON Zoltan
--3866299591-172194836-1644070787=:62768--


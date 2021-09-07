Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33233402315
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 07:41:54 +0200 (CEST)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNTrk-0006ca-PP
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 01:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNToM-0004d2-N1
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 01:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNToI-0000dG-CD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 01:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630993096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBXeCJ71E/VEdSBcCQKx212h4yvOEa2+o5kfsM4JAh0=;
 b=dYBmSsXsmhsAusAQbBqDQf43MOtQyD78uGkxsVXQDU/Zj+U0y6B8394TyCrDk6NSmuNCBu
 6qUD5BVK5bXIMAm4jm+lbLuWoUmn69x0tirYMh7YnfGT/aQ975Cvc7IWJnmY+7WlErNrNU
 TGex7uYvLWjPRJEagYaZ+jbYjAuxtL8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-2FTi8L1nOjWrMG1E1IezKA-1; Tue, 07 Sep 2021 01:38:14 -0400
X-MC-Unique: 2FTi8L1nOjWrMG1E1IezKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so654498wmj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 22:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YBXeCJ71E/VEdSBcCQKx212h4yvOEa2+o5kfsM4JAh0=;
 b=Jgiw9xlnveHpGCYc629nFOIyr/ssWrfmxAunrHqkigHXE9s/TUeZ8L0+eNLsXbnbI1
 0Ahz1Bn8blyu/OUaXZRqxH+awWmg54qbJ6ZQcVw12xzUMEWZGGYJ52hazC1KabaY7i4W
 hYFpqfl1jLmQoQa52pVpqMI18fsI5gmhl16uXyFy9JvH+XzEXKWEzH6FqlKEWbHEdaho
 6uX2oHiC/XWnh5E2DulRpfwNqawj3A3GdkZgnZj7wnRQh6z2tXuXfVMpPxLMtX3LNlDL
 6tQRiDWChkDez5ZV3uOY2G4BCUO1v9DqdqjjJITewnZVy+mLQSDxS4tVYe6KLlln3HhO
 JbyA==
X-Gm-Message-State: AOAM533rqbgS16j4fsrRJTgUJn9Vcpqw/MTFSix+MV71XDfyjhopr0Gy
 M9CF1n9vQWZLz41UV72htMzh2qNm9P9dAT1w7JPFwoSzPSZcWRixVNaHSScuZgUdZKWSamNJDu4
 xqWbk8+TBnXr3msw=
X-Received: by 2002:a5d:4991:: with SMTP id r17mr17248379wrq.247.1630993091545; 
 Mon, 06 Sep 2021 22:38:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzKvEkOxWX/JUSuuBLZSeMOGooyXjMiIuHhxh/TLQ0A2AuRtKlW2HasEIs3DPT53gIHDT4tw==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr17248334wrq.247.1630993091070; 
 Mon, 06 Sep 2021 22:38:11 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u16sm1449991wmc.41.2021.09.06.22.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 22:38:10 -0700 (PDT)
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
 <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
 <bb39ee8c-a567-591a-a1c4-822683bb723@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ba32305-3e9f-a770-0406-7612ed4aeece@redhat.com>
Date: Tue, 7 Sep 2021 07:38:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bb39ee8c-a567-591a-a1c4-822683bb723@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Ziming Zhang <ezrakiez@gmail.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 9:52 PM, BALATON Zoltan wrote:
> On Mon, 6 Sep 2021, Philippe Mathieu-Daudé wrote:
>> (Forgot to Cc Alex for eventual reproducer)
>>
>> On 9/6/21 6:44 PM, Mauro Matteo Cascella wrote:
>>> On Mon, Sep 6, 2021 at 5:31 PM Philippe Mathieu-Daudé
>>> <philmd@redhat.com> wrote:
>>>>
>>>> When building QEMU with DEBUG_ATI defined then running with
>>>> '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
>>>> we get:
>>>>
>>>>   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>>>>   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>>>>   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>>>>   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>>>>   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>>>>   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>>>>   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>>>>   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>>>>   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>>>>   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800
>>>> stride:2560 bpp:32 rop:0xff
>>>>   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>>>>   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8,
>>>> x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
>>>>   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation
>>>> fault.
>>>>   (gdb) bt
>>>>   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at
>>>> /lib64/libpixman-1.so.0
>>>>   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>>>>   #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
>>>> hw/display/ati_2d.c:196
>>>>   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800,
>>>> addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
>>>>   #4  0x0000555558b90ec4 in memory_region_write_accessor
>>>> (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at
>>>> softmmu/memory.c:492
>>>>
>>>> Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
>>>> the local dst_x and dst_y which adjust the (x, y) coordinates
>>>> depending on the direction in the SRCCOPY ROP3 operation, but
>>>> forgot to address the same issue for the PATCOPY, BLACKNESS and
>>>> WHITENESS operations, which also call pixman_fill().
>>>>
>>>> Fix that now by using the adjusted coordinates in the pixman_fill
>>>> call, and update the related debug printf().
>>>>
>>>> Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
>>>> Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/display/ati_2d.c | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
>>>> index 4dc10ea7952..692bec91de4 100644
>>>> --- a/hw/display/ati_2d.c
>>>> +++ b/hw/display/ati_2d.c
>>>> @@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
>>>>      DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
>>>>              s->regs.src_offset, s->regs.dst_offset,
>>>> s->regs.default_offset,
>>>>              s->regs.src_pitch, s->regs.dst_pitch,
>>>> s->regs.default_pitch,
>>>> -            s->regs.src_x, s->regs.src_y, s->regs.dst_x,
>>>> s->regs.dst_y,
>>>> +            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
>>>>              s->regs.dst_width, s->regs.dst_height,
>>>>              (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
>>>>              (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
>>>> @@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
>>>>          dst_stride /= sizeof(uint32_t);
>>>>          DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
>>>>                  dst_bits, dst_stride, bpp,
>>>> -                s->regs.dst_x, s->regs.dst_y,
>>>> +                dst_x, dst_y,
>>>>                  s->regs.dst_width, s->regs.dst_height,
>>>>                  filler);
>>>>          pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
>>>> -                    s->regs.dst_x, s->regs.dst_y,
>>>> +                    dst_x, dst_y,
>>>>                      s->regs.dst_width, s->regs.dst_height,
>>>>                      filler);
>>>>          if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
>>>> -- 
>>>> 2.31.1
>>>>
>>>
>>> Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
>>
>> Thanks. I wouldn't be surprise if we get another CVE in this code /
>> file / function ASAP this patch get merged... The code calls for a
>> rewrite, as per this function comment in its header:
>>
>> void ati_2d_blt(ATIVGAState *s)
>> {
>>    /* FIXME it is probably more complex than this and may need to be */
>>    /* rewritten but for now as a start just to get some output: */
> 
> It's also broken currently since the previous CVE fixes when I've tried
> to change it to only use unsigned values to avoid underflows and get
> away with only checking for overflows which simplifies it a bit. But
> turns out that's wrong, the hardware does allow negative values and
> while most drivers don't use that (such as Linux and MorphOS, so they
> still work), at least Solaris driver does and it produces broken picture
> now once X starts. (This can be reproduced with Solaris 10 x86 iso, but

It would be useful to dump these Solaris I/O accesses to use them as
regression tests.

> Solaris also needs more features to be implemented to make it work so
> fixing this alone is not enough to get past the first screen, text will
> be still missing.) To fix this we will need to revert to signed values
> and check for both over and underflow. I planned to try that eventually
> but haven't yet got around to it.
> 
> I don't think assigning a CVE to a bug that is in an experimental and
> largely unused part and happens when one enables debug code really worth
> the hassle, this could be handled as a normal bug. As long as the

CVE assignment can happens outside of QEMU community, we try to make it
clear what is the "security boundary" but researchers filling CVEs
might not understand it well.

> proposed fix does not break MorphOS I'm OK with it as probably that's
> the only useful case for ati-vga currently (and maybe booting Linux on
> pegasos2) but these are hardly security critical. I don't think anybody
> would use it for anything else at least there were no contributions or
> reports so far. Have you tested if MorphOS still works as described at
> http://zero.eik.bme.hu/~balaton/qemu/amiga/ ?

Nop.



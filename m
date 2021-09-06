Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48101401F7E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 20:21:23 +0200 (CEST)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNJFA-0005S8-14
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 14:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNJDf-0004IT-6W
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNJDa-0003rs-4e
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630952380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8dxmYI32cw4JsBNx46CVHGrUFngfBvv9tbQcMLU6p4=;
 b=Q3Qfe8vuAh+qMTctJQgg5YHAcKvrX7G22Bx4HgYXYaAzHFUTLwLBOhrYdkFXmLVOIXbx+c
 HgyMGRXTausm0LM9So6hTXkfzsIC+7uPyxcBMGZE+h2kydxLhXGM1kdBiH+JXXaO1eNoxu
 G+AZCP6hfmIUkhReRvUSb+ZUkB+atos=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-l_XZO4_eMPaTRj5XkCaPzw-1; Mon, 06 Sep 2021 14:19:39 -0400
X-MC-Unique: l_XZO4_eMPaTRj5XkCaPzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso32068wme.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 11:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8dxmYI32cw4JsBNx46CVHGrUFngfBvv9tbQcMLU6p4=;
 b=BVDGRqHbRKffpWH++XQkiWGeBl81FvsLaQ3wkjEJTMuaHOnvMVC/0zWvWI11rvH0bX
 SuFngkMHhZ69mFr8ui83y8fnCeR1RbqTPrPHTBwgAt4gswWvnhwuhaRBMmNW+e4v/nWF
 LOLeTS7QeZTXf+3nJdDheyge/wvYeX4AFpy6Znal097liFGCESHG5iRd2raJpnDwwewk
 37WWIdjXnyuyyo9Cy9zd4YUg1eQtIzLMt/zkxaZvZM/OJ0Fzww8FuzJDAfF8TnH7aSyk
 s8RLgyvIjyYixLRW+vAQh+ZewESCbwrutl0ed7MsRATsvttD2ZEgBMMHafnd76kO8BUu
 GK/A==
X-Gm-Message-State: AOAM532ARiNkQu74niVzIirRqXpbA6uTSfhKMoS9kMNIpCDvRpDHFkse
 drtoXAeIx4oL6MTXf7g/l1HWtsZDmCVFNwGU39pTeoSVQ0qF3iygTnmtOusO1GyCRGFcb/B5Nx5
 p44FGxar4A8oBUlI=
X-Received: by 2002:a5d:464c:: with SMTP id j12mr15110411wrs.27.1630952376852; 
 Mon, 06 Sep 2021 11:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8NX7S4RHtSuQuWNNAL461Ol5fiSTDuncccEesR8fML4cELlIDQgO1Qqs6STCwJY3LUU+gQA==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr15110376wrs.27.1630952376528; 
 Mon, 06 Sep 2021 11:19:36 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i4sm264949wmd.5.2021.09.06.11.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 11:19:36 -0700 (PDT)
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
Date: Mon, 6 Sep 2021 20:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, Ziming Zhang <ezrakiez@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Forgot to Cc Alex for eventual reproducer)

On 9/6/21 6:44 PM, Mauro Matteo Cascella wrote:
> On Mon, Sep 6, 2021 at 5:31 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> When building QEMU with DEBUG_ATI defined then running with
>> '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
>> we get:
>>
>>   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>>   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>>   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>>   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>>   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>>   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>>   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>>   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>>   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>>   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32 rop:0xff
>>   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>>   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
>>   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
>>   (gdb) bt
>>   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
>>   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>>   #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at hw/display/ati_2d.c:196
>>   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
>>   #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at softmmu/memory.c:492
>>
>> Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
>> the local dst_x and dst_y which adjust the (x, y) coordinates
>> depending on the direction in the SRCCOPY ROP3 operation, but
>> forgot to address the same issue for the PATCOPY, BLACKNESS and
>> WHITENESS operations, which also call pixman_fill().
>>
>> Fix that now by using the adjusted coordinates in the pixman_fill
>> call, and update the related debug printf().
>>
>> Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
>> Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/display/ati_2d.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
>> index 4dc10ea7952..692bec91de4 100644
>> --- a/hw/display/ati_2d.c
>> +++ b/hw/display/ati_2d.c
>> @@ -84,7 +84,7 @@ void ati_2d_blt(ATIVGAState *s)
>>      DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
>>              s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
>>              s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
>> -            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
>> +            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
>>              s->regs.dst_width, s->regs.dst_height,
>>              (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
>>              (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
>> @@ -180,11 +180,11 @@ void ati_2d_blt(ATIVGAState *s)
>>          dst_stride /= sizeof(uint32_t);
>>          DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
>>                  dst_bits, dst_stride, bpp,
>> -                s->regs.dst_x, s->regs.dst_y,
>> +                dst_x, dst_y,
>>                  s->regs.dst_width, s->regs.dst_height,
>>                  filler);
>>          pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
>> -                    s->regs.dst_x, s->regs.dst_y,
>> +                    dst_x, dst_y,
>>                      s->regs.dst_width, s->regs.dst_height,
>>                      filler);
>>          if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
>> --
>> 2.31.1
>>
> 
> Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thanks. I wouldn't be surprise if we get another CVE in this code /
file / function ASAP this patch get merged... The code calls for a
rewrite, as per this function comment in its header:

void ati_2d_blt(ATIVGAState *s)
{
    /* FIXME it is probably more complex than this and may need to be */
    /* rewritten but for now as a start just to get some output: */

Regards,

Phil.



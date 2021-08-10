Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D873E528B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:06:58 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJyb-0005az-Fx
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDJxE-0004CD-8g
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:05:32 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:36006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDJxA-0000kB-2E
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:05:32 -0400
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout07.t-online.de (Postfix) with SMTP id 676C66506;
 Tue, 10 Aug 2021 07:05:24 +0200 (CEST)
Received: from [192.168.211.200]
 (XL+Tz-ZCZhoT8-eEsXWepKWD+N8o033v7OeSU8LghBe4YT5oe6PsA9PZpyMpnInw+Y@[79.208.26.7])
 by fwd31.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mDJx5-2KZ38S0; Tue, 10 Aug 2021 07:05:23 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 3/3] ps2: migration support for command reply queue
To: Gerd Hoffmann <kraxel@redhat.com>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
 <20210807121202.6294-3-vr_qemu@t-online.de>
 <20210809101808.ds3kf37np46gxedc@sirius.home.kraxel.org>
Message-ID: <87553bd1-6493-d04c-ab44-6a239dde6cbe@t-online.de>
Date: Tue, 10 Aug 2021 07:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809101808.ds3kf37np46gxedc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: XL+Tz-ZCZhoT8-eEsXWepKWD+N8o033v7OeSU8LghBe4YT5oe6PsA9PZpyMpnInw+Y
X-TOI-EXPURGATEID: 150726::1628571923-000102A7-9A2671FF/0/0 CLEAN NORMAL
X-TOI-MSGID: 88f22572-f647-4946-8660-cf9f8b9cd195
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>    Hi,
>
>> +static bool ps2_keyboard_cqueue_needed(void *opaque)
>> +{
>> +    PS2KbdState *s = opaque;
>> +
>> +    return s->common.queue.cwptr != -1; /* the queue is mostly empty */
>> +}
>> +
>> +static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
>> +    .name = "ps2kbd/command_reply_queue",
>> +    .needed = ps2_keyboard_cqueue_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_INT32(common.queue.cwptr, PS2KbdState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
> Not going to work (the existing vmstate_ps2_keyboard_need_high_bit has
> the same problem btw).  Chicken and egg problem on the receiving side:
> How you properly evaluate ps2_keyboard_cqueue_needed() without having
> common.queue.cwptr received yet?
>
> With "cqueue not needed" being the common case migration will work
> nicely in most cases nevertheless, but when the source machine actually
> sends cqueue state things will break ...

Hi Gerd,

this part actually works. .needed is only evaluated on the sending side. 
For the receiving side subsections are optional. Migration doesn't fail 
if a subsection isn't loaded. Before I sent this patch series one of the 
migration tests was a migration from 6.0.92 to 6.0.92 with one byte in 
the command reply queue and 3 bytes in the scancode queue. The migration 
didn't fail.

Migration will fail in the rare case when a new QEMU sends the 
command_reply_queue subsection to an old QEMU version.

> Looking at data sent via vmstate works but ordering is important.  You
> could check write_cmd because that is sent in the migration data stream
> before ps2_keyboard_cqueue_needed() will be evaluated (just an random
> example for the ordering, probably wouldn't help much in this case).
>
> There is some redundancy in the data stream (wptr + rptr would be
> enough, but we also send count).  Maybe that can be used somehow.
> Of course the tricky part is to not confuse old qemu versions on
> the receiving end.
>
> If we can't find something we can add a property simliar to the one
> for the extended keyboard state.

What is the best way to add such a compat property? The ps2 keyboard 
isn't a qdev device. I can't just add a property to the device class. Do 
I have to add a property to the i8042 and the pl050 device and propagate 
the property value with the ps2_kbd_init() call to the PS2KbdState?

With best regards,
Volker

> take care,
>    Gerd
>



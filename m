Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9A3BF1C9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:59:24 +0200 (CEST)
Received: from localhost ([::1]:39722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1FZj-0000MN-H6
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1FYS-0006xm-ET
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:58:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1FYQ-00019x-Pz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:58:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id d12so4175451wre.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1sSlVk5t1UTrE5iK60YCr/+nbB6+iOIyAVHm9P78SMI=;
 b=akit0n45gYMTAC+pR6icZaluQ0ESrZ6uuAODBN3lPmrMvh9Vb/cx6aFtyQR7/Z44cl
 xLXx71Kq0YqIie9g7GZRVV8wGPaqBv3pI+iYwFnxtcLb5+M9bihO6tetflJtfagF0o5d
 yqWRi8M0Rm2TSIw2eHxjapAvdpYxxjvAnOWJsZrVkqCJ537FiQ/VPknJbpmW0k6ZPH/o
 QQo9W7MeLDT8K1eR5mIJ7EaoWibqtWDgiNSC0vzthBelMhxTlDu0phELmnAmUI6+ZrsL
 rw/e7nVLCUysvCnXA89ItZdo1p6eq7rQkzwg4xvw+zgm5YeBhyeFT4Wp8r4iYq0VeRRb
 h6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1sSlVk5t1UTrE5iK60YCr/+nbB6+iOIyAVHm9P78SMI=;
 b=n0H+xQY6H1b7Mikh62TIf2Z519ynogKE7aiDCIPPsOBnAbD2NLKagwPtr4bqOCjc2W
 flnOY6ePTXPM2hx4mkUwdP+Gyha9VE+fDNwmWZu4rCZxdPEHJrCTES/9U3tleNuZUSY3
 KYdL+Bh1XEWdsWGb6o/G2f4jxU/uSwTsfzRPC/zAP/aY3E+ktJ9eWPSPMY5HUng9jSAg
 LgqK1dnbLquR7nyfZdvAA7btkZ26qgKS3KEkVI+cwC8zlfOEer34SqlajWZ/bmvufcle
 FO7quJk+YHX6DsErUWPZv5B6QSaXHtq/jxQ8vxW6SrLBk9cB2UZGAjzUy6QNOQqlnbmq
 N0RQ==
X-Gm-Message-State: AOAM533zM0hVLO7To8rod0R1dyAToidygEmn5N4uuHLil1Rf+xMPdzbM
 LBpKL6NM71yO2xTaz9Jo/sg=
X-Google-Smtp-Source: ABdhPJzdef1+/nP/JPaTCYdnAz8y5UPPnIip7HEkx6ixjXKhYVJ6X//lhD1yZrhoAWrNKfz9ByCwUg==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr25703924wrs.2.1625695081296; 
 Wed, 07 Jul 2021 14:58:01 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a22sm174268wrc.66.2021.07.07.14.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:58:00 -0700 (PDT)
Subject: Re: [PATCH 3/4] dp8393x: Store CAM registers as 16-bit
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Finn Thain <fthain@linux-m68k.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-4-mark.cave-ayland@ilande.co.uk>
 <687af4d-a483-c7ff-b89c-59c0e442141@linux-m68k.org>
 <4ec71e41-3999-3ac1-85fa-84836dedb4a6@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e3cfec8a-2930-49f3-77ab-65c3f917907c@amsat.org>
Date: Wed, 7 Jul 2021 23:57:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4ec71e41-3999-3ac1-85fa-84836dedb4a6@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 11:08 AM, Mark Cave-Ayland wrote:
> On 07/07/2021 00:48, Finn Thain wrote:
> 
>> On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:
>>
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Per the DP83932C datasheet from July 1995:
>>>
>>>    4.0 SONIC Registers
>>>    4.1 THE CAM UNIT
>>>
>>>      The Content Addressable Memory (CAM) consists of sixteen
>>>      48-bit entries for complete address filtering of network
>>>      packets. Each entry corresponds to a 48-bit destination
>>>      address that is user programmable and can contain any
>>>      combination of Multicast or Physical addresses. Each entry
>>>      is partitioned into three 16-bit CAM cells accessible
>>>      through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
>>>      CAP0 corresponding to the least significant 16 bits of
>>>      the Destination Address and CAP2 corresponding to the
>>>      most significant bits.
>>>
>>> Store the CAM registers as 16-bit as it simplifies the code.
>>> There is no change in the migration stream.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   hw/net/dp8393x.c | 23 ++++++++++-------------
>>>   1 file changed, 10 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>>> index cc7c001edb..22ceea338c 100644
>>> --- a/hw/net/dp8393x.c
>>> +++ b/hw/net/dp8393x.c
>>> @@ -157,7 +157,7 @@ struct dp8393xState {
>>>       MemoryRegion mmio;
>>>         /* Registers */
>>> -    uint8_t cam[16][6];
>>> +    uint16_t cam[16][3];
>>>       uint16_t regs[0x40];
>>>         /* Temporaries */
>>> @@ -280,15 +280,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
>>>           address_space_read(&s->as, dp8393x_cdp(s),
>>>                              MEMTXATTRS_UNSPECIFIED, s->data, size);
>>>           index = dp8393x_get(s, width, 0) & 0xf;
>>> -        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
>>> -        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
>>> -        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
>>> -        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
>>> -        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
>>> -        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
>>> -        trace_dp8393x_load_cam(index, s->cam[index][0],
>>> s->cam[index][1],
>>> -                               s->cam[index][2], s->cam[index][3],
>>> -                               s->cam[index][4], s->cam[index][5]);
>>> +        s->cam[index][0] = dp8393x_get(s, width, 1);
>>> +        s->cam[index][1] = dp8393x_get(s, width, 2);
>>> +        s->cam[index][2] = dp8393x_get(s, width, 3);
>>> +        trace_dp8393x_load_cam(index,
>>> +                               s->cam[index][0] >> 8,
>>> s->cam[index][0] & 0xff,
>>> +                               s->cam[index][1] >> 8,
>>> s->cam[index][1] & 0xff,
>>> +                               s->cam[index][2] >> 8,
>>> s->cam[index][2] & 0xff);
>>>           /* Move to next entry */
>>>           s->regs[SONIC_CDC]--;
>>>           s->regs[SONIC_CDP] += size;
>>> @@ -591,8 +589,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr
>>> addr, unsigned int size)
>>>       case SONIC_CAP1:
>>>       case SONIC_CAP0:
>>>           if (s->regs[SONIC_CR] & SONIC_CR_RST) {
>>> -            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 -
>>> reg) + 1] << 8;
>>> -            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0
>>> - reg)];
>>> +            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 -
>>> reg)];
>>>           }
>>>           break;
>>>       /* All other registers have no special contraints */
>>
>> This patch incorrectly alters the behaviour of the jazzsonic.c driver
>> which reads the MAC address from the CAP registers in sonic_probe1().
>>
>> With mainline QEMU, the driver reports:
>> SONIC ethernet @e0001000, MAC 00:00:00:44:33:22, IRQ 28
>>
>> With this patch:
>> SONIC ethernet @e0001000, MAC 00:00:33:22:00:00, IRQ 28
>>
>>> @@ -990,7 +987,7 @@ static const VMStateDescription vmstate_dp8393x = {
>>>       .version_id = 0,
>>>       .minimum_version_id = 0,
>>>       .fields = (VMStateField []) {
>>> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
>>> +        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
>>>           VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
>>>           VMSTATE_END_OF_LIST()
>>>       }
> 
> I was staring at the code in dp8393x_do_load_cam() trying to figure out
> how on earth this could be reading the wrong values from the CAM
> descriptors, when I realised the problem is actually in the read back
> from the CAP registers (it doesn't need the x2 multiplier since the
> conversion from uint8_t to uint16_t).
> 
> This should be fixed by the following:
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 22ceea338c..09c34c3584 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -589,7 +589,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr
> addr, unsigned int size)
>      case SONIC_CAP1:
>      case SONIC_CAP0:
>          if (s->regs[SONIC_CR] & SONIC_CR_RST) {
> -            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 -
> reg)];
> +            val = s->cam[s->regs[SONIC_CEP] & 0xf][SONIC_CAP0 - reg];

Oops, thanks!


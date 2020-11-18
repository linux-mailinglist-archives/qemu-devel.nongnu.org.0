Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E275A2B8445
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:01:16 +0100 (CET)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfShf-0005mn-SI
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfSKT-0004hs-S9
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:37:17 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfSKR-0004Mc-HZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:37:17 -0500
Received: by mail-wr1-x441.google.com with SMTP id j7so3232947wrp.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nNeq8QaY1ALTdqBXp/fpFmpcH7lVmmnA/nsoyFPdyDE=;
 b=uOkWvFv+krtzaeAUMOeCtuROTB6vLAxMr6S53TdyNMgwo2+1JSYL69pXuSN3EwbX9c
 HNOF3jLpFdy05i6jcOH5+0ZCpQZyE25Pvbenzbwn9hLHinLbbG8yqrX+Gxig+EjUJgMi
 LOlbZYiEH+gQb+xpQy0DxJMLo0jaqrHy1sv0oB7Cuv62IR7UHV72ieHa84w7pf+7Q6eB
 pQEhH1Ps+xUvHzNXkKI3stEV3PXoeQviz4DIfNWC6l2AbipkKUtGzpCEdirwmy+DoA/T
 1yHOl/mObjMnk9focUd3vhLdOp+rnWHLvF9KLEqhs7070KT5nC6wVxC4oGiSZNAwyas1
 uvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nNeq8QaY1ALTdqBXp/fpFmpcH7lVmmnA/nsoyFPdyDE=;
 b=ssIfI6K2XWIWjtD1tfaMEK1ODl97Fq4VRjB3J0YZy2ijrQAfZKSLjVOFrVK1ob1m/8
 3VqJ/wqaN2C1ZUocRQs6DeMA92hV/rY/Sb0XQDWj7booFw3unT2zhfGpwl9T/ulC7PVk
 pJNbWJQod2m+l/IkfMAfiQBFnDxcCuj6cs347tek0mrDCAq/IN1mtbv+E6TzV5G7i1X0
 gUCCs3g1CP77q6VbubYQpiwWwjj9N0a/08ztd7TZ1gFab93K2z0uljBPxYBwvAAoUbQm
 IphwAeRIPIoNx8nWYGCmCXw09Q6oGRV04b/Nloz1dlQ/NeSYPzeDTsSwY6iJjKnwfCWN
 0tfQ==
X-Gm-Message-State: AOAM533f4tcSl+ALbS/FgYW4eBLN4MhS//Sd5Yz427wn55MOQy8EZVH1
 GOUuQ10HiSBxad7LNQUO70WErJmdIuE=
X-Google-Smtp-Source: ABdhPJwvEbHj7+pRev7lfQjqbUO8b1gFmnFSq32etWppIeDYt3Xkiv6n5t6r0nt0JNfSa9vVKGrJGw==
X-Received: by 2002:adf:df88:: with SMTP id z8mr6132911wrl.113.1605724632970; 
 Wed, 18 Nov 2020 10:37:12 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x22sm3288908wmj.17.2020.11.18.10.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:37:12 -0800 (PST)
Subject: Re: [PULL 19/92] hw/char/serial: Assert serial_ioport_read/write
 offset fits 8 bytes
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
 <20200924092314.1722645-20-pbonzini@redhat.com>
 <CAFEAcA9Utr2mCGyi7+8Yg16KSYhoP=3+hJa=wN6_AdG8TB0a8g@mail.gmail.com>
 <4215d17b-e0fa-881a-0f22-d545905a3bd5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <425494e8-f763-f070-bb1b-fe2aa9f8087f@amsat.org>
Date: Wed, 18 Nov 2020 19:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4215d17b-e0fa-881a-0f22-d545905a3bd5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:08 PM, Paolo Bonzini wrote:
> On 18/11/20 16:40, Peter Maydell wrote:
>> On Thu, 24 Sep 2020 at 10:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> The serial device has 8 registers, each 8-bit. The MemoryRegionOps
>>> 'serial_io_ops' is initialized with max_access_size=1, and all
>>> memory_region_init_io() callers correctly set the region size to
>>> 8 bytes:
>>> - serial_io_realize
>>> - serial_isa_realizefn
>>> - serial_pci_realize
>>> - multi_serial_pci_realize
>>>
>>> It is safe to assert the offset argument of serial_ioport_read()
>>> and serial_ioport_write() is always less than 8.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-Id: <20200907015535.827885-2-f4bug@amsat.org>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   hw/char/serial.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/char/serial.c b/hw/char/serial.c
>>> index fd80ae5592..840da89de7 100644
>>> --- a/hw/char/serial.c
>>> +++ b/hw/char/serial.c
>>> @@ -344,7 +344,7 @@ static void serial_ioport_write(void *opaque,
>>> hwaddr addr, uint64_t val,
>>>   {
>>>       SerialState *s = opaque;
>>>
>>> -    addr &= 7;
>>> +    assert(size == 1 && addr < 8);
>>>       trace_serial_ioport_write(addr, val);
>>>       switch(addr) {
>>>       default:
>>
>> Bug report https://bugs.launchpad.net/qemu/+bug/1904331
>> points out that the addition of this assert() makes obvious
>> that either the assert is wrong or some code later in the
>> function which is looking at size must be dead:
>>              if (size == 1) {
>>                  s->divider = (s->divider & 0xff00) | val;
>>              } else {
>>                  s->divider = val;
>>              }
>>
>> Presumably it's the if() that should be fixed ?
> 
> It can be dropped, because serial_io_ops has
> 
>     .impl = {
>         .min_access_size = 1,
>         .max_access_size = 1,
>     },
> 
> Therefore, a 16-bit write to addr==0 is automatically split into an
> 8-byte write to addr==0 and one to addr=1.  Together, the two set the
> full 16 bits of s->divider.

Since commit 5ec3a23e6c8 ("serial: convert PIO to new memory api
read/write") =)

> 
> Thanks,
> 
> Paolo
> 
> 


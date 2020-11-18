Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29A2B82AB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:09:47 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQxm-00059n-Ib
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfQwJ-0003ui-G0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:08:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfQwF-0000NF-1c
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeICZElRA6CcG8UlE1YUwMwTNALFoAjY82Nq+d4RUFw=;
 b=VXETHZ0use+2io+8y5dUYJvCQhQGhijFmPq92QHHQGZzusqfFSC0JhQ0J2zoOazkwD1ocj
 WRV1HqubGrpfAmYhgJOUUULtn8XqTmKBHTsMDawSgbZ1IYN/oc7IrLVp/rkjTEvxIenvkQ
 R9sOAhEWxQe/8WT7v0ktDC4fMPhqL40=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-NHt8ea4ZNDuvHi95_7-wig-1; Wed, 18 Nov 2020 12:08:07 -0500
X-MC-Unique: NHt8ea4ZNDuvHi95_7-wig-1
Received: by mail-ej1-f70.google.com with SMTP id y23so1095905ejp.10
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YeICZElRA6CcG8UlE1YUwMwTNALFoAjY82Nq+d4RUFw=;
 b=fRKEFcbnYeLqR0mXR694j0T6/3DOXAutWNRKplo3FKJ4UDtLqSV0Zp6cjjIPWimvX+
 /ENk7V3RsCTdCDecX2m3OYxHSX8lvWdJCbMtWHx7gtHSMUBy0boBcybK0uRseL2BaPcQ
 AgaJShgFA0YqFI8mNnhbBthVtuP7zPj11i/6KgIMxRm2YzrkdpGLX7UwsnfsZxiS1rdF
 BerLH66apxGEM5Vuc80lAAxyOb10fghlUHI0kredOYi4fX7iZwLpaLKNgvAWL/H3oeVP
 xG5JJn/PcPM5BTLfMdKTNaX+peyIsmhtlaTuCK4qzH2+GRO6SkoYjlcz3KXcerIony8w
 9RNQ==
X-Gm-Message-State: AOAM530oG1U0Z3/ScKXV5FRmtV7b2zOlStxS5K4cmhyxUSUs4/sG9vTY
 exfkFtmpQjsjPov0CRU8Rne/IjkucgPbiExRkLfW1qfPfLLQvqkaosYBDO5/4XD0Eq5Q3ZVcmbo
 2ojyD6SyA0nEaRhs=
X-Received: by 2002:a50:b584:: with SMTP id a4mr27046592ede.301.1605719285683; 
 Wed, 18 Nov 2020 09:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVJABJixPZ7ZDe5lhtCVGe2yeISu0C4xC7o2sNjK3MZNBe+Du3dqI7k65DUfWwvb838Ftvqg==
X-Received: by 2002:a50:b584:: with SMTP id a4mr27046563ede.301.1605719285290; 
 Wed, 18 Nov 2020 09:08:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm13779093edr.2.2020.11.18.09.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 09:08:04 -0800 (PST)
Subject: Re: [PULL 19/92] hw/char/serial: Assert serial_ioport_read/write
 offset fits 8 bytes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
 <20200924092314.1722645-20-pbonzini@redhat.com>
 <CAFEAcA9Utr2mCGyi7+8Yg16KSYhoP=3+hJa=wN6_AdG8TB0a8g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4215d17b-e0fa-881a-0f22-d545905a3bd5@redhat.com>
Date: Wed, 18 Nov 2020 18:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Utr2mCGyi7+8Yg16KSYhoP=3+hJa=wN6_AdG8TB0a8g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 16:40, Peter Maydell wrote:
> On Thu, 24 Sep 2020 at 10:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The serial device has 8 registers, each 8-bit. The MemoryRegionOps
>> 'serial_io_ops' is initialized with max_access_size=1, and all
>> memory_region_init_io() callers correctly set the region size to
>> 8 bytes:
>> - serial_io_realize
>> - serial_isa_realizefn
>> - serial_pci_realize
>> - multi_serial_pci_realize
>>
>> It is safe to assert the offset argument of serial_ioport_read()
>> and serial_ioport_write() is always less than 8.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20200907015535.827885-2-f4bug@amsat.org>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   hw/char/serial.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/serial.c b/hw/char/serial.c
>> index fd80ae5592..840da89de7 100644
>> --- a/hw/char/serial.c
>> +++ b/hw/char/serial.c
>> @@ -344,7 +344,7 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>>   {
>>       SerialState *s = opaque;
>>
>> -    addr &= 7;
>> +    assert(size == 1 && addr < 8);
>>       trace_serial_ioport_write(addr, val);
>>       switch(addr) {
>>       default:
> 
> Bug report https://bugs.launchpad.net/qemu/+bug/1904331
> points out that the addition of this assert() makes obvious
> that either the assert is wrong or some code later in the
> function which is looking at size must be dead:
>              if (size == 1) {
>                  s->divider = (s->divider & 0xff00) | val;
>              } else {
>                  s->divider = val;
>              }
> 
> Presumably it's the if() that should be fixed ?

It can be dropped, because serial_io_ops has

     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
     },

Therefore, a 16-bit write to addr==0 is automatically split into an 
8-byte write to addr==0 and one to addr=1.  Together, the two set the 
full 16 bits of s->divider.

Thanks,

Paolo



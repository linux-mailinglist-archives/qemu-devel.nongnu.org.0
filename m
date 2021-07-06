Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF153BDEE6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:26:30 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0saL-0006sa-3U
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0sYu-0005q1-V5; Tue, 06 Jul 2021 17:25:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0sYt-00057k-5N; Tue, 06 Jul 2021 17:25:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f17so582916wrt.6;
 Tue, 06 Jul 2021 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7VYZNGbFoL5cGqEzswc/n3mhhPontMBo01UGOUHMrXg=;
 b=JcSQvuBI1v0i5DKpWKpIWHsWKOUqp+hstBzLeThBGOUgM4R0nN3VSSOzTYv4M2i5ct
 4zxl0ze1uP9cbi7xOVzqrvwACesCigcX/+zEAFd586rvBpAOUTOc+m9soJ4IdzSy94NX
 CEI/iiVzFIsDd/QdlfimDnt8E+m0st2xrnSdLGMbXbPX40+58ygLtOvJChtplKDMs6bQ
 iIzTon8Y4j/lbF/v9T0UEpE5DXvLfGNbyllyL9ampxsuFDxB2fNrnCRlxhy8F155OQ8T
 79s6gcBSgK+mvtAIWp4H91etFxghg+XvdDzMHGFfD3wqbk3eWYrT1c7ViphwOod65bS4
 pu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7VYZNGbFoL5cGqEzswc/n3mhhPontMBo01UGOUHMrXg=;
 b=Cdc2o84klh7U9D+ymEyw1gigKWJpuDoy7aaa9CfS0ul8v7AjCAl1xK945BurZ84j7j
 Vdd5G9CIm48BwuNcusj5n89vKo2cAQYLfsRKiqyK63iBIEkqPK+NhPPg72NSh8UDNRR6
 sTtLtSpHypYYV01rfx4qBzQEZ++k7WztY82QgTdqonlJAFnuxbKVpfJABNhtoCujExNQ
 kRLFY0O/mSXR/ERUW1tkl4x/3FJUIvhZ2pLTuXRZIFLfjGnLzNAUuYYVKQNR5Ak555Fl
 TZVhfaFj+YC5sZic+pkMh3zc8v+ebeeE7atbTILUgSOPcPUFAxAUffrS2B4NEuLkxKyt
 in9w==
X-Gm-Message-State: AOAM532uxLFb0WFEmXx0TkpbEbIMF5ajiaDBIqiez3gANwx0ASNtC+bs
 YvjlPmZCLer3CL0NwjZdz58=
X-Google-Smtp-Source: ABdhPJxBuK5CaI2zhZjKsMYZS0oogmV/sEoGqe0i1m2wR5u/aV3PBC5K9vu29nXtS5A3Zpc5YBCsKw==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr23842504wrv.216.1625606696848; 
 Tue, 06 Jul 2021 14:24:56 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 12sm4378009wme.28.2021.07.06.14.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 14:24:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/7] hw/misc: Add device to help managing aliased
 memory regions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-2-f4bug@amsat.org>
 <2b3a6aec-aef9-6f31-1537-310757d6aa83@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9dba106-de0e-54d7-da9a-1519cd71b9fd@amsat.org>
Date: Tue, 6 Jul 2021 23:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2b3a6aec-aef9-6f31-1537-310757d6aa83@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 3:33 AM, Richard Henderson wrote:
> On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
>> Not really RFC, simply that I'v to add the technical description,
>> but I'd like to know if there could be a possibility to not accept
>> this device (because I missed something) before keeping working on
>> it. So far it is only used in hobbyist boards.
>>
>> Cc: Peter Xu<peterx@redhat.com>
>> Cc: Paolo Bonzini<pbonzini@redhat.com>
>> ---
>>   include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++
>>   hw/misc/aliased_region.c         | 132 +++++++++++++++++++++++++++++++
>>   MAINTAINERS                      |   6 ++
>>   hw/misc/Kconfig                  |   3 +
>>   hw/misc/meson.build              |   1 +
>>   5 files changed, 229 insertions(+)
>>   create mode 100644 include/hw/misc/aliased_region.h
>>   create mode 100644 hw/misc/aliased_region.c
> 
> Looks reasonable to me.
> 
> 
>> +    subregion_bits = 64 - clz64(s->span_size - 1);
>> +    s->mem.count = s->region_size >> subregion_bits;
>> +    assert(s->mem.count > 1);
>> +    subregion_size = 1ULL << subregion_bits;
> 
> So... subregion_size = pow2floor(s->span_size)?

No... should be subregion_size = pow2ceil(s->span_size).

> Why use a floor-ish computation here and pow2ceil later in
> aliased_mr_realize?

I missed it :)

> Why use either floor or ceil as opposed to
> asserting that the size is in fact a power of 2?

Unfortunately not all memory regions are power of 2 :(

See for example the armv7m_systick device (size 0xe0).

> Why must the region be
> a power of 2, as opposed to e.g. a multiple of page_size?

I/O regions don't have to be multiple of page_size... See
AVR devices for example:

(qemu) info mtree
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-0000000000007fff (prio 0, rom): flash
    0000000000800000-00000000008000ff (prio -1234, i/o): I/O
    0000000000800023-0000000000800025 (prio -1000, i/o): atmega-gpio-b
    0000000000800026-0000000000800028 (prio -1000, i/o): atmega-gpio-c
    0000000000800029-000000000080002b (prio -1000, i/o): atmega-gpio-d
    0000000000800035-0000000000800035 (prio -1000, i/o): avr-timer8-intflag
    0000000000800036-0000000000800036 (prio 0, i/o): avr-timer16-intflag
    0000000000800037-0000000000800037 (prio -1000, i/o): avr-timer8-intflag
    000000000080003f-0000000000800041 (prio -1000, i/o): avr-eeprom
    0000000000800044-0000000000800048 (prio -1000, i/o): avr-timer8
    000000000080004c-000000000080004e (prio -1000, i/o): avr-spi
    0000000000800060-0000000000800060 (prio -1000, i/o): avr-watchdog
    0000000000800064-0000000000800064 (prio 0, i/o): avr-power
    000000000080006e-000000000080006e (prio -1000, i/o): avr-timer8-intmask
    000000000080006f-000000000080006f (prio 0, i/o): avr-timer16-intmask
    0000000000800070-0000000000800070 (prio -1000, i/o): avr-timer8-intmask
    0000000000800074-0000000000800075 (prio -1000, i/o): avr-ext-mem-ctrl
    0000000000800078-000000000080007f (prio -1000, i/o): avr-adc
    0000000000800080-000000000080008d (prio 0, i/o): avr-timer16
    00000000008000b0-00000000008000b4 (prio -1000, i/o): avr-timer8
    00000000008000b8-00000000008000bd (prio -1000, i/o): avr-twi
    00000000008000c0-00000000008000c6 (prio 0, i/o): avr-usart
    0000000000800100-00000000008008ff (prio 0, ram): sram

> Or just the
> most basic requirement that region_size be a multiple of span_size?

OK.

Thanks for the review! Now I need to fill the documentation part :/

Phil.


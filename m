Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBB644876
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:58:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aJc-0004nA-Q7; Tue, 06 Dec 2022 10:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2aJa-0004mk-8o
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:57:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2aJY-0006DW-0A
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:57:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso13003770wmo.1
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pKznUNGVKE0jjzOvYKwDMAfgPgQmQRZsA+6vfg2487I=;
 b=Y0UEpCFB/+egP+5zcKEycO+6ymsxq+cEJrOZf+od9t1I8H3NGJ4GmAwM+5T2IcvC0T
 0h3LrP0WxBjeEcbE1roS63/40ZeOnJDFxLQMUaLi/z6SqH7mhLPSxmhQTlsNdzvr/1F1
 kChYNY1tllnBKH6a7P7ACO8n7Ljm4TmAmsgugbE8ufyJZYNAOCM7QDMzzRfdg/n89yH4
 NwNujvtXnhD4j7+C42M9xp/dWI1CdeWC2Qe85mWnfmVXzoz15zoUdExiU6oMMSMBMPGc
 PG1QEz8qQ2VQYHFuUb8PpxxbY+vtrE8uw5NHuJtpjQ4FI3wjbSt5EpxMW+XYVnEqY4BP
 v/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKznUNGVKE0jjzOvYKwDMAfgPgQmQRZsA+6vfg2487I=;
 b=X/ZW4pP+HDSVmDJhPCO95ZG84guOzKQ/PolJgrCQzIb4AAOcsVvhazOcFUZy139TF2
 TiDpVDkvwBjDH884ro3k3iE+6UDMXp4y6llYwyAHAVpnEGMjUrZrNb0Pg//+HzGPuotR
 dShHCfdn/BeRg8cBFkAUSELwjX6KGR2H5e6NaX2KwMrNpwVm8t2jc6JRuEsggRsWHkHH
 Sh4wJB+J6mZegREYAkwp7e4rl+boHH24ppaC4QSU4LHi2KyO4sDWzFCwlUzL7RqrNnOe
 WHjtIudaEHCPbLBpkXa3DJh7MF6GR7tr5pZiw2GT8ZRote6hGV1R/yoO4vfXkCTNFr8W
 9+WA==
X-Gm-Message-State: ANoB5pk9lT7TRYVYUCkpgVCi6ecUpiIKVqHuNs802qtxo2G5BiiMRrXv
 TXpzNtUHitBC8TfcDZcpSEimOw==
X-Google-Smtp-Source: AA0mqf7LU8rUeoXMGK4ce77trrVz78ZIMf7jYlb+Xum9VCZDgixYcQ5gnVr3njxWU47HM10DuWCyvQ==
X-Received: by 2002:a1c:ed17:0:b0:3cf:cfce:9d9e with SMTP id
 l23-20020a1ced17000000b003cfcfce9d9emr51801952wmh.66.1670342218015; 
 Tue, 06 Dec 2022 07:56:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm32697591wmo.0.2022.12.06.07.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:56:57 -0800 (PST)
Message-ID: <3201e3f9-8b98-613d-5516-e0c6d89a9b9a@linaro.org>
Date: Tue, 6 Dec 2022 16:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Fabrice Bellard <fabrice@bellard.org>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <Y4818KfGO7Y9Tsn/@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y4818KfGO7Y9Tsn/@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 13:30, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
>> Hi,
>>
>> I'm trying to understand the x86 architecture-specific code in
>> hw/display/vga.c:
>>
>>      const MemoryRegionPortio vbe_portio_list[] = {
>>          { 0, 1, 2, .read = vbe_ioport_read_index,
>>                     .write = vbe_ioport_write_index },
>>      # ifdef TARGET_I386
>>          { 1, 1, 2, .read = vbe_ioport_read_data,
>>                     .write = vbe_ioport_write_data },
>>      # endif
>>          { 2, 1, 2, .read = vbe_ioport_read_data,
>>                     .write = vbe_ioport_write_data },
>>          PORTIO_END_OF_LIST(),
>>      };
>>
>> Having:
>>
>>      typedef struct MemoryRegionPortio {
>>          uint32_t offset;
>>          uint32_t len;
>>          unsigned size;
>>          uint32_t (*read)(...);
>>          void (*write)(...);
>>          ...
>>      } MemoryRegionPortio;
>>
>> So on x86 we can have 16-bit I/O accesses unaligned to 8-bit boundary?
> 
> Yes, like most things in x86 the requirement for alignment is a 'should'
> followed by a description of what might happen if you don't:
> 
>  From intel arch manual 19.3:
>   '..16-bit ports should be aligned to even addresses (0, 2, 4, ...) so that all 16 bits can be transferred in a
>    single bus cycle. Likewise, 32-bit ports should be aligned to addresses that are multiples of four (0, 4, 8, ...). The
>    processor supports data transfers to unaligned ports, but there is a performance penalty because one or more
>    extra bus cycle must be used.'

So you confirm this is a architecture behavior, not a device one, thanks.

> I think I've even seen it suggested that a 32bit access to ffff might be
> defined - although I'm not sure if that's legal.

Easy to test :) If unspecified and there is some ISA-to-XXX bridge, then 
I expect this to be implementation dependent of the bridge.

> I don't know that bit of qemu well enough to know whether the cpu part
> of qemu should be splitting the unaligned accesses or not.
All I/O accesses are gated thru access_with_adjusted_size() in 
softmmu/memory.c.

There is an old access_with_adjusted_size_unaligned() version [1] from
Andrew and a more recent series [2] from Richard. Maybe the latter fixes
some long-standing bug [3] we have here?

[1] 
https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew@aj.id.au/
[2] 
https://lore.kernel.org/qemu-devel/20210619172626.875885-15-richard.henderson@linaro.org/
[3] 
https://lore.kernel.org/qemu-devel/CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com/


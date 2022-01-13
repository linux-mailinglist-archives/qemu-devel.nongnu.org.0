Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77948D28C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:03:21 +0100 (CET)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7u8l-0004XY-6f
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:03:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7u2y-0001Vn-9f
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7u2t-0001LS-OI
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642057029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKrzh/vch3xbZ+rl+M072ZkbD8eMez/jR5rl5Oln4X8=;
 b=Hvl8KZVcZ+bnA3FRyq1Td0eDtDh4OOjSitiWKO97zkW5jZxPck+LamGwipaDy9YCKnkxS0
 QPPILRC11Six5WCsijfbkFkZbdW5dDSvEq28laid2mwavK9y4KRyUDCP3cTAaZFI/nJG5n
 wkryttU+osTJs8g0q6giJkhNZm7G+PM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-yywr61G7N5eWdvoOtgx5WA-1; Thu, 13 Jan 2022 01:57:05 -0500
X-MC-Unique: yywr61G7N5eWdvoOtgx5WA-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso3115130wme.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aKrzh/vch3xbZ+rl+M072ZkbD8eMez/jR5rl5Oln4X8=;
 b=7fzFU48qDhpYf3gIOJmw45Ms0PziocEUyPMnCxl+7r2QpDFHwpSm1zaCKMqw4JWxn6
 HxOG3RdNTw/I3bNEmBV9/zRlTaJrE60UG+4pvjUi3u2/rrbOPwiWXvGvNXVShEC4c2dt
 kqIPGob1d5KdnvHBmEjEXz+q5zu473r7K3ZgwZxmLU0sba1zHamw8R6bjS+N6ZYYjIJv
 0bOXVr15G04xO9s8/exl4Jqlnk28FO0uzznLB9Y08b5QbdEWfYJwlLbUbfJHV//Ib+4c
 1Z3MQ1y+lhbYxWRXeDYtcPkQLxgp3p8R6Z9IuvtIxDPGT470ZzhAsF5nd+ddr8GuEFZ/
 9g9Q==
X-Gm-Message-State: AOAM533sKOJ7VNEn5V9fd054i3Wymrk5xWTOXnDleRgbMClY4rjLBygB
 iPmZYj6/ypte6SWJE+TVgNOIb4Nu0naqEN0g3v65hGwcbR+s69dTy24FDXR4jRO/xROvOnHgS+g
 U8/BVkmij3cZ0HtY=
X-Received: by 2002:a5d:4d45:: with SMTP id a5mr2582024wru.95.1642057024500;
 Wed, 12 Jan 2022 22:57:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdsMeOYIc/2Z0RqW7sizM05SHYYerdJhOMgavjzn8WJni2N5/wphKhEWNEF1fpRTbEGfPluQ==
X-Received: by 2002:a5d:4d45:: with SMTP id a5mr2582006wru.95.1642057024309;
 Wed, 12 Jan 2022 22:57:04 -0800 (PST)
Received: from [192.168.42.76] (tmo-065-240.customers.d1-online.com.
 [80.187.65.240])
 by smtp.gmail.com with ESMTPSA id d11sm1755430wri.67.2022.01.12.22.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 22:57:03 -0800 (PST)
Message-ID: <de79524d-222e-360e-25fd-5d9122286b5d@redhat.com>
Date: Thu, 13 Jan 2022 07:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/i386: Add the possibility to disable the 'isapc'
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220107160713.235918-1-thuth@redhat.com>
 <280cccf6-7d6d-56da-4b5f-ddb4facfed7e@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <280cccf6-7d6d-56da-4b5f-ddb4facfed7e@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 19.54, Philippe Mathieu-Daudé wrote:
> On 1/7/22 17:07, Thomas Huth wrote:
>> We already have a CONFIG_ISAPC switch - but we're not using it yet.
>> Add some "#ifdefs" to make it possible to disable this machine now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/i386/pc_piix.c        | 5 ++++-
>>   tests/qtest/cdrom-test.c | 2 +-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 1999190276..5147e1ee74 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
>>       pc_compat_1_5_fn(machine);
>>   }
>>   
>> +#ifdef CONFIG_ISAPC
>>   static void pc_init_isa(MachineState *machine)
>>   {
>>       pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
>>   }
>> +#endif
>>   
>>   #ifdef CONFIG_XEN
>>   static void pc_xen_hvm_init_pci(MachineState *machine)
>> @@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
>>       pci_config_set_revision(bridge_dev->config, pch_rev_id);
>>   }
>>   
>> +#ifdef CONFIG_ISAPC
>>   static void isapc_machine_options(MachineClass *m)
>>   {
>>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>> @@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
>>   
>>   DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
>>                     isapc_machine_options);
>> -
>> +#endif
> 
> Wouldn't it be cleaner to extract the isapc machine to a new C unit
> (after renaming/declaring pc_init1 public)? 

That would be cleaner, of course, but that would also mean a major 
refactoring: We could rearrange the code so that it is possible to compile a 
binary that has isapc, but not i440fx... but that likely means a complete 
rework of pc_piix.c so that the code that is common between i440fx and isapc 
needs to be moved into a separate file, too. And that's likely not worth the 
effort, I guess, since people rather want to compile without isapc than 
compiling without i440fx, I think. So let's go with this low-hanging fruit 
here for now, and keep the possible clean-up in mind for later.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

  Thomas




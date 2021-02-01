Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBA30A64A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:14:53 +0100 (CET)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XAS-0004Ym-Kw
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6X84-0002cz-NE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6X7q-0000NB-EA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612177914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FY6TXrDOk+o3c9tXEy/tXPHIpJwXmfVgAUDZqtQralI=;
 b=eZJelNpXp1A+uUYQU8VCGEnHgqYV1BnWoa1dwtF67TqywH8zjEttX3VK9Wmg4DNEMj9ZlQ
 rdnIJqybHaNgxtAQ03pYgk1m8NL+ELlk+2xMgFYx3EUanTKQVQQh/QbW8ShbTuauhDjmHQ
 h4b9MDTi81meYA8n6ZZqYWn+LjEJcJg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-MylPo3RoMZuLJ0Q7f59p6w-1; Mon, 01 Feb 2021 06:11:52 -0500
X-MC-Unique: MylPo3RoMZuLJ0Q7f59p6w-1
Received: by mail-wr1-f71.google.com with SMTP id z9so10188054wro.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FY6TXrDOk+o3c9tXEy/tXPHIpJwXmfVgAUDZqtQralI=;
 b=M7mb7V4y8ZV/eWSHaIX7qWII+83Lp+tiRbOxZD/BtYL2zucmEm1OzopmsRGKyBwP8g
 WP4kYDLpM4iXywDypSgcFDIJC9V4fTuQAPGJr1T7xvKH7vJqssbSvhppVStQLPWTtu6R
 dcgz3xWq63XqqwH2kLDjy6UmFxMixSRBVh1An4Q6Mnj+o+9jknH4acC9BsQeHpuNS8y0
 1GXgYKL8ue7x5A0F03FzNHRtVfekJjqI3MQmHEEn53cSl6GP9zuCkLCbf77l8Bv7UxAR
 mo0vrQ/pSj15T1RbP1Ort86PLccGrcaWOjHdIOllidQpXmMGFw7JK5MuWygZY6unDgsd
 BCGQ==
X-Gm-Message-State: AOAM532rQxZQVKXCeiiNCV/9he75WMBN0vt9eJL8mixsFiui31QmACaN
 DqYTF6BCO4AqSgiWZwldP5pzGqTeL0T6fp+qvEYhAPASGZaXH1fN4YgbRIwPVExqJkrqJLZbByX
 sJn9GQ9PeFler8WA=
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr17767747wrx.302.1612177911451; 
 Mon, 01 Feb 2021 03:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSQMfyeFF+3atrjOWr///Dt99h3yMiGXmn5Z/I940huc+9DXK1zFUmdjSOWwmL+4h1fUpRQA==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr17767722wrx.302.1612177911186; 
 Mon, 01 Feb 2021 03:11:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w25sm21241436wmc.42.2021.02.01.03.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 03:11:50 -0800 (PST)
Subject: Re: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-4-f4bug@amsat.org>
 <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2931aaa6-3850-ca59-73ea-252a524bd63d@redhat.com>
Date: Mon, 1 Feb 2021 12:11:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 11:59, Philippe Mathieu-Daudé wrote:
> On 1/31/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>> xenpv machine requires USB, IDE_PIIX and PCI:
>>
>>    /usr/bin/ld:
>>    libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>>    hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>>    hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>>    hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>>    libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>>    hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/Kconfig     | 1 +
>>   hw/xen/Kconfig | 7 +++++++
>>   2 files changed, 8 insertions(+)
>>   create mode 100644 hw/xen/Kconfig
>>
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index 5ad3c6b5a4b..f2a95591d94 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -39,6 +39,7 @@ source usb/Kconfig
>>   source virtio/Kconfig
>>   source vfio/Kconfig
>>   source watchdog/Kconfig
>> +source xen/Kconfig
>>   
>>   # arch Kconfig
>>   source arm/Kconfig
>> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
>> new file mode 100644
>> index 00000000000..0b8427d6bd1
>> --- /dev/null
>> +++ b/hw/xen/Kconfig
>> @@ -0,0 +1,7 @@
>> +config XEN_PV
>> +    bool
>> +    default y if XEN
>> +    depends on XEN
>> +    select PCI
>> +    select USB
>> +    select IDE_PIIX
> 
> Well this is not enough, --without-default-devices fails:
> 
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `ram_block_add':
> softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
> function `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
> `cpu_physical_memory_set_dirty_range':
> include/exec/ram_addr.h:333: undefined reference to
> `xen_hvm_modified_memory'
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.

I think you can modify xen_hvm_modified_memory to become a virtual 
function in AccelClass.

Paolo



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27A68FFC7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 06:17:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPzHV-00020H-C2; Thu, 09 Feb 2023 00:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzHS-0001zw-EA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzHQ-0003kv-CP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675919731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhW8CkHlcvSvhLwWv6/6rkCwpFOkIh/h49Kp1hKoVZc=;
 b=HtHN0Arhwy5X4EKBk7wy5NBjBmhPzmweS1GvIhSpnK3Z6cuc4JWAnc0bEZUHcdk5JQm/aw
 /HxXqZNnHYEqeURVj+Da0NqrVHKAhFhsJM+XJAe4xphL0yOOAMxVO6SpKTzXGV4D+wYnLK
 LXJySrG621sshJ50Cf8jQ2D1lDAfnR8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-ZTBMsoVUMsykb3Z_idUF8A-1; Thu, 09 Feb 2023 00:15:29 -0500
X-MC-Unique: ZTBMsoVUMsykb3Z_idUF8A-1
Received: by mail-qt1-f197.google.com with SMTP id
 l3-20020a05622a174300b003b9b6101f65so472816qtk.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 21:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhW8CkHlcvSvhLwWv6/6rkCwpFOkIh/h49Kp1hKoVZc=;
 b=bE45/L6rvHceRRM+9N+mL14rw+1ZhA4kUq+0cE+BopIXw32hkK6qjdwA4WWtzTDTAw
 cWhNvD67v7xuvEYFUBbWM9h5ie7C1I12Z2J72nWZ5zgHlXyGn5qAdn9jQbXWjRQAWkpk
 e+rXFz1EuuJssw0sAEDqsu1hkGfuKhbOY/ABmV45KzNRUQ0uRnMNFeEvOADxMjLq/ezE
 V5U0p2DCJvJ+xdqoXo8EZ0IxURZeEdZoKWAqVEvUUqO3eRbyjf1acahSy9GGknjErzJ3
 UM5CUc3s4vZTGmRsSr87zdIdLtQG2tnmvZJqf89qpdlRZohclp14KASGfGXmkusvjQWa
 Z2SA==
X-Gm-Message-State: AO0yUKUWS8wJjLlPtX64TZftPnkjoqKCZq1Fh5Jz5Dw4CVA7Jr2u7NFP
 X/67YJUkGvSx+U7k+WkLMLa/7WIrtmaSNcdsmJoyiPyH8VXLMrotkQY5RCAzJlMktJhsSoup8HE
 EcaWXwQZwBFgawN4=
X-Received: by 2002:a05:622a:1749:b0:3b8:6b19:7f95 with SMTP id
 l9-20020a05622a174900b003b86b197f95mr17923015qtk.19.1675919729243; 
 Wed, 08 Feb 2023 21:15:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8zRKABTKn4r9BxQ1XfrdoWE5KrnsNtRXuQSGOECOGu+bSwii0gO/np88RoQHZ/J28NV0WHtA==
X-Received: by 2002:a05:622a:1749:b0:3b8:6b19:7f95 with SMTP id
 l9-20020a05622a174900b003b86b197f95mr17922977qtk.19.1675919728955; 
 Wed, 08 Feb 2023 21:15:28 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 65-20020a370c44000000b007059c5929b8sm679427qkm.21.2023.02.08.21.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 21:15:27 -0800 (PST)
Message-ID: <dbdd2b09-7d9b-b929-cc2b-f93d8ed42868@redhat.com>
Date: Thu, 9 Feb 2023 06:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
 <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
 <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
 <20230207192031.pu5uy2yppv3htjw5@orel>
 <CABJz62O6U88GzAuVT78wVOk0f232hhTw35CjOBJL+eBAUfbpCg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
In-Reply-To: <CABJz62O6U88GzAuVT78wVOk0f232hhTw35CjOBJL+eBAUfbpCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/02/2023 17.48, Andrea Bolognani wrote:
> On Tue, Feb 07, 2023 at 08:20:31PM +0100, Andrew Jones wrote:
>> On Tue, Feb 07, 2023 at 06:38:15AM -0800, Andrea Bolognani wrote:
>>> Well, it looks like -no-acpi will come for free after all, thanks to
>>> the code you pasted above, as long as the machine property follows
>>> the convention established by x86, arm and (I just noticed this one)
>>> loongarch.
>>
>> Not quite, because we also have
>>
>> $ grep -A1 '"no-acpi"' qemu-options.hx
>> DEF("no-acpi", 0, QEMU_OPTION_no_acpi,
>>             "-no-acpi        disable ACPI\n", QEMU_ARCH_I386 | QEMU_ARCH_ARM)
>>
>> So that means neither riscv nor loongarch get -no-acpi just by adding
>> the "acpi" machine property.
>>
>> If the plan is to deprecate -no-acpi, then riscv can be like loongarch
>> and only have the "acpi" property from the start.
> 
> Makes sense.
> 
> 
> For the libvirt integration, do I understand correctly that the
> machine property was added by commit
> 
>    commit 17e89077b7e3bc1d96540e21ddc7451c3e077049
>    Author: Gerd Hoffmann <kraxel@redhat.com>
>    Date:   Fri Mar 20 11:01:36 2020 +0100
> 
>      acpi: add acpi=OnOffAuto machine property to x86 and arm virt
> 
>      Remove the global acpi_enabled bool and replace it with an
>      acpi OnOffAuto machine property.
> 
>      qemu throws an error now if you use -no-acpi while the machine
>      type you are using doesn't support acpi in the first place.
> 
>      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>      Message-Id: <20200320100136.11717-1-kraxel@redhat.com>
>      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>      Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> included in QEMU 5.0? libvirt still officially supports QEMU 4.2, so
> we'll have to make the use of the machine property conditional.

Sounds right, and testing for the machine option should be possible with the 
upcoming QEMU 8.0. FWIW, I assume this is similar to the -no-hpet option 
which has been turned into a machine property, too:

https://gitlab.com/libvirt/libvirt/-/commit/3c508e7d4310aeb8

  Thomas



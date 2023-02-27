Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BC6A3F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:25:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWagl-00056z-C2; Mon, 27 Feb 2023 05:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWagj-00056n-S0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWagh-0005X7-PW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677493494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXldrrrQQSce9r/cyrzaPTdzo3wbGmDO/iaSR/90qSk=;
 b=iQUoWpUbbfWnBtMgwfyJgiN2Zv9hsh4Vhh8ldJ6zirOgsSdpkFqJ9Til6Cfkr4OQa4+F6g
 e8dSZRdCVJBC1gNhBI7nu2u6TaQwOQpd/2TsgsByCheU86igE5uQm99V1eYUIPdgVHwji6
 0RUEUmx42/9zdURiIoE5qXJ6jbbqrIA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-TluJhQ52OlCjvnC0w-dBUQ-1; Mon, 27 Feb 2023 05:24:53 -0500
X-MC-Unique: TluJhQ52OlCjvnC0w-dBUQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 e14-20020a05620a208e00b0074270b9960dso3731152qka.22
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXldrrrQQSce9r/cyrzaPTdzo3wbGmDO/iaSR/90qSk=;
 b=f2SkJV8z6UP82IcV12RHZTB0I7Bwmo6YnnD9t4rm6N8fIlHv9iar7wWBpvkYo8k7b6
 k9B90L19FjDi1ICgXeGafU+WFiQCGHr07r6U0fbLXgO9kpx0sX1LgSb1mR/yqzvehwgP
 wiv+dJSBKIY65S0tmVPdbIR43x6Rxl62CINcUXez7S2n6wtW72JiBMmlOqgXxcEDQ+jM
 /+CnF3xbkEQ6FtEM0534GVGM/xfoEx5VTTyz6KgHmNbbVozwMVxnbD+udbz99HEgvpsZ
 Yr3qzO9CS18RjM4gRFEDr0D4QUamaF6Cg0qur7J3nzAqmYFLiWK4PRk+R8tQhZFMzn5z
 XedQ==
X-Gm-Message-State: AO0yUKVibIYG4fS1P2Ys3KnFT8rL0mXUSFwXEVisqEVuJbvh8df/FFCw
 pKUkfzEkLNZeQaTbMUHR8cJmOGyKKRByiLLnml1zM3T9zOwUGBjnKr/eYgYf722LIgHlvczMC/q
 LgsCtMdHYK0W4Pr4=
X-Received: by 2002:a05:622a:11d4:b0:3bf:d9d2:4866 with SMTP id
 n20-20020a05622a11d400b003bfd9d24866mr4960425qtk.24.1677493491350; 
 Mon, 27 Feb 2023 02:24:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/0XuYu7aLS7SQGL4FGpHSaE/WxeLPqVfrT00D5jQFwh/A3Zy97jrJKV8pyLWk2t/EbFZeubA==
X-Received: by 2002:a05:622a:11d4:b0:3bf:d9d2:4866 with SMTP id
 n20-20020a05622a11d400b003bfd9d24866mr4960402qtk.24.1677493491081; 
 Mon, 27 Feb 2023 02:24:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac86783000000b003bfb845497dsm4314493qtp.97.2023.02.27.02.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 02:24:50 -0800 (PST)
Message-ID: <5dc1b2c1-8794-8b59-8e29-84a7cf147c70@redhat.com>
Date: Mon, 27 Feb 2023 11:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <12e40895-82dd-2529-5df7-50ff528ab5f6@redhat.com>
 <e761581e-7c93-6c38-7cc7-388e1934e33c@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <e761581e-7c93-6c38-7cc7-388e1934e33c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/23/23 16:07, Avihai Horon wrote:
> 
> On 23/02/2023 12:05, Cédric Le Goater wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 2/22/23 21:55, Alex Williamson wrote:
>>>
>>> There are various errors running this through the CI on gitlab.
>>>
>>> This one seems bogus but needs to be resolved regardless:
>>>
>>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/glib-2.0 -I/usr/lib/s390x-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /builds/alex.williamson/qemu/linux-headers -isystem linux-headers -iquote . -iquote /builds/alex.williamson/qemu -iquote /builds/alex.williamson/qemu/include -iquote /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
>>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"' '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>>> 2787../hw/vfio/common.c: In function ‘vfio_listener_log_global_start’:
>>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>> 2789 1772 |     if (ret) {
>>> 2790      |        ^
>>
>>
>> The routine to fix is vfio_devices_start_dirty_page_tracking(). The compiler
>> is doing some inlining.
>>
> I don't think I understand how inlining could cause it.
> Could you elaborate on this?

The compiler reports an error in routine 'vfio_listener_log_global_start'
but the fix should be in 'vfio_devices_start_dirty_page_tracking'. Surely
because the compiler optimization inlines the latter.

> 
> I thought that the compiler just missed the initialization of ret because it happens in the if else statement, and that simply doing "int ret = 0;" would solve it.

Yes. This will work.

Thanks,

C.



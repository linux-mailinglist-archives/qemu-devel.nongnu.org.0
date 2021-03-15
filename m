Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7E33C2C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:58:16 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqXm-0004bq-Uq
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqQx-0008Hr-HN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLqQu-0005Yc-65
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615827065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/vYZzrCUTeI3H586Vq83dN+gO5EW6YS+AqDvycaGdk=;
 b=bQ4bMeSB+TXJG+YT5VcssMm9MUKGvGkhq9iXnusDI+9j2rMV9ZehcM0B5Hxzo56weYdMpW
 kXEOzhkTU76YIHFN40lllGrREn6s86M93vzlt1SG6oTIrftEQBporbmuFcudaLCfo/1Bjm
 RkvukK+dTUUXNRlepEajEVLlW6XsC6s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-ihm-kNExOoWmHAmTuqaflQ-1; Mon, 15 Mar 2021 12:51:04 -0400
X-MC-Unique: ihm-kNExOoWmHAmTuqaflQ-1
Received: by mail-wr1-f71.google.com with SMTP id p15so15202089wre.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4/vYZzrCUTeI3H586Vq83dN+gO5EW6YS+AqDvycaGdk=;
 b=D+o9jF61niQ9sCEYQ9cbj0qlRMbJEd0ab3NkhMdl38JMQ4DGQtUzgClrtt4PDwfRhs
 1EZKvNh0nb+gJ+CRq19WUodJqirSAtyXf2V94anNXCyauXd7r0EP3rySsorIQxPwrB3c
 ugcpviOFV73rGDHE46GvzPTN2uL9SA70UBC+IkuDcElGYBOUBX3LOG0bFfDs3lBzOOfN
 J7Ltu8EW7NkJdRNjyN8GLdBvxqCGnMB0TrLqCSBNj7p8FyRm4PMlMs/XN6Bvrqlw8hIq
 9GG3rpvfVGXGKXYDzNeTx7XfBJqrx1YzPWiPp+QiTgm0XALl5HC/3qsjhscy6KYki0iO
 7rPw==
X-Gm-Message-State: AOAM532MqNHEZnzmraffRgAgespt+QbPqUAPkdksWOmNOGwv1gwoQpEm
 uc1/RZv18CgkRU26Y9k3pk3JGmWZ/h56rTBuoSZJYX6ABtQnm3Ykuf6UgkLZwc4rT7AnI78LHKF
 MgqH9E9NGRy7iORyZgRgY93CDoNIlzRF1qFvkd89JOIC23fY5U45fHca/zhc7DonD
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr551181wrx.243.1615827062414; 
 Mon, 15 Mar 2021 09:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBdz1ZuH9EkxtFMrdnzAjl9ue/6rXGsLFikZB/K9e9dTfSDoqY1LYl0he4HcDXNEcm2Y0Zaw==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr551159wrx.243.1615827062180; 
 Mon, 15 Mar 2021 09:51:02 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r10sm217424wmh.45.2021.03.15.09.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:51:01 -0700 (PDT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
 <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
Message-ID: <0edd9206-a77b-7bdf-6c9a-f3f395f58cf3@redhat.com>
Date: Mon, 15 Mar 2021 17:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 5:44 PM, Philippe Mathieu-Daudé wrote:
> On 3/15/21 5:16 PM, Christian Borntraeger wrote:
>>
>>
>> On 08.03.21 14:50, Alex Bennée wrote:
>>> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
>>> their initial guest somewhere in memory and pass the information to it
>>> via platform data. The guest-loader is modelled after the generic
>>> loader for exactly this sort of purpose:
>>>
>>>    $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>>>      -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>>>      -device
>>> guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro
>>> console=hvc0 earlyprintk=xen" \
>>>      -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-Id: <20210303173642.3805-5-alex.bennee@linaro.org>
>>>
>>
>> This now results in
>>
>>     /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function
>> `loader_insert_platform_data':
>>     build/../hw/core/guest-loader.c:56: undefined reference to
>> `qemu_fdt_add_subnode'
>>     /usr/bin/ld: build/../hw/core/guest-loader.c:57: undefined reference
>> to `qemu_fdt_setprop'
>>     /usr/bin/ld: build/../hw/core/guest-loader.c:61: undefined reference
>> to `qemu_fdt_setprop_string_array'
>>     /usr/bin/ld: build/../hw/core/guest-loader.c:68: undefined reference
>> to `qemu_fdt_setprop_string'
>>     /usr/bin/ld: build/../hw/core/guest-loader.c:74: undefined reference
>> to `qemu_fdt_setprop_string_array'
>>     collect2: error: ld returned 1 exit status
>>     ninja: build stopped: subcommand failed.
>>
>> when building s390-softmmu on s390 with  --disable-fdt, which was in my
>> build script.
>>
> 
> Oops. Quick fix:
> 
> -- >8 --
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 9cd72edf513..5827996206e 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -37,7 +37,7 @@
>    'clock-vmstate.c',
>  ))
> 
> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> +softmmu_ss.add(when: ['CONFIG_TCG', fdt], if_true: files('guest-loader.c'))
> 
>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',
> 
> ---
> 
> But better is a Kconfig entry to be able to deselect this
> device.

-- >8 --
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index fdf03514d7d..9397503656d 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -11,6 +11,11 @@ config GENERIC_LOADER
     bool
     default y

+config GUEST_LOADER
+    bool
+    default y
+    depends on TCG
+
 config OR_IRQ
     bool

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 9cd72edf513..59f1605bb07 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -16,6 +16,7 @@
 common_ss.add(files('cpu.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true:
files('generic-loader.c'))
+common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true:
files('guest-loader.c'))
 common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true:
files('platform-bus.c'))
 common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
@@ -37,8 +38,6 @@
   'clock-vmstate.c',
 ))

-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
-
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
   'numa.c',
---



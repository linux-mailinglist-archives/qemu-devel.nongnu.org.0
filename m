Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1285690492
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:24:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ44z-0006sR-Ox; Thu, 09 Feb 2023 05:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ44y-0006s3-4o
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ44t-00077p-2Y
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675938173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKVTtAZ9A11qC47VA2JjZmO1R21ai9ahQnYgDekARQQ=;
 b=YqaafcuLn3fW2BurZjHZfBpPnmm0GSROlYt+oBLeY5c23QBv5VrivlPeZzoKKoxqoy0ApC
 2cYaeZemL51QFbfIMkhQul59ncAPSfMEfuKkNCnTK2XIrdy101wnheuf3WN/86zFHq3rlF
 baHpXcvQK/oDvQV4WzeNIo5cWwt+Hq8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-Pxu3yyFYOgyP3ZNJ4Gpq6g-1; Thu, 09 Feb 2023 05:22:52 -0500
X-MC-Unique: Pxu3yyFYOgyP3ZNJ4Gpq6g-1
Received: by mail-qk1-f198.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so969111qkn.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 02:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKVTtAZ9A11qC47VA2JjZmO1R21ai9ahQnYgDekARQQ=;
 b=5wkvfGwWaoPoXHlQk60j7pHNOqq9L+iKBvAUmQJwJI80pOQNGAEO8JIGiRbz8JvsjZ
 wlawLtX8CRsD8igu5jP8uVYO8NY3t3tzSyCCQLGuFnI8qZvdOIHcq2h9uslo/I6Z4Vv0
 9i3XXXyS7DhGrmET9mZRlt5CsbuRZ8CA7lxQVvro8TFx10R4XnGNJMIHxp2OwA+f1dQm
 sG1d3+BxjJBZzmMRHnVUNsa9r577fDGCoWx0wNOiiPUZofY6Y9Pe3Haar60KNdmuMcUW
 ULeGL+7xGNqMoYzMFgVEFAHFmkEAiU28WCMOUILkyxuMOBU5LCiC9C/0hor83gYpTBys
 xb+w==
X-Gm-Message-State: AO0yUKVcqhi6FCBTMRM2bLuC0NTWtp6ymM9M0x/U8mcLaNzCrej3v+rx
 MSC8T4hdFvL5jfJSAUSksCAfmL+iMWDO0zhXgnbvelzwmC3eJ4usu2PdaKqwfC+70+nbw6Cvuee
 JrKp3VHDaivy+5NM=
X-Received: by 2002:a05:622a:1aa6:b0:3b6:35a4:b107 with SMTP id
 s38-20020a05622a1aa600b003b635a4b107mr15385260qtc.5.1675938172289; 
 Thu, 09 Feb 2023 02:22:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/zhq1h8Xus6dzI3/RAtnH8LAKiUpXBtcJhnjByuQsYOzbNys873AOBKYI7My4AsTp4l/io8g==
X-Received: by 2002:a05:622a:1aa6:b0:3b6:35a4:b107 with SMTP id
 s38-20020a05622a1aa600b003b635a4b107mr15385245qtc.5.1675938172041; 
 Thu, 09 Feb 2023 02:22:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 y129-20020a376487000000b00738e8e81dc9sm1055185qkb.75.2023.02.09.02.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 02:22:51 -0800 (PST)
Message-ID: <928a0c54-f443-2d77-296d-4f2002b1cc42@redhat.com>
Date: Thu, 9 Feb 2023 11:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>
References: <20230208192654.8854-1-farosas@suse.de>
 <20230208192654.8854-2-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 01/10] hw/i386: Select CONFIG_PARALLEL for PC machines
In-Reply-To: <20230208192654.8854-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 08/02/2023 20.26, Fabiano Rosas wrote:
> Currently the isa-parallel driver is always added by the PC machines
> regardless of the presence of the actual code in the build, which can
> lead to a crash:
> 
> qemu-system-i386: unknown type 'isa-parallel'
> Aborted (core dumped)
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/i386/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 1bf47b0b0b..d3c340e053 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -20,7 +20,6 @@ config PC
>       imply PCI_IPMI_BT
>       imply IPMI_SSIF
>       imply ISA_DEBUG
> -    imply PARALLEL
>       imply PCI_DEVICES
>       imply PVPANIC_ISA
>       imply QXL
> @@ -46,6 +45,7 @@ config PC
>       select ACPI_VMGENID
>       select VIRTIO_PMEM_SUPPORTED
>       select VIRTIO_MEM_SUPPORTED
> +    select PARALLEL
>   
>   config PC_PCI
>       bool

Phew ... Ack from a plain upstream point of view. From a Red Hat downstream 
point of view, this will cause another downstream-only patch for us, since 
the binaries (and the machine types) that we have in RHEL have the 
"isa-parallel" device not compiled in on purpose.

So I started wondering now whether we could tackle all this a little bit 
different, in a more flexible way ... something similar like you did in your 
parallel port patch in v1 / something similar to what Peter suggested in his 
option (2) here:

https://lore.kernel.org/qemu-devel/CAFEAcA9VkFU_bh=aBAOoXCUCeSm1xuR+H+uerd468=vVuDrJEg@mail.gmail.com/ 


For display devices, we already have default_display in MachineClass, so 
instead of always selecting the VGA device in your "Select VGA_PCI in 
Kconfig" patch, we could check that in vl.c and set default_vga = 0 if it is 
not available.

For network devices, there is already default_nic_model in PCMachineClass 
... we could move that to the generic MachineClass and use it in vl.c according.

Then no_parallel, no_serial, no_floppy, no_cdrom, no_sdcard in the 
MachineClass could be replaced by a "char *default_XYZ", too, so that we 
rather have a device name here to indicate the availability of a default 
device than a boolean flag. If the pointer is not set ==> no default device. 
If the pointer is set and the device is available ==> use the default 
device. If the pointer is set and the device is not compiled in ==> emit a 
warning, but continue as if the pointer was not set.

What do you think?

  Thomas



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A471DD27D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 17:57:00 +0200 (CEST)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbnZ5-0007Cn-Rh
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbnWk-0004ET-5g
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:54:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54031
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbnWi-0002ql-3j
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590076471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2btMBDMAQpHQmjEZXmpcLXabksfUE2KX0A6EL1HCaY=;
 b=ZL4hioEem7maljkL2iM9mDjW/d17O4+4450J7GuyjQ7GmytNaQWjWPa8NkkYXegLYFLX/V
 w3NvrjxKjyvuMHnsSazym7OEuLmt4zaLL0mzn+BBb2ixhPsgNk9vM+7Jb9FQb6oHJ189AE
 sz/KF4fbf/9ccdycCEXRoPDLIbl6En4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-tzWKtTAFPPmI270ClrJcjQ-1; Thu, 21 May 2020 11:54:29 -0400
X-MC-Unique: tzWKtTAFPPmI270ClrJcjQ-1
Received: by mail-wm1-f71.google.com with SMTP id u11so2001430wmc.7
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 08:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i2btMBDMAQpHQmjEZXmpcLXabksfUE2KX0A6EL1HCaY=;
 b=Zn45GZaqfJdQW6dt+DmIJvj2CDmgUQDbFkyfdH/FXA0OysQH7uauZtC5W22sXcIYE9
 8DxT6cpP+JdmqTObl994riKsECCOKhPkw+p76UxOAY7wZV+4CW9eXfnClzdEtRXlAHJ6
 bqba+b9fL7Gzmf1k7AjXeuKDDgQ9i25iVFl+RlG7L2SUOuOSDaZ2MEnPnK7kDJDsmi5q
 ll0cpw7AdLyALtUixk0Lsa/loBUV9mGxONppnoe5JA7lHFPV5hWx/hPuiWn/u+sbJSqM
 8JIyjUiMrgLl4HhUDvicmplBI++y6Rb2gkKPTEg6XAxuXcw8xgm+/VJjSEqRSFkATyJw
 kC8g==
X-Gm-Message-State: AOAM533jP4+Di6TcX+Gy73CgaKKBm9ixgoSdsAPBMGusBGQLvpXPcnso
 8O1pwqWxR34697TFzX98tLNH2XAk9auJzKO/qtvJznboxbOTlPrvY86lI0P7qiP3CRJIKf4e9HK
 iUOObIPrmxXGeWAA=
X-Received: by 2002:adf:ef01:: with SMTP id e1mr8603737wro.28.1590076468692;
 Thu, 21 May 2020 08:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvT/HB78MQBt0xRMzgELYb0UsuWCX1WDmOveP9d0jWqtKTP7LzmrEMy0y2X/CVuCuWmYyl5w==
X-Received: by 2002:adf:ef01:: with SMTP id e1mr8603716wro.28.1590076468429;
 Thu, 21 May 2020 08:54:28 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.160.154])
 by smtp.gmail.com with ESMTPSA id o15sm6634518wrw.65.2020.05.21.08.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 08:54:27 -0700 (PDT)
Subject: Re: [RFC PATCH v2] hw/i386/vmport: Allow QTest use without crashing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200518103113.9882-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e9f00c94-4ba2-593b-b9a5-0020029e7eec@redhat.com>
Date: Thu, 21 May 2020 17:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200518103113.9882-1-f4bug@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/20 12:31, Philippe Mathieu-Daudé wrote:
> Trying libFuzzer on the vmport device, we get:
> 
>   AddressSanitizer:DEADLYSIGNAL
>   =================================================================
>   ==29476==ERROR: AddressSanitizer: SEGV on unknown address 0x000000008840 (pc 0x56448bec4d79 bp 0x7ffeec9741b0 sp 0x7ffeec9740e0 T0)
>   ==29476==The signal is caused by a READ memory access.
>     #0 0x56448bec4d78 in vmport_ioport_read (qemu-fuzz-i386+0x1260d78)
>     #1 0x56448bb5f175 in memory_region_read_accessor (qemu-fuzz-i386+0xefb175)
>     #2 0x56448bb30c13 in access_with_adjusted_size (qemu-fuzz-i386+0xeccc13)
>     #3 0x56448bb2ea27 in memory_region_dispatch_read1 (qemu-fuzz-i386+0xecaa27)
>     #4 0x56448bb2e443 in memory_region_dispatch_read (qemu-fuzz-i386+0xeca443)
>     #5 0x56448b961ab1 in flatview_read_continue (qemu-fuzz-i386+0xcfdab1)
>     #6 0x56448b96336d in flatview_read (qemu-fuzz-i386+0xcff36d)
>     #7 0x56448b962ec4 in address_space_read_full (qemu-fuzz-i386+0xcfeec4)
> 
> This is easily reproducible using:
> 
>   $ echo inb 0x5658 | qemu-system-i386 -M isapc,accel=qtest -qtest stdio
>   [I 1589796572.009763] OPENED
>   [R +0.008069] inb 0x5658
>   Segmentation fault (core dumped)
> 
>   $ coredumpctl gdb -q
>   Program terminated with signal SIGSEGV, Segmentation fault.
>   #0  0x00005605b54d0f21 in vmport_ioport_read (opaque=0x5605b7531ce0, addr=0, size=4) at hw/i386/vmport.c:77
>   77          eax = env->regs[R_EAX];
>   (gdb) p cpu
>   $1 = (X86CPU *) 0x0
>   (gdb) bt
>   #0  0x00005605b54d0f21 in vmport_ioport_read (opaque=0x5605b7531ce0, addr=0, size=4) at hw/i386/vmport.c:77
>   #1  0x00005605b53db114 in memory_region_read_accessor (mr=0x5605b7531d80, addr=0, value=0x7ffc9d261a30, size=4, shift=0, mask=4294967295, attrs=...) at memory.c:434
>   #2  0x00005605b53db5d4 in access_with_adjusted_size (addr=0, value=0x7ffc9d261a30, size=1, access_size_min=4, access_size_max=4, access_fn=
>       0x5605b53db0d2 <memory_region_read_accessor>, mr=0x5605b7531d80, attrs=...) at memory.c:544
>   #3  0x00005605b53de156 in memory_region_dispatch_read1 (mr=0x5605b7531d80, addr=0, pval=0x7ffc9d261a30, size=1, attrs=...) at memory.c:1396
>   #4  0x00005605b53de228 in memory_region_dispatch_read (mr=0x5605b7531d80, addr=0, pval=0x7ffc9d261a30, op=MO_8, attrs=...) at memory.c:1424
>   #5  0x00005605b537c80a in flatview_read_continue (fv=0x5605b7650290, addr=22104, attrs=..., ptr=0x7ffc9d261b4b, len=1, addr1=0, l=1, mr=0x5605b7531d80) at exec.c:3200
>   #6  0x00005605b537c95d in flatview_read (fv=0x5605b7650290, addr=22104, attrs=..., buf=0x7ffc9d261b4b, len=1) at exec.c:3239
>   #7  0x00005605b537c9e6 in address_space_read_full (as=0x5605b5f74ac0 <address_space_io>, addr=22104, attrs=..., buf=0x7ffc9d261b4b, len=1) at exec.c:3252
>   #8  0x00005605b53d5a5d in address_space_read (len=1, buf=0x7ffc9d261b4b, attrs=..., addr=22104, as=0x5605b5f74ac0 <address_space_io>) at include/exec/memory.h:2401
>   #9  0x00005605b53d5a5d in cpu_inb (addr=22104) at ioport.c:88
> 
> X86CPU is NULL because QTest accelerator does not use CPU.
> Fix by returning default values when QTest accelerator is used.
> 
> Reported-by: Clang AddressSanitizer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Removed Red Hat authorship ¯\_(ツ)_/¯
> 
>  hw/i386/vmport.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
> index 1aaaab691a..4ec95f8778 100644
> --- a/hw/i386/vmport.c
> +++ b/hw/i386/vmport.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/isa/isa.h"
>  #include "sysemu/hw_accel.h"
> +#include "sysemu/qtest.h"
>  #include "qemu/log.h"
>  #include "vmport.h"
>  #include "cpu.h"
> @@ -64,10 +65,14 @@ static uint64_t vmport_ioport_read(void *opaque, hwaddr addr,
>      VMPortState *s = opaque;
>      CPUState *cs = current_cpu;
>      X86CPU *cpu = X86_CPU(cs);
> -    CPUX86State *env = &cpu->env;
> +    CPUX86State *env;
>      unsigned char command;
>      uint32_t eax;
>  
> +    if (qtest_enabled()) {
> +        return -1;
> +    }
> +    env = &cpu->env;
>      cpu_synchronize_state(cs);
>  
>      eax = env->regs[R_EAX];
> @@ -90,6 +95,9 @@ static void vmport_ioport_write(void *opaque, hwaddr addr,
>  {
>      X86CPU *cpu = X86_CPU(current_cpu);
>  
> +    if (qtest_enabled()) {
> +        return;
> +    }
>      cpu->env.regs[R_EAX] = vmport_ioport_read(opaque, addr, 4);
>  }
>  
> @@ -97,6 +105,9 @@ static uint32_t vmport_cmd_get_version(void *opaque, uint32_t addr)
>  {
>      X86CPU *cpu = X86_CPU(current_cpu);
>  
> +    if (qtest_enabled()) {
> +        return -1;
> +    }
>      cpu->env.regs[R_EBX] = VMPORT_MAGIC;
>      return 6;
>  }
> @@ -105,6 +116,9 @@ static uint32_t vmport_cmd_ram_size(void *opaque, uint32_t addr)
>  {
>      X86CPU *cpu = X86_CPU(current_cpu);
>  
> +    if (qtest_enabled()) {
> +        return -1;
> +    }
>      cpu->env.regs[R_EBX] = 0x1177;
>      return ram_size;
>  }
> 

Queued, thanks.

Paolo



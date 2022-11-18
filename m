Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48A62F1A3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxuO-0004Cu-Is; Fri, 18 Nov 2022 04:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovxuM-0004Be-Ch
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovxuJ-0001HC-4X
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668764613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCpb/3QuLGxAhv7VLkKNlzZOVhbDOqE9z4iFqu1j4eA=;
 b=aPoqctO1WQM5DrpOwtdRnkS9flm0JAUpO8p15RyzGrAAlZcTe+0Q84ZP3h9r4k4Ebhqwme
 GFTjVrbvXff1G3tb3VLno2OyWB5Lc1omS1mjxUFFn+rEjmpxAHhDskQ/7tGsalpms/9xPf
 vEm+37roKQpv6uWPkAtsFwWqIR5Jj78=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-g5wNP54oOV2i31Sh_6jp-Q-1; Fri, 18 Nov 2022 04:43:32 -0500
X-MC-Unique: g5wNP54oOV2i31Sh_6jp-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso2013811wms.5
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCpb/3QuLGxAhv7VLkKNlzZOVhbDOqE9z4iFqu1j4eA=;
 b=SwVPLxwU4WXZOaq5zVfp/SDDUb9x/Q41tekBOzcYCH4VbP0nVykiSjA+NgMgS6hDp7
 Ds1E1WtvX7LUIZvDNEsd3qCUGIA38kJtCgT4MaP6SREseqAGTC9yauvaPvxOTG+QwVkT
 U75NNgeI1OSMylQtBFIgpA5y7GJDb9GKwqjsl5GJRr3VjG8+GeChLVg5fevIbEWI2ucy
 LI5/vZyTBwkHNyqtUC+ek/JTyKefZkjL2jMpf3GWuSNPW8hxBEBo5D58wDOGSjtS0UIz
 aG42GbuUejHXcVD9HmNX5rjfjjhB5SjaTpVjklaeN+2oK9VzWPttKqFuOl6mzILLLIIm
 SHDw==
X-Gm-Message-State: ANoB5pmhx99k60dkD5W3IzTFemnh4dE3d2Rz4he3liSK6oDHpTz6b+rB
 //2/CeueDjiuIyEPB7p/R+XIy2/eGWZecQ6ITTxrWN6mG8E70J2kdAFyhQGq6xJ40BRc2QWXIMc
 rifmx69DPX+EBjXY=
X-Received: by 2002:a5d:6404:0:b0:235:134a:91d7 with SMTP id
 z4-20020a5d6404000000b00235134a91d7mr3835405wru.53.1668764610859; 
 Fri, 18 Nov 2022 01:43:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zRrxxRcJed0ZvLD6FoqEezgPm7I3wsDZ0F8endge7OUDiFkOdG2JxRf/mHiEtNSS+AgVKsQ==
X-Received: by 2002:a5d:6404:0:b0:235:134a:91d7 with SMTP id
 z4-20020a5d6404000000b00235134a91d7mr3835374wru.53.1668764610494; 
 Fri, 18 Nov 2022 01:43:30 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-78.web.vodafone.de.
 [109.43.177.78]) by smtp.gmail.com with ESMTPSA id
 y10-20020a056000108a00b002366553eca7sm3067440wrw.83.2022.11.18.01.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 01:43:29 -0800 (PST)
Message-ID: <32f9a700-28f3-ada6-9526-c53cdcd3b5ac@redhat.com>
Date: Fri, 18 Nov 2022 10:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20221111124534.129111-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111124534.129111-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/2022 13.45, Cornelia Huck wrote:
> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
...
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 0ad0ed160387..1c0a7b83b545 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_7_2_machine_options(MachineClass *m)
> +static void pc_i440fx_8_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_machine_options(m);
> @@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;

Instead of renaming pc_i440fx_7_2_machine_options() and introducing a new 
pc_i440fx_7_2_machine_options() below, what about moving 
pcmc->default_cpu_version = 1 into pc_i440fx_machine_options() instead, like 
it is done with all other options? Then you could introduce a completely new 
pc_i440fx_8_0_machine_options() which would be way more logical (also when 
looking at this file with "git blame" later).

>   }
>   
> +DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> +                      pc_i440fx_8_0_machine_options);
> +
> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_8_0_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
>                         pc_i440fx_7_2_machine_options);
>   
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a496bd6e74f5..10bb49f679b0 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_7_2_machine_options(MachineClass *m)
> +static void pc_q35_8_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_machine_options(m);
> @@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;

dito

>   }
>   
> +DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
> +                   pc_q35_8_0_machine_options);
> +
> +static void pc_q35_7_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_8_0_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>                      pc_q35_7_2_machine_options);
>   

Would it make sense to remove the m->alias = NULL from the 7.1 and earlier 
machine types now?

  Thomas



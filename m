Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F287B6E9891
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:42:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWPb-0003c6-Gi; Thu, 20 Apr 2023 11:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppWPQ-0003bF-Kh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppWPJ-0003GN-An
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682005269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycgnZNMo0y9+7jKfY0qpnqPMEgXx0sKwhQrX+xeSraA=;
 b=b5E32zs/OeH6sioHjUp069yz9cPZ0w584UXAvdHuhgraSdbUj7L4ilpy7O1+KQuuJEk/sl
 S/DvS/l15UczURQkX5uN2a+j8uzX+ir/70lBp7D9vsI1uBu2fRIAUQ3iNAQ5zNj81Ol1mm
 SxhKD4VeBhWgbE6J5yE0Uojn+2jzZXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-3ocQmwUbM1CJ8unxU_SU-A-1; Thu, 20 Apr 2023 11:41:05 -0400
X-MC-Unique: 3ocQmwUbM1CJ8unxU_SU-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 a19-20020a05600c349300b003f17146a8deso2160346wmq.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682005264; x=1684597264;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ycgnZNMo0y9+7jKfY0qpnqPMEgXx0sKwhQrX+xeSraA=;
 b=jnNiqN+5Acto0Rv7nkua40tB76Z5Fg9nvzqI1VkHnWrGDFf9j3Bs4lEiNcA9P5AJxo
 nh/D6ZziJfyoTwGNiZoU1MGev0p733Ok9PXlEW5R3ludYI16P6OoPwgE0pfM+vWSyZCM
 Pj2o5JM6woSrog/zBY+qW+vlg1FJMb+Z94ONYDujkI6hFJQKuuninyIx/2xHqgr8dx+K
 ER8xMMK9wolc4tEWtNBYfGf5Hu2Oc/wIhGFm5IX7GXKOQaO9ldM7QSYHXxXp2YEeORHT
 iE1szScg7qouSyBN0DY+2IMDh3/LzXpjz7o1xReIheoxem60BLd2469LgOfTmTiyUEri
 OgBg==
X-Gm-Message-State: AAQBX9c0YgGal2pCqgDscyIxQfIgOxqdowrcGjdbjBiov9Qa5zx5h10f
 f/2OJm/vKPn3VEUa4jyllnCYQ4Dt8wZdtlF3PT5IRiOUDBCwAt9w7CD8hd4KO/Y+uo32LH9Pm0i
 f/4meN1J1JQ/t0Qs=
X-Received: by 2002:a7b:c38a:0:b0:3ee:775:c573 with SMTP id
 s10-20020a7bc38a000000b003ee0775c573mr1366188wmj.20.1682005264583; 
 Thu, 20 Apr 2023 08:41:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqaNiwaKWsP9SQ0lWBhOyfrHJCZLDt02vk7vc6nXRUcff2zG32gotd+U9pg8BHoU9oPwt9Cg==
X-Received: by 2002:a7b:c38a:0:b0:3ee:775:c573 with SMTP id
 s10-20020a7bc38a000000b003ee0775c573mr1366172wmj.20.1682005264190; 
 Thu, 20 Apr 2023 08:41:04 -0700 (PDT)
Received: from [192.168.8.105] (tmo-127-44.customers.d1-online.com.
 [80.187.127.44]) by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b003f173a00304sm5632159wmg.17.2023.04.20.08.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 08:41:03 -0700 (PDT)
Message-ID: <343646f8-4fac-a54b-8c57-e1f9ec4dd6ab@redhat.com>
Date: Thu, 20 Apr 2023 17:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] s390x/gdb: Split s390-virt.xml
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20230314101813.174874-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314101813.174874-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 14/03/2023 11.18, Ilya Leoshkevich wrote:
> Both TCG and KVM emulate ckc, cputm, last_break and prefix, and it's
> quite useful to have them during debugging. Right now they are grouped
> together with KVM-only pp, pfault_token, pfault_select and
> pfault_compare in s390-virt.xml, and are not available when debugging
> TCG-emulated code.
> 
> Move KVM-only registers into the new s390-virt-kvm.xml file. Advertise
> s390-virt.xml always, and the new s390-virt-kvm.xml only for KVM.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20230313211614.98739-1-iii@linux.ibm.com>
> ---
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04307.html
> v1 -> v2: Improve the naming and the commit message (Christian).
> 
>   configs/targets/s390x-linux-user.mak |  2 +-
>   configs/targets/s390x-softmmu.mak    |  2 +-
>   gdb-xml/s390-virt-kvm.xml            | 14 ++++++
>   gdb-xml/s390-virt.xml                |  4 --
>   target/s390x/gdbstub.c               | 65 +++++++++++++++++++---------
>   5 files changed, 61 insertions(+), 26 deletions(-)
>   create mode 100644 gdb-xml/s390-virt-kvm.xml
> 
> diff --git a/configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
> index e2978248ede..24c04c85894 100644
> --- a/configs/targets/s390x-linux-user.mak
> +++ b/configs/targets/s390x-linux-user.mak
> @@ -2,4 +2,4 @@ TARGET_ARCH=s390x
>   TARGET_SYSTBL_ABI=common,64
>   TARGET_SYSTBL=syscall.tbl
>   TARGET_BIG_ENDIAN=y
> -TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
> +TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
> diff --git a/configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
> index 258b4cf3582..70d2f9f0ba0 100644
> --- a/configs/targets/s390x-softmmu.mak
> +++ b/configs/targets/s390x-softmmu.mak
> @@ -1,4 +1,4 @@
>   TARGET_ARCH=s390x
>   TARGET_BIG_ENDIAN=y
>   TARGET_SUPPORTS_MTTCG=y
> -TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
> +TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-virt-kvm.xml gdb-xml/s390-gs.xml
> diff --git a/gdb-xml/s390-virt-kvm.xml b/gdb-xml/s390-virt-kvm.xml
> new file mode 100644
> index 00000000000..a256eddaf57
> --- /dev/null
> +++ b/gdb-xml/s390-virt-kvm.xml
> @@ -0,0 +1,14 @@
> +<?xml version="1.0"?>
> +<!-- Copyright 2023 IBM Corp.
> +
> +     This work is licensed under the terms of the GNU GPL, version 2 or
> +     (at your option) any later version. See the COPYING file in the
> +     top-level directory. -->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name="org.gnu.gdb.s390.virt.kvm">
> +  <reg name="pp" bitsize="64" type="uint64" group="system"/>
> +  <reg name="pfault_token" bitsize="64" type="uint64" group="system"/>
> +  <reg name="pfault_select" bitsize="64" type="uint64" group="system"/>
> +  <reg name="pfault_compare" bitsize="64" type="uint64" group="system"/>
> +</feature>
> diff --git a/gdb-xml/s390-virt.xml b/gdb-xml/s390-virt.xml
> index e2e9a7ad3cc..438eb68aabe 100644
> --- a/gdb-xml/s390-virt.xml
> +++ b/gdb-xml/s390-virt.xml
> @@ -11,8 +11,4 @@
>     <reg name="cputm" bitsize="64" type="uint64" group="system"/>
>     <reg name="last_break" bitsize="64" type="code_ptr" group="system"/>
>     <reg name="prefix" bitsize="64" type="data_ptr" group="system"/>
> -  <reg name="pp" bitsize="64" type="uint64" group="system"/>
> -  <reg name="pfault_token" bitsize="64" type="uint64" group="system"/>
> -  <reg name="pfault_select" bitsize="64" type="uint64" group="system"/>
> -  <reg name="pfault_compare" bitsize="64" type="uint64" group="system"/>
>   </feature>
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index a5d69d0e0bc..e1153f5dc4a 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -205,12 +205,8 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
>   #define S390_VIRT_CPUTM_REGNUM  1
>   #define S390_VIRT_BEA_REGNUM    2
>   #define S390_VIRT_PREFIX_REGNUM 3
> -#define S390_VIRT_PP_REGNUM     4
> -#define S390_VIRT_PFT_REGNUM    5
> -#define S390_VIRT_PFS_REGNUM    6
> -#define S390_VIRT_PFC_REGNUM    7
>   /* total number of registers in s390-virt.xml */
> -#define S390_NUM_VIRT_REGS 8
> +#define S390_NUM_VIRT_REGS 4
>   
>   static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
>   {
> @@ -223,14 +219,6 @@ static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
>           return gdb_get_regl(mem_buf, env->gbea);
>       case S390_VIRT_PREFIX_REGNUM:
>           return gdb_get_regl(mem_buf, env->psa);
> -    case S390_VIRT_PP_REGNUM:
> -        return gdb_get_regl(mem_buf, env->pp);
> -    case S390_VIRT_PFT_REGNUM:
> -        return gdb_get_regl(mem_buf, env->pfault_token);
> -    case S390_VIRT_PFS_REGNUM:
> -        return gdb_get_regl(mem_buf, env->pfault_select);
> -    case S390_VIRT_PFC_REGNUM:
> -        return gdb_get_regl(mem_buf, env->pfault_compare);
>       default:
>           return 0;
>       }
> @@ -255,19 +243,51 @@ static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
>           env->psa = ldtul_p(mem_buf);
>           cpu_synchronize_post_init(env_cpu(env));
>           return 8;
> -    case S390_VIRT_PP_REGNUM:
> +    default:
> +        return 0;
> +    }
> +}
> +
> +/* the values represent the positions in s390-virt-kvm.xml */
> +#define S390_VIRT_KVM_PP_REGNUM     0
> +#define S390_VIRT_KVM_PFT_REGNUM    1
> +#define S390_VIRT_KVM_PFS_REGNUM    2
> +#define S390_VIRT_KVM_PFC_REGNUM    3
> +/* total number of registers in s390-virt-kvm.xml */
> +#define S390_NUM_VIRT_KVM_REGS 4
> +
> +static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf, int n)
> +{
> +    switch (n) {
> +    case S390_VIRT_KVM_PP_REGNUM:
> +        return gdb_get_regl(mem_buf, env->pp);
> +    case S390_VIRT_KVM_PFT_REGNUM:
> +        return gdb_get_regl(mem_buf, env->pfault_token);
> +    case S390_VIRT_KVM_PFS_REGNUM:
> +        return gdb_get_regl(mem_buf, env->pfault_select);
> +    case S390_VIRT_KVM_PFC_REGNUM:
> +        return gdb_get_regl(mem_buf, env->pfault_compare);
> +    default:
> +        return 0;
> +    }
> +}
> +
> +static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +{
> +    switch (n) {
> +    case S390_VIRT_KVM_PP_REGNUM:
>           env->pp = ldtul_p(mem_buf);
>           cpu_synchronize_post_init(env_cpu(env));
>           return 8;
> -    case S390_VIRT_PFT_REGNUM:
> +    case S390_VIRT_KVM_PFT_REGNUM:
>           env->pfault_token = ldtul_p(mem_buf);
>           cpu_synchronize_post_init(env_cpu(env));
>           return 8;
> -    case S390_VIRT_PFS_REGNUM:
> +    case S390_VIRT_KVM_PFS_REGNUM:
>           env->pfault_select = ldtul_p(mem_buf);
>           cpu_synchronize_post_init(env_cpu(env));
>           return 8;
> -    case S390_VIRT_PFC_REGNUM:
> +    case S390_VIRT_KVM_PFC_REGNUM:
>           env->pfault_compare = ldtul_p(mem_buf);
>           cpu_synchronize_post_init(env_cpu(env));
>           return 8;
> @@ -320,10 +340,15 @@ void s390_cpu_gdb_init(CPUState *cs)
>                                cpu_write_c_reg,
>                                S390_NUM_C_REGS, "s390-cr.xml", 0);
>   
> +    gdb_register_coprocessor(cs, cpu_read_virt_reg,
> +                             cpu_write_virt_reg,
> +                             S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
> +
>       if (kvm_enabled()) {
> -        gdb_register_coprocessor(cs, cpu_read_virt_reg,
> -                                 cpu_write_virt_reg,
> -                                 S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
> +        gdb_register_coprocessor(cs, cpu_read_virt_kvm_reg,
> +                                 cpu_write_virt_kvm_reg,
> +                                 S390_NUM_VIRT_KVM_REGS, "s390-virt-kvm.xml",
> +                                 0);
>       }
>   #endif
>   }

The patch looks reasonable to me, but I'm not that much familiar with the 
gdb stuff ... Richard, David, Alex, Christian, any objections? If not, I 
could queue this for my next pull request if nobody else wants to take it.

  Thomas



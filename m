Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D395329EF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:06:03 +0200 (CEST)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTIX-0004mS-KU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSOh-0000b2-AU
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSOe-0004QS-Ix
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNIHolXOtba/KfroUvm6+nuHO3iQXM82ADLznV2LFSw=;
 b=AuRtp0ORgbRGdfeWXTQ4r5EBeIafnFr+ZeXJ2XnouUledAUAljChMsBSipnLYa/HHQ+dSI
 yTq+n04nMdTL98rnoA41SGhvGXlvT6YXRO5OZDd63fhSkJB5/yA9COLYATBYPIW+9f9M+f
 4Eh0tbruA79/0pJu8YAzP8O6fYEWwOE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-b26LuMYvP22viSKJcXwj9g-1; Tue, 24 May 2022 07:08:14 -0400
X-MC-Unique: b26LuMYvP22viSKJcXwj9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 p21-20020a05600c359500b0039740f3d32dso1129093wmq.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=iNIHolXOtba/KfroUvm6+nuHO3iQXM82ADLznV2LFSw=;
 b=r2xwZSmhjWrN01Csa+EaN4XuMbKw5GRBmLLPppuEAwt3N9H43kkYmHqApgYmzvN3VV
 wVDlq0c/EhvM7dd2y4ZVK/pSyUoRKY4eV5Bc2GIhLm7PddJKa3iQU2U/gjBZ2AtRqCN9
 ID0QaK25NAGM2reibnFGLwUxp4Og9ya+72rQECw6x5kDaSY0yXBsMoNwbzHL+UZfCuZs
 qtlMs0o9jQE3D+uXgcBxVptzvwLafokhdYaKlYNPf1HDiwkL9QK5VwQzWsRI5Yl+gv1Y
 4WgnKoaLmbRD6UWVtgPsenTpUXcuITumg2KKcGpAtnj7pXet0jvikEi41fW9+ttdIV7F
 7sZQ==
X-Gm-Message-State: AOAM533b2egbzZyYLwVohjFMUdKirzwwPh+UWT1HnoApWd0ppetOsHNm
 rLIqTeSxutgNwrac9t6uFnEGRhG7uZsBg333m8urnj1ok9tG/li1i8f+1/dARbxxIcFbyZduqLf
 ontHABqE/txWvtpk=
X-Received: by 2002:a05:6000:15c2:b0:20f:cf09:3a23 with SMTP id
 y2-20020a05600015c200b0020fcf093a23mr11381881wry.279.1653390493772; 
 Tue, 24 May 2022 04:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKK452n21cMT2trx8jRmBdVz1mtgVNKDiFkgNfgNGTDwrU1xsyxJSz/OC34PFLhZN8lSz4hg==
X-Received: by 2002:a05:6000:15c2:b0:20f:cf09:3a23 with SMTP id
 y2-20020a05600015c200b0020fcf093a23mr11381865wry.279.1653390493556; 
 Tue, 24 May 2022 04:08:13 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d6c64000000b0020ff9802ee3sm522576wrz.35.2022.05.24.04.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:08:12 -0700 (PDT)
Message-ID: <3dba48f5-7e12-31b6-24b5-573956219020@redhat.com>
Date: Tue, 24 May 2022 13:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-5-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 04/13] s390x: topology: implementating Store Topology
 System Information
In-Reply-To: <20220420115745.13696-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 13.57, Pierre Morel wrote:
> The handling of STSI is enhanced with the interception of the
> function code 15 for storing CPU topology.
> 
> Using the objects built during the pluging of CPU, we build the

s/pluging/plugging/

> SYSIB 15_1_x structures.
> 
> With this patch the maximum MNEST level is 2, this is also
> the only level allowed and only SYSIB 15_1_2 will be built.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index f6969b76c5..a617c943ff 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -889,4 +889,5 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>   
>   #include "exec/cpu-all.h"
>   
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>   #endif

Please keep an empty line before the #endif

> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
> new file mode 100644
> index 0000000000..7f6db18829
> --- /dev/null
> +++ b/target/s390x/cpu_topology.c
> @@ -0,0 +1,112 @@
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2021

2022 ?

> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
...
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
> +{
> +    const MachineState *machine = MACHINE(qdev_get_machine());
> +    void *p;
> +    int ret, cc;
> +
> +    /*
> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
> +     */
> +    if (sel2 != 2) {
> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    p = g_malloc0(TARGET_PAGE_SIZE);
> +
> +    setup_stsi(machine, p, 2);
> +
> +    if (s390_is_pv()) {
> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);
> +    } else {
> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, TARGET_PAGE_SIZE);
> +    }
> +    cc = ret ? 3 : 0;
> +    setcc(cpu, cc);

Just a matter of taste (i.e. keep it if you like) - but you could scratch 
the cc variable in this function by just doing:

     setcc(cpu, ret ? 3 : 0);

> +    g_free(p);
> +}
> +

  Thomas



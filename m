Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A456F024C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:05:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwc4-0000kh-St; Thu, 27 Apr 2023 04:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwc2-0000gH-Lr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwc0-0005b0-FG
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682582659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R36dlmlB7mS4Q+5i4QZDZFJ2WCUffsynJFMD103cOFM=;
 b=D6cUeqbnyGKWIY1AXs+6PkCRMpJsLG/npJ/3/5P6UiCjojAfCtkLouv76CT+DADfHpUupf
 JPgSyF0mXow6KSU3eSNUZEWReVRHBZ0ZF1J/r/xeqLDulkWI8Zc+Ys1McK+LNvlKDR3Uf0
 5MP1VGTHGkz0miFLrm8i8ADT22WhN38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-jfsho0OgMUeAVeFCR5LLPQ-1; Thu, 27 Apr 2023 04:04:17 -0400
X-MC-Unique: jfsho0OgMUeAVeFCR5LLPQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb303so2991261f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582656; x=1685174656;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R36dlmlB7mS4Q+5i4QZDZFJ2WCUffsynJFMD103cOFM=;
 b=kuuBZaK58mkN7zPlm6eMMmac9LNbYgINVxHGGCFstrfg4OEIwfayRB1hIo5Fh/LIoM
 +6GsBLGqv+ic68K1FiyCrRCdAwSQqtadaE/7pxk54+t1n7tTygo5ZmN6Q/pyKHRt/LA/
 SsqMgY+ofTzG9/NEyPt/DIKR89jvCzcPJKtEpAEKpEbeCdZ6Al6qFkTZNC0HQIrPQrHm
 BfYHpkX05qWg2T9crui8zu1HjdhXQCxMtHqGZ22N5qXRT9RRpMINrZaeajNokhtITG4w
 +lZq/ERTV6mTucq1KTUwGy6sfSrb1ba8RWiH/ROCf3OQlONS/CHpT3Hr5vJgIw/JM+WB
 FFjA==
X-Gm-Message-State: AC+VfDz5D3YEGUbwQXuzcMcjebwV8hlcHa1YHNxhF/zT5CJPlc3Zw/DA
 nEMF/aVE5JgzmP9oH5gLrfEXUeyoe2gq10DVeJ3GqLGD6InvrREXeK6HFfzgyKzCEAs+KsU0x+u
 WHz/kTujROrzWdJk=
X-Received: by 2002:a5d:474a:0:b0:2cf:efc7:19ad with SMTP id
 o10-20020a5d474a000000b002cfefc719admr575921wrs.53.1682582656438; 
 Thu, 27 Apr 2023 01:04:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nVcazw8m5wVRp5FQUk5kfDzYaCyFFT7YJ2VExk+yhU598C2ZQJMln+TwZ9wHCxJsfS15UqA==
X-Received: by 2002:a5d:474a:0:b0:2cf:efc7:19ad with SMTP id
 o10-20020a5d474a000000b002cfefc719admr575892wrs.53.1682582656101; 
 Thu, 27 Apr 2023 01:04:16 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adff303000000b002f4cf72fce6sm17882206wro.46.2023.04.27.01.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:04:15 -0700 (PDT)
Message-ID: <45e09800-6a47-0372-5244-16e2dc72370d@redhat.com>
Date: Thu, 27 Apr 2023 10:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v20 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
In-Reply-To: <20230425161456.21031-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 25/04/2023 18.14, Pierre Morel wrote:
> S390 adds two new SMP levels, drawers and books to the CPU
> topology.
> The S390 CPU have specific topology features like dedication
> and entitlement to give to the guest indications on the host
> vCPUs scheduling and help the guest take the best decisions
> on the scheduling of threads on the vCPUs.
> 
> Let us provide the SMP properties with books and drawers levels
> and S390 CPU with dedication and entitlement,
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 2e267fa458..42a6a40333 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -342,3 +342,15 @@
>                      'TARGET_S390X',
>                      'TARGET_MIPS',
>                      'TARGET_LOONGARCH64' ] } }
> +
> +##
> +# @CpuS390Polarization:
> +#
> +# An enumeration of cpu polarization that can be assumed by a virtual
> +# S390 CPU
> +#
> +# Since: 8.1
> +##
> +{ 'enum': 'CpuS390Polarization',
> +  'prefix': 'S390_CPU_POLARIZATION',
> +  'data': [ 'horizontal', 'vertical' ] }

It seems like you don't need this here yet ... I think you likely could also 
introduce it in a later patch instead (patch 11 seems the first one that 
needs this?)

Also, would a " 'if': 'TARGET_S390X' " be possible here, too?

> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index c3dab007da..77bee06304 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -30,8 +30,19 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>       GString *s = g_string_new(NULL);
> +    const char *multiply = " * ", *prefix = "";
>   
> -    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
> +    if (mc->smp_props.drawers_supported) {
> +        g_string_append_printf(s, "drawers (%u)", ms->smp.drawers);
> +        prefix = multiply;

That "prefix" stuff looks complicated ... why don't you simply add the "*" 
at the end of the strings:

     g_string_append_printf(s, "drawers (%u) * ",
                            ms->smp.drawers);

?

> +    }
> +
> +    if (mc->smp_props.books_supported) {
> +        g_string_append_printf(s, "%sbooks (%u)", prefix, ms->smp.books);
> +        prefix = multiply;
> +    }
> +
> +    g_string_append_printf(s, "%ssockets (%u)", prefix, ms->smp.sockets);

... it's followed by "sockets" here anyway, so adding the " * " at the end 
of the strings above should be fine.

>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
> +    unsigned drawers = config->has_drawers ? config->drawers : 0;
> +    unsigned books   = config->has_books ? config->books : 0;
>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>       unsigned dies    = config->has_dies ? config->dies : 0;
>       unsigned clusters = config->has_clusters ? config->clusters : 0;
> @@ -85,6 +98,8 @@ void machine_parse_smp_config(MachineState *ms,
>        * explicit configuration like "cpus=0" is not allowed.
>        */
>       if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_drawers && config->drawers == 0) ||
> +        (config->has_books && config->books == 0) ||
>           (config->has_sockets && config->sockets == 0) ||
>           (config->has_dies && config->dies == 0) ||
>           (config->has_clusters && config->clusters == 0) ||
> @@ -111,6 +126,19 @@ void machine_parse_smp_config(MachineState *ms,
>       dies = dies > 0 ? dies : 1;
>       clusters = clusters > 0 ? clusters : 1;
>   
> +    if (!mc->smp_props.books_supported && books > 1) {
> +        error_setg(errp, "books not supported by this machine's CPU topology");
> +        return;
> +    }
> +    books = books > 0 ? books : 1;

Could be shortened to:  book = books ?: 1;

> +    if (!mc->smp_props.drawers_supported && drawers > 1) {
> +        error_setg(errp,
> +                   "drawers not supported by this machine's CPU topology");
> +        return;
> +    }
> +    drawers = drawers > 0 ? drawers : 1;

Could be shortened to:  drawers = drawers ?: 1;

>       /* compute missing values based on the provided ones */
>       if (cpus == 0 && maxcpus == 0) {
>           sockets = sockets > 0 ? sockets : 1;
> @@ -124,33 +152,41 @@ void machine_parse_smp_config(MachineState *ms,
>               if (sockets == 0) {
>                   cores = cores > 0 ? cores : 1;
>                   threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus /
> +                          (drawers * books * dies * clusters * cores * threads);
>               } else if (cores == 0) {
>                   threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus /
> +                        (drawers * books * sockets * dies * clusters * threads);
>               }

(not very important, but I wonder whether we should maybe disallow 
"prefer_sockets" with drawers and books instead of updating the calculation 
here - since prefer_sockets should only occur on old machine types)

>           } else {
>               /* prefer cores over sockets since 6.2 */
>               if (cores == 0) {
>                   sockets = sockets > 0 ? sockets : 1;
>                   threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus /
> +                        (drawers * books * sockets * dies * clusters * threads);
>               } else if (sockets == 0) {
>                   threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus /
> +                          (drawers * books * dies * clusters * cores * threads);
>               }
>           }

  Thomas



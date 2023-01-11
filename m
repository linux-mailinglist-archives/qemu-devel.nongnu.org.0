Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6B66569C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWvR-0008K6-5M; Wed, 11 Jan 2023 03:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFWvN-0008HZ-AA
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFWvL-0000Tk-IY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673427449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCZp470aw4dEjZsFd+fqL7Enxs229S6a8dCK934dTM4=;
 b=Od9xYVUTXDL6yDN+TUZYNhslIcoelTmnLC3fdatXeUGmMtiF2DDbC29X+WMW0VuN3oCQwW
 bgOzNsQrs4TDRd10CmgLfEfrneGSoP3XIwE+tGaN03+f8SXtcppyOzEvUyPFeDUAyppikO
 zS2xZe9ZXXSahl49eRkXZVP5QbOmpKU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-pJztc_7eM0S0fZLtNs3Bng-1; Wed, 11 Jan 2023 03:57:28 -0500
X-MC-Unique: pJztc_7eM0S0fZLtNs3Bng-1
Received: by mail-qv1-f71.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso8101083qvr.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCZp470aw4dEjZsFd+fqL7Enxs229S6a8dCK934dTM4=;
 b=RA6e+xKv3lZbXXHASDhl69WsXbtMNgiopXTLX6qfrLnKQw7MV/rgAFWACpiWr5CZab
 aNcqqZjZ2QCVYhaYV0Pm/bBH5S1q0UJQmMs0NEa8Q+OXW41J2tMo/8P468UNiTiDuz9F
 +eV5LV1IsVxvYlma+r8gLBDXvvT/8nGs92xlHKLmtGIQZDXI6kZ0c1FOUggYb+HzHpAL
 BYMm5JbCebrGx2WwMKrVPazdYcFkUS0CElqiOgrxHOL5KcthXaagN71U8ceu2mNyrqIh
 biCqHYd+MxTa+o1ZlFpbqCf7p6/KzHT+9/kIzHfGBLOX16QnzRtV2pnt8odNk03NUsGW
 6AQg==
X-Gm-Message-State: AFqh2kqjpPeM6KfoQeuv2xrPwIRJeiYN8Sp7TmeBaB92b8mpVjWkxWJ/
 VeeamBDWsDO4QqpveW42vFMYyuISLErU/uoXkxY1fKhnNGv07XRpIz3oMd4r7VuI6vKcRx8S2nd
 x5OI5lbyk8rDEH/o=
X-Received: by 2002:ac8:41d4:0:b0:3a5:402:4bcf with SMTP id
 o20-20020ac841d4000000b003a504024bcfmr99558560qtm.24.1673427448231; 
 Wed, 11 Jan 2023 00:57:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtf1DVxBh1iPHh4gDjTTUs+xnP/MFMBHIprnZ9rnb16rmsqdKgzvommHBXUsn7MSOg1haxENA==
X-Received: by 2002:ac8:41d4:0:b0:3a5:402:4bcf with SMTP id
 o20-20020ac841d4000000b003a504024bcfmr99558532qtm.24.1673427447981; 
 Wed, 11 Jan 2023 00:57:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05622a149400b0035d432f5ba3sm7371201qtx.17.2023.01.11.00.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 00:57:27 -0800 (PST)
Message-ID: <e65bce5b-977c-ed19-9562-3af8ee8e9fba@redhat.com>
Date: Wed, 11 Jan 2023 09:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 04/11] s390x/sclp: reporting the maximum nested
 topology entries
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-5-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 05/01/2023 15.53, Pierre Morel wrote:
> The maximum nested topology entries is used by the guest to know
> how many nested topology are available on the machine.
> 
> Currently, SCLP READ SCP INFO reports MNEST = 0, which is the
> equivalent of reporting the default value of 2.
> Let's use the default SCLP value of 2 and increase this value in the
> future patches implementing higher levels.

I'm confused ... so does a SCLP value of 2 mean a MNEST level of 4 ?

> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   include/hw/s390x/sclp.h | 5 +++--
>   hw/s390x/sclp.c         | 4 ++++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
> index 712fd68123..4ce852473c 100644
> --- a/include/hw/s390x/sclp.h
> +++ b/include/hw/s390x/sclp.h
> @@ -112,12 +112,13 @@ typedef struct CPUEntry {
>   } QEMU_PACKED CPUEntry;
>   
>   #define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET     128
> -#define SCLP_READ_SCP_INFO_MNEST                2
> +#define SCLP_READ_SCP_INFO_MNEST                4

... since you update it to 4 here.

>   typedef struct ReadInfo {
>       SCCBHeader h;
>       uint16_t rnmax;
>       uint8_t rnsize;
> -    uint8_t  _reserved1[16 - 11];       /* 11-15 */
> +    uint8_t  _reserved1[15 - 11];       /* 11-14 */
> +    uint8_t  stsi_parm;                 /* 15-16 */
>       uint16_t entries_cpu;               /* 16-17 */
>       uint16_t offset_cpu;                /* 18-19 */
>       uint8_t  _reserved2[24 - 20];       /* 20-23 */
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index eff74479f4..07e3cb4cac 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -20,6 +20,7 @@
>   #include "hw/s390x/event-facility.h"
>   #include "hw/s390x/s390-pci-bus.h"
>   #include "hw/s390x/ipl.h"
> +#include "hw/s390x/cpu-topology.h"
>   
>   static inline SCLPDevice *get_sclp_device(void)
>   {
> @@ -125,6 +126,9 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>   
>       /* CPU information */
>       prepare_cpu_entries(machine, entries_start, &cpu_count);
> +    if (s390_has_topology()) {
> +        read_info->stsi_parm = SCLP_READ_SCP_INFO_MNEST;

This seems to be in contradiction to what you've said in the commit 
description - you set it to 4 and not to 2.

  Thomas


> +    }
>       read_info->entries_cpu = cpu_to_be16(cpu_count);
>       read_info->offset_cpu = cpu_to_be16(offset_cpu);
>       read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);



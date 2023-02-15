Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C66980DC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:30:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKez-00075j-Gy; Wed, 15 Feb 2023 11:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKew-0006wc-OJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSKeu-0007PG-Fi
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676478550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7ijZ/h4SqINV6bp7lkefoOkWj76Dtz5FB4zt5ySnhY=;
 b=NXjsf+AyuFVOfE19Rjg31FdoHyr6+59XoBAR0dODT0tof0t1MwfQCct7PlatTVfM3VM/tR
 zRlkn17YhxhaWxMW5lkZw/l/4e1h8xzmHYp5AFDyr1GB4GyN74lwxuFdekPntMrZh0+Lxi
 Y8k+omd7o45rzsPrj4UteaZeA0rclOg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-lPD9_WyiPOOr2ZSuUq_QMg-1; Wed, 15 Feb 2023 11:29:08 -0500
X-MC-Unique: lPD9_WyiPOOr2ZSuUq_QMg-1
Received: by mail-qt1-f198.google.com with SMTP id
 bs11-20020ac86f0b000000b003b9b4ec27c4so11419270qtb.19
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I7ijZ/h4SqINV6bp7lkefoOkWj76Dtz5FB4zt5ySnhY=;
 b=zSnOFrHR9aX0hdbeQ8ArkllIzfngcQDrHgqHZTRj5JfexHULFVD/9B6DqDxREc2qtc
 aS7VGAPc60tnp4GluZUIhpUGdbISZ+bla3C9gogc8wk+fco6HI2qONTLJFe7HOzrvxy7
 MrTXULg2qK1PVxscpGdyVwZOh8fhXBvewaqkRXq2HwV7bVLwhE64Cn+koKycE2xmkFyM
 HKpGb9OQ9QmAFw5GmoZ/N/GqHCO4qasfQabnOskAQxEsayxtCkGLM6RXv928s6DuWfxj
 fwbz1uK1BQ5859NeolKVN83RB79BBSyXgNucAkF7B5hpxvo3nx8ul32nGqKVPv9LYAMO
 wTJw==
X-Gm-Message-State: AO0yUKXfbFbjTDLdtyMEqgZjM6RY0ja75WVaHBP1dsGsuCkAZY1LlX7o
 ZzDrA1NKE0lee+dx+vCsYKkbMbPdn4MHvpm3ISTGmORQlfwuKmn5UsE0Wvlm5nL4UV7pIPCAE9B
 LoGNLNkRv2Z5rj+M=
X-Received: by 2002:ac8:7ca2:0:b0:3b9:bc8c:c201 with SMTP id
 z2-20020ac87ca2000000b003b9bc8cc201mr5023899qtv.12.1676478548233; 
 Wed, 15 Feb 2023 08:29:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+wBBv6N5+DDDboFPXy5n8oiTXCASj3EGeOHVfu2OKijSMAOYYIP/jotXoR9yhtjAlK8rdhCw==
X-Received: by 2002:ac8:7ca2:0:b0:3b9:bc8c:c201 with SMTP id
 z2-20020ac87ca2000000b003b9bc8cc201mr5023878qtv.12.1676478547952; 
 Wed, 15 Feb 2023 08:29:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n129-20020a37bd87000000b006ee8874f5fasm14031205qkf.53.2023.02.15.08.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:29:07 -0800 (PST)
Message-ID: <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
Date: Wed, 15 Feb 2023 17:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-5-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-5-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 2/5/23 10:43, Mostafa Saleh wrote:
> Add a new system property for smmuv3 to choose what translation
> stages to advertise.
>
> The property added arm-smmuv3.stage can have 3 values:
> - "1": Stage-1 is only advertised.
Stage-1 only is advertised
> - "2": Stage-2 is only advertised.
> - "all": Stage-1 + Stage-2 are supported, which is not implemented in
> this patch series.
>
> If not passed or an unsupported value is passed, it will default to
> stage-1.
>
> The property is not used in this patch as stage-2 has not been
> enabled yet.
Usually the user knob (ie. the property) is introduced at the last
stage, ie. at 16/16.

Thanks

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h |  5 +++++
>  hw/arm/smmuv3.c          | 28 +++++++++++++++++++++++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  3 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 170e88c24a..ec64fb43a0 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -329,6 +329,11 @@ enum { /* Command completion notification */
>          })
>  
>  #define SMMU_FEATURE_2LVL_STE (1 << 0)
> +#define SMMU_FEATURE_STAGE1   (1 << 1)
> +#define SMMU_FEATURE_STAGE2   (1 << 2)
> +
> +#define STAGE1_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE1)
> +#define STAGE2_SUPPORTED(f)   (f & SMMU_FEATURE_STAGE2)
>  
>  /* Events */
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 955b89c8d5..54dd8e5ec1 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
>  #include "cpu.h"
> @@ -238,6 +239,19 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  
>  static void smmuv3_init_regs(SMMUv3State *s)
>  {
> +    /*
> +     * Based on system property, the stages supported in smmu will be advertised.
> +     * At the moment "all" is not supported.
> +     * Default stage is 1.
> +     */
> +    s->features = SMMU_FEATURE_STAGE1;
> +    if (s->stage && !strcmp("2", s->stage)) {
> +        s->features = SMMU_FEATURE_STAGE2;
> +    } else if (s->stage && !strcmp("all", s->stage)) {
> +        qemu_log_mask(LOG_UNIMP,
> +                          "SMMUv3 S1 and S2 nesting not supported, defaulting to S1\n");
> +    }
> +
>      /**
>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>       *       multi-level stream table
> @@ -276,7 +290,6 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->eventq.cons = 0;
>      s->eventq.entry_size = sizeof(struct Evt);
>  
> -    s->features = 0;
>      s->sid_split = 0;
>      s->aidr = 0x1;
>      s->cr[0] = 0;
> @@ -1514,6 +1527,18 @@ static const VMStateDescription vmstate_smmuv3 = {
>      },
>  };
>  
> +static Property smmuv3_properties[] = {
> +    /*
> +     * Stages of translation advertised.
> +     * "1": Stage 1
> +     * "2": Stage 2
> +     * "all": Stage 1 + Stage 2
> +     * Defaults to stage 1
> +     */
> +    DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void smmuv3_instance_init(Object *obj)
>  {
>      /* Nothing much to do here as of now */
> @@ -1530,6 +1555,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>                                         &c->parent_phases);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
> +    device_class_set_props(dc, smmuv3_properties);
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index f1921fdf9e..9b9e1c7baf 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -62,6 +62,7 @@ struct SMMUv3State {
>  
>      qemu_irq     irq[4];
>      QemuMutex mutex;
> +    char *stage;
>  };
>  
>  typedef enum {



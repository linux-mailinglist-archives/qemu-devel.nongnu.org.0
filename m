Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AD4DD9B0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:24:10 +0100 (CET)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBeL-0007O0-E2
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:24:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVBYm-0002zW-Hp
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVBYj-0007Bh-Vh
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647605901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwZGbc9in2st0WF8Ra1OwJxHudiAbBIeP/KYvtMjXHU=;
 b=cxwc5O/grJG86Oe3eTlbJZnAAxs8xjJ+Bli5W4xhdgui120+RQ8Nii/kuGhSlNKhZg/osf
 dAMRidi2PrAH+bMe9M3Q33J9xClR1WqqYmzDEf9KN3De9TzxRTVrjM3aAwZ5FuzRLchxmG
 gXmfMemouJOiyWTftRnXqli4yvMoN9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Q3EWHfBLM3-TBMgBQ6rJUg-1; Fri, 18 Mar 2022 08:18:20 -0400
X-MC-Unique: Q3EWHfBLM3-TBMgBQ6rJUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so3731820wmh.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vwZGbc9in2st0WF8Ra1OwJxHudiAbBIeP/KYvtMjXHU=;
 b=Dfbr5PHqdsasc898lhZD5C+e/4lMmixksRgPx7fu6HgCgM5JES/Jzs1A91yJH3P+Xr
 N2WPnNm4xU12tS1gqiKztJHczAPDp2A/pA9sLGbvhhLgv3uWXC/YDRdiE0lKtPWJ7SZQ
 CkqtF27bBC19tOwf9TOcq/IESUMQNdw0AELwhwX6Ejky3UaVaIJ11btiIE2Hlv8kR84A
 8U0cuOJ/KDN5fQdXDSRY3VFyAw1QmNuMAJhOIgXFIReiQ8fZLT/WSmhcnlFEc2/HaBsz
 6LirE/Tmyv6UuKbuNc5LWsyQQNZPNeq5Uc4SAiKas9Z+WoeU0sMnLgExmn4KMOr5k2BE
 t7sA==
X-Gm-Message-State: AOAM532JLbhiR2B88v/CnmaLLoTveXRDe4cbP+8x4A2nqNjWa0xmXiA3
 YdugUCwjsOtunDAC+IVnL2hKnNLPec8jX2pnvuRCDzSexGC0QWXmZy2PGfW2V+RoHAZCNXTIY6T
 VP0S+htpLIkHlpTc=
X-Received: by 2002:adf:ed49:0:b0:203:e5c2:b3d8 with SMTP id
 u9-20020adfed49000000b00203e5c2b3d8mr7580661wro.24.1647605898264; 
 Fri, 18 Mar 2022 05:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvyUOAHLnTz7t12zG5u3LL+jA77eVQs7CdJTHOd8J08avubZz3x6aUzHjeC8cj0/meigujgw==
X-Received: by 2002:adf:ed49:0:b0:203:e5c2:b3d8 with SMTP id
 u9-20020adfed49000000b00203e5c2b3d8mr7580625wro.24.1647605897914; 
 Fri, 18 Mar 2022 05:18:17 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-254.customers.d1-online.com.
 [80.187.65.254]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00203f1231082sm3719394wrd.90.2022.03.18.05.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 05:18:17 -0700 (PDT)
Message-ID: <1150fe4c-cccd-ac14-70c5-55eb88ee9749@redhat.com>
Date: Fri, 18 Mar 2022 13:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20220316145521.1224083-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 15.55, Cornelia Huck wrote:
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
...
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9bc..c3eab13c60e8 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +
>   static void ccw_machine_7_0_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_1_instance_options(machine);
>   }
>   
>   static void ccw_machine_7_0_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +DEFINE_CCW_MACHINE(7_0, "7.0", false);
>   
>   static void ccw_machine_6_2_instance_options(MachineState *machine)
>   {

Acked-by: Thomas Huth <thuth@redhat.com>



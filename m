Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1C176AA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 13:20:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOKcq-0008CG-4y
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 07:20:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYd-0005ip-2P
	for qemu-devel@nongnu.org; Wed, 08 May 2019 07:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKYb-0002jw-GZ
	for qemu-devel@nongnu.org; Wed, 08 May 2019 07:16:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53177)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKYb-0002j6-7S
	for qemu-devel@nongnu.org; Wed, 08 May 2019 07:16:17 -0400
Received: by mail-wm1-f68.google.com with SMTP id o25so2769085wmf.2
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Eq7qSLyleWrNCHx4P4SRi3MKHGejKq3JrAmj3Wbb+Ss=;
	b=WD9KajQgVKWAgIbmS8KJR6SVT82No5dychEtCZjQbwItuR/BJRBmGUzmrCfeJuSbb6
	1TezWOdhSHeYNbP4DOJeLiE65El/HJ5lVpeCpQsYdMXWONLyoXdYQIlVZAygVEbSTMSR
	LvxJI5Dkx/TEid+SfOaTgwIkbFhKX1C9AyQYUmJ6Akgkc3K0lu53IzXg0X93wXRcOlDB
	xYf35YcDVB6AeRkSB3X6M7lJkhnwzcWnp8F2nda3KZdrYCB7GL8HSY4bMv4hHbEOp8te
	R8Tb3xfLH/ZOvTr05wtlUtf7MsersPA1ypM+EMJtDfYNbMDG1SglnAj7AinMO5KQLkA0
	QfwQ==
X-Gm-Message-State: APjAAAV0GA/lybf6T1NDuIljUXsCNnCraZNjNfAZN0hlXExBCCKjuCT8
	4+ZaLX1WqG28v/1ydt8T28gqlg==
X-Google-Smtp-Source: APXvYqyc18QPrkT7qH66pLpTwTbbRMDPbNQl+e8l60uHIrDjuJ+m9zNhqZUVgk/zHPFsMRtxpRVEfA==
X-Received: by 2002:a05:600c:2291:: with SMTP id
	17mr2584957wmf.132.1557314176242; 
	Wed, 08 May 2019 04:16:16 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	o6sm35170410wrh.55.2019.05.08.04.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:16:15 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-11-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f56c85c7-4045-ce26-4a44-8e6bc28a71e2@redhat.com>
Date: Wed, 8 May 2019 13:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2 10/16] hw/mips: Use
 object_initialize_child for correct reference counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> This patch was generated using the following Coccinelle script:
> 
>  @use_sysbus_init_child_obj_missing_parent@
>  expression child_ptr;
>  expression child_type;
>  expression child_size;
>  @@
>  -   object_initialize(child_ptr, child_size, child_type);
>      ...
>  -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
>      ...
>  ?-  object_unref(OBJECT(child_ptr));
>  +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
>  +                         child_size, child_type);
> 
> We let the Malta/Boston machines adopt the CPS child, and similarly
> the CPS adopts the ITU/CPC/GIC/GCR children.
> 
> While the object_initialize() function doesn't take an
> 'Error *errp' argument, the object_initialize_child() does.
> Since this code is used when a machine is created (and is not
> yet running), we deliberately choose to use the &error_abort
> argument instead of ignoring errors if an object creation failed.
> This choice also matches when using sysbus_init_child_obj(),
> since its code is:
> 
>   void sysbus_init_child_obj(Object *parent,
>                              const char *childname, void *child,
>                              size_t childsize, const char *childtype)
>   {
>       object_initialize_child(parent, childname, child, childsize,
>                               childtype, &error_abort, NULL);
> 
>       qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
>   }
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/mips/boston.c     |  4 ++--
>  hw/mips/cps.c        | 20 ++++++++------------
>  hw/mips/mips_malta.c |  4 ++--
>  3 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index cb3ea85fdc1..1ffccc8da92 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -455,8 +455,8 @@ static void boston_mach_init(MachineState *machine)
>  
>      is_64b = cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
>  
> -    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> -    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(machine), "cps", OBJECT(&s->cps),
> +                          sizeof(s->cps), TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), machine->cpu_type, "cpu-type",
>                              &err);
>      object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index fc97f59af4c..649b35a76c5 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -94,9 +94,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>  
>      /* Inter-Thread Communication Unit */
>      if (itu_present) {
> -        object_initialize(&s->itu, sizeof(s->itu), TYPE_MIPS_ITU);
> -        qdev_set_parent_bus(DEVICE(&s->itu), sysbus_get_default());
> -
> +        sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu),
> +                              TYPE_MIPS_ITU);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &err);
>          object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-present",
> @@ -115,9 +114,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* Cluster Power Controller */
> -    object_initialize(&s->cpc, sizeof(s->cpc), TYPE_MIPS_CPC);
> -    qdev_set_parent_bus(DEVICE(&s->cpc), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
> +                          TYPE_MIPS_CPC);
>      object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err);
>      object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
> @@ -130,9 +128,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>                              sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpc), 0));
>  
>      /* Global Interrupt Controller */
> -    object_initialize(&s->gic, sizeof(s->gic), TYPE_MIPS_GIC);
> -    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "gic", &s->gic, sizeof(s->gic),
> +                          TYPE_MIPS_GIC);
>      object_property_set_int(OBJECT(&s->gic), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->gic), 128, "num-irq", &err);
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
> @@ -147,9 +144,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      /* Global Configuration Registers */
>      gcr_base = env->CP0_CMGCRBase << 4;
>  
> -    object_initialize(&s->gcr, sizeof(s->gcr), TYPE_MIPS_GCR);
> -    qdev_set_parent_bus(DEVICE(&s->gcr), sysbus_get_default());
> -
> +    sysbus_init_child_obj(OBJECT(dev), "gcr", &s->gcr, sizeof(s->gcr),
> +                          TYPE_MIPS_GCR);
>      object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
>      object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 04f2117d71e..aff8464f2ac 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1151,8 +1151,8 @@ static void create_cps(MaltaState *s, const char *cpu_type,
>  {
>      Error *err = NULL;
>  
> -    object_initialize(&s->cps, sizeof(s->cps), TYPE_MIPS_CPS);
> -    qdev_set_parent_bus(DEVICE(&s->cps), sysbus_get_default());
> +    sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps), sizeof(s->cps),
> +                          TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), cpu_type, "cpu-type", &err);
>      object_property_set_int(OBJECT(&s->cps), smp_cpus, "num-vp", &err);
>      object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA47A485540
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:02:46 +0100 (CET)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57oL-0000Zg-Gn
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n57bP-0000w8-L5
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:49:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n57bN-0004en-5U
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ysqLclNJzMut443f5x8/Ue0sG0SeYUxnh0PmY3i8bI=;
 b=Is7EorHQGFo7Jgho/ljXUkUabssGo3BBe41/4/sxAsELaoTGH1Xp/hC/5bQ3Scb8xuJjwj
 mJasQS1/Ot+vonqZwYdszSZAIM2tJrYpTxobmvtdm07lm1U8ZG35TGZc3Dz3E9mmqDtfkc
 IGNPa8x/FrQSsEtLE3IjBH/dfJ2/rHM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-ibwBS5CXOuae1AiTgGv6pw-1; Wed, 05 Jan 2022 09:49:16 -0500
X-MC-Unique: ibwBS5CXOuae1AiTgGv6pw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r10-20020adfa14a000000b001a375e65e60so4179784wrr.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7ysqLclNJzMut443f5x8/Ue0sG0SeYUxnh0PmY3i8bI=;
 b=iDlQ2XI5TPjbhMtkctoe2RrXj09KGz7/vb+N+0VA4l7tdAMgUJYrg+RCACK0v0nel8
 0hNTKuT4YvROI7sFzAEzcs9iSJrcCLcpGNoMZwCUmz37pRgZl7o1g2Ix3onf0IV2ixGa
 KihPUPrDyBJ1CyqQX7MB0ApgEjkel2EcJXwX7QNCMJ5r1xmOBJ92JszqhSJuBZXHNeya
 V7BDBdcs3vOIAJtTbiefVh6hdGcvQzKCm8esNMcvG1VNI/H5fY1GR1SEjHRvbTvosdm6
 0t2G+S2AQk3O6oIlddfAbIMGWEar9S3c/n6utGKTVUmn9c5vwEay+lsMBDCNnK7YtB46
 S4kg==
X-Gm-Message-State: AOAM532alUokRnxQdnoKgIyducejiCj5DOSrsRrEoNqgPcwQ4jc52la2
 GHtC2rAUPUCn+Zm1r9SQsnjcAUafHfV1PDyvAOC+pTbh7xEwfTRrO/WUKlJFTrA9yYmmvff0urF
 YwAuWFDSw31r4Nak=
X-Received: by 2002:a5d:4343:: with SMTP id u3mr22236366wrr.504.1641394155332; 
 Wed, 05 Jan 2022 06:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK+c4uuIUmHjP9R/uzqfvlNhQbSKXUXiVv074QlolwC/fancIfcA+LOM/hMfxLJ2AgFIhw4g==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr22236342wrr.504.1641394155134; 
 Wed, 05 Jan 2022 06:49:15 -0800 (PST)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id d5sm19208611wrs.61.2022.01.05.06.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:49:14 -0800 (PST)
Date: Wed, 5 Jan 2022 15:49:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 21/34] hw/arm: add control knob to disable kaslr_seed
 via DTB
Message-ID: <20220105144913.2nitpxzmdyucgr7g@gator>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-22-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220105135009.1584676-22-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, pbonzini@redhat.com, aurelien@aurel32.net,
 stefanha@redhat.com, crosa@redhat.com, Jerome Forissier <jerome@forissier.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:49:56PM +0000, Alex Bennée wrote:
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Acked-by: Jerome Forissier <jerome@forissier.org>
> Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
> ---
>  docs/system/arm/virt.rst |  7 +++++++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>    using ACPI and guest external abort exceptions. The default is off.
>  
> +kaslr-dtb-seed
> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
> +  like address space randomisation. The default is ``on``. You will want
> +  to disable it if your trusted boot chain will verify the DTB it is
> +  passed. It would be the responsibility of the firmware to come up
> +  with a seed and pass it on if it wants to.
> +
>  Linux guest kernel configuration
>  """"""""""""""""""""""""""""""""
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dc6b66ffc8..acd0665fe7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -148,6 +148,7 @@ struct VirtMachineState {
>      bool virt;
>      bool ras;
>      bool mte;
> +    bool kaslr_dtb_seed;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba..1781e47c76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
>  
>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>      qemu_fdt_add_subnode(fdt, "/chosen");
> -    create_kaslr_seed(ms, "/chosen");
> +    if (vms->kaslr_dtb_seed) {
> +        create_kaslr_seed(ms, "/chosen");
> +    }
>  
>      if (vms->secure) {
>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
> -        create_kaslr_seed(ms, "/secure-chosen");
> +        if (vms->kaslr_dtb_seed) {
> +            create_kaslr_seed(ms, "/secure-chosen");
> +        }
>      }
>  
>      /* Clock node, for the benefit of the UART. The kernel device tree
> @@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
>  }
>  
> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->kaslr_dtb_seed;
> +}
> +
> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->kaslr_dtb_seed = value;
> +}
> +
>  static char *virt_get_oem_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable "
>                                            "ITS instantiation");
>  
> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
> +                                   virt_get_kaslr_dtb_seed,
> +                                   virt_set_kaslr_dtb_seed);
> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
> +                                          "Set off to disable passing of kaslr "
> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)
>      /* MTE is disabled by default.  */
>      vms->mte = false;
>  
> +    /* Supply a kaslr-seed by default */
> +    vms->kaslr_dtb_seed = true;
> +
>      vms->irqmap = a15irqmap;
>  
>      virt_flash_create(vms);
> -- 
> 2.30.2
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>



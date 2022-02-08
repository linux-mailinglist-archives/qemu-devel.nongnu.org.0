Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3224AE1E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:06:31 +0100 (CET)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVos-0003kd-9S
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHTuR-0005BP-PS
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHTuO-0000K3-Es
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644339842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZAcWY/aboKFcXwEbG9Mp7WJpeBBlC8nT6/K12Ew4FQ=;
 b=ihZ8LWFod9Htj0lxRyUTXBw1JOY7Dr5gQT4qEKy1okUXzBccpLrO1D8pgNgdwc175bhDST
 b2hsnC4Cs7micklBXWnCxJQAkAQpPl47DKwFcDfpRj8Zxg+bZhQQ+5iabc4wra4n1FiuqL
 EGzMD1IpoCegLqSj0AhiEynh9CA7zNw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-yrc5xsqFNMupGKXDBX8hDQ-1; Tue, 08 Feb 2022 12:04:01 -0500
X-MC-Unique: yrc5xsqFNMupGKXDBX8hDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso1279615wma.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UZAcWY/aboKFcXwEbG9Mp7WJpeBBlC8nT6/K12Ew4FQ=;
 b=Y819Bl8eTBX8aG4DmzNPaow6o0tCehT8kybz7EjbEcjIZhKS0mGV/cJf3czarGVqBu
 G9lCZ6uiRR7ZZPl9CekfyunKGqzRy+dktVXfivtrFQxkoY+KqCoMGaqs7+DpPpMRGqgK
 yYMnPHFJIMt3H+TKKudQ1nIgY6oVGzBew2nKsCsZni7nFlALwTt3rPe7p+GjkYisiV0U
 C8hnVP2bbb8tKzS0inz3wJVHUlroIpz8C9RLCzlj/k08qtm+4Bx1N1zHdmmfNFnHZXPS
 oUw7pVOj1TpeLJ5bK81qo1y0LObrnrdjyIs8KnIs+WWxho7/0QYu1pJKxcuiaiGtZqAa
 J3pA==
X-Gm-Message-State: AOAM533u+dHiURSNdvldyuM9f/P20r0X0jNq9Hriukowwh01yN1PciyN
 PEuzfzvrY+upAnrBFHHQ5lt6j36v+LuSOQ3G1F5h7/KUC252Du6AGkHBsEVOyzqCyfzDG2BHfmP
 h4blplgntBFNLgoU=
X-Received: by 2002:a5d:6604:: with SMTP id n4mr4287455wru.588.1644339840230; 
 Tue, 08 Feb 2022 09:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1uoTtS6KoowdY/uF538+MuEF7ytc9Ig6/wXAjoBNiYAgYhmvkLZMs5ezD7gpCk4vKL8UwSw==
X-Received: by 2002:a5d:6604:: with SMTP id n4mr4287430wru.588.1644339839971; 
 Tue, 08 Feb 2022 09:03:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o7sm6322623wrp.25.2022.02.08.09.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:03:59 -0800 (PST)
Date: Tue, 8 Feb 2022 17:03:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <YgKifeZwaWRZ1V1l@work-vm>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208133842.112017-2-eric.auger@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanb@linux.vnet.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, quintela@redhat.com, alex.williamson@redhat.com,
 imammedo@redhat.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Auger (eric.auger@redhat.com) wrote:
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.

Don't the weird sizes and alignments also cause problems with the RAM
migration code?
Why don't you just align this up to a convenient boundary?

Dave

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> ---
> 
> v3 -> v4:
> -  call vmstate_unregister_ram
> ---
>  hw/tpm/tpm_crb.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c3..668f969b409 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
>  #include "sysemu/reset.h"
> +#include "exec/cpu-common.h"
>  #include "tpm_prop.h"
>  #include "tpm_ppi.h"
>  #include "trace.h"
> @@ -43,6 +44,7 @@ struct CRBState {
>  
>      bool ppi_enabled;
>      TPMPPI ppi;
> +    uint8_t *crb_cmd_buf;
>  };
>  typedef struct CRBState CRBState;
>  
> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> +
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>          "tpm-crb-mmio", sizeof(s->regs));
> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
> +    vmstate_register_ram(&s->cmdmem, dev);
>  
>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE, &s->mmio);
> @@ -309,12 +315,25 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>      qemu_register_reset(tpm_crb_reset, dev);
>  }
>  
> +static void tpm_crb_unrealize(DeviceState *dev)
> +{
> +    CRBState *s = CRB(dev);
> +
> +    vmstate_unregister_ram(&s->cmdmem, dev);
> +    qemu_vfree(s->crb_cmd_buf);
> +
> +    if (s->ppi_enabled) {
> +        qemu_vfree(s->ppi.buf);
> +    }
> +}
> +
>  static void tpm_crb_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      TPMIfClass *tc = TPM_IF_CLASS(klass);
>  
>      dc->realize = tpm_crb_realize;
> +    dc->unrealize = tpm_crb_unrealize;
>      device_class_set_props(dc, tpm_crb_properties);
>      dc->vmsd  = &vmstate_tpm_crb;
>      dc->user_creatable = true;
> -- 
> 2.26.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



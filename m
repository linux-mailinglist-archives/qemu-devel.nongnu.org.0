Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE54949C4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 09:45:23 +0100 (CET)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAT4M-00068G-9J
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 03:45:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nASO5-0006fn-MS
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nASO0-0005r3-3d
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642665681;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHySBy0AgHCO9aow980vmAKacBH83qBP2H1O4qu/vwc=;
 b=ElIkxhJyQ+d0of7gN1ucBAh4EjKZhkMLNq10NmXxGUdqkocE3DXjwYHatY7b8HPsYvWAge
 UhlBi5xoNz4NDlPbOi0aT/Hl1VYhmgr2nu0YvtFBjkAHtnkCHUatDbRKN8ue1i9f9gToGe
 qCkT/K7b6j5hVES4atzh2nLcONlG8Qk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-KKKJWBCmNZ28J9_3L_OUwA-1; Thu, 20 Jan 2022 03:01:18 -0500
X-MC-Unique: KKKJWBCmNZ28J9_3L_OUwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g80-20020a1c9d53000000b0034da9d62199so270183wme.7
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 00:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bHySBy0AgHCO9aow980vmAKacBH83qBP2H1O4qu/vwc=;
 b=28F53g+Pxqmx5hzdscg7cZTAxRdgQ8VTvkOuz6dFL74cVekDmaSNuswEyZIAMgV8xW
 e57U6bY+LfTyDmxQvO8agLcMFGlBKnLkTt9W1JzXGbCbiJm+qkM7/3gPybR3Nex6ao1/
 YocLVtVQNLHw8oQUoLdaUmuUe4uxiPTqe0kp8Wu37hI1iwJbVN5p84Y+ptDqNtwITFhb
 2PtpEWtC1se/lZjRWV83HYY/x3GRta0jGYR6HJEYGHBthQ9oSY3xWYusLAdupHvi5b8N
 WZNP10XQDKSioCDf7Ey1uILAcbsS0hR52y+uh1m3z0MwH1NeWHYu4gkM8Z6dNR91ardC
 V45g==
X-Gm-Message-State: AOAM532slwVnfG38vB32yU+Vtd5MsNSGRFbSIgqRAAmrcH/HY057DbZB
 Q3ygdn7Q8kzbdAj75tZQTS7WG8MIpJsfhAUhipMG7QRyY0tyZPnEl0GIVhtweY+6wOD/+pvlEUQ
 n64R/lhgm921QSzA=
X-Received: by 2002:a05:6000:3cf:: with SMTP id
 b15mr21090593wrg.425.1642665677097; 
 Thu, 20 Jan 2022 00:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUQ55fShgNhsA4C9o47aK1tnmym2ks/brZOgsBuewmXlFNYwC2ScOl8Ovr55eh4/KA9jAMdA==
X-Received: by 2002:a05:6000:3cf:: with SMTP id
 b15mr21090569wrg.425.1642665676848; 
 Thu, 20 Jan 2022 00:01:16 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id a15sm2039381wrp.41.2022.01.20.00.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 00:01:16 -0800 (PST)
Subject: Re: [PATCH v3 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220120001242.230082-1-f4bug@amsat.org>
 <20220120001242.230082-2-f4bug@amsat.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0255c6c8-84ee-7f4d-d492-1cbe63468f2a@redhat.com>
Date: Thu, 20 Jan 2022 09:01:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220120001242.230082-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 1/20/22 1:12 AM, Philippe Mathieu-Daudé wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/tpm/tpm_crb.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c3..be0884ea603 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
>  #include "sysemu/reset.h"
> +#include "exec/cpu-common.h"
OK thank you for the change. That's definitively better to keep

tpm_crb.c in meson's softmmu_ss


Thanks

Eric
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
> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
>  
>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE, &s->mmio);
> @@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>      qemu_register_reset(tpm_crb_reset, dev);
>  }
>  
> +static void tpm_crb_unrealize(DeviceState *dev)
> +{
> +    CRBState *s = CRB(dev);
> +
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



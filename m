Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD546693C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:35:29 +0100 (CET)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspzT-0006lr-UK
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:35:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspwj-0004hj-LH; Thu, 02 Dec 2021 12:32:37 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=33716
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mspwi-0004ZE-2u; Thu, 02 Dec 2021 12:32:37 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id bu11so226480qvb.0;
 Thu, 02 Dec 2021 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NwtgmuE90iKCwGnHdyMjUXNGhJba9UPR4ZboPObfO5E=;
 b=T83qvMEq7fySOGODJZLBXbeU0TYX7Ms49rTm+H4ER8wFENDoyNycARFJS99Kz48bpo
 i+hfoCsqlQai/AWj9gqlGeMgAorw6JsIINMjiKoJkHstPXX3/njubMiNL8R+mgjhbWUX
 erJ/ylJ43x/mGgvciOjbBDJfPeb+vemLDplc/fLKIjQ+Co2jCurZZBDxLtNsTtZtkxkJ
 UrZv+7wvlzZdGP2ghjBE3uJ7DXb3kSsJuLkFLQcQjUQM8BAwagJS9oGfhS4HpCTrHvrK
 +JQvYb4sax+wgqm0+g01a9mua8T+PhKsjlzkBLd5DE+Qy502qPLHO3IvSTkAFsvb+VEs
 NQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwtgmuE90iKCwGnHdyMjUXNGhJba9UPR4ZboPObfO5E=;
 b=0bFKP2UJjgfbJHhWeJI914RqSljl+XID8Q5JXguu4sxigw3yzCHsesA4Wlwsa8Eary
 XdgRQBz1TPBQ012BF4Nr9craMXX0bm+gynRYQA28h/zum1W8Mf2CtP8J4iboV6rCipWl
 tELfd1dw1LtncfN4+cOdNLUEYnU+UF0EAkGOaKAZGpbcR/oAIOzoQuLxT8kYQL1+Ph7g
 qAbehnq03ZvsairshOuZM6FCTAw+ZHSk90j8UJHc9BhyGPgwsHEwzqLPcXtxho+Md3lG
 LXO/PXzCrlSHECUknCkuWAOu4MKMyaq2Yc9kO3ADTsr65vT6psc8Rhqhhbt84qe3sx5Z
 wzVg==
X-Gm-Message-State: AOAM530h3MCknm2HazmwrEexnPNj3ZnKSprDRDG2uINDrNZ0HAj/Mr0A
 DrRNolEzEWy5Q7XE6C1hByt5GB+rSO8=
X-Google-Smtp-Source: ABdhPJw7ng5XKfDrLakGbUVohVKR2mr9Pke6EkfGc+BEsR52LWTU7ZER0dMr4/PyTqSxeIbXpvmJ6w==
X-Received: by 2002:a05:6214:528c:: with SMTP id
 kj12mr14314894qvb.4.1638466354865; 
 Thu, 02 Dec 2021 09:32:34 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id i16sm223303qtx.57.2021.12.02.09.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:32:34 -0800 (PST)
Message-ID: <64dd90b5-0261-9624-b214-794eddde4c06@gmail.com>
Date: Thu, 2 Dec 2021 14:32:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 05/14] ppc/pnv: Reparent user created PHB3 devices to the
 PnvChip
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-6-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> The powernv machine uses the object hierarchy to populate the device
> tree and each device should be parented to the chip it belongs to.
> This is not the case for user created devices which are parented to
> the container "/unattached".
> 
> Make sure a PHB3 device is parented to its chip by reparenting the
> object if necessary.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/pnv.h   |  1 +
>   hw/pci-host/pnv_phb3.c |  6 ++++++
>   hw/ppc/pnv.c           | 17 +++++++++++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 0710673a7fd8..247379ef1f88 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -175,6 +175,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> +void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index dd1cf37288a0..e91f658b0060 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1005,6 +1005,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>               error_setg(errp, "invalid chip id: %d", phb->chip_id);
>               return;
>           }
> +
> +        /*
> +         * Reparent user created devices to the chip to build
> +         * correctly the device tree.
> +         */
> +        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
>       }
>   
>       /* LSI sources */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d7fe92cb082d..9a458655efd9 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1784,6 +1784,23 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> +void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
> +{
> +    Object *parent = OBJECT(chip);
> +    g_autofree char *default_id =
> +        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
> +
> +    if (obj->parent == parent) {
> +        return;
> +    }
> +
> +    object_ref(obj);
> +    object_unparent(obj);
> +    object_property_add_child(
> +        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
> +    object_unref(obj);
> +}
> +
>   PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>   {
>       int i;
> 


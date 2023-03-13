Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00E6B7141
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdhW-00010a-48; Mon, 13 Mar 2023 04:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdh7-0000rW-Iq
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdh5-0002hx-1e
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678696687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37KPC8iAAykTukpblmNIJM3vt2p0WkoVcga/+N/nJtQ=;
 b=BgLU6z2mogWwORIkFBmaVPclMsYLLB0OWSOik/kRV8r3ULXfthjc/P06OeH3rtvrqyc8bI
 T7ZS6Jsvm6GxIoR+t6SNvyaW5g4sMJB694dNl+TFBy2FiKoxX1CgZVbhjjozyKMMscSRPc
 qIL4r4iKI8RgLUY5x5TXWiB2xhF8WhE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-6HvAYMpENcmyt_oV_nboOA-1; Mon, 13 Mar 2023 04:38:05 -0400
X-MC-Unique: 6HvAYMpENcmyt_oV_nboOA-1
Received: by mail-wm1-f72.google.com with SMTP id
 az7-20020a05600c600700b003ed25435106so511783wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678696684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37KPC8iAAykTukpblmNIJM3vt2p0WkoVcga/+N/nJtQ=;
 b=PA2aqf4Azfsx8vMxkzlo44c0SvnhV9KAk7BcMGF2FAjVk9Bu9dOH/jIuOtkPv3mjhX
 ixI+c4atS/TOK+o8R+971JgLmRYBlUkPFk5y4M2lirhwNDqO99a2IWWNPRxegalsgPas
 PtNHhD70MI349jjUXMyPcO93KdfGTHcyCZ7YUw+T4dwriXzp68iP+yrKPHdzkdnlhcZS
 zX5MwLqYtLvgUwDc7Cp2ESaGpf6175w42T9H9QiHHlD3g4dUfOY2KnyDEuq0mEro4LOQ
 L9igDHhT1yXMblZk8FaE74AwkGATJKJAAcYyqs0TO4HCKngYepmjaje/MC9Tv657vgXf
 JXqQ==
X-Gm-Message-State: AO0yUKVAcZaO+lWXOZCr84nB8rE+tdeTfi5ZLzezAVFkBumuD2qEcZCh
 6Y+YvmIOHaqtT+L1TTME1LaLgWgTmxEM3NIQY9M7JTInQfOoPh3gitw3rDxXdohWuryhMU43dtG
 n4YvnYiAmifEwkEY=
X-Received: by 2002:a05:600c:4450:b0:3eb:36fa:b791 with SMTP id
 v16-20020a05600c445000b003eb36fab791mr9338089wmn.31.1678696684285; 
 Mon, 13 Mar 2023 01:38:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set/5SD7Lt/rM8Fixz0OQJ4X3uUqX2Hyk/KzFkRmSPUrJIbnB4JyE4wbtp6EHr0ezP8zpA2L4Sg==
X-Received: by 2002:a05:600c:4450:b0:3eb:36fa:b791 with SMTP id
 v16-20020a05600c445000b003eb36fab791mr9338059wmn.31.1678696683977; 
 Mon, 13 Mar 2023 01:38:03 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003e20970175dsm9202958wms.32.2023.03.13.01.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:38:03 -0700 (PDT)
Message-ID: <e31aa3c6-fdc2-6e62-3b2d-44d9dc18c5d8@redhat.com>
Date: Mon, 13 Mar 2023 09:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 6/6] lsi53c895a: disable reentrancy detection for
 script RAM
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fiona Ebner <f.ebner@proxmox.com>,
 Fam Zheng <fam@euphon.net>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-7-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-7-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 13/03/2023 09.24, Alexander Bulekov wrote:
> As the code is designed to use the memory APIs to access the script ram,
> disable reentrancy checks for the pseudo-RAM ram_io MemoryRegion.
> 
> In the future, ram_io may be converted from an IO to a proper RAM MemoryRegion.
> 
> Reported-by: Fiona Ebner <f.ebner@proxmox.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/scsi/lsi53c895a.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index af93557a9a..db27872963 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2302,6 +2302,12 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
>       memory_region_init_io(&s->io_io, OBJECT(s), &lsi_io_ops, s,
>                             "lsi-io", 256);
>   
> +    /*
> +     * Since we use the address-space API to interact with ram_io, disable the
> +     * re-entrancy guard.
> +     */
> +    s->ram_io.disable_reentrancy_guard = true;
> +
>       address_space_init(&s->pci_io_as, pci_address_space_io(dev), "lsi-pci-io");
>       qdev_init_gpio_out(d, &s->ext_irq, 1);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>



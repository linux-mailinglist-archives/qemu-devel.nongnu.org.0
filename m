Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B857843F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:48:50 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDR7B-0005TO-N4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oDR4g-0001gh-Ji
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:46:14 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oDR4d-000195-PA
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:46:13 -0400
Received: by mail-ej1-x630.google.com with SMTP id oy13so21297303ejb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=51TiKKOJ6gRWqN61IeyHMVFvZl2rbVXo78frrVI/3i4=;
 b=Kcd937g4ptNIE79EC7pE9TdOn/u+9xx7XBlLIqNxkBIbZrq2/z9eMG1fSGOA1IKhb6
 SS96IN5hHOsOMZEP1cnmxhguCSt6P4Y8xd4O69d8jTlwtmPseYsuxb9E1qJFl7uFpjQe
 r752uf6yzWvZcFb8MVEfkhelm2tjli6jjrBFnCBLfLzHJqHckXEgwm7z1RcBwhx8gnMX
 OeG/QjF1ljj7LjhvdHnWkQWjKGOk+7RkdWpbANnBDnRX3BW8EhSWHUFOF6ipEc3LLFvU
 5KX3vP9Ig/SV7eQKcjt47aGDZVDjqODHt6zuoupfDSVwd32PXtJ8hsMPN9gYil+lDNxR
 1v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=51TiKKOJ6gRWqN61IeyHMVFvZl2rbVXo78frrVI/3i4=;
 b=oGUEp+2/38YG5ze2OcEJoijwRbUGMLyPj5l0dowm+0CkIloZpSncaSZgZLskl9RSKZ
 7Lhaurfw6z5vJtXVFvLjZaKBqSmgDcFnkFwp2AHNCDRW5P7m6QiqBZCYME0rka5Lnn4H
 4dy15ef5H9MhNB3PMdl9ugkAHr6f/ax+BfThL9pQekv5saY8hITDlaEZplWLIZvh7JpN
 ucqkN1MOSur3qVFegeiqgImOYue29sF52mxDpOqNAO3TCeWkGlmZ2wWWqw4GkYulkgpH
 RmcIDqXqyiLgL2f7z6BNj41OdQCu90mv/3Jfo9aZrvA0EIO7K2L7rW700VwQYL5Q1H78
 bymQ==
X-Gm-Message-State: AJIora+gfJGOhrRstAd9o+ncZufmdBw7D+v0nWcI5G0fvj4zY8aaL57Z
 a32Ko8Dg5gsL/+ZK/8Zw+9oMIQ==
X-Google-Smtp-Source: AGRyM1t7dOK2OoDQW0rW+PJUurqjb2Hk2R7nYrjq6WV10Mzh4AEWErgr1E1xrP8ZtD1+K8eLvgGVAw==
X-Received: by 2002:a17:907:2888:b0:72b:4a91:b21a with SMTP id
 em8-20020a170907288800b0072b4a91b21amr26165380ejc.35.1658151970001; 
 Mon, 18 Jul 2022 06:46:10 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 x18-20020a170906297200b00728f6d4d0d7sm5511533ejd.67.2022.07.18.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:46:09 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:45:44 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Zhang, Tina" <tina.zhang@intel.com>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/virtio/virtio-iommu: Enforce power-of-two notify for
 both MAP and UNMAP
Message-ID: <YtVkCESkWdtlk9Dj@myrica>
References: <20220714095418.261387-1-jean-philippe@linaro.org>
 <MW5PR11MB5881B65DFAC3710620AB0C0D898B9@MW5PR11MB5881.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR11MB5881B65DFAC3710620AB0C0D898B9@MW5PR11MB5881.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tina,

On Fri, Jul 15, 2022 at 12:09:23AM +0000, Zhang, Tina wrote:
> > +static void virtio_iommu_notify_map_unmap(IOMMUMemoryRegion *mr,
> > +                                          IOMMUTLBEvent *event,
> > +                                          hwaddr virt_start, hwaddr
> > +virt_end) {
> > +    uint64_t delta = virt_end - virt_start;
> > +
> > +    event->entry.iova = virt_start;
> > +    event->entry.addr_mask = delta;
> > +
> > +    if (delta == UINT64_MAX) {
> > +        memory_region_notify_iommu(mr, 0, *event);
> > +    }
> > +
> > +    while (virt_start != virt_end + 1) {
> > +        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end,
> > + 64);
> > +
> > +        event->entry.addr_mask = mask;
> > +        event->entry.iova = virt_start;
> > +        memory_region_notify_iommu(mr, 0, *event);
> > +        virt_start += mask + 1;
> 
> Hi Jean, 
> 
> We also need to increase the event->translated_addr for the map request here.

Ah right, I'll fix this

Thanks,
Jean


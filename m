Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F739894C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:19:35 +0200 (CEST)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPqQ-0001y5-9x
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpH-0000Xr-2o
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpD-0004VV-Dn
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qT/rEhDCwV24v94sG7Ykt0QbZ4SWYTSc0TjZg6wk47A=;
 b=jJwM55kfkOC7tGThLY4r9HiU7nZhroa21YqPvfJcQ4FQwp1tOfUrsBqdsakjmo0NFszREc
 MjhmRX0t4NbKIXClq/ezpTfukyIPF6VItsSsFvTrGLBaUavtAkQOSKhL0q0RANiijdyjMf
 peg8nPEO6cr/jdXG8XGv4W39OPFpSFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-JTfEndKLPxe0aaXVh0ubSA-1; Wed, 02 Jun 2021 08:18:16 -0400
X-MC-Unique: JTfEndKLPxe0aaXVh0ubSA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h18-20020a05600c3512b029018434eb1bd8so2121802wmq.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 05:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=qT/rEhDCwV24v94sG7Ykt0QbZ4SWYTSc0TjZg6wk47A=;
 b=r+TysT3kkrTj1HW21KNS1f94K5+MvnEZLAp4HhD/gLrsmcXiIWlH4kA4vscO2G9DjC
 xaZGZBitfG2hfwrXXIA/7VWZBaEZHsawPqDGntWJ2rG2Mzgub2v0KtbW36pfpWDxbLfx
 N1pqKcreMmdc789bB+Jz1a6jBzXiFdDTeJpEnZc4qJSkHUbSIm0n/s9Va2bXPzjCsFMv
 2zi4Nwkq7M4o4AdBgvfHyh1oImixkQL1QWPFJUZfwunq70MJ1Ig2kXwfre1BR9zy2dHx
 M/wj/BQgePWq6cRBtYfmCd43nfqA6fDr1dWkB7BzClTo9CURgrQzxiy6prx2Cki3Aum2
 Z7tw==
X-Gm-Message-State: AOAM530muvK7fX6rVb9RmUS+iJyfsc3XfKvB5RNQOEyLXQbuaUBYALf3
 0GdkXRqFYagVlcYHB+y9ExeKtVnGlCEQin7c1+D+FkzpSY6EWzbPsHRsiarNuVSybF7o7zX9NMp
 XCfsMPd5dJhFripI=
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4544587wmh.86.1622636294909; 
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1HK9P9XNZJxcvxlSrOyqkNQcfbchvGeF+XOOkOnIQn6Xn24Ms93JWyYRWN2SbDqgLpZHHtg==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4544561wmh.86.1622636294724; 
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q20sm8208740wrf.45.2021.06.02.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 2/8] hw/pxb: Add a bypass iommu property
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-3-git-send-email-wangxingang5@huawei.com>
Message-ID: <26a8b296-15fc-65d3-d343-06b4ac380ce4@redhat.com>
Date: Wed, 2 Jun 2021 14:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-3-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 5/25/21 5:49 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu property for pci_expander_bridge.
> The property can be used as:
> qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/pci-bridge/pci_expander_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index aedded1064..7112dc3062 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -57,6 +57,7 @@ struct PXBDev {
>  
>      uint8_t bus_nr;
>      uint16_t numa_node;
> +    bool bypass_iommu;
>  };
>  
>  static PXBDev *convert_to_pxb(PCIDevice *dev)
> @@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>      bus->map_irq = pxb_map_irq_fn;
>  
>      PCI_HOST_BRIDGE(ds)->bus = bus;
> +    PCI_HOST_BRIDGE(ds)->bypass_iommu = pxb->bypass_iommu;
>  
>      pxb_register_bus(dev, bus, &local_err);
>      if (local_err) {
> @@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
>      /* Note: 0 is not a legal PXB bus number. */
>      DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>      DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> +    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  



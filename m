Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E5398A33
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:04:40 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQY3-0003WG-JI
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loQWn-0001yo-82
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loQWl-00064Q-Ko
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622638998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gknU4n/A3Gn4WaJU0OiXa0O+9VSIyIia9iAzgmbs+HY=;
 b=iS/atiyvUcmOy6l62X/zEktc3d232pl7nW/Au+oUHoBT4KPkOH1q5UFhKk5j7+/dasCZNs
 4b9HPuex3pJ7uRoKGAhEVNXqPqNR/eYGrkdT4FgJSretBPxqcul6zkrHczMkAq4ooI7IBv
 i7CjWH2uNL2s0ai5NfF2hWFAcnoYuRA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-2W-oaLrgMxKTgFxg1WxQ1w-1; Wed, 02 Jun 2021 09:03:04 -0400
X-MC-Unique: 2W-oaLrgMxKTgFxg1WxQ1w-1
Received: by mail-wm1-f71.google.com with SMTP id
 n20-20020a05600c4f94b029017f371265feso2173401wmq.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 06:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gknU4n/A3Gn4WaJU0OiXa0O+9VSIyIia9iAzgmbs+HY=;
 b=Vx1uis6Mnw0K13TGotppN2PZMmMFBx1ExCLg3bWvxUdzJYq3kRa45vwqwyX/RuFC1a
 jL7xHx5ET1rxSbs85u/MfBYBz08fkjv+ix8++9NCPNNU2aB64nrt4FbQQ93Af945ckRg
 4pUZqg0mNWmC2OwKVftJ6nGcdK6s2arJTxAVRjfOd8zHL0QARJO7+N+aG5i/YqqzCDGb
 O7JBceBWcDdqJ4PE5Fgp7gxgnOkt+BX0SAdEl74YP5Z5yjRrXkBiRVgBCYPMnLoU15uz
 y8cdXY65JAFYTKp0vjGGhcEPxreboT9FgsgFaIXpdgmtjg+8JkbPXwRwWNaDos4blk58
 9VjQ==
X-Gm-Message-State: AOAM532EHkUSjAwR1Pxpa2hBxtRAFAjAiPZ47fLHe5FP9Bp1Aku5ti+N
 zlO5u+9w4/SJlkyLlpz6J0OGfrrwUgtKiTjn87ul7iHSj2avNWMpOAIG5cIw0iD8hGXs9FLFf3v
 fZE+hTSfalP20qC0=
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr5263373wmq.112.1622638983474; 
 Wed, 02 Jun 2021 06:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfnD92+s4X5LQM4eA5FgZUEcl8uN34p7HSdUDwGy/zTchL6Gq+xN0CRhy8sY7aoaEN9EwA0A==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr5263349wmq.112.1622638983268; 
 Wed, 02 Jun 2021 06:03:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id a12sm2608336wmj.36.2021.06.02.06.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 06:03:02 -0700 (PDT)
Subject: Re: [PATCH v4 5/8] hw/pci: Add pci_bus_range to get bus number range
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <edcf80ec-7f91-b986-047c-a87c8cc7d669@redhat.com>
Date: Wed, 2 Jun 2021 15:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/25/21 5:50 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This helps to get the bus number range of a pci bridge hierarchy.
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/pci/pci.c         | 15 +++++++++++++++
>  include/hw/pci/pci.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 27d588e268..7f18ea5ef5 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -537,6 +537,21 @@ int pci_bus_num(PCIBus *s)
>      return PCI_BUS_GET_CLASS(s)->bus_num(s);
>  }
>  
Add a doc comment such as "returns the min and max bus numbers of a root
bus"?

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
 
> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
> +{
> +    int i;
> +    *min_bus = *max_bus = pci_bus_num(bus);
> +
> +    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
> +        PCIDevice *dev = bus->devices[i];
> +
> +        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
> +            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
> +            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
> +        }
> +    }
> +}
> +
>  int pci_bus_numa_node(PCIBus *bus)
>  {
>      return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index f4d51b672b..d0f4266e37 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>      return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
>  }
>  int pci_bus_num(PCIBus *s);
> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
>  static inline int pci_dev_bus_num(const PCIDevice *dev)
>  {
>      return pci_bus_num(pci_get_bus(dev));



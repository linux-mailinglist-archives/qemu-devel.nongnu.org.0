Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2C35D99C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:07:55 +0200 (CEST)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWE5S-0003et-72
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lWE3l-0002wR-KC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lWE3i-0005Kr-Lw
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618301165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXZsNf/Po+VAIbmTCzQlWtQaasfbMF34wWpevfywJwM=;
 b=XmGJ6Ftfutng3h7117mY8Wy8MqbeUin2ejhjYv+V1FGWj1WJpR7kpoyB9ni8/ApOhh/h/Z
 /i2kI9XpxOjaGM4066HZh6WNkCctbFvAjoToEE4PMHD2lLXrvv8Q9rY6sVJMT8LUTZMgAR
 JCNAaZexkxujUhu5XWLbxKSrewNbOKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-WP6L-9qZNh2tb6kp_nvGeg-1; Tue, 13 Apr 2021 04:06:01 -0400
X-MC-Unique: WP6L-9qZNh2tb6kp_nvGeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B1080A19E;
 Tue, 13 Apr 2021 08:05:59 +0000 (UTC)
Received: from [10.36.113.20] (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A95DC5C233;
 Tue, 13 Apr 2021 08:05:49 +0000 (UTC)
Subject: Re: [PATCH RFC RESEND v2 3/6] hw/pci: Add pci_root_bus_max_bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-4-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f0cc7d43-70bd-7a65-3cba-213f258c57b4@redhat.com>
Date: Tue, 13 Apr 2021 10:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616656965-23328-4-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 3/25/21 8:22 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> This helps to find max bus number of a root bus.
s/max bus number of a root bus/highest bus number of a bridge hierarchy?
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
>  include/hw/pci/pci.h |  1 +
>  2 files changed, 35 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e17aa9075f..c7957cbf7c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -538,6 +538,40 @@ int pci_bus_num(PCIBus *s)
>      return PCI_BUS_GET_CLASS(s)->bus_num(s);
>  }
>  
> +int pci_root_bus_max_bus(PCIBus *bus)
> +{
> +    PCIHostState *host;
> +    PCIDevice *dev;
> +    int max_bus = 0;
> +    int type, devfn;
> +    uint8_t subordinate;
> +
> +    if (!pci_bus_is_root(bus)) {
> +        return 0;
> +    }
> +
> +    host = PCI_HOST_BRIDGE(BUS(bus)->parent);
> +    max_bus = pci_bus_num(host->bus);
> +
> +    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
> +        dev = host->bus->devices[devfn];
> +
> +        if (!dev) {
> +            continue;
> +        }
> +
> +        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
Seems there is PCI_DEVICE_GET_CLASS(dev)->is_bridge (see
pci_root_bus_in_range). Can't that be used instead?
> +        if (type == PCI_HEADER_TYPE_BRIDGE) {
> +            subordinate = dev->config[PCI_SUBORDINATE_BUS];
> +            if (subordinate > max_bus) {
> +                max_bus = subordinate;
what about the secondary bus number, it is always less than the others?

Thanks

Eric
> +            }
> +        }
> +    }
> +
> +    return max_bus;
> +}
> +
>  int pci_bus_numa_node(PCIBus *bus)
>  {
>      return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 718b5a454a..e0c69534f4 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>      return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
>  }
>  int pci_bus_num(PCIBus *s);
> +int pci_root_bus_max_bus(PCIBus *bus);
>  static inline int pci_dev_bus_num(const PCIDevice *dev)
>  {
>      return pci_bus_num(pci_get_bus(dev));
> 



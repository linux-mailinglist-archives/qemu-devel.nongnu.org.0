Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5BF3329F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:15:17 +0100 (CET)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe4q-00077l-M7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJdT9-00068E-AI
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJdT6-0001rr-Cn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615300575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chuoaICmiBfrDBlUcbMO3IRg1iki2dfxOMLEGBz7MLQ=;
 b=adNxYirK94jrQdmBUxe1dNVFlT5de9B2uv4yQNwCMTeoG+ciSBC/aTtD1I4/vzQuJtj9hl
 mMQgqV3bk/dWWnvVFX9Ttp9fW3Y6KKfNPfd4+Ah8slbvDxJSEzKSoYDnaMS3DaljZkqiXe
 pSlisoBPf0hhPfdwv5UCKwWqUpugFsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-bLGfwM6hNS6zOSUu4dkLxg-1; Tue, 09 Mar 2021 09:36:11 -0500
X-MC-Unique: bLGfwM6hNS6zOSUu4dkLxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CE81B2C983;
 Tue,  9 Mar 2021 14:36:09 +0000 (UTC)
Received: from [10.36.112.254] (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE3F6F98C;
 Tue,  9 Mar 2021 14:36:04 +0000 (UTC)
Subject: Re: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu
 option for pci root bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e37590d0-d65f-e4e4-ec59-92eb3166d9d9@redhat.com>
Date: Tue, 9 Mar 2021 15:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On 2/27/21 9:33 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> These patches add support for configure iommu on/off for pci root bus,
> including primary bus and pxb root bus. At present, All root bus will go
> through iommu when iommu is configured, which is not flexible.
> 
> So this add option to enable/disable iommu for primary bus and pxb root bus.
> When iommu is enabled for the root bus, devices attached to it will go
> through iommu. When iommu is disabled for the root bus, devices will not
> go through iommu accordingly.

Please could you give an example of the qemu command line for which the
new option is useful for you. This would help me to understand your
pcie/pci topology and also make sure I test it with the smmu.

Thank you in advance

Best Regards

Eric
> 
> Xingang Wang (4):
>   pci: Add PCI_BUS_IOMMU property
>   hw/pci: Add iommu option for pci root bus
>   hw/pci: Add pci_root_bus_max_bus
>   hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
> 
>  hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
>  hw/arm/virt.c                       | 29 +++++++++
>  hw/pci-bridge/pci_expander_bridge.c |  6 ++
>  hw/pci/pci.c                        | 35 ++++++++++-
>  include/hw/arm/virt.h               |  1 +
>  include/hw/pci/pci.h                |  1 +
>  include/hw/pci/pci_bus.h            | 13 ++++
>  7 files changed, 153 insertions(+), 24 deletions(-)
> 



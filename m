Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC831A07C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:21:28 +0100 (CET)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZK0-0008Fd-MQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAZHS-0007Na-H7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAZHQ-00011c-Ct
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeWC+drWzccwJMBscgAF6dspogRPZy/Q5z652jSyKiM=;
 b=BuWVDrw3Qc2WMPHY/XMeqpaDmFKKGikFBFPfICyeOtvgfobp3wji3DArUJmBA8xFF773rr
 3ESCoekwdCq7DFPLahX1OSCTRZ+GKoWIeOtwtRwMLCvqzX1MKLeSCuOl3tcUJutuDVUMta
 TLu3wXpRPyDjVmcu46y6I0T4nGqIess=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Y1MZRRwrPA-pGQpIdWVbfg-1; Fri, 12 Feb 2021 09:18:39 -0500
X-MC-Unique: Y1MZRRwrPA-pGQpIdWVbfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A96F9814304;
 Fri, 12 Feb 2021 14:18:32 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0E4C7F48A;
 Fri, 12 Feb 2021 14:18:29 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] pci: cleanup failover sanity check
To: qemu-devel@nongnu.org
References: <20210212135250.2738750-1-lvivier@redhat.com>
 <20210212135250.2738750-2-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <73a7c99e-40e3-6da5-19ff-44eca29b8b46@redhat.com>
Date: Fri, 12 Feb 2021 15:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212135250.2738750-2-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: quintela@redhat.com, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 alex.williamson@redhat.com, zhengxiang9@huawei.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 14:52, Laurent Vivier wrote:
> Commit a1190ab628 has added a "allow_unplug_during_migration = true" at
> the end of the main "if" block, so it is not needed to set it anymore
> in the previous checking.
> 
> Remove it, to have only sub-ifs that check for needed conditions and exit
> if one fails.
> 
> Fixes: 4f5b6a05a4e7 ("pci: add option for net failover")
> Fixes: a1190ab628c0 ("migration: allow unplug during migration for failover devices")
> Cc: jfreimann@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I forgot to copy from the first review:
Reviewed-by: Jens Freimann <jfreimann@redhat.com>

> ---
>  hw/pci/pci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 512e9042ffae..ecb7aa31fabd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2120,10 +2120,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>              pci_qdev_unrealize(DEVICE(pci_dev));
>              return;
>          }
> -        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> -            && (PCI_FUNC(pci_dev->devfn) == 0)) {
> -            qdev->allow_unplug_during_migration = true;
> -        } else {
> +        if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> +            || (PCI_FUNC(pci_dev->devfn) != 0)) {
>              error_setg(errp, "failover: primary device must be in its own "
>                                "PCI slot");
>              pci_qdev_unrealize(DEVICE(pci_dev));
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC131E61F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:05:35 +0100 (CET)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcRS-0006f3-LP
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcJW-0006ha-2o
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcJR-0006Cb-4T
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613627835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDN9EwCQgTbOWkkY7vvhcIU+Kr3p6EaDc7g5i2Za9vQ=;
 b=Y50gaU5MKDq1GjgqB8m+BdKsQ+HYF37Tq7rlR1lBeRL90BaB6rLX1YNntbjBGXTTSIujAb
 TYe+BOZoa+BWWSu5c7n97JRvm0KrxkBV97snnN+676k9LiCrd335Ngg6vQgkwwUx8CuLTO
 9pKtHlTycAXeecgM0jnvbDLRCNbfJ2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-fjFrPG_SMvWXZo7SWTeqbA-1; Thu, 18 Feb 2021 00:57:13 -0500
X-MC-Unique: fjFrPG_SMvWXZo7SWTeqbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 947CC81425C;
 Thu, 18 Feb 2021 05:57:12 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F4D36F921;
 Thu, 18 Feb 2021 05:57:00 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] pci: cleanup failover sanity check
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210210174518.2493928-1-lvivier@redhat.com>
 <20210210174518.2493928-2-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <526a2dac-2aac-fd0b-7396-6ab0ecd3c83a@redhat.com>
Date: Thu, 18 Feb 2021 13:56:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210174518.2493928-2-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 quintela@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/11 上午1:45, Laurent Vivier wrote:
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
> Reviewed-by: Jens Freimann <jfreimann@redhat.com>
> ---
>   hw/pci/pci.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)


Acked-by: Jason Wang <jasowang@redhat.com>


>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 512e9042ffae..ecb7aa31fabd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2120,10 +2120,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>               pci_qdev_unrealize(DEVICE(pci_dev));
>               return;
>           }
> -        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> -            && (PCI_FUNC(pci_dev->devfn) == 0)) {
> -            qdev->allow_unplug_during_migration = true;
> -        } else {
> +        if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
> +            || (PCI_FUNC(pci_dev->devfn) != 0)) {
>               error_setg(errp, "failover: primary device must be in its own "
>                                 "PCI slot");
>               pci_qdev_unrealize(DEVICE(pci_dev));



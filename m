Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A7207EF7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 23:53:56 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joDL9-000778-Hz
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 17:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joDJt-0005iz-BP
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:52:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1joDJq-0008Ny-0r
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 17:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593035553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tTAsG/HWwoojbc0ySxwmz5C1oT0JygnVoPi+YGbW/c=;
 b=jAKunTV/2lArnX56h3mWqtX6y1G+UQxh8uYvDuAL0/s9iFF8FxhcG/nrbddgAvsRWsPw7a
 uznmm2yoYqT1mZQCRbXTGnWak3w2OlYP8SH4xi9R3XXCdxPF0YAHDRK55WA+8XsmlzXKrc
 0U3RT8uJcLfqdMR9eoTJzIvW+pTzs0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-2yNfUHbcNH6vPMOKoUo6Ew-1; Wed, 24 Jun 2020 17:52:31 -0400
X-MC-Unique: 2yNfUHbcNH6vPMOKoUo6Ew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 620068031F6;
 Wed, 24 Jun 2020 21:52:30 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F34EF10013D7;
 Wed, 24 Jun 2020 21:52:26 +0000 (UTC)
Subject: Re: [PATCH 05/46] virtio-crypto-pci: Tidy up
 virtio_crypto_pci_realize()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-6-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <93382daf-08f8-8326-0aca-3d4e95fe7fc4@redhat.com>
Date: Wed, 24 Jun 2020 16:52:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624164344.3778251-6-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 11:43 AM, Markus Armbruster wrote:
> virtio_crypto_pci_realize() continues after realization of its
> "virtio-crypto-device" fails.  Only an object_property_set_link()
> follows; looks harmless to me.  Tidy up anyway: return after failure,
> just like virtio_rng_pci_realize() does.
> 
> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/virtio/virtio-crypto-pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/hw/virtio/virtio-crypto-pci.c b/hw/virtio/virtio-crypto-pci.c
> index 72be531c95..0755722288 100644
> --- a/hw/virtio/virtio-crypto-pci.c
> +++ b/hw/virtio/virtio-crypto-pci.c
> @@ -54,7 +54,9 @@ static void virtio_crypto_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>       }
>   
>       virtio_pci_force_virtio_1(vpci_dev);
> -    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +    if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
> +        return;
> +    }
>       object_property_set_link(OBJECT(vcrypto),
>                    OBJECT(vcrypto->vdev.conf.cryptodev), "cryptodev",
>                    NULL);
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



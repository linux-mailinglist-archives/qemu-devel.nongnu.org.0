Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CF2F59F9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:37:02 +0100 (CET)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzuNZ-0007Cn-R4
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuMg-0006Jm-1w
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzuMe-0007MT-KG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610598963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jUGTB17U/iDyHdaDQgZ/6qUhyCQoy2Ci4khHB5bxUU=;
 b=G7jyVF1xgzmcnokyllbcAv3vlL7PzM/je9MDPEqVwWEbWmoBKsA9LPeIyiYRIFNoEdglom
 LGggywXJxdU1gO+CHkG8Ro+MVNLT90+5ewzjW7gxcIqKxJgCeJfRYY0NdgAXxLxj7U05v3
 qiE2VLv0mZTyGQQCxnCtZX5tX+20P7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-XfEA0j2CPZeY7LsGl2e8fg-1; Wed, 13 Jan 2021 23:36:02 -0500
X-MC-Unique: XfEA0j2CPZeY7LsGl2e8fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37CEB806662
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:36:01 +0000 (UTC)
Received: from [10.72.12.100] (ovpn-12-100.pek2.redhat.com [10.72.12.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D8D6A252;
 Thu, 14 Jan 2021 04:35:57 +0000 (UTC)
Subject: Re: [PATCH v1 0/4] vhost-vdpa: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210113154540.24981-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86037c3a-f2c5-1667-7e2e-e964735f546f@redhat.com>
Date: Thu, 14 Jan 2021 12:35:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113154540.24981-1-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/13 下午11:45, Cindy Lu wrote:
> Add configure interrupt support in vdpa_vhost. qemu will use the irqfd
> process to support this feature.
>
> These code are all tested in vp-vdpa (support configure interrupt)
> vdpa_sim (not support configure interrupt)
>
>
> Cindy Lu (4):
>    virtio:add support in configure interrupt
>    virtio-pci:add support for configure interrupt


If possible, I would like to add the MMIO support for this.

One great advantage of vDPA is that it can avoid to expose a PCI device 
for guest.

Thanks


>    vhost_net:enable configure interrupt when vhost_net start
>    vhost-vdpa:add callback function for configure interrupt
>
>   hw/net/vhost_net.c                | 19 ++++++-
>   hw/virtio/trace-events            |  2 +
>   hw/virtio/vhost-vdpa.c            | 29 +++++++++-
>   hw/virtio/virtio-pci.c            | 93 +++++++++++++++++++++++++++++++
>   hw/virtio/virtio.c                | 25 +++++++++
>   include/hw/virtio/vhost-backend.h |  4 ++
>   include/hw/virtio/virtio-bus.h    |  2 +
>   include/hw/virtio/virtio.h        |  5 ++
>   8 files changed, 177 insertions(+), 2 deletions(-)
>



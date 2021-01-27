Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7394305232
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 06:39:11 +0100 (CET)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4dXq-0002ya-P9
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 00:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dX3-0002ZG-AH
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4dX1-0007KJ-By
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 00:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611725897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpnaaZoyJeo3IXbhrMOGAQEwlwvgLJDPX8FbgfSmK8Q=;
 b=BiEtS2sb0JPE9xxinEO+ImIsxJu7qPZVCWlZGqo+/UDc7P39h1sruvwy13khhvA+Ng5VG+
 WBzO/UDwsY+GnUBNtg1iDRnPqkxgfbnJhDh6+yu8Cfhit0PF4Lh1Rn7uydC2PUjlFzxhaE
 Ww/AnlQ6SqgG5YsdV4O/qRNsfqvuomo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-BUJ2c1KGOC-thP1B1zg3AA-1; Wed, 27 Jan 2021 00:38:15 -0500
X-MC-Unique: BUJ2c1KGOC-thP1B1zg3AA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1C8A107ACE3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 05:38:14 +0000 (UTC)
Received: from [10.72.13.33] (ovpn-13-33.pek2.redhat.com [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C20571F07F;
 Wed, 27 Jan 2021 05:38:10 +0000 (UTC)
Subject: Re: [PATCH v3 2/5] vhost_net: enable configure interrupt when
 vhost_net start
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6d276606-e4d7-e2ee-3fa6-ab1010c84093@redhat.com>
Date: Wed, 27 Jan 2021 13:38:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126074254.3225-3-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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


On 2021/1/26 下午3:42, Cindy Lu wrote:
> While peer is vhost vdpa, setup the configure interrupt function
> vhost_net_start and release the resource when vhost_net_stop
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/vhost_net.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 24d555e764..0660da474a 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -345,6 +345,15 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>           error_report("Error binding guest notifier: %d", -r);
>           goto err;
>       }
> +    if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        if (k->set_config_notifiers) {
> +            r = k->set_config_notifiers(qbus->parent, true);
> +            if (r < 0) {
> +                error_report("Error binding config notifier: %d", -r);
> +                goto err;
> +            }
> +       }
> +    }
>   
>       for (i = 0; i < total_queues; i++) {
>           peer = qemu_get_peer(ncs, i);
> @@ -391,7 +400,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>       for (i = 0; i < total_queues; i++) {
>           vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
>       }
> -
> +   if (ncs->peer && ncs->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        if (k->set_config_notifiers) {


It looks to me that checking k->set_config_notifier is sufficient here.

Thanks


> +            r = k->set_config_notifiers(qbus->parent, false);
> +            if (r < 0) {
> +                error_report("Error unbinding config notifier: %d", -r);
> +            }
> +           assert(r >= 0);
> +        }
> +    }
>       r = k->set_guest_notifiers(qbus->parent, total_queues * 2, false);
>       if (r < 0) {
>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", r);



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731128FC60
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 04:19:05 +0200 (CEST)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTFKh-0006jt-Jj
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 22:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kTFJU-0006B7-EG
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 22:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kTFJR-0005Gc-Hv
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 22:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602814663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IZyciROz6W8g4Eb4FK1Micniim3/HI3EXyuBxcaNDQ=;
 b=Y8cttgFBMI2ZH3iHjU5itPPY5n+mZkDx7qW3h0eavVvi6FbNRHg/njro5xhNp1iLm18ytw
 7mxcJjs3UV4f945adQvwLImppdw5UzcDDzuc0EErFVxEMANJtWx+fcFK2KWsJ7Iemg4hVp
 yoHBawEcJMlfJA2AD/5tG7IBfE13f6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-TZoXeoe2MGC3wVl0DdWRdg-1; Thu, 15 Oct 2020 22:17:42 -0400
X-MC-Unique: TZoXeoe2MGC3wVl0DdWRdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161401868426;
 Fri, 16 Oct 2020 02:17:41 +0000 (UTC)
Received: from [10.72.12.212] (ovpn-12-212.pek2.redhat.com [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A714276673;
 Fri, 16 Oct 2020 02:17:36 +0000 (UTC)
Subject: Re: [PATCH v2] virtio-net: Set mac address to hardware if the peer is
 vdpa
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20200925151333.6157-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c7392598-5c4f-8b4a-e5e7-8488af6d3757@redhat.com>
Date: Fri, 16 Oct 2020 10:17:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925151333.6157-1-lulu@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/25 下午11:13, Cindy Lu wrote:
> If the peer's type is vdpa, we need to set the mac address to hardware
> in virtio_net_device_realize,
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/net/virtio-net.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cb0d27084c..1f2c1643bf 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3399,6 +3399,12 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>       nc = qemu_get_queue(n->nic);
>       nc->rxfilter_notify_enabled = 1;
>   
> +   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        struct virtio_net_config netcfg = {};
> +        memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
> +        vhost_net_set_config(get_vhost_net(nc->peer),
> +            (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> +    }
>       QTAILQ_INIT(&n->rsc_chains);
>       n->qdev = dev;
>   


Applied.

Thanks




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371233CF48
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:08:31 +0100 (CET)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4kg-0006oB-3J
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM4jm-0006Nd-3a
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM4jj-0004dI-S9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615882050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN9y6XoBUNKBPG2escDAHz1LZLsNGtzXcJhXkRDovUk=;
 b=RyX06sOiFckqS2uKjOGk7UV0qL4XVu9hsqOl+/dZEe+gXoe8sSmTOdFRS7ZnBGSYwhfCHP
 4S7elgNXfAWWfe8diS1vu/52WqL0Jb4UQFD8IZHqeRFQIEYjLlW5NH85gSybp7pTRRcXrz
 OwanZtgsJw8Wje7+GtLTCKVSYzlJShs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-zKz-XwnVOwGyCVtsR-W68g-1; Tue, 16 Mar 2021 04:07:27 -0400
X-MC-Unique: zKz-XwnVOwGyCVtsR-W68g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EABE814315;
 Tue, 16 Mar 2021 08:07:25 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1249B62A1B;
 Tue, 16 Mar 2021 08:07:16 +0000 (UTC)
Subject: Re: [RFC v2 12/13] vhost: Check for device VRING_USED_F_NO_NOTIFY at
 shadow virtqueue kick
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <52806611-8435-f80a-63b4-51cfc7a9ead2@redhat.com>
Date: Tue, 16 Mar 2021 16:07:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-13-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/16 上午3:48, Eugenio Pérez 写道:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 68ed0f2740..7df98fc43f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -145,6 +145,15 @@ static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
>       svq->ring_id_maps[qemu_head] = elem;
>   }
>   
> +static void vhost_shadow_vq_kick(VhostShadowVirtqueue *svq)
> +{
> +    /* Make sure we are reading updated device flag */
> +    smp_rmb();


smp_mb() actually? Or it's better to explain this following read needs 
to be orderd with what read before.

Thanks


> +    if (!(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY)) {
> +        event_notifier_set(&svq->kick_notifier);
> +    }
> +}
> +
>   /* Handle guest->device notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
> @@ -174,7 +183,7 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>               }
>   
>               vhost_shadow_vq_add(svq, elem);
> -            event_notifier_set(&svq->kick_notifier);
> +            vhost_shadow_vq_kick(svq);
>           }
>   
>           virtio_queue_set_notification(svq->vq, true);



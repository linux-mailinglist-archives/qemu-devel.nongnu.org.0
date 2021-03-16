Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218633CF54
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:10:39 +0100 (CET)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4mk-0007hd-FV
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM4kk-00078n-W8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM4ki-0005HA-Oq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615882111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1nCMh/GdtBAnYHceTwx46TFXLt9IwH9izaAAYsXUH8=;
 b=aHtdAdo6te9xoyg2zx2U4yxc4LO/I1rPKrbPtSUT+Q90Z+WJ5rwR7L/0yjbWGtEG2s4Wl7
 UOmSuQbReBvLOSKN6ST/uHFZjTw+60nNpWVB0Ls6uuM92iUwVp0B0TwHJ7HvQD0xKhjj+k
 ttPpD30AxMbL0VJYF7F9cvVu+Nzp0qM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-OYhZaPniP_uW-KgOR_BeAw-1; Tue, 16 Mar 2021 04:08:30 -0400
X-MC-Unique: OYhZaPniP_uW-KgOR_BeAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795F5180A0A3;
 Tue, 16 Mar 2021 08:08:28 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB501B426;
 Tue, 16 Mar 2021 08:08:19 +0000 (UTC)
Subject: Re: [RFC v2 13/13] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device
 call on shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-14-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6a5a542d-9640-36b3-401a-9208576c6588@redhat.com>
Date: Tue, 16 Mar 2021 16:08:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-14-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
>   hw/virtio/vhost-shadow-virtqueue.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 7df98fc43f..e3879a4622 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -71,10 +71,35 @@ typedef struct VhostShadowVirtqueue {
>       /* Next head to consume from device */
>       uint16_t used_idx;
>   
> +    /* Cache for the exposed notification flag */
> +    bool notification;
> +
>       /* Descriptors copied from guest */
>       vring_desc_t descs[];
>   } VhostShadowVirtqueue;
>   
> +static void vhost_shadow_vq_set_notification(VhostShadowVirtqueue *svq,
> +                                             bool enable)
> +{
> +    uint16_t notification_flag;
> +
> +    if (svq->notification == enable) {
> +        return;
> +    }
> +
> +    notification_flag = virtio_tswap16(svq->vdev, VRING_AVAIL_F_NO_INTERRUPT);
> +
> +    svq->notification = enable;
> +    if (enable) {
> +        svq->vring.avail->flags &= ~notification_flag;
> +    } else {
> +        svq->vring.avail->flags |= notification_flag;
> +    }
> +
> +    /* Make sure device reads our flag */
> +    smp_mb();


This is a hint, so we don't need memory barrier here.

Thanks


> +}
> +
>   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
>                                       const struct iovec *iovec,
>                                       size_t num, bool more_descs, bool write)
> @@ -251,7 +276,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>       do {
>           unsigned i = 0;
>   
> -        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> +        vhost_shadow_vq_set_notification(svq, false);
>           while (true) {
>               g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
>               if (!elem) {
> @@ -269,6 +294,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
>               svq->masked_notifier.signaled = true;
>               event_notifier_set(svq->masked_notifier.n);
>           }
> +        vhost_shadow_vq_set_notification(svq, true);
>       } while (vhost_shadow_vq_more_used(svq));
>   
>       if (masked_notifier) {



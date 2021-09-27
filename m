Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98BF419226
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:21:33 +0200 (CEST)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnlM-0007cW-SA
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mUniZ-0004yW-IY
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mUniV-0008HB-SF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632737914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqjrsVQ2KPaSC8U7zaSoS78CvzQd4I3Y4dLjxzUky+M=;
 b=ibRRAF7iq2/hfXzJ8C8+pbvky66LE2aZhSHSFI4lkT4nbix9SCtHOp2vEiwUWIq6AIerc1
 qmb3oaIwR+2bxLDIYapGtHNlZO+Nmi1x7sgeVlTkrg6JZDWawyjnvvpbMUKsw/WnGkNgbC
 ZhfkV8xSGlVpHac0hTDWKfVqo1WFxsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-vaG8GDnpMzKDF6PVqq0GYg-1; Mon, 27 Sep 2021 06:18:33 -0400
X-MC-Unique: vaG8GDnpMzKDF6PVqq0GYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1268E801E72
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:18:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3AF10023AE;
 Mon, 27 Sep 2021 10:18:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] hw/virtio: Comment virtqueue_flush() must be
 called with RCU read lock
In-Reply-To: <20210906104318.1569967-2-philmd@redhat.com>
Organization: Red Hat GmbH
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-2-philmd@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 27 Sep 2021 12:18:31 +0200
Message-ID: <874ka6e2yw.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06 2021, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 7 +++++++
>  hw/virtio/virtio.c         | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb750..c1c5f6e53c8 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -186,6 +186,13 @@ void virtio_delete_queue(VirtQueue *vq);
> =20
>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
>                      unsigned int len);
> +/**
> + * virtqueue_flush:
> + * @vq: The #VirtQueue
> + * @count: Number of elements to flush
> + *
> + * Must be called within RCU critical section.
> + */

Hm... do these doc comments belong into .h files, or rather into .c files?

>  void virtqueue_flush(VirtQueue *vq, unsigned int count);
>  void virtqueue_detach_element(VirtQueue *vq, const VirtQueueElement *ele=
m,
>                                unsigned int len);
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 3a1f6c520cb..97f60017466 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -896,6 +896,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, uns=
igned int count)
>      }
>  }
> =20
> +/* Called within rcu_read_lock().  */
>  void virtqueue_flush(VirtQueue *vq, unsigned int count)
>  {
>      if (virtio_device_disabled(vq->vdev)) {

The content of the change looks good to me, I'm only wondering about
the style...



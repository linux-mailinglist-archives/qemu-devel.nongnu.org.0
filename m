Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4431FA35
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:00:52 +0100 (CET)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6Kx-0000zx-J8
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6J3-0008V3-1S
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6J1-00086f-CO
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613743130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1VwvQyZxBPkokQ9XqziKEpbV9WT0NCaCUDcD6xsKfk=;
 b=iweswfi+cAT7L7wrAMjC5qSlhdrnG7c5IOOLlYgb+6KtQSoLqSzMwu4UEUFH1QUqpYawAK
 onqORHxThakWlEHUaZY1by0FwEG2tVXNc6GqtLSImT4+Y1V5yCNDBz7mx/BkPlUW2/f96y
 uZ4bgd1s0HEluvzmo6kvUPrqr02IxOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-Xkluonf2OcKJ8iuYyO8bMQ-1; Fri, 19 Feb 2021 08:58:47 -0500
X-MC-Unique: Xkluonf2OcKJ8iuYyO8bMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC00985EE63;
 Fri, 19 Feb 2021 13:58:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3C16085D;
 Fri, 19 Feb 2021 13:58:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3A2318000A2; Fri, 19 Feb 2021 14:58:31 +0100 (CET)
Date: Fri, 19 Feb 2021 14:58:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210219135831.vg5gtcfdhs3a72zl@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
 <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
 <20210219035206.730f145e.pasic@linux.ibm.com>
 <20210219084545.stb4wjn6ggwent4g@sirius.home.kraxel.org>
 <20210219104252.38feac7c.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210219104252.38feac7c.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Maybe we need a type_register_mayfail() variant which doesn't abort in
> > case the parent isn't found (see also commit
> > 501093207eb1ed4845e0a65ee1ce7db7b9676e0b).
> 
> I was also thinking along the same lines last night, and came up with
> this workaround:
> 
> diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
> index c301e2586b..bbe591cd62 100644
> --- a/hw/s390x/virtio-ccw-gpu.c
> +++ b/hw/s390x/virtio-ccw-gpu.c
> @@ -62,7 +62,16 @@ static const TypeInfo virtio_ccw_gpu = {
>  
>  static void virtio_ccw_gpu_register(void)
>  {
> +#ifdef CONFIG_MODULES
> +    /*
> +     * Ugly hack: Avoid targets that don't have it aborting when this module
> +     * is loaded.
> +    if (object_class_by_name(TYPE_VIRTIO_CCW_DEVICE)) {
> +        type_register_static(&virtio_ccw_gpu);
> +    }
> +#else
>      type_register_static(&virtio_ccw_gpu);
> +#endif
>  }
>  
>  type_init(virtio_ccw_gpu_register)
> 
> but then I decided it is too ugly to post. Something like
> type_register_mayfail() would be certainly nicer, although I would still
> prefer the failing type register if the device ain't built as a module.

type_register_mayfail() could have different behavior depending on
CONFIG_MODULES (and a comment block explaining why).

take care,
  Gerd



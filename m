Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0B3A2894
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:41:39 +0200 (CEST)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHBy-0005Ox-7L
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrHBA-0004fK-ND
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrHB8-0003cg-Pk
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623318045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H+Qf0y/YCKn3zH14w+eVCd5RaqSGAwHT0oh9CzRtZkA=;
 b=Y9DwLB/jhZx2siEGi5aASg4MqbixXiFCZlfTr1RPIzdCXXGRswGzAIkubS0IQGyinUSfbO
 5b9U6AdEYNL8LzaXINXDhTdEh6RwdyrMIMLSsNYwxpTj9MCN5gzSJ7d72m1Fr73v5U5EtS
 tHLFHBP5U9XyfYXFIXr5BeZOKN9Q+a0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-2SV9a9VNMgubtFWwfARvug-1; Thu, 10 Jun 2021 05:40:43 -0400
X-MC-Unique: 2SV9a9VNMgubtFWwfARvug-1
Received: by mail-ed1-f71.google.com with SMTP id
 c12-20020aa7d60c0000b029038fccdf4390so13861386edr.9
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H+Qf0y/YCKn3zH14w+eVCd5RaqSGAwHT0oh9CzRtZkA=;
 b=RG8QAIKpJNSqj1PWkO/KPGt4R8Ab94hHpP4joGxWuPBCxIRr3qKfFJZPD6v3q8vq6h
 twWL01c0/YET752TTiaw/fhui3l7ONRquVk6T5XhSN9P/GY0Qi7gTlmhvmdnVHC7VdI4
 jAADrAfAo8jw2bh6iNhnaXLf/RssZbh6tmh68eGX1kYAHQZuZxYJMiS11mwKRrj/Yo+Y
 M4HwFcNKHINr+it9Js/VLU4LDBsqh0wIB2MAKCstxEdDsGuwktdpzvZn4dAPv5pZDR40
 PgZjQsLfufY2OSIJFzeBTRSJsY0ME9powDARaKwZ+MELbqVFnhCxlsakrrGP07Igkuku
 xHjg==
X-Gm-Message-State: AOAM533MPGFBFex+D0pb3ri0rgBkfbnieDql6ozZZNPR+rk0s46i0fyG
 47KyMX96t/3uze0Tpt1+k+nW/rYo2dGcydzZBVdPQ40phyn7wdsvdIvRUVuyiN/wWY/4/uRu2jK
 F6fw8ej8+H7IQqWM=
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr3691001edu.221.1623318042185; 
 Thu, 10 Jun 2021 02:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOLWSuykkdgm+hX80w2p417pocCAprtt0izN4kOPvjZ+WI6HY9hnjeT7mz3b1VueN3DKQRuw==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr3690988edu.221.1623318042005; 
 Thu, 10 Jun 2021 02:40:42 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id b24sm1070908edw.4.2021.06.10.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:40:41 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:40:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v1] virtio/vsock: add two more queues for datagram types
Message-ID: <20210610094039.2ek3som6fxcgjtyw@steredhat>
References: <20210610001424.209158-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210610001424.209158-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 12:14:24AM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>
>The virtio spec patch is here:
>https://www.spinics.net/lists/linux-virtualization/msg50027.html
>
>Here is the link for the linux kernel git repo with patches
>to support dgram sockets:
>https://github.com/Jiang1155/linux/tree/vsock-dgram-v1
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
> configure                                     | 13 +++++++++++++
> hw/virtio/vhost-vsock-common.c                | 11 ++++++++++-
> hw/virtio/vhost-vsock.c                       |  8 +++++---
> include/hw/virtio/vhost-vsock-common.h        | 10 +++++++++-
> include/standard-headers/linux/virtio_vsock.h |  3 +++
> meson.build                                   |  1 +
> 6 files changed, 41 insertions(+), 5 deletions(-)
>
>diff --git a/configure b/configure
>index 9f016b06b5..6455b283a5 100755
>--- a/configure
>+++ b/configure
>@@ -343,6 +343,7 @@ vhost_net="$default_feature"
> vhost_crypto="$default_feature"
> vhost_scsi="$default_feature"
> vhost_vsock="$default_feature"
>+vhost_vsock_dgram="no"
> vhost_user="no"
> vhost_user_blk_server="auto"
> vhost_user_fs="$default_feature"
>@@ -1272,6 +1273,10 @@ for opt do
>   ;;
>   --enable-vhost-vsock) vhost_vsock="yes"
>   ;;
>+  --disable-vhost-vsock-dgram) vhost_vsock_dgram="no"
>+  ;;
>+  --enable-vhost-vsock-dgram) vhost_vsock_dgram="yes"
>+  ;;

I don't think we should add a configuration option to enable/disable the 
dgram support at build time.

I think we should do it at runtime looking at the features negiotated.

Take a look at virtio_net_set_multiqueue().

Thanks,
Stefano



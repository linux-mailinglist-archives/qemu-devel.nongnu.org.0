Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFC6AD931
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSan-00067o-P1; Tue, 07 Mar 2023 03:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZSam-00067f-Lo
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZSal-0000Ar-Aj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 03:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678177358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUhDAgUWgg7k/HH7dtJbncU5uaNsGBrjwb2Fw1kdKfs=;
 b=XA0MgJLhJTdU7kuHw1zGM0H6K0ml8d6A0J4XU8ioIfYJ1lgwhADDjjwYVjT1Waa7/fjKmT
 4d6SyZfgldkVlbhbIGBaypUDcNbcaM5yXLHOndn+lBIQTNAT78Xgw17AZVNColOKHCbXN0
 2vKqaRI8ZdJjfIIp8wb8+eAq0NQVew8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-v-CayFPJPlyq3rAWSGnS-g-1; Tue, 07 Mar 2023 03:22:37 -0500
X-MC-Unique: v-CayFPJPlyq3rAWSGnS-g-1
Received: by mail-oi1-f198.google.com with SMTP id
 n205-20020acabdd6000000b003846654dd65so5152550oif.19
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 00:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678177357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wUhDAgUWgg7k/HH7dtJbncU5uaNsGBrjwb2Fw1kdKfs=;
 b=dEZ/bGkQ9ABtxMZi0BHPCdlbEOnaYlZOBSaGJHVAMf/0FPQ9li0N6zOoIXJbIAJ5v7
 /vLqCt1Of3ddPSFmDoorz8JV8H9uSq5NCLNUM3Js/ZOj6mnAxjD+EqfuB4w4OLE+ALsd
 KRMR7p6k4loFz7qAkvK+4+ORbL3/GIMfYhoI1eq1NATcQXcyzyofUfkbtqPBvbHnQBEF
 vB43phldp2IiIlxfQ5fr3azAonQ47K6pEu5Qsj2vQpV5QrHVPG04Fy4WOs0ew5Hdmosk
 a0e+YZ6tTsQfl6QzPrFs3JWLLBQJc+cuofK/uT+6QDnfkcZ7tv5+W1ydVBqOjzGQfida
 pzvw==
X-Gm-Message-State: AO0yUKVNRs6R0E/lIOJrSdKB+lszWQZX0a+Lo18bxOVcoXOHuWW9xbwL
 gxFclTWg40faHfRmXiffJVWqljjZU0JqCksGhyW0Q/l4djA+l2LOhgsY6g7yPedW7eMghHGoPME
 8KPEfwpF0wN7V2CH8yhcoP/AhZ8/Cg0U=
X-Received: by 2002:a05:6871:6a99:b0:172:3aea:ecaa with SMTP id
 zf25-20020a0568716a9900b001723aeaecaamr4389469oab.9.1678177356787; 
 Tue, 07 Mar 2023 00:22:36 -0800 (PST)
X-Google-Smtp-Source: AK7set++ulI7kpWSW37zw/ENIGxEGIda8mPBPdCm/W5nXcl4m+7wHVumo1XTjSxZYun/NxI3Dzjnh2jwQ4oWtnhXT6g=
X-Received: by 2002:a05:6871:6a99:b0:172:3aea:ecaa with SMTP id
 zf25-20020a0568716a9900b001723aeaecaamr4389465oab.9.1678177356604; Tue, 07
 Mar 2023 00:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20230306193209.516011-1-peterx@redhat.com>
In-Reply-To: <20230306193209.516011-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Mar 2023 16:22:25 +0800
Message-ID: <CACGkMEt9KgYgaO7T3BsGaFY3fv-A4yPCro7OVjt9t+gomWmtcA@mail.gmail.com>
Subject: Re: [PATCH] vhost: Drop unused eventfd_add|del hooks
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, longpeng2@huawei.com, 
 "Michael S . Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 7, 2023 at 3:32=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> These hooks were introduced in:
>
> 80a1ea3748 ("memory: move ioeventfd ops to MemoryListener", 2012-02-29)
>
> But they seem to be never used.  Drop them.
>
> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..c713dc5d9d 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1291,18 +1291,6 @@ void vhost_virtqueue_stop(struct vhost_dev *dev,
>                         0, virtio_queue_get_desc_size(vdev, idx));
>  }
>
> -static void vhost_eventfd_add(MemoryListener *listener,
> -                              MemoryRegionSection *section,
> -                              bool match_data, uint64_t data, EventNotif=
ier *e)
> -{
> -}
> -
> -static void vhost_eventfd_del(MemoryListener *listener,
> -                              MemoryRegionSection *section,
> -                              bool match_data, uint64_t data, EventNotif=
ier *e)
> -{
> -}
> -
>  static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
>                                                  int n, uint32_t timeout)
>  {
> @@ -1457,8 +1445,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *op=
aque,
>          .log_sync =3D vhost_log_sync,
>          .log_global_start =3D vhost_log_global_start,
>          .log_global_stop =3D vhost_log_global_stop,
> -        .eventfd_add =3D vhost_eventfd_add,
> -        .eventfd_del =3D vhost_eventfd_del,
>          .priority =3D 10
>      };
>
> --
> 2.39.1
>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B76A7B87
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 07:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXctp-0005LT-LB; Thu, 02 Mar 2023 01:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXcto-0005L8-3u
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 01:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXctm-0003lr-Hn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 01:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677740321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBL3DzVqTndO947h/1iNrKw3eoksE0x1WBkaJH9IBy0=;
 b=EfLf62LfRjJBfTlCrIs5CYKPUqzZhwrD8aP1a5ZoHjW5A7UFUlUBqNcumI41RpbMaj1du3
 xIZhYRw4sGfWXa6vPxOdlLg3xL5nHGjyTd/gM8rRADR2ngGuKir/+whWdkkH4t8MpZ+GMQ
 +Cwar7qnEeBXIAsW8I9k9kCftEIw31E=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-LqlxRcJZN0e1LuyHZm2P5w-1; Thu, 02 Mar 2023 01:58:40 -0500
X-MC-Unique: LqlxRcJZN0e1LuyHZm2P5w-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-172cecb34bdso8107373fac.22
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 22:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBL3DzVqTndO947h/1iNrKw3eoksE0x1WBkaJH9IBy0=;
 b=JZ0POLbI59tp0sHsI0uKrZvYDvoG+n+d51fopC7hs7L5N5WJ3EvZHWKta7nnJekG0D
 cIBeLiB9avAVO+UkdX3Ha4VHr6n5jX1zkgBp84mMZtCBYzeZUBlz+K7h+Bv+aNBMBl47
 KGfInjBIhtcV71TLkxPJ586GSPUYnJEd7S5GitNkMhfzNczZa/0MPFnvgYjXDBa0OZdy
 smoW2IYODltkaXilNU7wgSX2pVmdP8VXv9OXkbxX1P6dOk+wLeQP4k+gQGll4RWzkm4l
 J6w5w5Qs2zjTRuhwRjFy4LxuqkqCYgXlPxJP7mJ7ur6ciKik9WMX+Bq17KcBoTio1wEJ
 ZAag==
X-Gm-Message-State: AO0yUKX2Cr9orQhHJmY+fQVSTMnZCYX4krtNQ93hfa3ixE6rSmJWOP8w
 A3kLf2qCi7cAXRAClObNbagsh3RbcsKGcdjChFTRcT11Sbu9f7lMeDE8/k/lcO/tlyEPUSMpeZr
 JEnGHm3mW60FiiQDk1uS+LZz0bvDbDsw=
X-Received: by 2002:a9d:3ca:0:b0:68d:724c:4bd4 with SMTP id
 f68-20020a9d03ca000000b0068d724c4bd4mr3082131otf.4.1677740314910; 
 Wed, 01 Mar 2023 22:58:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8g9mZKOOJlvqei9wJhluM8XDwTbaHA5LyBLeBHC3nKjrvUYr3RNFjedgXG4FPzIAnOSuelqRRewwgQgXaRBfM=
X-Received: by 2002:a9d:3ca:0:b0:68d:724c:4bd4 with SMTP id
 f68-20020a9d03ca000000b0068d724c4bd4mr3082128otf.4.1677740314627; Wed, 01 Mar
 2023 22:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20230215221444.29845-1-clopez@suse.de>
In-Reply-To: <20230215221444.29845-1-clopez@suse.de>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Mar 2023 14:58:23 +0800
Message-ID: <CACGkMEvye8ffh3hpXynsJrJpjEmsusS3ZKCgi4TH0UXn7MG1Xw@mail.gmail.com>
Subject: Re: [PATCH] virtio: fix reachable assertion due to stale value of
 cached region size
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Feb 16, 2023 at 6:23=E2=80=AFAM Carlos L=C3=B3pez <clopez@suse.de> =
wrote:
>
> In virtqueue_{split,packed}_get_avail_bytes() descriptors are read
> in a loop via MemoryRegionCache regions and calls to
> vring_{split,packed}_desc_read() - these take a region cache and the
> index of the descriptor to be read.
>
> For direct descriptors we use a cache provided by the caller, whose
> size matches that of the virtqueue vring. We limit the number of
> descriptors we can read by the size of that vring:
>
>     max =3D vq->vring.num;
>     ...
>     MemoryRegionCache *desc_cache =3D &caches->desc;
>
> For indirect descriptors, we initialize a new cache and limit the
> number of descriptors by the size of the intermediate descriptor:
>
>     len =3D address_space_cache_init(&indirect_desc_cache,
>                                    vdev->dma_as,
>                                    desc.addr, desc.len, false);

So desc.addr and desc.len are under the control of the driver. A
malicious driver can choose to do a trick there. Should we sanitize
them here?

Thanks

>     desc_cache =3D &indirect_desc_cache;
>     ...
>     max =3D desc.len / sizeof(VRingDesc);
>
> However, the first initialization of `max` is done outside the loop
> where we process guest descriptors, while the second one is done
> inside. This means that a sequence of an indirect descriptor followed
> by a direct one will leave a stale value in `max`. If the second
> descriptor's `next` field is smaller than the stale value, but
> greater than the size of the virtqueue ring (and thus the cached
> region), a failed assertion will be triggered in
> address_space_read_cached() down the call chain.
>
> Fix this by initializing `max` inside the loop in both functions.
>
> Fixes: 9796d0ac8fb0 ("virtio: use address_space_map/unmap to access descr=
iptors")
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>
> ---
>  hw/virtio/virtio.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..db70c4976e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1071,6 +1071,7 @@ static void virtqueue_split_get_avail_bytes(VirtQue=
ue *vq,
>      VirtIODevice *vdev =3D vq->vdev;
>      unsigned int max, idx;
>      unsigned int total_bufs, in_total, out_total;
> +    MemoryRegionCache *desc_cache;
>      MemoryRegionCache indirect_desc_cache =3D MEMORY_REGION_CACHE_INVALI=
D;
>      int64_t len =3D 0;
>      int rc;
> @@ -1078,15 +1079,13 @@ static void virtqueue_split_get_avail_bytes(VirtQ=
ueue *vq,
>      idx =3D vq->last_avail_idx;
>      total_bufs =3D in_total =3D out_total =3D 0;
>
> -    max =3D vq->vring.num;
> -
>      while ((rc =3D virtqueue_num_heads(vq, idx)) > 0) {
> -        MemoryRegionCache *desc_cache =3D &caches->desc;
> -        unsigned int num_bufs;
> +        unsigned int num_bufs =3D total_bufs;
>          VRingDesc desc;
>          unsigned int i;
>
> -        num_bufs =3D total_bufs;
> +        desc_cache =3D &caches->desc;
> +        max =3D vq->vring.num;
>
>          if (!virtqueue_get_head(vq, idx++, &i)) {
>              goto err;
> @@ -1218,14 +1217,14 @@ static void virtqueue_packed_get_avail_bytes(Virt=
Queue *vq,
>      wrap_counter =3D vq->last_avail_wrap_counter;
>      total_bufs =3D in_total =3D out_total =3D 0;
>
> -    max =3D vq->vring.num;
> -
>      for (;;) {
>          unsigned int num_bufs =3D total_bufs;
>          unsigned int i =3D idx;
>          int rc;
>
>          desc_cache =3D &caches->desc;
> +        max =3D vq->vring.num;
> +
>          vring_packed_desc_read(vdev, &desc, desc_cache, idx, true);
>          if (!is_desc_avail(desc.flags, wrap_counter)) {
>              break;
> --
> 2.35.3
>
>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD58623E76
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3iJ-0008Ct-8q; Thu, 10 Nov 2022 04:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot3hu-0008AW-JT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot3hp-0001MB-87
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668071919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9PtmWacVDvNbdGp459ch/P1Oe2nNfD3EATd2WZYwb7g=;
 b=XfPgr+sr2I/BFAN6LkloEujTx9X8e2sWtNyDz1W+6go/z+kFJeUSQixwL83ngOS4pIe+ng
 cmJAoBeYc/PoaB/onz6VLWEVP++pVzlZWef+i5/uliHFiQryivs7lNErrTJ8JvyMd68afA
 xzM/ELkSvNNZoGuXsNkIy1OJ2NpM3Es=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-i8PBkA3IN0aun7vSGG-rBw-1; Thu, 10 Nov 2022 04:18:36 -0500
X-MC-Unique: i8PBkA3IN0aun7vSGG-rBw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13d553369a0so752285fac.22
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9PtmWacVDvNbdGp459ch/P1Oe2nNfD3EATd2WZYwb7g=;
 b=IalIssn6l78bTkShFd0DJVAe+SJVrrqQAqB0awLCBGzzyyHPXGl8QiQc4Qen/H6YsW
 d6Nt2KpZPlO8UEJBdc1UNmXG/N6JCTCvUTHN+MltgP9MjqPp5sF6C1CX6JKKMbSxYAIB
 PITkZnZx2EECttcXGuK0ulyao/USmAyI/dT68CQtPlTqHbORLHbN7b/zgYNgjZmjoSsS
 Wgq1NP5t4HeToqWuK3HXKVoL12rdZC7imFsjpy6T8INXQbzPSWUBWltFYSYcpEbwaJw9
 11TQlqWg5wfzF7WYSUqgeKxoWD1bqJeJvIEwfMlxFJUKwHvsX+xZNkWWVR2j5LNPgBjg
 K1Zw==
X-Gm-Message-State: ACrzQf0VhB5NdZXNNORlttmIOVwu0gjtxFE1wLTsFMrG0P5xxsyFus5F
 GGhzeeA6Atqn53HiGDTEK/+tt5PSmN3VyWYqIqSlu+5+VAXONtk9GNXZvk++4QfnmrXOuOhyPfy
 sTg0WAXiG2TvjwHmate88iDD0ZqMu0ow=
X-Received: by 2002:aca:908:0:b0:354:68aa:9c59 with SMTP id
 8-20020aca0908000000b0035468aa9c59mr1219340oij.35.1668071915354; 
 Thu, 10 Nov 2022 01:18:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Tp8lBsCX/YkLKAWg00+3DBcZbS8InVA1mCDgm3pJ7HO6AcV3G+pYtk1ajInNRDYZBqcROem+5XM0FGUMFy4w=
X-Received: by 2002:aca:908:0:b0:354:68aa:9c59 with SMTP id
 8-20020aca0908000000b0035468aa9c59mr1219337oij.35.1668071915096; Thu, 10 Nov
 2022 01:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20221110082755.12372-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20221110082755.12372-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 17:18:23 +0800
Message-ID: <CACGkMEtKg3XHj+_dBGEJ4yBM_PRMuKBizQEVXXB5qgSF==n6DQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: fix for heap-buffer-overflow
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 10, 2022 at 4:28 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> Run shell script:
>
>     cat << EOF | valgrind qemu-system-i386 -display none -machine accel=qtest, -m \
>     512M -M q35 -nodefaults -device virtio-net,netdev=net0 -netdev \
>     user,id=net0 -qtest stdio
>     outl 0xcf8 0x80000810
>     outl 0xcfc 0xc000
>     outl 0xcf8 0x80000804
>     outl 0xcfc 0x01
>     outl 0xc00d 0x0200
>     outl 0xcf8 0x80000890
>     outb 0xcfc 0x4
>     outl 0xcf8 0x80000889
>     outl 0xcfc 0x1c000000
>     outl 0xcf8 0x80000893
>     outw 0xcfc 0x100
>     EOF
>
> Got:
>     ==68666== Invalid read of size 8
>     ==68666==    at 0x688536: virtio_net_queue_enable (virtio-net.c:575)
>     ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
>     ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
>     ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
>     ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
>     ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
>     ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
>     ==68666==    by 0x6EBCD3: flatview_write_continue (physmem.c:2820)
>     ==68666==    by 0x6EBFBF: flatview_write (physmem.c:2862)
>     ==68666==    by 0x6EF5E7: address_space_write (physmem.c:2958)
>     ==68666==    by 0x6DFDEC: cpu_outw (ioport.c:70)
>     ==68666==    by 0x6F6DF0: qtest_process_command (qtest.c:480)
>     ==68666==  Address 0x29087fe8 is 24 bytes after a block of size 416 in arena "client"
>
> That is reported by Alexander Bulekov. https://gitlab.com/qemu-project/qemu/-/issues/1309
>
> Here, the queue_index is the index of the cvq, but cvq does not have the
> corresponding NetClientState,

This is not necessarily truth for some backends like vhost-vDPA.

> so overflow appears.

Note that this is guest trigger-able, so anything that is below the
VIRTIO_QUEUE_MAX but greater or equal than cvq index could hit this.

>
> I add a check here, ignore illegal queue_index and cvq queue_index.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  hw/net/virtio-net.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 975bbc22f9..88f25709d6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -549,7 +549,14 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>  static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)

If we require the VirtioDeviceClass to validate the index, let's add a
document there. Or we can let the transport to validate this.

Thanks

>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +    NetClientState *nc;
> +
> +    /* validate queue_index and skip for cvq */
> +    if (queue_index >= n->max_queue_pairs * 2) {
> +        return;
> +    }
> +
> +    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
>
>      if (!nc->peer) {
>          return;
> @@ -566,9 +573,16 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>  static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +    NetClientState *nc;
>      int r;
>
> +    /* validate queue_index and skip for cvq */
> +    if (queue_index >= n->max_queue_pairs * 2) {
> +        return;
> +    }
> +
> +    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +
>      if (!nc->peer || !vdev->vhost_started) {
>          return;
>      }
> --
> 2.32.0.3.g01195cf9f
>



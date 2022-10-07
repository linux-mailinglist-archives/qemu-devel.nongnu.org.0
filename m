Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20645F7B55
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:23:22 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogq89-0000vV-JI
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ogpVV-0006XG-3z
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ogpVK-0000yt-GA
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665157393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4l/UgN1ILVTN0rLvAO4fiPys1pRQkJ7Axn2LX26fY0=;
 b=OnRgoWaMSDumcklyuBy6+71UBiLFAcDCQwbaeoQm4Lcx+58VDz4Kw5CeTXol61l4qDxglu
 ODWCBcoizb6rv615b8D3/bF6wGEYkVafcyoecDH9+tS1ZgLvROC86PAxF631J0xX0g+S5J
 lrpcTaL8L5hBxaxujc7VkOgRCJkndQE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-k717h5utP-KvYms5NqMJEw-1; Fri, 07 Oct 2022 11:43:12 -0400
X-MC-Unique: k717h5utP-KvYms5NqMJEw-1
Received: by mail-pg1-f200.google.com with SMTP id
 g66-20020a636b45000000b0043a256d3639so3086870pgc.12
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4l/UgN1ILVTN0rLvAO4fiPys1pRQkJ7Axn2LX26fY0=;
 b=Wl9mfwZmmnegmJa6hcWt57QHO+4/M8/sHolpw8GibXKlqMLk365Z89V8Pc+zQIO8MT
 cGRPoVE7jbhh4UDi0DmZDRba0XXvG8Tyo2LWLi78oJIjGYlGxdr19lUTW9jwxgaWbuOX
 y2K4kvGyAo7Ow/GQaK3Xux928hv4Ej/bFyjxQST7gpseBTZRf/bOgNX8q5caZYLEdbp3
 /0c/7/ZA+VL0eKUSrKSAvPVlkTh8kqG7yt17wz6jGmFmqXW0PQsowfdIUZSwCvisqVth
 WZUj+xtHEw4UNdKujP0+LFSZ239BJhLw0p/idAWw+BCwsAWOPSwBa8lefP0a7tW2cy6b
 lyFQ==
X-Gm-Message-State: ACrzQf17r/1IS+oYagK66xaJWrzXAtFAdRBxqwf3SUhwaQhUwNcOwJdp
 j/hGJQW2su/TIcKOfm4mLwJa3taPENIU0gsxlncuDzpJTEtoipEZt1CeZSZ2wa5QFsRmCPKfsZj
 oFBrc1Nk4wQRLWAE1vHyEGmXqxVnBNdw=
X-Received: by 2002:a17:902:ce8f:b0:176:e0b3:cf14 with SMTP id
 f15-20020a170902ce8f00b00176e0b3cf14mr5624791plg.153.1665157391378; 
 Fri, 07 Oct 2022 08:43:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WYmnjzmCQUyCpfs3AJVSSY8yWaa7pQqr/7TjBpXwOfTHofPHE/5csjTBiwfFZafUZSKO2/U9deWZGwHa/XKw=
X-Received: by 2002:a17:902:ce8f:b0:176:e0b3:cf14 with SMTP id
 f15-20020a170902ce8f00b00176e0b3cf14mr5624770plg.153.1665157391112; Fri, 07
 Oct 2022 08:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 7 Oct 2022 17:42:34 +0200
Message-ID: <CAJaqyWdtDH8FYzvPLqW8PHmwtUP-puHH=n7EB7xgHsy_uur4Dw@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 4, 2022 at 11:05 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> The citing commit has incorrect code in vhost_vdpa_receive() that returns
> zero instead of full packet size to the caller. This renders pending pack=
ets
> unable to be freed so then get clogged in the tx queue forever. When devi=
ce
> is being reset later on, below assertion failure ensues:
>
> 0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
> 1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
> 2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
> 3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
> 4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=3D<optimized out>) at /us=
r/src/debug/qemu/hw/net/virtio-net.c:563
> 5  0x000055b8f7012fcf in virtio_reset (opaque=3D0x55b8faf881f0) at /usr/s=
rc/debug/qemu/hw/virtio/virtio.c:1993
> 6  0x000055b8f71f0086 in virtio_bus_reset (bus=3Dbus@entry=3D0x55b8faf881=
78) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
> 7  0x000055b8f71f1620 in virtio_pci_reset (qdev=3D<optimized out>) at /us=
r/src/debug/qemu/hw/virtio/virtio-pci.c:1845
> 8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=3D<optimized ou=
t>, addr=3D<optimized out>, value=3D<optimized out>,
>    size=3D<optimized out>, shift=3D<optimized out>, mask=3D<optimized out=
>, attrs=3D...) at /usr/src/debug/qemu/memory.c:483
> 9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=3Daddr@entry=3D2=
0, value=3Dvalue@entry=3D0x7f867e7fb7e8, size=3Dsize@entry=3D1,
>    access_size_min=3D<optimized out>, access_size_max=3D<optimized out>, =
access_fn=3D0x55b8f6fafc20 <memory_region_write_accessor>,
>    mr=3D0x55b8faf80a50, attrs=3D...) at /usr/src/debug/qemu/memory.c:544
> 10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=3Dmr@entry=3D0x=
55b8faf80a50, addr=3Daddr@entry=3D20, data=3D0, op=3D<optimized out>,
>    attrs=3Dattrs@entry=3D...) at /usr/src/debug/qemu/memory.c:1470
> 11 0x000055b8f6f62ada in flatview_write_continue (fv=3Dfv@entry=3D0x7f86a=
c04cd20, addr=3Daddr@entry=3D549755813908, attrs=3D...,
>    attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f86d0223028 <Address 0x7f86d02=
23028 out of bounds>, len=3Dlen@entry=3D1, addr1=3D20, l=3D1,
>    mr=3D0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
> 12 0x000055b8f6f62c8f in flatview_write (fv=3D0x7f86ac04cd20, addr=3D5497=
55813908, attrs=3D...,
>    buf=3D0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=3D1) =
at /usr/src/debug/qemu/exec.c:3306
> 13 0x000055b8f6f674cb in address_space_write (as=3D<optimized out>, addr=
=3D<optimized out>, attrs=3D..., buf=3D<optimized out>,
>    len=3D<optimized out>) at /usr/src/debug/qemu/exec.c:3396
> 14 0x000055b8f6f67575 in address_space_rw (as=3D<optimized out>, addr=3D<=
optimized out>, attrs=3D..., attrs@entry=3D...,
>    buf=3Dbuf@entry=3D0x7f86d0223028 <Address 0x7f86d0223028 out of bounds=
>, len=3D<optimized out>, is_write=3D<optimized out>)
>    at /usr/src/debug/qemu/exec.c:3406
> 15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x55b8f9aa0e10) =
at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
> 16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=3D0x55b8f9aa0e10) at=
 /usr/src/debug/qemu/cpus.c:1318
> 17 0x000055b8f7336e16 in qemu_thread_start (args=3D0x55b8f9ac8480) at /us=
r/src/debug/qemu/util/qemu-thread-posix.c:519
> 18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
> 19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6
>
> Make vhost_vdpa_receive() return the size passed in as is, so that the
> caller qemu_deliver_packet_iov() would eventually propagate it back to
> virtio_net_flush_tx() to release pending packets from the async_tx queue.
> Which corresponds to the drop path where qemu_sendv_packet_async() return=
s
> non-zero in virtio_net_flush_tx().
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>


> Fixes: 846a1e85da64 ("vdpa: Add dummy receive callback")
> Cc: Eugenio Perez Martin <eperezma@redhat.com>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd0..182b3a1 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState=
 *nc, ObjectClass *oc,
>  static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf=
,
>                                    size_t size)
>  {
> -    return 0;
> +    return size;
>  }
>
>  static NetClientInfo net_vhost_vdpa_info =3D {
> --
> 1.8.3.1
>



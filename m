Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F72CB64F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:08:14 +0100 (CET)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNBN-0001tU-F5
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kkNAB-0001Rl-Im
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kkNA7-0002vz-2p
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvyJja9ZOoAMogK3AMLw3FZhPY6bQSiosV2E0ks05sE=;
 b=LTxoGm9GPLK3v+QSuT+ZScdAIY98PzIEJROXm2DpcFRcpHvRKdfpLreuAXJowQpAF6BAh6
 Qv4MuowJldvaX+UEpfJqdbckLMwWPGn2Lt+Jm7jiDsAHwSz3DrM7HxgS1Es3t3cN7NCUF6
 +MBrviukVYv9B+nezdgo3Z0+u8xEleU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-ddKwJx66PE-B_JZBR7WHiQ-1; Wed, 02 Dec 2020 03:06:51 -0500
X-MC-Unique: ddKwJx66PE-B_JZBR7WHiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45D81F1BB;
 Wed,  2 Dec 2020 08:06:49 +0000 (UTC)
Received: from [10.72.13.145] (ovpn-13-145.pek2.redhat.com [10.72.13.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 505F45D705;
 Wed,  2 Dec 2020 08:06:43 +0000 (UTC)
Subject: Re: [RFC PATCH v2 4/5] virtio-net: Added eBPF RSS to virtio-net.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-5-andrew@daynix.com>
 <e3c4d907-1901-52ae-5dde-0aea4780cb35@redhat.com>
 <CAOEp5OfmRUpKZ-MNDWP=-TxKkWoAPS=n3eKV989fFiiAsRaZ4w@mail.gmail.com>
 <9b400fa7-a597-ba44-b661-802d8b2d105c@redhat.com>
 <CAOEp5OdYtkasECGopea6byYyWbyaXMcEoWAVaB5sz_z2=zqQow@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8f78b964-5a36-b213-dc30-d324657574b3@redhat.com>
Date: Wed, 2 Dec 2020 16:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5OdYtkasECGopea6byYyWbyaXMcEoWAVaB5sz_z2=zqQow@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/2 下午3:16, Yuri Benditovich wrote:
>
>
> On Wed, Dec 2, 2020 at 6:06 AM Jason Wang <jasowang@redhat.com 
> <mailto:jasowang@redhat.com>> wrote:
>
>
>     On 2020/12/1 下午3:40, Yuri Benditovich wrote:
>     >
>     >
>     > On Tue, Nov 24, 2020 at 10:49 AM Jason Wang <jasowang@redhat.com
>     <mailto:jasowang@redhat.com>
>     > <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>> wrote:
>     >
>     >
>     >     On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
>     >     > From: Andrew <andrew@daynix.com <mailto:andrew@daynix.com>
>     <mailto:andrew@daynix.com <mailto:andrew@daynix.com>>>
>     >     >
>     >     > When RSS is enabled the device tries to load the eBPF program
>     >     > to select RX virtqueue in the TUN. If eBPF can be loaded
>     >     > the RSS will function also with vhost (works with kernel
>     5.8 and
>     >     later).
>     >     > Software RSS is used as a fallback with vhost=off when eBPF
>     >     can't be loaded
>     >     > or when hash population requested by the guest.
>     >     >
>     >     > Signed-off-by: Yuri Benditovich
>     <yuri.benditovich@daynix.com <mailto:yuri.benditovich@daynix.com>
>     >     <mailto:yuri.benditovich@daynix.com
>     <mailto:yuri.benditovich@daynix.com>>>
>     >     > Signed-off-by: Andrew Melnychenko <andrew@daynix.com
>     <mailto:andrew@daynix.com>
>     >     <mailto:andrew@daynix.com <mailto:andrew@daynix.com>>>
>     >     > ---
>     >     >   hw/net/vhost_net.c             |   2 +
>     >     >   hw/net/virtio-net.c            | 120
>     >     +++++++++++++++++++++++++++++++--
>     >     >   include/hw/virtio/virtio-net.h |   4 ++
>     >     >   net/vhost-vdpa.c               |   2 +
>     >     >   4 files changed, 124 insertions(+), 4 deletions(-)
>     >     >
>     >     > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>     >     > index 24d555e764..16124f99c3 100644
>     >     > --- a/hw/net/vhost_net.c
>     >     > +++ b/hw/net/vhost_net.c
>     >     > @@ -71,6 +71,8 @@ static const int user_feature_bits[] = {
>     >     >       VIRTIO_NET_F_MTU,
>     >     >       VIRTIO_F_IOMMU_PLATFORM,
>     >     >       VIRTIO_F_RING_PACKED,
>     >     > +    VIRTIO_NET_F_RSS,
>     >     > +    VIRTIO_NET_F_HASH_REPORT,
>     >     >
>     >     >       /* This bit implies RARP isn't sent by QEMU out of
>     band */
>     >     >       VIRTIO_NET_F_GUEST_ANNOUNCE,
>     >     > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>     >     > index 277289d56e..afcc3032ec 100644
>     >     > --- a/hw/net/virtio-net.c
>     >     > +++ b/hw/net/virtio-net.c
>     >     > @@ -698,6 +698,19 @@ static void
>     virtio_net_set_queues(VirtIONet *n)
>     >     >
>     >     >   static void virtio_net_set_multiqueue(VirtIONet *n, int
>     >     multiqueue);
>     >     >
>     >     > +static uint64_t fix_ebpf_vhost_features(uint64_t features)
>     >     > +{
>     >     > +    /* If vhost=on & CONFIG_EBPF doesn't set - disable RSS
>     >     feature */
>     >     > +    uint64_t ret = features;
>     >     > +#ifndef CONFIG_EBPF
>     >     > +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
>     >     > +#endif
>     >     > +    /* for now, there is no solution for populating the hash
>     >     from eBPF */
>     >     > +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);
>     >
>     >
>     >     I think there's still some misunderstanding here.
>     >
>     >     When "rss" is enabled via command line, qemu can't not turn
>     it off
>     >     silently, otherwise it may break migration. Instead, qemu should
>     >     disable
>     >     vhost-net if eBPF can't be loaded.
>     >
>     >     When "hash_report" is enabled via command line, qemu should
>     disable
>     >     vhost-net unconditionally.
>     >
>     >
>     > I agree in general with this requirement and I'm preparing an
>     > implementation of such fallback.
>     >
>     > The problem is that qemu already uses the mechanism of turning off
>     > host features
>     > silently if they are not supported by the current vhost in kernel:
>     >
>     https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/hw/virtio/vhost.c#L1526
>     >
>     > Can you please comment on it and let me know how it should be
>     modified
>     > in future?
>     > I've planned to use it in next work (implementing hash report in
>     kernel)
>
>
>     This looks like a bug that needs to be solved. Otherwise we break
>     migration from rss=on, vhost=off to rss=on,vhost=on.
>
> I think I need to fill the gap in my understanding of migration's 
> prerequisites.
> According to 
> https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/docs/devel/migration.rst
> "... QEMU has to be launched with the same arguments the two times 
> ..." and we test the migration during development
> according to this statement.


Yes, that's the overall requirement. And it shows the issue of disabling 
feature silently. If we had src whose vhost support feature A and dst 
vhost doesn't support. Even if we launch the QEMU with the same 
arguments, it can still fail.

So actually two issues:

1) whether or not to disable features silently

2) whether or not to support migration between vhost=on to vhost=off

For 1), I think we'd better don't do that, and if we can do 1), it would 
be possible to achieve 2).


> What are the real requirements and prerequisites of the migration?


For virtio, I think we allow some kind of extra flexibility. We try to 
make migration work between vhost=off and vhost=on. What we need is just 
to keep everything that visible to guest after migration the same as 
before migration.  Obviously, device features is one of the thing.

Thanks



>
>     I think you can keep the current code as is and I will try to seek
>     a way
>     to solve the issue.
>
>     Thanks
>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E744918BF1B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 19:10:38 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEzcr-00006T-WD
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 14:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jEzbh-00083i-1t
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 14:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jEzbf-0002Jd-8L
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 14:09:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:23605)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jEzbf-0002J9-3X
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 14:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584641362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFNQ2NVwhGuWzlq2AWsUHYXLPN1sx4Q5Z9JKHDxmVXo=;
 b=Y4PM1FrLLqr652lXxzh3ugrjhNqQ9xmFVQKeX9g7ZeKCpf9Cb/t42rOa00RuAB5RDBajOh
 L9tt5Uhe818djhDXBb3nWlMFCSU4iUZQ3FUyB+HWBxiP9ymtF+DutxBFc2YfXn4qKuo8A2
 sN/NpeKgtNPKcykhjyeu05/8GsXBHTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130--njwQhrNPlGr8o0gyE1L3w-1; Thu, 19 Mar 2020 14:09:20 -0400
X-MC-Unique: -njwQhrNPlGr8o0gyE1L3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3D2801A29;
 Thu, 19 Mar 2020 18:09:19 +0000 (UTC)
Received: from work-vm (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63ED419C58;
 Thu, 19 Mar 2020 18:09:13 +0000 (UTC)
Date: Thu, 19 Mar 2020 18:09:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v5 7/7] virtio-net: add migration support for RSS and
 hash report
Message-ID: <20200319180910.GD2833@work-vm>
References: <20200318091525.27044-1-yuri.benditovich@daynix.com>
 <20200318091525.27044-8-yuri.benditovich@daynix.com>
 <20200318104826.GF2850@work-vm>
 <CAOEp5Odhjr6h7erYz_VchjRF98-SNt27RW_T_ao7P0nwc-0ebg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Odhjr6h7erYz_VchjRF98-SNt27RW_T_ao7P0nwc-0ebg@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Yan Vugenfirer <yan@daynix.com>, Jason Wang <jasowang@redhat.com>,
 quintela@redhat.com, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yuri Benditovich (yuri.benditovich@daynix.com) wrote:
> On Wed, Mar 18, 2020 at 12:48 PM Dr. David Alan Gilbert <dgilbert@redhat.=
com>
> wrote:
>=20
> > * Yuri Benditovich (yuri.benditovich@daynix.com) wrote:
> > > Save and restore RSS/hash report configuration.
> > >
> > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > ---
> > >  hw/net/virtio-net.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index a0614ad4e6..0b058aae9f 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -2842,6 +2842,13 @@ static int virtio_net_post_load_device(void
> > *opaque, int version_id)
> > >          }
> > >      }
> > >
> > > +    if (n->rss_data.enabled) {
> > > +        trace_virtio_net_rss_enable(n->rss_data.hash_types,
> > > +                                    n->rss_data.indirections_len,
> > > +                                    sizeof(n->rss_data.key));
> > > +    } else {
> > > +        trace_virtio_net_rss_disable();
> > > +    }
> > >      return 0;
> > >  }
> > >
> > > @@ -3019,6 +3026,24 @@ static const VMStateDescription
> > vmstate_virtio_net_has_vnet =3D {
> > >      },
> > >  };
> > >
> > > +static const VMStateDescription vmstate_rss =3D {
> > > +    .name      =3D "vmstate_rss",
> >
> > You need to do something to avoid breaking migration compatibility
> > from/to old QEMU's and from/to QEMU's on hosts without the new virtio
> > features.
> > Probably adding a .needed =3D   here pointing to a function that
> > checks 'enabled' might do it.
> >
> > Does VMSTATE_STRUCT_TEST(..,..,checker_procedure,...) result the same
> thing?
>=20
> Another question about migration support:
> What is expected/required behavior?
> Possible cases:
> old qemu -> new qemu
> new qemu (new feature off) -> old qemu

Just works.

Also be careful about the definition of 'new feature off'; normally we
tie these things to machine types, so that with the old machine type the
guest doesn't even see the feature; it can't turn it on.

> new qemu (new feature on) -> old qemu

Fails; hopefully nicely.

Dave

>=20
>=20
> > Dave
> >
> >
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_BOOL(enabled, VirtioNetRssData),
> > > +        VMSTATE_BOOL(redirect, VirtioNetRssData),
> > > +        VMSTATE_BOOL(populate_hash, VirtioNetRssData),
> > > +        VMSTATE_UINT32(hash_types, VirtioNetRssData),
> > > +        VMSTATE_UINT16(indirections_len, VirtioNetRssData),
> > > +        VMSTATE_UINT16(default_queue, VirtioNetRssData),
> > > +        VMSTATE_UINT8_ARRAY(key, VirtioNetRssData,
> > > +                            VIRTIO_NET_RSS_MAX_KEY_SIZE),
> > > +        VMSTATE_VARRAY_UINT16_ALLOC(indirections_table,
> > VirtioNetRssData,
> > > +                                    indirections_len, 0,
> > > +                                    vmstate_info_uint16, uint16_t),
> > > +        VMSTATE_END_OF_LIST()
> > > +    },
> > > +};
> > > +
> > >  static const VMStateDescription vmstate_virtio_net_device =3D {
> > >      .name =3D "virtio-net-device",
> > >      .version_id =3D VIRTIO_NET_VM_VERSION,
> > > @@ -3067,6 +3092,7 @@ static const VMStateDescription
> > vmstate_virtio_net_device =3D {
> > >                           vmstate_virtio_net_tx_waiting),
> > >          VMSTATE_UINT64_TEST(curr_guest_offloads, VirtIONet,
> > >                              has_ctrl_guest_offloads),
> > > +        VMSTATE_STRUCT(rss_data, VirtIONet, 1, vmstate_rss,
> > VirtioNetRssData),
> > >          VMSTATE_END_OF_LIST()
> > >     },
> > >  };
> > > --
> > > 2.17.1
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



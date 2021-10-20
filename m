Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159A4343CF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:22:30 +0200 (CEST)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2BR-00059c-8D
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md22p-0001lq-Sv
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1md22k-0005gX-Qe
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634699608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdMKVadj337pcMo1WqS3psVhvUbHS6kwRpEaZZAuzsY=;
 b=dP3XG5UDtBkPszuGtjnmgkO9o4Xquq6XCmSH50V+xQQ+6oclMYADXFg4cq5nOENB4p/3Ew
 F2lc7u24FXyINgntOQR0wsJaaPPa1DapOeyukjuTEdecF+Twc4LxBjE/lyQHWOT7V1UrTe
 qVfvjI3+3LTyr+wAuT3ZjlT1tFlRwJA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-cMvfliXTPdyOuw-iDamSJg-1; Tue, 19 Oct 2021 23:13:27 -0400
X-MC-Unique: cMvfliXTPdyOuw-iDamSJg-1
Received: by mail-lj1-f200.google.com with SMTP id
 132-20020a2e058a000000b00210aeaca823so1351960ljf.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sdMKVadj337pcMo1WqS3psVhvUbHS6kwRpEaZZAuzsY=;
 b=lvkp+5iKMopCit+1SUokTJ8mmc6FzXRmBe/7TOSUoFIlRDBm2lRHKUyTappQTr1p/T
 DSeWGuPCVGTah3gVQfWndhbOzOpDhAznmQ+sIUtv95FwqibZWZD5vyqvM6ejYwDnYMFh
 4Kd0/yKBfH3kQ/5WZY6h5UaEdSFC/kI/G7oioa+6SOO+vDNMKt9Gp+i1WhkLRC7q3ep7
 QCoHjqJZ6Lv3pMurOGr/DMqEoQgzsB4Fl8yyVBBX7mUzMAqPfPad86wn7Pmi4hqR1SYA
 2o9p+zvWKxZ/PQr7FBJQJGfW+BZzLsGTZQ3u7LJwYNjhzAXRkoQwyY5wsEPtyye8Jd78
 VWpw==
X-Gm-Message-State: AOAM530npQTw1GK5/MOYNBnvZCo2KdX2THi3S1ZPNtbJVbUgoO9gM8to
 eh81JbLTW6D23sfhYLehIdxnQDtfSbtMEj65m3M7mJvIUbBr/ZpuHm+ENDZWnId4+jBpvwu5j2b
 C4S4GSmVjh0Q7rpMsSHrcdNx+ByU8ac8=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr9489796lfv.629.1634699605536; 
 Tue, 19 Oct 2021 20:13:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcl7zn9wBZT5RzyS7yjyluo3BQOmFmxMwRG8jl/nKughhDRKyyl000O8JKrKq4yDSIKtblW0smhBaNkOPPZeE=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr9489773lfv.629.1634699605288; 
 Tue, 19 Oct 2021 20:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210918020437.1822937-1-chen.zhang@intel.com>
 <3f1ead6c-4429-3edc-75cd-d48ecac317fc@redhat.com>
 <MWHPR11MB00316C47878D3EEA430424419BBE9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00316C47878D3EEA430424419BBE9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Oct 2021 11:13:14 +0800
Message-ID: <CACGkMEspzhjzeS-wzRy5t17pdXE4=zhXbuoPmNedis2BisVF8Q@mail.gmail.com>
Subject: Re: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: Lukas Straub <lukasstraub2@web.de>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 10:53 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 19, 2021 3:39 PM
> > To: Zhang, Chen <chen.zhang@intel.com>; Eric Blake <eblake@redhat.com>;
> > Markus Armbruster <armbru@redhat.com>
> > Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> > <lizhijian@cn.fujitsu.com>; Lukas Straub <lukasstraub2@web.de>; Tao Xu
> > <tao3.xu@intel.com>
> > Subject: Re: [PATCH V3] net/colo: check vnet_hdr_support flag when usin=
g
> > virtio-net
> >
> >
> > =E5=9C=A8 2021/9/18 =E4=B8=8A=E5=8D=8810:04, Zhang Chen =E5=86=99=E9=81=
=93:
> > > When COLO use only one vnet_hdr_support parameter between COLO
> > network
> > > filter(filter-mirror, filter-redirector or filter-rewriter and
> > > colo-compare, packet will not be parsed correctly. Acquire network
> > > driver related to COLO, if it is nirtio-net,
> >
> >
> > Typo.
>
> Oh~ will fix in next version.
>
> >
> >
> > >   check vnet_hdr_support flag of COLO network filter and colo-compare=
.
> > >
> > > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >
> > > Changelog:
> > > v3:
> > >      Fix some typos.
> > >      Rebased for Qemu 6.2.
> > >
> > > v2:
> > >      Detect virtio-net driver and apply vnet_hdr_support
> > >      automatically. (Jason)
> > > ---
> > >   net/colo-compare.c    | 57
> > +++++++++++++++++++++++++++++++++++++++++++
> > >   net/colo.c            | 20 +++++++++++++++
> > >   net/colo.h            |  4 +++
> > >   net/filter-mirror.c   | 21 ++++++++++++++++
> > >   net/filter-rewriter.c | 10 ++++++++
> > >   qapi/qom.json         |  6 +++++
> > >   qemu-options.hx       |  6 +++--
> > >   7 files changed, 122 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > > b100e7b51f..870bd05a41 100644
> > > --- a/net/colo-compare.c
> > > +++ b/net/colo-compare.c
> > > @@ -110,6 +110,7 @@ struct CompareState {
> > >       char *sec_indev;
> > >       char *outdev;
> > >       char *notify_dev;
> > > +    char *netdev;
> > >       CharBackend chr_pri_in;
> > >       CharBackend chr_sec_in;
> > >       CharBackend chr_out;
> > > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> > >       return COMPARE_READ_LEN_MAX;
> > >   }
> > >
> > > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > > +Error **errp) {
> > > +    const char *colo_obj_type, *netdev_from_filter;
> > > +    char **netdev =3D (char **)opaque;
> > > +
> > > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > > +
> > > +    if (colo_obj_type &&
> > > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > > +        if (*netdev =3D=3D NULL) {
> > > +            *netdev =3D g_strdup(netdev_from_filter);
> > > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > > +            warn_report("%s is using a different netdev from other C=
OLO "
> > > +                        "component", colo_obj_type);
> > > +        }
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > >   /*
> > >    * Called from the main thread on the primary for packets
> > >    * arriving over the socket from the primary.
> > > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
> > >       s->vnet_hdr =3D value;
> > >   }
> > >
> > > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > +
> > > +    return g_strdup(s->netdev);
> > > +}
> > > +
> > > +static void compare_set_netdev(Object *obj, const char *value, Error
> > > +**errp) {
> > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > +
> > > +    g_free(s->netdev);
> > > +    s->netdev =3D g_strdup(value);
> > > +}
> > > +
> > >   static char *compare_get_notify_dev(Object *obj, Error **errp)
> > >   {
> > >       CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> > >           max_queue_size =3D MAX_QUEUE_SIZE;
> > >       }
> > >
> > > +    if (!s->netdev) {
> > > +        /* Set default netdev as the first colo netfilter found */
> > > +        qemu_opts_foreach(qemu_find_opts("object"),
> > > +                          colo_set_default_netdev, &s->netdev, NULL)=
;
> > > +    }
> > > +
> > >       if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> > >           !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> > >           return;
> > > @@ -1289,6 +1333,16 @@ static void
> > colo_compare_complete(UserCreatable *uc, Error **errp)
> > >           return;
> > >       }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, s->netdev, NULL)) {
> > > +        /*
> > > +         * colo compare needs 'vnet_hdr_support' when it works on vi=
rtio-net,
> > > +         * add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >       net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet=
_hdr);
> > >       net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > > s->vnet_hdr);
> > >
> > > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> > >       s->vnet_hdr =3D false;
> > >       object_property_add_bool(obj, "vnet_hdr_support",
> > compare_get_vnet_hdr,
> > >                                compare_set_vnet_hdr);
> > > +    /* colo compare can't varify that netdev is correct */
> > > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > > +                            compare_set_netdev);
> > >   }
> > >
> > >   void colo_compare_cleanup(void)
> > > diff --git a/net/colo.c b/net/colo.c
> > > index 3a3e6e89a0..4a03780f45 100644
> > > --- a/net/colo.c
> > > +++ b/net/colo.c
> > > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > > *connection_track_table,
> > >
> > >       return conn ? true : false;
> > >   }
> > > +
> > > +/* check the network driver related to COLO, return 1 if it is
> > > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > > +Error **errp) {
> > > +    const char *driver_type, *netdev_from_driver;
> > > +    char *netdev_from_filter =3D (char *)opaque;
> > > +
> > > +    driver_type =3D qemu_opt_get(opts, "driver");
> > > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > > +
> > > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) =
{
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > > +        return 1;
> > > +    }
> > > +    return 0;
> > > +}
> > > diff --git a/net/colo.h b/net/colo.h
> > > index d91cd245c4..d401fc76b6 100644
> > > --- a/net/colo.h
> > > +++ b/net/colo.h
> > > @@ -18,6 +18,9 @@
> > >   #include "qemu/jhash.h"
> > >   #include "qemu/timer.h"
> > >   #include "net/eth.h"
> > > +#include "qemu/option.h"
> > > +#include "qemu/option_int.h"
> > > +#include "qemu/config-file.h"
> > >
> > >   #define HASHTABLE_MAX_SIZE 16384
> > >
> > > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, in=
t
> > vnet_hdr_len);
> > >   Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
> > >   void packet_destroy(void *opaque, void *user_data);
> > >   void packet_destroy_partial(void *opaque, void *user_data);
> > > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
> > >
> > >   #endif /* NET_COLO_H */
> > > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > > f20240cc9f..69ca9c9839 100644
> > > --- a/net/filter-mirror.c
> > > +++ b/net/filter-mirror.c
> > > @@ -12,6 +12,7 @@
> > >   #include "qemu/osdep.h"
> > >   #include "net/filter.h"
> > >   #include "net/net.h"
> > > +#include "net/colo.h"
> > >   #include "qapi/error.h"
> > >   #include "qom/object.h"
> > >   #include "qemu/main-loop.h"
> > > @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *=
nf,
> > Error **errp)
> > >           return;
> > >       }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter mirror needs 'vnet_hdr_support' when colo filter m=
odules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >       qemu_chr_fe_init(&s->chr_out, chr, errp);
> > >   }
> > >
> > > @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterSta=
te
> > *nf, Error **errp)
> > >           }
> > >       }
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter redirector needs 'vnet_hdr_support' when colo filt=
er modules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >       net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr)=
;
> > >
> > >       if (s->indev) {
> > > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > > cb3a96cde1..637ef4ce71 100644
> > > --- a/net/filter-rewriter.c
> > > +++ b/net/filter-rewriter.c
> > > @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState *=
nf,
> > Error **errp)
> > >   {
> > >       RewriterState *s =3D FILTER_REWRITER(nf);
> > >
> > > +    if (!s->vnet_hdr &&
> > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > +                          vnet_driver_check, nf->netdev_id, NULL)) {
> > > +        /*
> > > +         * filter rewriter needs 'vnet_hdr_support' when colo filter=
 modules
> > > +         * work on virtio-net, add 'vnet_hdr_support' automatically
> > > +         */
> > > +        s->vnet_hdr =3D true;
> > > +    }
> > > +
> > >       s->connection_track_table =3D
> > g_hash_table_new_full(connection_key_hash,
> > >                                                         connection_ke=
y_equal,
> > >                                                         g_free, diff
> > > --git a/qapi/qom.json b/qapi/qom.json index a25616bc7a..5760107160
> > > 100644
> > > --- a/qapi/qom.json
> > > +++ b/qapi/qom.json
> > > @@ -241,6 +241,11 @@
> > >   # @notify_dev: name of the character device backend to be used to
> > communicate
> > >   #              with the remote colo-frame (only for Xen COLO)
> > >   #
> > > +# @netdev: id of the network device backend to colo-compare. Althoug=
h
> > > +#          colo-compare doesn't depend on network device directly, t=
his
> > > +#          parameter helps colo-compare know what network driver it =
is
> > > +#          working on.(since 6.2)
> >
> >
> > This looks kind of not elegant. We don't want to couple COLO with netde=
v.
> >
> > I wonder if we can do this without adding netdev.
>
> Yes, current COLO is not bind to netdev, but here we want to auto fix con=
figuration issue.

If my memory is correct, the current design allows an external
comparing module to work.

> To avoid wrong setting other non-colo related existing filter,  COLO need=
 know the colo-effect netdev to setup.
> And this parameter is optional, this patch will setup default colo-effect=
 netdev in colo_set_default_netdev().
> Or any good idea?

How about

1) adding a handshake in the protocol before receiving packets
or
2) add a header to the payload to show if it contains a vnet header
or
3) go back to let mgmt set vnet_hdr=3Don/off (looks like the first
proposal but it avoids the coupling).

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> >
> > > +#
> > >   # @compare_timeout: the maximum time to hold a packet from
> > @primary_in for
> > >   #                   comparison with an incoming packet on @secondar=
y_in in
> > >   #                   milliseconds (default: 3000)
> > > @@ -264,6 +269,7 @@
> > >               'outdev': 'str',
> > >               'iothread': 'str',
> > >               '*notify_dev': 'str',
> > > +            '*netdev': 'str',
> > >               '*compare_timeout': 'uint64',
> > >               '*expired_scan_cycle': 'uint32',
> > >               '*max_queue_size': 'uint32', diff --git
> > > a/qemu-options.hx b/qemu-options.hx index 8f603cc7e6..250937fbbf
> > > 100644
> > > --- a/qemu-options.hx
> > > +++ b/qemu-options.hx
> > > @@ -4964,12 +4964,14 @@ SRST
> > >           stored. The file format is libpcap, so it can be analyzed w=
ith
> > >           tools such as tcpdump or Wireshark.
> > >
> > > -    ``-object colo-
> > compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=
=3Dchard
> > evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeou=
t=3D@
> > var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]`=
`
> > > +    ``-object
> > > + colo-
> > compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][=
,notify
> > > +
> > _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}]=
[,
> > m
> > > + ax_queue_size=3D@var{size}]``
> > >           Colo-compare gets packet from primary\_in chardevid and
> > >           secondary\_in, then compare whether the payload of primary =
packet
> > >           and secondary packet are the same. If same, it will output
> > >           primary packet to out\_dev, else it will notify COLO-framew=
ork to do
> > > -        checkpoint and send primary packet to out\_dev. In order to
> > > +        checkpoint and send primary packet to out\_dev. Although col=
o-
> > compare
> > > +        does not depend on network device directly, netdevid helps
> > > +        colo-compare know what network driver it is working on. In
> > > + order to
> > >           improve efficiency, we need to put the task of comparison i=
n
> > >           another iothread. If it has the vnet\_hdr\_support flag,
> > >           colo compare will send/recv packet with vnet\_hdr\_len.
>



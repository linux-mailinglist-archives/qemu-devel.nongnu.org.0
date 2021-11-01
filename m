Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17004441279
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 04:48:03 +0100 (CET)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhOIj-0008T0-Ox
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 23:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhOH8-0007lI-99
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 23:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhOH5-0002uP-DK
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 23:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635738377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evYzcyjk3seqPK2YKuLI0HaIAFIsPnoDBP3F8Cy9/Y0=;
 b=F4sqR+p/DwpzvW/5b5NHRHN3pdY3x2bm96O2nydtpPhfuC9KMsHjSj3wzDjzGdouu2Qcls
 8on7OmZDXFSR/1AywAf5UIROSuA3e37Dc41rU578A9MTE+wXfBT41MwEcvWQeaGZf5jHq2
 X4CJRfCyqis5naPubi7CV9ps5xNLwvs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-2JbsW8lROLaNnVMnZDlHEg-1; Sun, 31 Oct 2021 23:46:16 -0400
X-MC-Unique: 2JbsW8lROLaNnVMnZDlHEg-1
Received: by mail-lj1-f200.google.com with SMTP id
 m11-20020a2e97cb000000b00212f89f3888so1922112ljj.21
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 20:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evYzcyjk3seqPK2YKuLI0HaIAFIsPnoDBP3F8Cy9/Y0=;
 b=5EaVSQmONTE9aXzCN/F0o1f6vy1MW2+YH6AY3eZy3+q3zx2RF5Mzx46ULJ2PcWwxqm
 z7oiEAFEcTTC3K/l14GLxr6rMqzcYnJBj/+8gqdww6XpryTLiEwC2HSH5F10p1rvTTe+
 9SlTbxLViU6Sno0WJ1SfSYlrinD8qaJNmxaBVuu/cPSKH+ecR4n1G4b9buRE6JJuy1M+
 XkYaH7g9WtJ8NZP/DOSSpywifcG0dgIRS3ZLpwy35pQY6dAJDR5vEJp6DxWeJy9ZYQg5
 XjBlSjYRhcps7TBKWrR+ugECfnNmXZJsekta1LuQZQpIcb/zV36AnDtijMBXstutXvYY
 n3vg==
X-Gm-Message-State: AOAM531Ht2g/C9xLGm+KyOtu5t7/z3G5bJhIUpJdl/ynwoK1R8n9qRc8
 UdWVw4zbwvGe2mppW8M2OVBp+dOYyScR4MAHY5NWrIGlu9YtXzK/6pqMc4F7Ql+93Hg7U4EsTl3
 vVL7XaW+sGFmQu8JU7y49wdivUADTXlM=
X-Received: by 2002:a05:6512:3d0b:: with SMTP id
 d11mr10844974lfv.481.1635738374685; 
 Sun, 31 Oct 2021 20:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF9Vi0StfwCxVKLJleuxJA5SVgB0gJhKMAvREzfHfqAahEhuh5khak0X6azEkVG8ZyzvgzZcsRiLret1rd1l4=
X-Received: by 2002:a05:6512:3d0b:: with SMTP id
 d11mr10844957lfv.481.1635738374420; 
 Sun, 31 Oct 2021 20:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 1 Nov 2021 11:46:03 +0800
Message-ID: <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 4:08 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, October 29, 2021 11:11 AM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: qemu-dev <qemu-devel@nongnu.org>; Markus Armbruster
> > <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for =
filter-
> > mirror/redirector
> >
> >
> > =E5=9C=A8 2021/10/28 =E4=B8=8B=E5=8D=885:05, Zhang Chen =E5=86=99=E9=81=
=93:
> > > Make the vnet header a necessary part of filter transfer protocol.
> > > It make other modules(like another filter-redirector,colo-compare...)
> > > know how to parse net packet correctly. If local device is not the
> > > virtio-net-pci, vnet_hdr_len will be 0.
> > >
> > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > ---
> > >   net/filter-mirror.c | 34 ++++++++++++++++------------------
> > >   1 file changed, 16 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > > f20240cc9f..24d3e498e9 100644
> > > --- a/net/filter-mirror.c
> > > +++ b/net/filter-mirror.c
> > > @@ -39,6 +39,7 @@ struct MirrorState {
> > >       CharBackend chr_in;
> > >       CharBackend chr_out;
> > >       SocketReadState rs;
> > > +    /* Keep compatibility for the management layer */
> > >       bool vnet_hdr;
> > >   };
> > >
> > > @@ -48,7 +49,7 @@ static int filter_send(MirrorState *s,
> > >   {
> > >       NetFilterState *nf =3D NETFILTER(s);
> > >       int ret =3D 0;
> > > -    ssize_t size =3D 0;
> > > +    ssize_t size =3D 0, vnet_hdr_len =3D 0;
> > >       uint32_t len =3D 0;
> > >       char *buf;
> > >
> > > @@ -63,21 +64,18 @@ static int filter_send(MirrorState *s,
> > >           goto err;
> > >       }
> > >
> > > -    if (s->vnet_hdr) {
> > > -        /*
> > > -         * If vnet_hdr =3D on, we send vnet header len to make other
> > > -         * module(like colo-compare) know how to parse net
> > > -         * packet correctly.
> > > -         */
> > > -        ssize_t vnet_hdr_len;
> > > -
> > > -        vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> > > +    /*
> > > +     * The vnet header is the necessary part of filter transfer prot=
ocol.
> > > +     * It make other module(like colo-compare) know how to parse net
> > > +     * packet correctly. If device is not the virtio-net-pci,
> > > +     * vnet_hdr_len will be 0.
> > > +     */
> > > +    vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> > >
> > > -        len =3D htonl(vnet_hdr_len);
> > > -        ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len,
> > sizeof(len));
> > > -        if (ret !=3D sizeof(len)) {
> > > -            goto err;
> > > -        }
> > > +    len =3D htonl(vnet_hdr_len);
> > > +    ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len,
> > > + sizeof(len));
> >
> >
> > I wonder if we need to introduce new parameter, e.g force_vnet_hdr here=
,
> > then we can always send vnet_hdr when it is enabled.
> >
> > Otherwise the "vnet_hdr_support" seems meaningless.
>
> Yes, Current "vnet_hdr_support"  default enabled, and vnet_hdr_len alread=
y forced from attached nf->netdev.
> Maybe we can introduce a new parameter "force_no_vnet_hdr" here to make t=
he vnet_hdr_len always keep 0.
> If you think OK, I will update it in next version.

Let me explain, if I was not wrong:

"vnet_hdr_support" means whether or not to send vnet header length. If
vnet_hdr_support=3Dfalse, we won't send the vnet header. This looks the
same as you "force_no_vent_hdr" above.

And my "force_vnet_hdr" seems duplicated with vnet_hdr_support=3Dtrue.
So it looks to me we can leave the mirror code as is and just change
the compare? (depends on the mgmt to set a correct vnet_hdr_support)

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> >
> > > +    if (ret !=3D sizeof(len)) {
> > > +        goto err;
> > >       }
> > >
> > >       buf =3D g_malloc(size);
> > > @@ -252,7 +250,7 @@ static void filter_redirector_setup(NetFilterStat=
e
> > *nf, Error **errp)
> > >           }
> > >       }
> > >
> > > -    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> > > +    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
> > >
> > >       if (s->indev) {
> > >           chr =3D qemu_chr_find(s->indev); @@ -406,14 +404,14 @@ stat=
ic
> > > void filter_mirror_init(Object *obj)
> > >   {
> > >       MirrorState *s =3D FILTER_MIRROR(obj);
> > >
> > > -    s->vnet_hdr =3D false;
> > > +    s->vnet_hdr =3D true;
> > >   }
> > >
> > >   static void filter_redirector_init(Object *obj)
> > >   {
> > >       MirrorState *s =3D FILTER_REDIRECTOR(obj);
> > >
> > > -    s->vnet_hdr =3D false;
> > > +    s->vnet_hdr =3D true;
> > >   }
> > >
> > >   static void filter_mirror_fini(Object *obj)
>



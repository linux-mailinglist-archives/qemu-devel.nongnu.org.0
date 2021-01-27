Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1233054A3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:29:31 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fGc-0007Cq-AE
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fDH-000630-M1
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:26:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fD7-00066A-JH
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611732352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8szPNvIK9CiokdL2PbeyOJjldspQ1ho0olWTV8nfJX0=;
 b=OUuLAFWnZOZKqz5b7w8iQoLmNbQLdpIJ88AYacE83v2olaptInRrrLG5RTEJhBl/fJf/wh
 ys3Y6d5LGBExGk03S+3b1Wq27BXfV1tz2gMf6pL8o+AtIbykvdCj+vKkpkQBAN3k/Io6Zj
 uZERSTObMA3NFuLIR/xdknotajKG668=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-AXeTVcUwOsWONNl85HiHQw-1; Wed, 27 Jan 2021 02:25:51 -0500
X-MC-Unique: AXeTVcUwOsWONNl85HiHQw-1
Received: by mail-pg1-f200.google.com with SMTP id 18so945784pgp.22
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8szPNvIK9CiokdL2PbeyOJjldspQ1ho0olWTV8nfJX0=;
 b=X8tRjVyycjeBZkGReM3CELNuTEkpD/SVvOyhXJawR7WNDWFwK7oLpiamiNigRsrAub
 z/1qIE0CeoXJUP1B/oOjPT8xC5JjXxVWAKmP9e1DY6OEXQfktyiCO0bGhE6VnoyquniA
 5g6gIUl8ovigmNnMbAFwf3PQBK9JdHGg/NwrRPnuKnKPOI1uPSXjW/ciH/ADQlAq+Fg0
 pMbfF0mhB3YirFhsFSUuCVq8HF0yscHQqdO92SXGMNuFSrYCbcwifjy3qdq2W0kCPxfZ
 ha1kMbXl6naKywm8z9cIb3f74yHsETD4oQbOQwkx/ibQ0UG0AcIvZYEdvE2w3vZR73+E
 iM+g==
X-Gm-Message-State: AOAM533+tih1Z8xdA2AtRnV7SZJQ3INWLfy03FukLBgWu9pN9EO4AXmj
 LTtx9Q2YfU9CSlNGjdH2ruvshpwe48J/P8MUbYxB/TxeAExWveiesh/l5axGYRZ8E1t3sSLkfrA
 NgM7XSUwAaKR1HDWVsnVEN2FE9rl9E6o=
X-Received: by 2002:a63:5142:: with SMTP id r2mr2166870pgl.248.1611732349890; 
 Tue, 26 Jan 2021 23:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynJebVm3B/jexbOLN5Zm1WY1wAIGW+fIWnNmvKDLp1Zo09dXApr3Wp2qISGnxQRzpizkX87RLzyQmWUadzdI0=
X-Received: by 2002:a63:5142:: with SMTP id r2mr2166858pgl.248.1611732349676; 
 Tue, 26 Jan 2021 23:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-3-lulu@redhat.com>
 <6d276606-e4d7-e2ee-3fa6-ab1010c84093@redhat.com>
In-Reply-To: <6d276606-e4d7-e2ee-3fa6-ab1010c84093@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 27 Jan 2021 15:25:12 +0800
Message-ID: <CACLfguU6LoCvaY+djk_SMUWny4AegFPVvznYArUr4aW2hgkUcg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] vhost_net: enable configure interrupt when
 vhost_net start
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 1:38 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/26 =E4=B8=8B=E5=8D=883:42, Cindy Lu wrote:
> > While peer is vhost vdpa, setup the configure interrupt function
> > vhost_net_start and release the resource when vhost_net_stop
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/net/vhost_net.c | 19 ++++++++++++++++++-
> >   1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 24d555e764..0660da474a 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -345,6 +345,15 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >           error_report("Error binding guest notifier: %d", -r);
> >           goto err;
> >       }
> > +    if (ncs->peer && ncs->peer->info->type =3D=3D NET_CLIENT_DRIVER_VH=
OST_VDPA) {
> > +        if (k->set_config_notifiers) {
> > +            r =3D k->set_config_notifiers(qbus->parent, true);
> > +            if (r < 0) {
> > +                error_report("Error binding config notifier: %d", -r);
> > +                goto err;
> > +            }
> > +       }
> > +    }
> >
> >       for (i =3D 0; i < total_queues; i++) {
> >           peer =3D qemu_get_peer(ncs, i);
> > @@ -391,7 +400,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >       for (i =3D 0; i < total_queues; i++) {
> >           vhost_net_stop_one(get_vhost_net(ncs[i].peer), dev);
> >       }
> > -
> > +   if (ncs->peer && ncs->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHO=
ST_VDPA) {
> > +        if (k->set_config_notifiers) {
>
>
> It looks to me that checking k->set_config_notifier is sufficient here.
>
> Thanks
>
>
sure will fix this

> > +            r =3D k->set_config_notifiers(qbus->parent, false);
> > +            if (r < 0) {
> > +                error_report("Error unbinding config notifier: %d", -r=
);
> > +            }
> > +           assert(r >=3D 0);
> > +        }
> > +    }
> >       r =3D k->set_guest_notifiers(qbus->parent, total_queues * 2, fals=
e);
> >       if (r < 0) {
> >           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", =
r);
>



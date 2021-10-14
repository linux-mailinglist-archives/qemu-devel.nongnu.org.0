Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0E42D8E4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:09:55 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazYY-0007jS-Nd
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazR6-0008NC-G5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mazR4-00051g-8F
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634212929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y917W0s45tqCFFtMn286bqPZ8pU7+VOxkulPX7z86WQ=;
 b=cZKi82yltiv+WZsIR8q7YA9EWiCW4Uhs+kNJVxzGpppBv+L4RVTMHxYTtfjK+i6tmdbJAL
 Wx7cLOS+IjIQ5vhVg39326lBw7Dex+bo/fK8WUuBtorZOrAP00IIFLKxY1IX/ZPQq5r2O7
 QVDMBkswnWiAmNr3zsN8HW06st/8U/k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-ep4lQdUOPpOc8Aa28lEXbg-1; Thu, 14 Oct 2021 08:02:08 -0400
X-MC-Unique: ep4lQdUOPpOc8Aa28lEXbg-1
Received: by mail-qk1-f199.google.com with SMTP id
 s18-20020a05620a255200b00433885d4fa7so4287885qko.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y917W0s45tqCFFtMn286bqPZ8pU7+VOxkulPX7z86WQ=;
 b=iuUMoJWNhTC72GQx8+m7HegdOc0apuqTW2IJzclY6uoy3nquAvEHWQCY36IWWfiWx8
 SKACQKlKPuQtjQD0ir0cTq9A47Ze83RLDnc1ztRbih4MxJLkT8+TEBXmY4CBup1XJlTJ
 QerLVKeg37elGVdl+oOnUrpuoV4xWu9Iq+iklDhfVy9k9wDCKChVjQrwh5QlG1dM4t2A
 O9Ow3/rmrgQ0NWchQwHlazJ03wlI6bQFdeOUtv/jxyPx7oAm/GcylDU6tiQ50zhbSJXf
 5J25l1scRyVY5AHrgJEz20qhAYrYGBjD+fYdezISU/8kOxeegfuIRODwPDYv0wbg2Lr8
 7ZLg==
X-Gm-Message-State: AOAM530oMolsjgScaji+eycdqWjbxImPhKO23O5v3NkQiD2H9Oa466A+
 Br4k+hXPG++RuRpxEzLNl/bYA0jkaP5+uqKHvst61h6W90is75cKdODLqHx/W7aE6AEFUHONMYN
 Bx+aKCqKsloH+DuskwQZVpn1qkAYYS1w=
X-Received: by 2002:ad4:5ba3:: with SMTP id 3mr4634079qvq.60.1634212927888;
 Thu, 14 Oct 2021 05:02:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnf7Q0OB5XGKrkYio4ZGwl98N4+F714We0KqMDIuwrv1jAyJKnFbMoEVkB1zDR5TKfzSf5TiYfpOKbC2/Rwa4=
X-Received: by 2002:ad4:5ba3:: with SMTP id 3mr4634054qvq.60.1634212927716;
 Thu, 14 Oct 2021 05:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-6-eperezma@redhat.com>
 <877deihlcd.fsf@dusky.pond.sub.org>
 <CAJaqyWcz6+ce+T3GYPa7durLEwxN8OdwK=7KCYbcD1o03uj4Xw@mail.gmail.com>
 <87pmsa5pby.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmsa5pby.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 14:01:31 +0200
Message-ID: <CAJaqyWcaHs6-Rn5OJyN9SFopbZDFdk9xhOHg94S9WY0HjoQnSA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/20] vhost: Add x-vhost-enable-shadow-vq qmp
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 3:46 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Tue, Oct 12, 2021 at 7:18 AM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
> >>
> >> > Command to enable shadow virtqueue.
> >> >
> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> > ---
> >> >  qapi/net.json          | 23 +++++++++++++++++++++++
> >> >  hw/virtio/vhost-vdpa.c |  8 ++++++++
> >> >  2 files changed, 31 insertions(+)
> >> >
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index 7fab2e7cd8..a2c30fd455 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -79,6 +79,29 @@
> >> >  { 'command': 'netdev_del', 'data': {'id': 'str'},
> >> >    'allow-preconfig': true }
> >> >
> >> > +##
> >> > +# @x-vhost-enable-shadow-vq:
> >> > +#
> >> > +# Use vhost shadow virtqueue.
> >> > +#
> >> > +# @name: the device name of the VirtIO device
> >>
> >> Is this a qdev ID?  A network client name?
> >
> > At this moment is the virtio device name, the one specified at the
> > call of "virtio_init". But this should change, maybe the qdev id or
> > something that can be provided by the command line fits better here.
>
> To refer to a device backend, we commonly use a backend-specific ID.
> For network backends, that's NetClientState member name.
>

Ok so I will use the NetClientState member name, it fits way better
here than the virtio device name.

Thanks!

> To refer to a device frontend, we commonly use a qdev ID or a QOM path.
>
> [...]
>



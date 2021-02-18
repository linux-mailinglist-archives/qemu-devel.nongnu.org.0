Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396931EE6B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:38:27 +0100 (CET)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCoC1-0002By-Ev
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCoAN-0001dL-RC
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCoAH-00069J-6w
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613673394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wN27AbIc5xGpY54lrdd7J668q+yocmeBUt4SBn3DU3o=;
 b=gB+L04LC8aaoDrl085xP3ULl5V/znUUE/4ESkfM4dgAwQLi/TGav5FmSyF8mzsFlS742mY
 LdUueixPDgpivjyjNnjZ2PRWcWz5+LFSNWlyyIZQ9IYr/fWAVvZ4YNDQ8jOJugFnOU/tPG
 T5lFFjH99eU4JU3JWefYtKekXODPva0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-xQqQ7OKtPje6CDJSEnWOqQ-1; Thu, 18 Feb 2021 13:36:33 -0500
X-MC-Unique: xQqQ7OKtPje6CDJSEnWOqQ-1
Received: by mail-qt1-f199.google.com with SMTP id p20so1729414qtn.23
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 10:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wN27AbIc5xGpY54lrdd7J668q+yocmeBUt4SBn3DU3o=;
 b=cMp34EcJ+LLj3/n+dk4ElHHpwvMYQTfXARdukqoyOYpdQlF98ucov2HHENEe8icbS1
 Q1iMmWoIOjCTBbE7QBhJF23gS4LYVQsbNTPWi6h3yxNZA6WhI94A8eVEbueDHGdW5yha
 tHr3UyXCLPxXFmC1socKj07cpEGOBKPMYAHpZL1TXtSglssIgHEBsS1Nrm6Cq6kT3J5Z
 jMVzzxkJLws3n701w+qj7qoSu5n9c4DCU/r6uXSgsXRGLqIVZsM+6ryums7dHpK234nu
 pMvyeKgCGBHaRjJ3tuzl0UQXrGNIkSp0k9uUZmoOnEPTaZ5o2V2EJYInEnsSZf7l3RdJ
 1qkQ==
X-Gm-Message-State: AOAM533K0CTsGzUONhpVaTI7gB2QtvX0rBgaT7JnTAKJqgRLa1/rxGUN
 FnbPpf4Ss5vKxYH7EBO0p9iZ73Ai3zRIqJ+YprQDdiYS8dBUsEVzP3jBOBS4HZQFTzUDVn39Kfd
 BbSaPLDhGaADp7qBSL8YRRx/KxowU7KM=
X-Received: by 2002:a37:af83:: with SMTP id y125mr5628990qke.210.1613673392585; 
 Thu, 18 Feb 2021 10:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvVq7+DYbZL3EEEP5zbq3u44dMxVZ3n4hia8JN3JWoByaDUK8Y27mrd//RvB4w30xceV0uE/uMvgISYWrMSso=
X-Received: by 2002:a37:af83:: with SMTP id y125mr5628965qke.210.1613673392321; 
 Thu, 18 Feb 2021 10:36:32 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-6-eperezma@redhat.com>
 <20210217152633.GG269203@stefanha-x1.localdomain>
 <CAJaqyWd2St=CYbOCzqhW5WKktAG5zfzEjEpFuEXRoUU4dk_w0A@mail.gmail.com>
In-Reply-To: <CAJaqyWd2St=CYbOCzqhW5WKktAG5zfzEjEpFuEXRoUU4dk_w0A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 18 Feb 2021 19:35:56 +0100
Message-ID: <CAJaqyWe+cc=ddG4cEkqObMTdzuO3pyTMqqOqtMfPKgMK-2Pm+A@mail.gmail.com>
Subject: Re: [RFC v2 5/7] vhost: Add x-vhost-enable-shadow-vq qmp
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 7:47 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Feb 17, 2021 at 4:26 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Feb 09, 2021 at 04:37:55PM +0100, Eugenio P=C3=A9rez wrote:
> > > diff --git a/qapi/net.json b/qapi/net.json
> > > index c31748c87f..a1cdffb0f9 100644
> > > --- a/qapi/net.json
> > > +++ b/qapi/net.json
> > > @@ -77,6 +77,28 @@
> > >  ##
> > >  { 'command': 'netdev_del', 'data': {'id': 'str'} }
> > >
> > > +##
> > > +# @x-vhost-enable-shadow-vq:
> > > +#
> > > +# Use vhost shadow virtqueue.
> >
> > Is this command for testing only or do you expect it to be invoked by
> > libvirt in production? I think the shadow virtqueue can be an internal
> > QEMU feature that is hidden from management tools.
> >
>
> I think shadow virtqueue should kick in automatically when live
> migration is triggered and the vhost device does not have _F_LOG too.
>
> Maybe something like "prefer shadow vq to vhost logging" could be
> exposed, but it is not a thing we have to figure now.
>
> > > +#
> > > +# @name: the device name of the virtual network adapter
> > > +#
> > > +# @enable: true to use he alternate shadow VQ notification path
> > > +#
> > > +# Returns: Error if failure, or 'no error' for success
> > > +#
> > > +# Since: 6.0
> >
> > Is this a generic feature for any vhost or vDPA device? If yes, please
> > replace "virtual network adapter" in the doc comment.
> >
> > Does this only apply to vhost-net devices? If so, please put "vhost-net=
"
> > in the name since there are other non-net vhost devices.
>
> Right, thanks for the catch!
>

Moreover, the command should not be in net.json. However, I don't see
a generic virtio/vhost file to add the command.

> >
> > > +#
> > > +# Example:
> > > +#
> > > +# -> { "execute": "x-vhost-enable-shadow-vq", "arguments": {"enable"=
: true} }
> >
> > Missing "name" field?
>
> Yes, I will fix the example in future revisions.
>
> Thanks!



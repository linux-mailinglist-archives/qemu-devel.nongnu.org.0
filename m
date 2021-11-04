Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8478444D63
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 03:49:08 +0100 (CET)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miSoN-0002CT-Ju
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 22:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSn4-0000ow-EI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSn1-0007xQ-4q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635994062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/5bn2QBW2W8NQ38jVbB9/Ff1JDK0+IYfD71GxCjkoY=;
 b=eiNWrSDXIaurqf7i3LCmC/rtsNlk68fI2i0nhqUTsnrr7dX3n8h/Kbj76KyGrEwQ+GxvGT
 0kEwVRwxSPmBN1PMcR6ZEhfTarRel6JdjMLx+NOWqHhbZUtjB79c4fNVv1UiK5Lw/nuFWp
 /riMHhnTLEr7R97SI9kIvONwA6gSPKQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-cvTZNVjnM_iLp6brXfyANA-1; Wed, 03 Nov 2021 22:47:41 -0400
X-MC-Unique: cvTZNVjnM_iLp6brXfyANA-1
Received: by mail-lf1-f72.google.com with SMTP id
 d10-20020a0565123d0a00b004002359a671so1362616lfv.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 19:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I/5bn2QBW2W8NQ38jVbB9/Ff1JDK0+IYfD71GxCjkoY=;
 b=j6tfa0B0qXCXSuRbG1knmh3mM389enA/iQcc11Y+0zB4fM0ObqMtZKB+WrhQPIlVjE
 w/Mwf+qVcYIzr1CLqfgyX3/+KrkHtcodeiaZIqY7AetlU1DcYE78dmIK4hTaA0MsRLqg
 MNvJAK26Ze4bOqFD/oV7SNEl5DO4vAetzoXlhkHr19o4EfApm7rkYGD8Rz76RFYjIAPF
 xG8Wyfq7aPmT/bBxoAGk3Oc/NZTMb34U5beMeXICXef9tD7GwiERE+IoApQ6X9eU0+XK
 aFMG6RfJBr4s6QI1BNBSdQlbUZ3UjqqjfrkJxG7KbeYMmTCDSmENby6MJNdly/413LrC
 jL0g==
X-Gm-Message-State: AOAM532C6byydf0/43BuLFQM9RcID1hXEkn30KyHqGrX0B4+h+dzLohg
 4PzvZ82xJD1PFjZr7qhsu5CsJ9ktTWXoa1I9sLFhrRkuqa5ROvyJRIIcX8MKiDnlhz4NnRBCQsr
 n2JlsFOlqx6xduYR6gET91nOzr8yH2dg=
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr8392556ljk.369.1635994059698; 
 Wed, 03 Nov 2021 19:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi5Vqfu00MiK/S1CzVbd3BoVWwvocQFjE6/+0RrzTQ9nNlsLO0pyOyjLpsSJLt4xVDpwPgVN5SRnpFyGYOjvU=
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr8392535ljk.369.1635994059465; 
 Wed, 03 Nov 2021 19:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211103100131.1983272-1-eperezma@redhat.com>
 <20211103100131.1983272-3-eperezma@redhat.com>
In-Reply-To: <20211103100131.1983272-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Nov 2021 10:47:28 +0800
Message-ID: <CACGkMEuEktc5RbeBcfyDhZ5iTBB49nHdcwQ+r0u29VfmuC+gtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] vhost: Fix last vq queue index of devices with no
 cvq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 6:01 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The -1 assumes that last index counts all vhost device models as having
> two queues, but they count only the ones that models the data queues.
>
> Because of that, the right change in last_index is to actually add the
> cvq, not to remove the missing one.
>
> This is not a problem to vhost-net, but it is to vhost-vdpa, which
> device model trust to reach the last index to finish starting the
> device.
>
> Tested with vp_vdpa with host's vhost=3Don and vhost=3Doff, with ctrl_vq=
=3Don
> and ctrl_vq=3Doff.
>
> Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virt=
io device")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/net/vhost_net.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 081946dc93..fe2b8a2b83 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -329,8 +329,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState=
 *ncs,
>      int r, e, i, last_index =3D data_queue_pairs * 2;
>      NetClientState *peer;
>
> -    if (!cvq) {
> -        last_index -=3D 1;
> +    if (cvq) {
> +        last_index +=3D 1;

Patch looks ok.

Not a native speaker but I guess "last" should be inside the closed
interval. If this is true, I still prefer to change the check in
vhost_vdpa_dev_start().

Thanks

>      }
>
>      if (!k->set_guest_notifiers) {
> --
> 2.27.0
>



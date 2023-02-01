Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D013686547
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:20:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB9w-0008IN-97; Wed, 01 Feb 2023 06:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNB9T-00088q-Vg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNB9S-0005WQ-Dp
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675250381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSXDXGxAzpR7FWOag5Debz4jNyEvgdgUf7SwsYN4iDk=;
 b=iEtPiY6X6vQ1cN0ZrgPtqedDzceZ2ZRC5azfkcxzNz5R/PY4AD01wcizmkOy20Isa9vasX
 +UoXxzjhvfCOUvZnMlpD3PN9x48NZd0Cy3oGcAKq3CrCDBiOut2AF3vl6qk0Rp/eb23uUN
 NRY/cs1QoFewyrHHrcqrgOmDE9EOKvM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1--EC176cPPuGOhToUR2K8HQ-1; Wed, 01 Feb 2023 06:19:37 -0500
X-MC-Unique: -EC176cPPuGOhToUR2K8HQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 q139-20020a25d991000000b0084516f8d38cso2225115ybg.17
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 03:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DSXDXGxAzpR7FWOag5Debz4jNyEvgdgUf7SwsYN4iDk=;
 b=Ah/9ajuTMZMkoibZzbfr81Ozhe/apqfAelTEY9bLzmPZUazM3l+h79QGai3wPCJsUa
 93ZnkaMrUjwbQ1YDJmbci9Hub+78QuxlpU9hpaxGLadrEmuE5GK7OTTH0H8YvHNQ+Coc
 L4KpD71if0LM+f0f5b8MPewOBnoxw6kRwoPbAOmLFwHYtfOA3IjDvAfywly1hcP2jYOZ
 6nwKjfc35qBT+a+dkdKYVYtq2+pXRTQZowPesZfPVD3NYqT/OjaGMWvRkjyrZ/iRlJe4
 lv9Fi42I1UTAndzXQROCfTWFPcwVZAd4DS2Ukc9r+36z50VZpApptb3cQINnMLLtoSPU
 NX8w==
X-Gm-Message-State: AO0yUKV/M/m8VpRQPEfuKJVj5uE6j+/ls7BOcF+Br9vPHUHEFi+XbGqc
 FXkNdDzQK+xtViJSHslz15Bf5yUjR1FuBvVL5cEfzIvRtxTSpEi69E3MeCIGCnjqo6eDd4CrhC/
 KHZCbAjLEus1M47facBKl5efCSC0og5o=
X-Received: by 2002:a05:6902:10f:b0:80b:72cc:3967 with SMTP id
 o15-20020a056902010f00b0080b72cc3967mr269912ybh.123.1675250377332; 
 Wed, 01 Feb 2023 03:19:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9Pq3fZa2Lw5fmxdwI0OVvCWCgWiKdDLqsMba6cvD//XbvxFDw3uEFFRXJ/T6IR6w68cuSAY46nUYO6fxo9IqU=
X-Received: by 2002:a05:6902:10f:b0:80b:72cc:3967 with SMTP id
 o15-20020a056902010f00b0080b72cc3967mr269908ybh.123.1675250377098; Wed, 01
 Feb 2023 03:19:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
In-Reply-To: <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Feb 2023 12:19:01 +0100
Message-ID: <CAJaqyWdkC26qasL8ofc6_v90nGtkD1xUm9ES=yqOXDFkuyunnw@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 1, 2023 at 12:14 PM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> Thanks Eugenio for working on this.
>
> On 1/31/23 20:10, Eugenio Perez Martin wrote:
> > Hi,
> >
> > The current approach of offering an emulated CVQ to the guest and map
> > the commands to vhost-user is not scaling well:
> > * Some devices already offer it, so the transformation is redundant.
> > * There is no support for commands with variable length (RSS?)
> >
> > We can solve both of them by offering it through vhost-user the same
> > way as vhost-vdpa do. With this approach qemu needs to track the
> > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > device status for live migration. vhost-user should use the same SVQ
> > code for this, so we avoid duplications.
> >
> > One of the challenges here is to know what virtqueue to shadow /
> > isolate. The vhost-user device may not have the same queues as the
> > device frontend:
> > * The first depends on the actual vhost-user device, and qemu fetches
> > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> >
> > For the device, the CVQ is the last one it offers, but for the guest
> > it is the last one offered in config space.
> >
> > To create a new vhost-user command to decrease that maximum number of
> > queues may be an option. But we can do it without adding more
> > commands, remapping the CVQ index at virtqueue setup. I think it
> > should be doable using (struct vhost_dev).vq_index and maybe a few
> > adjustments here and there.
> >
> > Thoughts?
>
> I am fine with both proposals.
> I think index remapping will require a bit more rework in the DPDK
> Vhost-user library, but nothing insurmountable.
>

Can you expand on this? I think my proposal does not require modifying
anything in the device. Or you mean hw/virtio/vhost-user.c and
similar?

Thanks!

> I am currently working on a PoC adding support for VDUSE in the DPDK
> Vhost library, and recently added control queue support. We can reuse it
> if we want to prototype your proposal.
>

Sure, that would be great.

Thanks!



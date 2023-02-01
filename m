Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E2686058
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:12:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN72k-00026C-1k; Wed, 01 Feb 2023 01:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pN72h-00025y-VG
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 01:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pN72g-0004nT-6H
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 01:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675234585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qiWcu/BEMhfa0F0t98gmnNQTftBKQr44C24Dv1aYZo=;
 b=Z49HPXFbcLQsAR0TTWYCeF7Izg+rdNQ38TbN/9XcpmvRMawXW6gNAUnmvFFyMS5zYKjxv4
 wk1zfnU48g1KxTVFkxl1rF8SfWn+p3JQYdaqZjnjSdIR4fEGolSupBA2GLgD22NM93SjUe
 ZMcT2cOF8C1I0Yz7G00lvoDhcEn1GGU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-XesX-psmOrWkEsxbPF-2KQ-1; Wed, 01 Feb 2023 01:56:21 -0500
X-MC-Unique: XesX-psmOrWkEsxbPF-2KQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 p19-20020a25d813000000b0080b78270db5so18842084ybg.15
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 22:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5qiWcu/BEMhfa0F0t98gmnNQTftBKQr44C24Dv1aYZo=;
 b=e4aQA4qIyYnqZOi1Nzkjls97QSmetsbvm9pyKmrZtgZhRSYg4x0Xgv7mMHBp/+N+vm
 fg17XWiMaGn1WYT/2/Tc8fLTD8ycr6cpmexaqDLAqtTfJerfoYe4LkujpBW/FBFSyYXR
 QnNzzQL6wYNcJa3fOJ+zuyXhsS3tYfju12jWXnmNWlt2hy6U2U0JmA4QRmVFv53bxk4F
 iofxogC3USIIqZq81qGvi5VduVNcAdEOmBEedsCsHGb4aF8Fn7cQYXObPJhATNIv3Hsr
 z/YHsNGUXKVcDTol6j7X3s2RuQLqoDm8kFdA3HUsReWXMtNAIZqUag2i7tr2xrwAjLHX
 p7Iw==
X-Gm-Message-State: AO0yUKUbpZlqHAG3ySM4YS5xmDJRtBmAH0MlMwKC3fNT1+HgVKPgg6dn
 LAPl1Cx+RXgC/oBIvj4YyudtXZenWRSnZ7VLoMr0ARJJiTLbj2y2j9uZJgIw5DaU0+rSbpDyGYx
 vEAmGD7zGKrsAgoOgvbevs5LU10UUG5E=
X-Received: by 2002:a25:e002:0:b0:80b:6391:c7a9 with SMTP id
 x2-20020a25e002000000b0080b6391c7a9mr229976ybg.381.1675234580742; 
 Tue, 31 Jan 2023 22:56:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/7ausF2hmyvGbd19BbN6xV9sPpoYRUfAKtnTN7Eb7Kxp7aAMjmmQjCmo6qvjUom9hnJhmDllGIBfYGtdKt+9w=
X-Received: by 2002:a25:e002:0:b0:80b:6391:c7a9 with SMTP id
 x2-20020a25e002000000b0080b6391c7a9mr229973ybg.381.1675234580493; Tue, 31 Jan
 2023 22:56:20 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CACGkMEs2wkkWmrNUuxfUVEsdGAkgxFxCLqCb5H-cH+dvVf-ijA@mail.gmail.com>
In-Reply-To: <CACGkMEs2wkkWmrNUuxfUVEsdGAkgxFxCLqCb5H-cH+dvVf-ijA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Feb 2023 07:55:44 +0100
Message-ID: <CAJaqyWdXfT9tfdFL3V8rTDjP+4rw2au3QXvT5XUfx-JooqcpHg@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Jason Wang <jasowang@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
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

On Wed, Feb 1, 2023 at 4:27 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Feb 1, 2023 at 3:10 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
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
>
> Note that it really depends on the model we used. SVQ works well for
> trap and emulation (without new API to be invented). But if save and
> load API is invented, SVQ is not a must.
>

That's right, but the premise in the proposal is that control vq RSS
messages are already complex enough to avoid adding more vhost-user
messages. I cannot imagine expanding the vhost-user or virtio API to
add the save and restore functions soon :).

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
>
> It requires device specific knowledge, it might work for networking
> devices but not others (or need new codes).
>

Yes, I didn't review all the other kinds of devices for the proposal,
but I'm assuming:
* There is no other device that has already implemented CVQ over
vhost-user (or this problems would have been solved)
* All vhost-user devices config space are already offered by qemu like
vhost-user net, and the cvq-alike index is well defined in the
standard like -net.

So this proposal should fit all those devices, isn't it?

Thanks!



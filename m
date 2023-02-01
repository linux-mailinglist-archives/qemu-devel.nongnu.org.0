Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89A685DF0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3oo-0004On-Hk; Tue, 31 Jan 2023 22:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pN3om-0004OK-QR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pN3ol-0007ib-31
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675222190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M8WKEMMCA9JB1i1jRgP8c0tSvTU8L3xUDuU8y7+1d5k=;
 b=cWXdp5Aq3aKLUGBdc65qe8+/+CTLRF0IMwvd+aRWO8CfWx+N/WqWsZ0CnB1IZrqqwXRF+r
 Aa9bOeb+rN8RcLSgCJtbIYzDJIf7ZhjWb3Z3Hh72e8GaAZoc+45XEFU5iTcC/SfZTrcw7i
 zGtcbJN4TfHj0Lyap3v1b0p351ra2aY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-Ma1RSo18Ml6_zrtepO7oUw-1; Tue, 31 Jan 2023 22:29:48 -0500
X-MC-Unique: Ma1RSo18Ml6_zrtepO7oUw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-15fe7396eb4so6429290fac.12
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M8WKEMMCA9JB1i1jRgP8c0tSvTU8L3xUDuU8y7+1d5k=;
 b=pq6KMTcbUrAE2/1aMsBNnlHZazK7UzLyui+hA2yrS5RFIcZ+taomHuAtEVQcwztToQ
 JPF+Vokmx1wd4htqAazZAQNFnvV6naZgRczfQWtvFXE0dJIt7KS6Px4iZzGWtKOKSZmS
 cuuXGdjvlVwdHoBEvx/fMSkzPPU8feNgTriRSV3KksrwporWsRCt7n1Cce2vaoVIIafB
 vOB2Mx0J+b0WNnbXXI88D6K41vtNyzvV/OY9jesGvZr4h/LlYYyCQdFXVb8na1z5ExIQ
 qhnd4iW2E2x3BzB7nL+U7jNqj5voEz4FTSVi9YRfYNyKVoV60B9IpezufBduqoF16eFC
 OaXA==
X-Gm-Message-State: AO0yUKUKs7iSgZFwLWk0r+TrzIS/yz0shcirrTkceFdIFP2ZPLCVKT6o
 AmwP42zaepl0ciZUDzg1jjRcLbJoMJcqTyFBAPeSc/Uy9rpuTQDaBTEz/o5TBM10IuFFogYlY0R
 bfcwZNPyW/Cx2uW8xmxcRbtiGZG/wh84=
X-Received: by 2002:aca:a8c5:0:b0:363:a978:6d41 with SMTP id
 r188-20020acaa8c5000000b00363a9786d41mr72047oie.280.1675222186940; 
 Tue, 31 Jan 2023 19:29:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8tZRY2Up1I8fQwUVDc7lLw3gFxYjvPCQgRwrq+Xksqem1tr50aUDAWXpKMbMy64w0IKO/sjZUVdnVvnpCYy3o=
X-Received: by 2002:aca:a8c5:0:b0:363:a978:6d41 with SMTP id
 r188-20020acaa8c5000000b00363a9786d41mr72042oie.280.1675222186726; Tue, 31
 Jan 2023 19:29:46 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
In-Reply-To: <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Feb 2023 11:29:35 +0800
Message-ID: <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>
> On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
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
> >
> > Thanks!
>
>
> (Starting a separated thread to vhost-vdpa related use case)
>
> This could also work for vhost-vdpa if we ever decide to honor netdev
> queues argument. It is totally ignored now, as opposed to the rest of
> backends:
> * vhost-kernel, whose tap device has the requested number of queues.
> * vhost-user, that errors with ("you are asking more queues than
> supported") if the vhost-user parent device has less queues than
> requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
>
> One of the reasons for this is that device configuration space is
> totally passthrough, with the values for mtu, rss conditions, etc.
> This is not ideal, as qemu cannot check src and destination
> equivalence and they can change under the feets of the guest in the
> event of a migration.

This looks not the responsibility of qemu but the upper layer (to
provision the same config/features in src/dst).

> External tools are needed for this, duplicating
> part of the effort.
>
> Start intercepting config space accesses and offering an emulated one
> to the guest with this kind of adjustments is beneficial, as it makes
> vhost-vdpa more similar to the rest of backends, making the surprise
> on a change way lower.

This probably needs more thought, since vDPA already provides a kind
of emulation in the kernel. My understanding is that it would be
sufficient to add checks to make sure the config that guests see is
consistent with what host provisioned?

Thanks

>
> Thoughts?
>
> Thanks!
>



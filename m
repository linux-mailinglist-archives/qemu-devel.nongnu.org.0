Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485D687395
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 04:03:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNPrn-0007DW-Id; Wed, 01 Feb 2023 22:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNPrl-0007DO-3E
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNPrj-0003E8-9g
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 22:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675306941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4pu3XhTKQf+lfnxnhyQr3DUInRQPRYFv4HGAvfl46wA=;
 b=g7v0CxKf9ESBtQAis5drCaViEdcKTCCxcn7f/W3xFPPtraSZ15mU05skf8oz4w4t2uHuBK
 +xtHoyrVxmKjabmV4mRb/cPBsiUwKB7dUR6c+E3oXgm9juOvVUucdzn45eE56wAgidxibG
 V4fyKTvF52abwFGvOSiznPjVZUNwhsk=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-bZdRAs3UOfC2Hfh32003CA-1; Wed, 01 Feb 2023 22:02:20 -0500
X-MC-Unique: bZdRAs3UOfC2Hfh32003CA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1635c250efeso342391fac.19
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 19:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4pu3XhTKQf+lfnxnhyQr3DUInRQPRYFv4HGAvfl46wA=;
 b=zQDpkUGzPlpLf3ZxSu7oUwBk9vcEJqZcRIl/57cpCbivp+4xXCMh6DI0kodDPsZZWM
 719dnBd8IfGT4bZENDSG+/XJQtb41V3cmlzUVtvqkPRpJ2tPyi6qbKaAOKkJySvTeXk2
 AkV1nbklyltpgRTweZOEwWz8XaLUhbOpXQwvX/mO3ifA4Oq2/xGBKSza929jDf9XpOtN
 fYV8VSL2qQD3NBeo0TFOWcTt1IRtDQctHpoEu61KCYlGiih70q5Z1ddZ7EKk4N8Rcfh+
 Gl5zQz3cY1v8BMfG2HHU5ExAzB5iWkrHJkLylzkPGHTyfqfwyofWiLfzT2pg6Vg7WQoA
 9MCw==
X-Gm-Message-State: AO0yUKWXTSLav/I3YXVQGDulxIeS6pSjJN68gCRs0B7wjJ7dWsE9n077
 bbZxHkfrxQdga3gUGXtY8Df5jznFG3SSTkiPURY+FIhdGOjjb/8IpIRfUVTL30bYQVzfiAsdaqL
 OZXvFYml1RnsFUi/9UkApWAQGJWg1oQo=
X-Received: by 2002:a05:6870:830b:b0:15b:96b5:9916 with SMTP id
 p11-20020a056870830b00b0015b96b59916mr115155oae.280.1675306939196; 
 Wed, 01 Feb 2023 19:02:19 -0800 (PST)
X-Google-Smtp-Source: AK7set89kbGlOBtzFoqlGNxX7bkerK+c0rNtVRdP/+Mz/2ttqfmhKlhGgfkj7jFGN9m0FCdHS2Cj5+vs//yuScVtVAQ=
X-Received: by 2002:a05:6870:830b:b0:15b:96b5:9916 with SMTP id
 p11-20020a056870830b00b0015b96b59916mr115148oae.280.1675306938977; Wed, 01
 Feb 2023 19:02:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CACGkMEs2wkkWmrNUuxfUVEsdGAkgxFxCLqCb5H-cH+dvVf-ijA@mail.gmail.com>
 <CAJaqyWdXfT9tfdFL3V8rTDjP+4rw2au3QXvT5XUfx-JooqcpHg@mail.gmail.com>
In-Reply-To: <CAJaqyWdXfT9tfdFL3V8rTDjP+4rw2au3QXvT5XUfx-JooqcpHg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Feb 2023 11:02:07 +0800
Message-ID: <CACGkMEs_TGBzKPsjUNyhxn2pxa=w9uZ2=E1VgGwu51ZeBi8f-Q@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Feb 1, 2023 at 2:56 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>
> On Wed, Feb 1, 2023 at 4:27 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Feb 1, 2023 at 3:10 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > The current approach of offering an emulated CVQ to the guest and map
> > > the commands to vhost-user is not scaling well:
> > > * Some devices already offer it, so the transformation is redundant.
> > > * There is no support for commands with variable length (RSS?)
> > >
> > > We can solve both of them by offering it through vhost-user the same
> > > way as vhost-vdpa do. With this approach qemu needs to track the
> > > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > > device status for live migration. vhost-user should use the same SVQ
> > > code for this, so we avoid duplications.
> >
> > Note that it really depends on the model we used. SVQ works well for
> > trap and emulation (without new API to be invented). But if save and
> > load API is invented, SVQ is not a must.
> >
>
> That's right, but the premise in the proposal is that control vq RSS
> messages are already complex enough to avoid adding more vhost-user
> messages. I cannot imagine expanding the vhost-user or virtio API to
> add the save and restore functions soon :).

Probably, but we know we need that some day.

>
> > >
> > > One of the challenges here is to know what virtqueue to shadow /
> > > isolate. The vhost-user device may not have the same queues as the
> > > device frontend:
> > > * The first depends on the actual vhost-user device, and qemu fetches
> > > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> > >
> > > For the device, the CVQ is the last one it offers, but for the guest
> > > it is the last one offered in config space.
> > >
> > > To create a new vhost-user command to decrease that maximum number of
> > > queues may be an option. But we can do it without adding more
> > > commands, remapping the CVQ index at virtqueue setup. I think it
> > > should be doable using (struct vhost_dev).vq_index and maybe a few
> > > adjustments here and there.
> >
> > It requires device specific knowledge, it might work for networking
> > devices but not others (or need new codes).
> >
>
> Yes, I didn't review all the other kinds of devices for the proposal,
> but I'm assuming:
> * There is no other device that has already implemented CVQ over
> vhost-user (or this problems would have been solved)

If I was not wrong, vhost-user protocol itself allows arbitrary types
of virtqueue to be implemented on top. So it might just be an
implementation issue.

> * All vhost-user devices config space are already offered by qemu like
> vhost-user net, and the cvq-alike index is well defined in the
> standard like -net.
>
> So this proposal should fit all those devices, isn't it?

If it could be done without extending vhost-user API, that would be fine.

Thanks

>
> Thanks!
>



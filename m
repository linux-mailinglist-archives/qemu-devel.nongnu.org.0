Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB36864E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAlL-0007gs-FO; Wed, 01 Feb 2023 05:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNAkJ-00077j-2s
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNAkE-0008Q1-J5
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675248817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AL2Pdi3is1+oRvaU0I7CYlC6ByOWz3/8VnYI5SjBaV8=;
 b=UIeK4k0FQKTfYNYTz9BFukkYuXHHvcdrlmrlzrP/ldnRKyTVUsUhghWMmxAUZam2S3q4kH
 OBVSFyd5LAAjCQvyWgokWXlGNQi9a4w+kmEX41BgW618EmLVnBME2Ak2fLq65PRbv7qcw1
 JCLfFFktgfyGugp/pbmVbI8uzMAx8Bw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-duhcWVHMOg-5N-Q0UT94qg-1; Wed, 01 Feb 2023 05:53:36 -0500
X-MC-Unique: duhcWVHMOg-5N-Q0UT94qg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso2005199wry.13
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AL2Pdi3is1+oRvaU0I7CYlC6ByOWz3/8VnYI5SjBaV8=;
 b=eW3abIqfAyagQbeMd+857GuvdEw69LsbrckabAIcXzHbpBRvGgSHSibn1ZNCrIxjeQ
 QU6Vxtl+/G4AIIytMRgu4YhyHSlGF+MfM9YlKwbTngXnM72t4gRMClrwaaQ9fTGZRzmN
 4YKjySKf4gET34w4/Da1RmcabePJMFDbNCx93CBACABZ1aUBHwDqWFc0hZxw1zUhvGI5
 PeHrU2YJHQptPofRvLe20XFHOQN/aGG6sWxLa+iUXMjC4f/FNGKnBA3hSQkcjDrSZKsw
 LzVLoPQ/vAyd9fNwh0DwztVViVpf21TxnRUKwpKoDU+8CTn2x+k9a+LvE21QX8z7jw03
 9w7g==
X-Gm-Message-State: AO0yUKVggHTdI14+G9qoqb3nAPTTbqVUztrLEWsuNT9KSkITRY7FhSvp
 sH/qLRCyfmqLz3FFvtObHulCI5wjYaNGvq1vayjh7Loqw26DrkC1KakfoWjpvOqVxX0OxnUHnHP
 q12akUGnUHBIIr8A=
X-Received: by 2002:a05:600c:204e:b0:3db:66e:cfdd with SMTP id
 p14-20020a05600c204e00b003db066ecfddmr1697106wmg.9.1675248815185; 
 Wed, 01 Feb 2023 02:53:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8D6iUCIx8+RP51BGkF3pB8weuoz2j9j4bgec8TzUBaMUsWhv0WmH0HOmkoZWe4wZULagb69A==
X-Received: by 2002:a05:600c:204e:b0:3db:66e:cfdd with SMTP id
 p14-20020a05600c204e00b003db066ecfddmr1697087wmg.9.1675248814958; 
 Wed, 01 Feb 2023 02:53:34 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c42d300b003dc53217e07sm1281147wme.16.2023.02.01.02.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:53:34 -0800 (PST)
Date: Wed, 1 Feb 2023 05:53:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Message-ID: <20230201055236-mutt-send-email-mst@kernel.org>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
 <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 01, 2023 at 11:29:35AM +0800, Jason Wang wrote:
> On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
> > On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
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
> > >
> > > Thoughts?
> > >
> > > Thanks!
> >
> >
> > (Starting a separated thread to vhost-vdpa related use case)
> >
> > This could also work for vhost-vdpa if we ever decide to honor netdev
> > queues argument. It is totally ignored now, as opposed to the rest of
> > backends:
> > * vhost-kernel, whose tap device has the requested number of queues.
> > * vhost-user, that errors with ("you are asking more queues than
> > supported") if the vhost-user parent device has less queues than
> > requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
> >
> > One of the reasons for this is that device configuration space is
> > totally passthrough, with the values for mtu, rss conditions, etc.
> > This is not ideal, as qemu cannot check src and destination
> > equivalence and they can change under the feets of the guest in the
> > event of a migration.
> 
> This looks not the responsibility of qemu but the upper layer (to
> provision the same config/features in src/dst).
> 
> > External tools are needed for this, duplicating
> > part of the effort.
> >
> > Start intercepting config space accesses and offering an emulated one
> > to the guest with this kind of adjustments is beneficial, as it makes
> > vhost-vdpa more similar to the rest of backends, making the surprise
> > on a change way lower.
> 
> This probably needs more thought, since vDPA already provides a kind
> of emulation in the kernel. My understanding is that it would be
> sufficient to add checks to make sure the config that guests see is
> consistent with what host provisioned?
> 
> Thanks

I feel ability to adjust and emulate one device on top of another
one is a strong suit of virtio (as opposed to e.g. vfio which
always wants exactly the same device). Let's not throw this baby
out with the bathwater.

> >
> > Thoughts?
> >
> > Thanks!
> >



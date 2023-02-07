Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5568D225
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJxr-0005ru-M9; Tue, 07 Feb 2023 04:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPJxn-0005r9-Hz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:08:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPJxl-0000Kr-JJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675760907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M67trZ8xZCIF9lVM9UOCAOmCsOrm05JZ5i74/ekd8g=;
 b=aaIWZfh4wefWnU/lKP2+HPnRzYIQBZ7HRUqx/qlm2w5qLcOnMs72FJCKUhITQgw5b5AKFZ
 7us7BICo/BbXuI8NoJRg9v9mQPcOBS5aY5lLFCNiwaJfMMG1xQXrI4/hPCspydKy721Nlt
 oDs3bYnazFWBNRBD+p1XzX3HTFm2u0M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-H4HUTk-nPNamIDD9GMg07Q-1; Tue, 07 Feb 2023 04:08:26 -0500
X-MC-Unique: H4HUTk-nPNamIDD9GMg07Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003deab30bb8bso6958516wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3M67trZ8xZCIF9lVM9UOCAOmCsOrm05JZ5i74/ekd8g=;
 b=tW0f+/Z6l8iyV2495kiklETqe3tz9w2VluVXPOb6pIi3OGQ6HQ5ytYmrZ2ZfKznfsh
 TxCzOFXG/kdGC+B/D4JHt/Ra9zJpIQXjdc7t6ar/PSL1zBltwlctg8ZMCXPRGyzljaF9
 1G8ZAywN8sJfuYSLkDPFp+siIM4ZOZBEdyz8FH/j7jSbcZtTMyLVFVdY0t9U3XM5AKgy
 CLgYV7J54Wy7RdaT9F96Pu67h21DSKnp5wzgXejfAvx3sqSjH4lNzv/7St8prCFsM99H
 ZRRMwg0uvdC6jfZo6iVx+QG2kUXlraXBq96cpRdt4MMXF1JFQPyaZQAna8A1ohF0QpHK
 7AMQ==
X-Gm-Message-State: AO0yUKUj9P+qbki5xgdmDmN4QbqLPOef/fRWaSKGrlNswwT8tmjmEXPk
 +O+UNwdcbrGUVLsIpxK9xDElHFPyk0uZgadZLw2tyA/g4D4oW8zpR2YnsK3QSScd4SKJN89oo3b
 CUPqQ9bEUoDDbEAM=
X-Received: by 2002:a05:600c:a292:b0:3df:eb5d:fbf with SMTP id
 hu18-20020a05600ca29200b003dfeb5d0fbfmr2413571wmb.38.1675760905351; 
 Tue, 07 Feb 2023 01:08:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+qtwg8dUyMcjba+kfzQH59CxUPODE1SvWVfS6k/TQywh7Y/6YGS4GZ15L5rEMQr6WX1r23hA==
X-Received: by 2002:a05:600c:a292:b0:3df:eb5d:fbf with SMTP id
 hu18-20020a05600ca29200b003dfeb5d0fbfmr2413545wmb.38.1675760905047; 
 Tue, 07 Feb 2023 01:08:25 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003db06493ee7sm20308903wmb.47.2023.02.07.01.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:08:24 -0800 (PST)
Message-ID: <f26dd5ed-fa02-faeb-fadb-0dbfbe7792d3@redhat.com>
Date: Tue, 7 Feb 2023 10:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: vhost-user (virtio-fs) migration: back end state
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06.02.23 17:27, Stefan Hajnoczi wrote:
> On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
>> Hi Stefan,
>>
>> For true virtio-fs migration, we need to migrate the daemon’s (back
>> end’s) state somehow.  I’m addressing you because you had a talk on this
>> topic at KVM Forum 2021. :)
>>
>> As far as I understood your talk, the only standardized way to migrate a
>> vhost-user back end’s state is via dbus-vmstate.  I believe that
>> interface is unsuitable for our use case, because we will need to
>> migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly
>> been chosen arbitrarily, but the introducing commit’s message says that
>> it’s based on the idea that the data must be supplied basically
>> immediately anyway (due to both dbus and qemu migration requirements),
>> and I don’t think we can meet that requirement.
> Yes, dbus-vmstate is the available today. It's independent of
> vhost-user and VIRTIO.
>
>> Has there been progress on the topic of standardizing a vhost-user back
>> end state migration channel besides dbus-vmstate?  I’ve looked around
>> but didn’t find anything.  If there isn’t anything yet, is there still
>> interest in the topic?
> Not that I'm aware of. There are two parts to the topic of VIRTIO
> device state migration:
> 1. Defining an interface for migrating VIRTIO/vDPA/vhost/vhost-user
> devices. It doesn't need to be implemented in all these places
> immediately, but the design should consider that each of these
> standards will need to participate in migration sooner or later. It
> makes sense to choose an interface that works for all or most of these
> interfaces instead of inventing something vhost-user-specific.
> 2. Defining standard device state formats so VIRTIO implementations
> can interoperate.
>
>> Of course, we could use a channel that completely bypasses qemu, but I
>> think we’d like to avoid that if possible.  First, this would require
>> adding functionality to virtiofsd to configure this channel.  Second,
>> not storing the state in the central VM state means that migrating to
>> file doesn’t work (well, we could migrate to a dedicated state file,
>> but...).  Third, setting up such a channel after virtiofsd has sandboxed
>> itself is hard.  I guess we should set up the migration channel before
>> sandboxing, which constrains runtime configuration (basically this would
>> only allow us to set up a listening server, I believe).  Well, and
>> finally, it isn’t a standard way, which won’t be great if we’re planning
>> to add a standard way anyway.
> Yes, live migration is hard enough. Duplicating it is probably not
> going to make things better. It would still be necessary to support
> saving to file as well as live migration.
>
> There are two high-level approaches to the migration interface:
> 1. The whitebox approach where the vhost-user back-end implements
> device-specific messages to get/set migration state (e.g.
> VIRTIO_FS_GET_DEVICE_STATE with a struct virtio_fs_device_state
> containing the state of the FUSE session or multiple fine-grained
> messages that extract pieces of state). The hypervisor is responsible
> for the actual device state serialization.
> 2. The blackbox approach where the vhost-user back-end implements the
> device state serialization itself and just produces a blob of data.

Implementing this through device-specific messages sounds quite nice to 
me, and I think this would work for the blackbox approach, too. The 
virtio-fs device in qemu (the front end stub) would provide that data as 
its VM state then, right?

I’m not sure at this point whether it is sensible to define a 
device-specific standard for the state (i.e. the whitebox approach).  I 
think that it may be too rigid if we decide to extend it in the future.  
As far as I understand, the benefit is that it would allow for 
interoperability between different virtio-fs back end implementations, 
which isn’t really a concern right now.  If we need this in the future, 
I’m sure we can extend the protocol further to alternatively use 
standardized state.  (Which can easily be turned back into a blob if 
compatibility requires it.)

I think we’ll probably want a mix of both, where it is standardized that 
the state consists of information about each FUSE inode and each open 
handle, but that information itself is treated as a blob.

> An example of the whitebox approach is the existing vhost migration
> interface - except that it doesn't really support device-specific
> state, only generic virtqueue state.
>
> An example of the blackbox approach is the VFIO v2 migration interface:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/vfio.h#n867
>
> Another aspect to consider is whether save/load is sufficient or if
> the full iterative migration model needs to be exposed by the
> interface. VFIO migration is an example of the full iterative model
> while dbus-vmstate is just save/load. Devices with large amounts of
> state need the full iterative model while simple devices just need
> save/load.

Yes, we will probably need an iterative model.  Splitting the state into 
information about each FUSE inode/handle (so that single inodes/handles 
can be updated if needed) should help accomplish this.

> Regarding virtiofs, I think the device state is not
> implementation-specific. Different implementations may have different
> device states (e.g. in-memory file system implementation versus POSIX
> file system-backed implementation), but the device state produced by
> https://gitlab.com/virtio-fs/virtiofsd can probably also be loaded by
> another implementation.

Difficult to say.  What seems universal to us now may well not be, 
because we’re just seeing our own implementation.  I think we’ll just 
serialize it in a way that makes sense to us now, and hope it’ll make 
sense to others too should the need arise.

> My suggestion is blackbox migration with a full iterative interface.
> The reason I like the blackbox approach is that a device's device
> state is encapsulated in the device implementation and does not
> require coordinating changes across other codebases (e.g. vDPA and
> vhost kernel interface, vhost-user protocol, QEMU, etc). A blackbox
> interface only needs to be defined and implemented once. After that,
> device implementations can evolve without constant changes at various
> layers.

Agreed.

> So basically, something like VFIO v2 migration but for vhost-user
> (with an eye towards vDPA and VIRTIO support in the future).
>
> Should we schedule a call with Jason, Michael, Juan, David, etc to
> discuss further? That way there's less chance of spending weeks
> working on something only to be asked to change the approach later.

Sure, sounds good!  I’ve taken a look into what state we’ll need to 
migrate already, but I’ll take a more detailed look now so that it’s 
clear what our requirements are.

Hanna



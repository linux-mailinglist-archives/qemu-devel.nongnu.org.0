Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2E868BC1A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:54:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP03h-0008Pq-8i; Mon, 06 Feb 2023 06:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pP03e-0008Ph-Uv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:53:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pP03c-0000s2-73
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675684390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FkeT65cfw4IqL7WJmLPgQDmNgMh6engqmdtAQs0jsc0=;
 b=jMKCQFbbEEDZEXx/sUtFjyFVlWEEyAQIPAUPBe++z7yPzglVmZ+tDsVzwFB17qETsDhQBB
 RIckpUYNMfbkZvOZ8DkBujaSXqiNYVn6KPWw8qYnpyOM5e1f7WGuSpZ9/Mn5N0POpPr/C4
 hG27ZotJrauwkZQXOBoVDL9g5aKsDJQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-wvamIXWCOAOd_SJKiEvJBQ-1; Mon, 06 Feb 2023 06:53:09 -0500
X-MC-Unique: wvamIXWCOAOd_SJKiEvJBQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 w17-20020a25c711000000b008673e821352so8807732ybe.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FkeT65cfw4IqL7WJmLPgQDmNgMh6engqmdtAQs0jsc0=;
 b=EHpquyVClKy0g+cXUEaoaZPNMzmr3WIP2ftND3lLtySJNylJ0mSxMwGy2W3zjQ9uJF
 WNmf+puI0dl2PtxCDMKzYKkaA/SLTAH3gq9sIhWA/Gy2MIxOuXtkf5XyQl8OUq+44ao+
 gAZjss6rnLMdDGEpJE+ipqZnIFk56Xbv8ZnNXJQyNousayia+LFl76Lbs9bKnT1/KJAM
 dQ+/SxOlfmUZZmeEIP2ba0q1O2jrbAlWfC2YT2lEdMSUw5hhC+nZiAqWu0K9nx6mbFVZ
 Ks0QTRYaDMDnlMA1uIIMUWN7ZwyIglKti80MUG1fXEo4sDwo6nA8UzA7pavMGsvfjU/C
 AkcA==
X-Gm-Message-State: AO0yUKW9Niu/LSt78b9HZGZGYd/3M1Lz6UG1kWs2iwuAvhI1m9aURwcu
 tyRpMKuEVBuMc/gi5379aZPhHNHXShAHRDS9inT/riRobyg4qSBhFr8SNuiX0c9/giLsIqJujF9
 1TdlZahLh4IZVfYfIPRb27PV+ybE3fDM=
X-Received: by 2002:a5b:74a:0:b0:892:d8cc:cdc8 with SMTP id
 s10-20020a5b074a000000b00892d8cccdc8mr281993ybq.381.1675684387462; 
 Mon, 06 Feb 2023 03:53:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+yCtSO/UOiL/AzbPP9DJMJsKL8iJgqzNinfrwuZXFKJAk2cM9WSFKo3kzTgRJ3iPIwGeg5IdjOIzgok8Q4okQ=
X-Received: by 2002:a5b:74a:0:b0:892:d8cc:cdc8 with SMTP id
 s10-20020a5b074a000000b00892d8cccdc8mr281974ybq.381.1675684387087; Mon, 06
 Feb 2023 03:53:07 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAJaqyWd+g5fso6AEGKwj0ByxFVc8EpCS9+ezoMpnjyMo5tbj8Q@mail.gmail.com>
 <CAJSP0QXyO4qXJseMzbgsVdXK-4-W4U9DxPcxr6wX45d6VBTeWQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXyO4qXJseMzbgsVdXK-4-W4U9DxPcxr6wX45d6VBTeWQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 6 Feb 2023 12:52:30 +0100
Message-ID: <CAJaqyWczFwbxNWrZ8dcFHvYrV2=tH7Tv0Apf=qORT+gzDpBN4Q@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Florescu,
 Andreea" <fandree@amazon.com>, Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Sun, Feb 5, 2023 at 2:57 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Sun, 5 Feb 2023 at 03:15, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
> > On Fri, Jan 27, 2023 at 4:18 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > Dear QEMU, KVM, and rust-vmm communities,
> > > QEMU will apply for Google Summer of Code 2023
> > > (https://summerofcode.withgoogle.com/) and has been accepted into
> > > Outreachy May 2023 (https://www.outreachy.org/). You can now
> > > submit internship project ideas for QEMU, KVM, and rust-vmm!
> > >
> > > Please reply to this email by February 6th with your project ideas.
> > >
> > > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > > be a mentor. Mentors support interns as they work on their project. It's a
> > > great way to give back and you get to work with people who are just
> > > starting out in open source.
> > >
> > > Good project ideas are suitable for remote work by a competent
> > > programmer who is not yet familiar with the codebase. In
> > > addition, they are:
> > > - Well-defined - the scope is clear
> > > - Self-contained - there are few dependencies
> > > - Uncontroversial - they are acceptable to the community
> > > - Incremental - they produce deliverables along the way
> > >
> > > Feel free to post ideas even if you are unable to mentor the project.
> > > It doesn't hurt to share the idea!
> > >
> > > I will review project ideas and keep you up-to-date on QEMU's
> > > acceptance into GSoC.
> > >
> > > Internship program details:
> > > - Paid, remote work open source internships
> > > - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> > > hrs/week for 12 weeks
> > > - Mentored by volunteers from QEMU, KVM, and rust-vmm
> > > - Mentors typically spend at least 5 hours per week during the coding period
> > >
> > > For more background on QEMU internships, check out this video:
> > > https://www.youtube.com/watch?v=xNVCX7YMUL8
> > >
> > > Please let me know if you have any questions!
> > >
> > > Stefan
> > >
> >
> > Appending the different ideas here.
>
> Hi Eugenio,
> Thanks for sharing your project ideas. I have added some questions
> below before we add them to the ideas list wiki page.
>
> > VIRTIO_F_IN_ORDER feature support for virtio devices
> > ===
> > This was already a project the last year, and it produced a few series
> > upstream but was never merged. The previous series are totally useful
> > to start with, so it's not starting from scratch with them [1]:
>
> Has Zhi Guo stopped working on the patches?
>

I can ask him for sure.

> What is the state of the existing patches? What work remains to be done?
>

There are some pending comments from upstream. However if somebody
starts it from scratch it needs time to review some of the VirtIO
standard to understand the virtio in_order feature, both in split and
packed vq.


> >
> > Summary
> > ---
> > Implement VIRTIO_F_IN_ORDER in QEMU and Linux (vhost and virtio drivers)
> >
> > The VIRTIO specification defines a feature bit (VIRTIO_F_IN_ORDER)
> > that devices and drivers can negotiate when the device uses
> > descriptors in the same order in which they were made available by the
> > driver.
> >
> > This feature can simplify device and driver implementations and
> > increase performance. For example, when VIRTIO_F_IN_ORDER is
> > negotiated, it may be easier to create a batch of buffers and reduce
> > DMA transactions when the device uses a batch of buffers.
> >
> > Currently the devices and drivers available in Linux and QEMU do not
> > support this feature. An implementation is available in DPDK for the
> > virtio-net driver.
> >
> > Goals
> > ---
> > Implement VIRTIO_F_IN_ORDER for a single device/driver in QEMU and
> > Linux (virtio-net or virtio-serial are good starting points).
> > Generalize your approach to the common virtio core code for split and
> > packed virtqueue layouts.
> > If time allows, support for the packed virtqueue layout can be added
> > to Linux vhost, QEMU's libvhost-user, and/or QEMU's virtio qtest code.
> >
> > Shadow Virtqueue missing virtio features
> > ===
> >
> > Summary
> > ---
> > Some VirtIO devices like virtio-net have a control virtqueue (CVQ)
> > that allows them to dynamically change a number of parameters like MAC
> > or number of active queues. Changes to passthrough devices using vDPA
> > using CVQ are inherently hard to track if CVQ is handled as
> > passthrough data queues, because qemu is not aware of that
> > communication for performance reasons. In this situation, qemu is not
> > able to migrate these devices, as it is not able to tell the actual
> > state of the device.
> >
> > Shadow Virtqueue (SVQ) allows qemu to offer an emulated queue to the
> > device, effectively forwarding the descriptors of that communication,
> > tracking the device internal state, and being able to migrate it to a
> > new destination qemu.
> >
> > To restore that state in the destination, SVQ is able to send these
> > messages as regular CVQ commands. The code to understand and parse
> > virtio-net CVQ commands is already in qemu as part of its emulated
> > device, but the code to send the some of the new state is not, and
> > some features are missing. There is already code to restore basic
> > commands like mac or multiqueue, and it is easy to use it as a
> > template.
> >
> > Goals
> > ---
> > To implement missing virtio-net commands sending:
> > * VIRTIO_NET_CTRL_RX family, to control receive mode.
> > * VIRTIO_NET_CTRL_GUEST_OFFLOADS
> > * VIRTIO_NET_CTRL_VLAN family
> > * VIRTIO_NET_CTRL_MQ_HASH config
> > * VIRTIO_NET_CTRL_MQ_RSS config
>
> Is there enough work here for a 350 hour or 175 hour GSoC project?
>

I think 175 hour should fit better. If needed more features can be
added (packed vq, ring reset, etc), but to start contributing a 175
hour should work.

> The project description mentions "there is already code to restore
> basic commands like mac and multiqueue", please include a link.
>

MAC address was merged with ASID support so the whole series is more
complicated than it should be. Here is it the most relevant patch:
* https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00342.html

MQ is way cleaner in that regard, and future series should look more
similar to this one:
* https://www.mail-archive.com/qemu-devel@nongnu.org/msg906273.html

> > Shadow Virtqueue performance optimization
> > ===
> > Summary
> > ---
> > To perform a virtual machine live migration with an external device to
> > qemu, qemu needs a way to know which memory the device modifies so it
> > is able to resend it. Otherwise the guest would resume with invalid /
> > outdated memory in the destination.
> >
> > This is especially hard with passthrough hardware devices, as
> > transports like PCI imposes a few security and performance challenges.
> > As a method to overcome this for virtio devices, qemu can offer an
> > emulated virtqueue to the device, called Shadow Virtqueue (SVQ),
> > instead of allowing the device to communicate directly with the guest.
> > SVQ will then forward the writes to the guest, being the effective
> > writer in the guest memory and knowing when a portion of it needs to
> > be resent.
> >
> > As this is effectively breaking the passthrough and it adds extra
> > steps in the communication, this comes with a performance penalty in
> > some forms: Context switches, more memory reads and writes increasing
> > cache pressure, etc.
> >
> > At this moment the SVQ code is not optimized. It cannot forward
> > buffers in parallel using multiqueue and multithread, and it does not
> > use posted interrupts to notify the device skipping the host kernel
> > context switch (doorbells).
> >
> > The SVQ code requires minimal modifications for the multithreading,
> > and these are examples of multithreaded devices already like
> > virtio-blk which can be used as a template-alike. Regarding the posted
> > interrupts, DPDK is able to use them so that code can also be used as
> > a template.
> >
> > Goals
> > ---
> > * Measure the latest SVQ performance compared to non-SVQ.
>
> Which benchmark workload and which benchmarking tool do you recommend?
> Someone unfamiliar with QEMU and SVQ needs more details in order to
> know what to do.
>

In my opinion netperf (TCP_STREAM & TCP_RR) or iperf equivalent +
testpmd in AF_PACKET mode should test these scenarios better. But
maybe upstream requests additional testings. Feedback on this would be
appreciated actually.

My intention is not for the intern to develop new tests or anything
like that, they are just a means to justify the changes in SVQ. This
part would be very guided, or it can be offloaded from the project. So
if these tools are not enough descriptive maybe it's better to take
this out of the goals and add it to the description like that.

> > * Add multithreading to SVQ, extracting the code from the Big QEMU Lock (BQL).
>
> What do you have in mind? Allowing individual virtqueues to be
> assigned to IOThreads? Or processing all virtqueues in a single
> IOThread (like virtio-blk and virtio-scsi do today)?
>

My idea was to use iothreads. I thought virtio-blk and virtio-scsi
were done that way actually, is there a reason / advantage to use just
a single iothread?

> > * Add posted thread capabilities to QEMU, following the model of DPDK to it.
>
> What is this about? I thought KVM uses posted interrupts when
> available, so what needs to be done here? Please also include a link
> to the relevant DPDK code.
>

The guest in KVM may use posted interrupts but SVQ code runs in
userland qemu :). There were no previous uses of HW posted interrupts
as far as I know so SVQ is only able to use vhost-vdpa kick eventfds
to notify queues. This has a performance penalty in the form of host
kernel context switches.

If I'm not wrong this patch adds it to DPDK, but I may be missing
additional context or versions:
* https://lore.kernel.org/all/1579539790-3882-31-git-send-email-matan@mellanox.com/

Please let me know if you need further information. Thanks!



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83559548866
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 18:01:16 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mV9-0007d1-J9
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 12:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0mT5-0006b2-GO
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o0mT1-0003q2-RI
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655135942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1mEctCWYPdjfe5QrbYN/quHmrkRjkjL2LVlSgc7A3I=;
 b=VTN6qyM4+0SjJd9qsDHtKDegWhqZrYTbX5rHDV0dUBlATxyWZj/wsNorpSxEtFtY2G1i6p
 cEbFrbrmDn7KNZ+fuq9KIGCdfaxEhVCwRPgssLNv0i+F7pIUlslxyJp3HZtWSyIevcZqqz
 FNhjmWiwgSAb+ZLMvxnl711aWkMG/9s=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-POR-VP16NBOqUalR3OdSow-1; Mon, 13 Jun 2022 11:59:01 -0400
X-MC-Unique: POR-VP16NBOqUalR3OdSow-1
Received: by mail-io1-f70.google.com with SMTP id
 k4-20020a6b4004000000b006697f6074e6so2891013ioa.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 08:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n1mEctCWYPdjfe5QrbYN/quHmrkRjkjL2LVlSgc7A3I=;
 b=VgPgrae6u/imrGTle9H3WVvSNYTlLOSLdqxuPql6VHRuv2XEZqA888q/07UL7BBgUA
 sJGM1HNC++WjV+oRr31XetYv9QCO+tUYjv5pPSmhxJriqCFyByqxLZnzzQ97VyTyA6lr
 nItPHvvUYtiDNGUsRlJS6wLEVJU72jH/n8pwchBdPbJYOA9sjGdeeHckrQP2yFaXx+kv
 WXNTnadTn4fJHAWGbLXn/+met4Qd6BDQ+5cfxiwaTSNGAY+GJ3UTjH5bb63xBUlTkODX
 mIob7XocAwviLZ/T4Gkd9iUYIrgJ5IowZJ9/NvDOvGUtuf9JZH1MVLw5MpIsCFMEUtCp
 NE1Q==
X-Gm-Message-State: AOAM530GTEIhCK5I5nqssq0uGyapGhCrjFjo7zY8uBvYoiFsin8Gu0AK
 x+eHWKO1WA0+vnAhjL5jc2MBkH0iTNjEaf1cc1WJ5K5RO+dRzn9msvbMtvwjv2xWvwzCofkWcUm
 j6949D8lxAO2P/Yw=
X-Received: by 2002:a05:6638:4982:b0:332:79b:1dee with SMTP id
 cv2-20020a056638498200b00332079b1deemr279046jab.290.1655135940498; 
 Mon, 13 Jun 2022 08:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMDL9usnTpuX9IQZVSY1PcfHgy2WWVXxHfDs5MU0QY+BE7fS8VEVEF51l8lGxcfQYBgqhbuw==
X-Received: by 2002:a05:6638:4982:b0:332:79b:1dee with SMTP id
 cv2-20020a056638498200b00332079b1deemr279030jab.290.1655135940248; 
 Mon, 13 Jun 2022 08:59:00 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a02cbc7000000b003315d11b825sm3637563jaq.13.2022.06.13.08.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 08:58:59 -0700 (PDT)
Date: Mon, 13 Jun 2022 11:58:57 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Jason Wang <jasowang@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
Message-ID: <YqdewVr/PujCuYW2@xz-m1.local>
References: <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
 <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
 <3cac02a4-5c2a-362d-4035-e82d66097107@nutanix.com>
 <YqdKsNEkWsS3XDvf@xz-m1.local>
 <2081c641-80ea-00a9-b42d-3ef4cbf6b387@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2081c641-80ea-00a9-b42d-3ef4cbf6b387@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 09:03:24PM +0530, manish.mishra wrote:
> 
> On 13/06/22 8:03 pm, Peter Xu wrote:
> > On Mon, Jun 13, 2022 at 03:28:34PM +0530, manish.mishra wrote:
> > > On 26/05/22 8:21 am, Jason Wang wrote:
> > > > On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
> > > > > On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
> > > > > > > 2. Also this algorithm only control or limits dirty rate by guest
> > > > > > > writes. There can be some memory dirtying done by virtio based devices
> > > > > > > which is accounted only at qemu level so may not be accounted through
> > > > > > > dirty rings so do we have plan for that in future? Those are not issue
> > > > > > > for auto-converge as it slows full VM but dirty rate limit only slows
> > > > > > > guest writes.
> > > > > > > 
> > > > > >   From the migration point of view, time spent on migrating memory is far
> > > > > > greater than migrating devices emulated by qemu. I think we can do that when
> > > > > > migrating device costs the same magnitude time as migrating memory.
> > > > > > 
> > > > > > As to auto-converge, it throttle vcpu by kicking it and force it to sleep
> > > > > > periodically. The two seems has no much difference from the perspective of
> > > > > > internal method but the auto-converge is kind of "offensive" when doing
> > > > > > restraint. I'll read the auto-converge implementation code and figure out
> > > > > > the problem you point out.
> > > > > This seems to be not virtio-specific, but can be applied to any device DMA
> > > > > writting to guest mem (if not including vfio).  But indeed virtio can be
> > > > > normally faster.
> > > > > 
> > > > > I'm also curious how fast a device DMA could dirty memories.  This could be
> > > > > a question to answer to all vcpu-based throttling approaches (including the
> > > > > quota based approach that was proposed on KVM list).  Maybe for kernel
> > > > > virtio drivers we can have some easier estimation?
> > > > As you said below, it really depends on the speed of the backend.
> > > > 
> > > > >    My guess is it'll be
> > > > > much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
> > > > > could use a large chunk of guest mem.
> > > > Probably, for vhost-user backend, it could be ~20Mpps or even higher.
> > > Sorry for late response on this. We did experiment with IO on virtio-scsi based disk.
> > Thanks for trying this and sharing it out.
> > 
> > > We could see dirty rate of ~500MBps on my system and most of that was not tracked
> > > 
> > > as kvm_dirty_log. Also for reference i am attaching test we used to avoid tacking
> > > 
> > > in KVM. (as attached file).
> > The number looks sane as it seems to be the sequential bandwidth for a
> > disk, though I'm not 100% sure it'll work as expected since you mmap()ed
> > the region with private pages rather than shared, so after you did I'm
> > wondering whether below will happen (also based on the fact that you mapped
> > twice the size of guest mem as you mentioned in the comment):
> > 
> >    (1) Swap out will start to trigger after you read a lot of data into the
> >        mem already, then old-read pages will be swapped out to disk (and
> >        hopefully the swap device does not reside on the same virtio-scsi
> >        disk or it'll be even more complicated scenario of mixture IOs..),
> >        meanwhile when you finish reading a round and start to read from
> >        offset 0 swap-in will start to happen too.  Swapping can slow down
> >        things already, and I'm wondering whether the 500MB/s was really
> >        caused by the swapout rather than backend disk reads.  More below.
> > 
> >    (2) Another attribute of private pages AFAICT is after you read it once
> >        it does not need to be read again from the virtio-scsi disks.  In
> >        other words, I'm thinking whether starting from the 2nd iteration
> >        your program won't trigger any DMA at all but purely torturing the
> >        swap device.
> > 
> > Maybe changing MAP_PRIVATE to MAP_SHARED can emulate better on what we want
> > to measure, but I'm also not 100% sure on whether it could be accurate..
> > 
> > Thanks,
> > 
> Thanks Peter, Yes agree MAP_SHARED should be used here, sorry i missed that 😁.
> 
> Yes, my purpose of taking file size larger than RAM_SIZE was to cause
> 
> frequent page cache flush and re-populating page-cache pages, not to
> 
> trigger swaps. I checked on my VM i had swapping disabled, may be
> 
> MAP_PRIVATE did not make difference because it was read-only.

Makes sense. And yeah I overlooked the RO part - indeed page cache will be
used for RO pages as long as never written.  So it'll behave like shared.

Otherwise for a swap-all-off you should have have hit OOM anyway and the
process probably will get killed sooner or later. :)

> 
> I tested again with MAP_SHARED it comes around ~500MBps.

Makes sense.  I'd guess that's the limitation of the virtio-scsi backend,
IOW the logical limitation of device dirtying memory could be unlimited
(e.g., when we put the virtio backend onto a ramdisk).

-- 
Peter Xu



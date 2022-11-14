Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12E628F2F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik1-0004jR-IX; Mon, 14 Nov 2022 18:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouiek-0002SL-8d
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oucz5-0003Ly-HN
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668445858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zserY8lvCmdE7soYociT6MixwEHGuXgnLooq83r2ZE=;
 b=Fp08ZfswU4+Az1cJA5xihi4ngLvNdpnsOcwkRRDABMOrT/Dq5dwjdAyvttylxgYO1WyqWJ
 8Qd4A5AD+FuTOyZq7UagtV7dM13Ody4eQsoebJ5KKaOTca4XFylI9Zy+cDtPzwPdxjfXq0
 ahFo1/HqRfb/uJHS97ei/SeVxlFQ4cg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-DeVDWfpDP-CvwZVyNqKqmg-1; Mon, 14 Nov 2022 12:10:57 -0500
X-MC-Unique: DeVDWfpDP-CvwZVyNqKqmg-1
Received: by mail-qk1-f200.google.com with SMTP id
 i17-20020a05620a249100b006fa2e10a2ecso11533023qkn.16
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 09:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zserY8lvCmdE7soYociT6MixwEHGuXgnLooq83r2ZE=;
 b=dlHeqskYfH5kpZhuEVpzj5BuzQOBWUGFPC8QMT1rxr3wAao0DZpGM8EjeEL248vQLZ
 Ko4pndxnqEIkFHcG4d1p4YvKsWNBRL11jh6bQIHBBaug9SJPkBPwDEsWXTnN9anYtL47
 lxZrFfB+oR7G9XfVBeG5PZQxjHmokQy3C+sW/8yeLSlSJA7PsNWJjbFqFAFSU7AfRUnS
 XvgZG8yiRDlEx4OG6e4xeaGreCyn+TN13Q7q55mHDnoP4RxOadwRtsR8DUEIy69onLBD
 9GOxAax1KPBoYZL78PGo81yIvGguaIW/qd8zTKk9TK0vX3jcsd+A4VYqfwgF+Z9QtYa5
 Staw==
X-Gm-Message-State: ANoB5plWgGu6LXg033XdRGqXyRyaptXpxmghCnh2CyNuAYuSgx9HyRwL
 dESOwSkP2WnbyGYCZoDVTVjDdqDRDNjCkYrLvuvdTdwxQ6cVS4b7VIXHWWkHmxtFDNN4u7eOVIc
 8TR6EDTuprCKeoG8=
X-Received: by 2002:a05:620a:1d4e:b0:6fa:b06:bd82 with SMTP id
 dm14-20020a05620a1d4e00b006fa0b06bd82mr12311736qkb.10.1668445856649; 
 Mon, 14 Nov 2022 09:10:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6jEiMVEpPzaJ4pqJOa1dek+WCMVON5y2ZygRr5vi9gGnIj/BpcJvag3RnBuhZMHQdaC6qRRQ==
X-Received: by 2002:a05:620a:1d4e:b0:6fa:b06:bd82 with SMTP id
 dm14-20020a05620a1d4e00b006fa0b06bd82mr12311702qkb.10.1668445856347; 
 Mon, 14 Nov 2022 09:10:56 -0800 (PST)
Received: from redhat.com ([37.19.196.93]) by smtp.gmail.com with ESMTPSA id
 h19-20020ac87453000000b003a5612c3f28sm5905802qtr.56.2022.11.14.09.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:10:55 -0800 (PST)
Date: Mon, 14 Nov 2022 12:10:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221114115549-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
> 
> 
> Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
> > On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
> > > Am 08.11.22 um 10:23 schrieb Alex Bennée:
> > > > The previous fix to virtio_device_started revealed a problem in its
> > > > use by both the core and the device code. The core code should be able
> > > > to handle the device "starting" while the VM isn't running to handle
> > > > the restoration of migration state. To solve this dual use introduce a
> > > > new helper for use by the vhost-user backends who all use it to feed a
> > > > should_start variable.
> > > > 
> > > > We can also pick up a change vhost_user_blk_set_status while we are at
> > > > it which follows the same pattern.
> > > > 
> > > > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > 
> > > Hmmm, is this
> > > commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> > > Author:     Alex Bennée <alex.bennee@linaro.org>
> > > AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> > > Commit:     Michael S. Tsirkin <mst@redhat.com>
> > > CommitDate: Mon Nov 7 14:08:18 2022 -0500
> > > 
> > >      hw/virtio: introduce virtio_device_should_start
> > > 
> > > and older version?
> > 
> > This is what got merged:
> > https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
> > This patch was sent after I merged the RFC.
> > I think the only difference is the commit log but I might be missing
> > something.
> > 
> > > This does not seem to fix the regression that I have reported.
> > 
> > This was applied on top of 9f6bcfd99f which IIUC does, right?
> > 
> > 
> 
> QEMU master still fails for me for suspend/resume to disk:
> 
> #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
> #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
> #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
> #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
> #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
> #5  0x000002aa1ffa8966 in vhost_vsock_common_pre_save (opaque=<optimized out>) at ../hw/virtio/vhost-vsock-common.c:203
> #6  0x000002aa1fe5e0ee in vmstate_save_state_v
>     (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0 <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8, vmdesc=vmdesc@entry=0x3fddc08eb30, version_id=version_id@entry=0) at ../migration/vmstate.c:329
> #7  0x000002aa1fe5ebf8 in vmstate_save_state (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>, opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30) at ../migration/vmstate.c:317
> #8  0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170, se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at ../migration/savevm.c:908
> #9  0x000002aa1fe79584 in qemu_savevm_state_complete_precopy_non_iterable (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false, inactivate_disks=inactivate_disks@entry=true)
>     at ../migration/savevm.c:1393
> #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true) at ../migration/savevm.c:1459
> #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
> #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
> #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
> #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
> #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
> #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
> 
> Michael, your previous branch did work if I recall correctly.

That one was failing under github CI though (for reasons we didn't
really address, such as disconnect during stop causing a recursive
call to stop, but there you are).

-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA3628E6E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijk-0004AD-C2; Mon, 14 Nov 2022 18:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouied-00025D-Pl
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oud8h-0007Yn-8s
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668446454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1h4vHokMBRV7qptmUGZ/f1RehjlT29ynWiebRMTn0tc=;
 b=NYY60f9bieriBOSU4CxcGm8GPMe1tDCsfedKcbqgSNqN2dC59k5+VaJi7/aHh5tgC00wP2
 99PReOjk/MDRRJjNzje1VPy8YzRdjBwlRdlwQg62u5M+wOM4OV8J/nfc8BVRSJdHicRztE
 Xqz+xFja0SOdyF9Dz4HSNaJYZy4M+g4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-RHjn5F5jMSiZgXWCqNXBCQ-1; Mon, 14 Nov 2022 12:20:51 -0500
X-MC-Unique: RHjn5F5jMSiZgXWCqNXBCQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 mb6-20020a056214550600b004bc0f14f7b2so8739326qvb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 09:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1h4vHokMBRV7qptmUGZ/f1RehjlT29ynWiebRMTn0tc=;
 b=2Te75GDVAiKyJQ7KeYNLgzo4ZplrNU9Mk3uW2XZdqf3etiGz3QT6clA5s2inMF9alZ
 17PIZFvfHHQZrgk1s4aWFFCMdHWvlBhYrig6vgkBPm71gtSvBcdPQNnlvPyC9YZL/5P3
 WmEv9K4HfEHGY4kfViZkrjXGFHFZeHinXPGzr0QKbMF+SiO06SKOaWtf7/1FYjnsa4P+
 WsO/hSSSfnSeA8puwlwjmtIIvTQ/Xmbhqtm1tENU9T/5hVV0kreeuedfJyJSDkluZks4
 eTZPB2Pwqzc4YY2ZgH/1JBlvHrp1Okfo9q3SyFnJUU+XSkZ9klECC0txQ/pK7KdFbpbV
 fiyA==
X-Gm-Message-State: ANoB5plVgNiw7/IOmThAdejpohTOAsC92D7PaEPnWyveWliXGdOFPA/N
 Ol8KqxKMYixImS9yb4zFNWLKNRdKeyLz6VTqJ2rL5RK5+FQikKMTFIgDZvzzYpUHqEnqn3/hN5C
 BVew/o+9NYlw/vcc=
X-Received: by 2002:a05:6214:4498:b0:4b1:ae16:ee41 with SMTP id
 on24-20020a056214449800b004b1ae16ee41mr13651984qvb.0.1668446449960; 
 Mon, 14 Nov 2022 09:20:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5+NpN21lRA2dlBsUi93ALLZQF4mOxcJ7B+mX+gSLNrfsUHBzH5zcoesSR77YgLP2mfvfQsMQ==
X-Received: by 2002:a05:6214:4498:b0:4b1:ae16:ee41 with SMTP id
 on24-20020a056214449800b004b1ae16ee41mr13651968qvb.0.1668446449712; 
 Mon, 14 Nov 2022 09:20:49 -0800 (PST)
Received: from redhat.com ([37.19.196.93]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05620a409000b006bb78d095c5sm6836501qko.79.2022.11.14.09.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:20:49 -0800 (PST)
Date: Mon, 14 Nov 2022 12:20:42 -0500
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
Message-ID: <20221114121959-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
> 
> 
> Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
> > On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
> > > 
> > > 
> > > Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
> > > > On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
> > > > > Am 08.11.22 um 10:23 schrieb Alex Bennée:
> > > > > > The previous fix to virtio_device_started revealed a problem in its
> > > > > > use by both the core and the device code. The core code should be able
> > > > > > to handle the device "starting" while the VM isn't running to handle
> > > > > > the restoration of migration state. To solve this dual use introduce a
> > > > > > new helper for use by the vhost-user backends who all use it to feed a
> > > > > > should_start variable.
> > > > > > 
> > > > > > We can also pick up a change vhost_user_blk_set_status while we are at
> > > > > > it which follows the same pattern.
> > > > > > 
> > > > > > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > > > > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > > 
> > > > > Hmmm, is this
> > > > > commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> > > > > Author:     Alex Bennée <alex.bennee@linaro.org>
> > > > > AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> > > > > Commit:     Michael S. Tsirkin <mst@redhat.com>
> > > > > CommitDate: Mon Nov 7 14:08:18 2022 -0500
> > > > > 
> > > > >       hw/virtio: introduce virtio_device_should_start
> > > > > 
> > > > > and older version?
> > > > 
> > > > This is what got merged:
> > > > https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
> > > > This patch was sent after I merged the RFC.
> > > > I think the only difference is the commit log but I might be missing
> > > > something.
> > > > 
> > > > > This does not seem to fix the regression that I have reported.
> > > > 
> > > > This was applied on top of 9f6bcfd99f which IIUC does, right?
> > > > 
> > > > 
> > > 
> > > QEMU master still fails for me for suspend/resume to disk:
> > > 
> > > #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
> > > #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
> > > #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
> > > #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
> > > #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
> > > #5  0x000002aa1ffa8966 in vhost_vsock_common_pre_save (opaque=<optimized out>) at ../hw/virtio/vhost-vsock-common.c:203
> > > #6  0x000002aa1fe5e0ee in vmstate_save_state_v
> > >      (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0 <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8, vmdesc=vmdesc@entry=0x3fddc08eb30, version_id=version_id@entry=0) at ../migration/vmstate.c:329
> > > #7  0x000002aa1fe5ebf8 in vmstate_save_state (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>, opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30) at ../migration/vmstate.c:317
> > > #8  0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170, se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at ../migration/savevm.c:908
> > > #9  0x000002aa1fe79584 in qemu_savevm_state_complete_precopy_non_iterable (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false, inactivate_disks=inactivate_disks@entry=true)
> > >      at ../migration/savevm.c:1393
> > > #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true) at ../migration/savevm.c:1459
> > > #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
> > > #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
> > > #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
> > > #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
> > > #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
> > > #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
> > > 
> > > Michael, your previous branch did work if I recall correctly.
> > 
> > That one was failing under github CI though (for reasons we didn't
> > really address, such as disconnect during stop causing a recursive
> > call to stop, but there you are).
> Even the double revert of everything?

I don't remember at this point.

> So how do we proceed now?

I'm hopeful Alex will come up with a fix.

-- 
MST



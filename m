Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AB6293E0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ourtw-0005fw-NG; Tue, 15 Nov 2022 04:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oursw-0005PB-8W
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:05:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oursZ-0000RO-82
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668503114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdK7EXxyE13Z5sIlLW7nvKsJiG/CDN0lb0pOWJ7v+ew=;
 b=c57WBy/gMdtx1o+74ORnwJT9QRElvSr/8/RSoYioj9ZTjZlCdrnEjddWlBpknBF3vl3x5G
 65BnT8eASkneU71mhYpE9VSUdYgPecxTZQ3YFEhnlESXBVXhDdheC3R/8zI1Er2omHGCb8
 sIeuCis5wXQ6m+ImN6O6O8ZeRUqYff8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-s1Pp7aUdMEOHKQ5w8AicqQ-1; Tue, 15 Nov 2022 04:05:12 -0500
X-MC-Unique: s1Pp7aUdMEOHKQ5w8AicqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so3550553wme.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 01:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hdK7EXxyE13Z5sIlLW7nvKsJiG/CDN0lb0pOWJ7v+ew=;
 b=ZYwgr0rbHpASzVGzj141t5XEHWVEA9mtN3Bp2ycsSwi4ssne+l1gxS2fPBNdxqiuTw
 CUYoDwVATM5hTi4AmQCMabN5d7romRXRv0g3M/0VkDM+gNq6w0exJFE8CIkZZk9xnz4F
 HZwWWlh31Jr86ODzRq6q2f9jQHwAkJLPCUu3QqwtSaTc5ie9cxSGvEdYW7e4k0Wd+Djl
 zakJc+pZ9SF8yDMkdMLR8zQwCJ4lEDKxQfK1A4YbCRCvvkPQJGcU4j1vEJxRf7Dly7gf
 W6YvfBg2DDv+/OMdfJ/q5U9oQCVzGwM2r3mcrbBjakYPznVoiBvKTqacHNV9PH3XV6Qb
 eyCg==
X-Gm-Message-State: ANoB5pk1QsnmUa2G/Onv9z85wQG+wVeXOGFvqg9J1LG5TMU4I2MP5P9W
 Gy9B0wba3UWkZjq+fmGSl17LiFhHf8nmA4qZnKGtFvujLS0ftz6dkLNVGqF7tG318PA3VzrW0Jc
 +S/E3aIgDhWvB7U0=
X-Received: by 2002:adf:d846:0:b0:236:73af:f9ae with SMTP id
 k6-20020adfd846000000b0023673aff9aemr10045047wrl.344.1668503111039; 
 Tue, 15 Nov 2022 01:05:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7P8AmOBix7ELh/YoRP45r3l73eb1CbYA1omk1uRbXvrLAOc8y5yv4aTZdg8xqLcYhTpPGpiQ==
X-Received: by 2002:adf:d846:0:b0:236:73af:f9ae with SMTP id
 k6-20020adfd846000000b0023673aff9aemr10045018wrl.344.1668503110676; 
 Tue, 15 Nov 2022 01:05:10 -0800 (PST)
Received: from redhat.com ([2.52.131.207]) by smtp.gmail.com with ESMTPSA id
 n10-20020adff08a000000b002368f6b56desm13970966wro.18.2022.11.15.01.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 01:05:09 -0800 (PST)
Date: Tue, 15 Nov 2022 04:05:05 -0500
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
Message-ID: <20221115035522-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
 <20221114121959-mutt-send-email-mst@kernel.org>
 <69fbc17f-cd78-a849-f7fc-31f8b3945ded@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fbc17f-cd78-a849-f7fc-31f8b3945ded@linux.ibm.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 15, 2022 at 09:18:27AM +0100, Christian Borntraeger wrote:
> 
> Am 14.11.22 um 18:20 schrieb Michael S. Tsirkin:
> > On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
> > > 
> > > 
> > > Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
> > > > On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
> > > > > 
> > > > > 
> > > > > Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
> > > > > > On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
> > > > > > > Am 08.11.22 um 10:23 schrieb Alex Bennée:
> > > > > > > > The previous fix to virtio_device_started revealed a problem in its
> > > > > > > > use by both the core and the device code. The core code should be able
> > > > > > > > to handle the device "starting" while the VM isn't running to handle
> > > > > > > > the restoration of migration state. To solve this dual use introduce a
> > > > > > > > new helper for use by the vhost-user backends who all use it to feed a
> > > > > > > > should_start variable.
> > > > > > > > 
> > > > > > > > We can also pick up a change vhost_user_blk_set_status while we are at
> > > > > > > > it which follows the same pattern.
> > > > > > > > 
> > > > > > > > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > > > > > > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> > > > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > > > > 
> > > > > > > Hmmm, is this
> > > > > > > commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> > > > > > > Author:     Alex Bennée <alex.bennee@linaro.org>
> > > > > > > AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> > > > > > > Commit:     Michael S. Tsirkin <mst@redhat.com>
> > > > > > > CommitDate: Mon Nov 7 14:08:18 2022 -0500
> > > > > > > 
> > > > > > >        hw/virtio: introduce virtio_device_should_start
> > > > > > > 
> > > > > > > and older version?
> > > > > > 
> > > > > > This is what got merged:
> > > > > > https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
> > > > > > This patch was sent after I merged the RFC.
> > > > > > I think the only difference is the commit log but I might be missing
> > > > > > something.
> > > > > > 
> > > > > > > This does not seem to fix the regression that I have reported.
> > > > > > 
> > > > > > This was applied on top of 9f6bcfd99f which IIUC does, right?
> > > > > > 
> > > > > > 
> > > > > 
> > > > > QEMU master still fails for me for suspend/resume to disk:
> > > > > 
> > > > > #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
> > > > > #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
> > > > > #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
> > > > > #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
> > > > > #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
> > > > > #5  0x000002aa1ffa8966 in vhost_vsock_common_pre_save (opaque=<optimized out>) at ../hw/virtio/vhost-vsock-common.c:203
> > > > > #6  0x000002aa1fe5e0ee in vmstate_save_state_v
> > > > >       (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0 <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8, vmdesc=vmdesc@entry=0x3fddc08eb30, version_id=version_id@entry=0) at ../migration/vmstate.c:329
> > > > > #7  0x000002aa1fe5ebf8 in vmstate_save_state (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>, opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30) at ../migration/vmstate.c:317
> > > > > #8  0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170, se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at ../migration/savevm.c:908
> > > > > #9  0x000002aa1fe79584 in qemu_savevm_state_complete_precopy_non_iterable (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false, inactivate_disks=inactivate_disks@entry=true)
> > > > >       at ../migration/savevm.c:1393
> > > > > #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true) at ../migration/savevm.c:1459
> > > > > #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
> > > > > #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
> > > > > #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
> > > > > #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
> > > > > #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
> > > > > #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
> > > > > 
> > > > > Michael, your previous branch did work if I recall correctly.
> > > > 
> > > > That one was failing under github CI though (for reasons we didn't
> > > > really address, such as disconnect during stop causing a recursive
> > > > call to stop, but there you are).
> > > Even the double revert of everything?
> > 
> > I don't remember at this point.
> > 
> > > So how do we proceed now?
> > 
> > I'm hopeful Alex will come up with a fix.
> 
> 
> The initial fix changed to qemu/master does still work for me
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbfc6..fb3072838119 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -411,14 +411,14 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>   */
>  static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
>  {
> -    if (vdev->use_started) {
> -        return vdev->started;
> -    }
> -
>      if (!vdev->vm_running) {
>          return false;
>      }
> +    if (vdev->use_started) {
> +        return vdev->started;
> +    }
> +
>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>  }

Hmm this makes sense to me. And with the new API the
follout should be minimal. Let's see how it behaves on github.
It would be nice to fix the recursive stop problem properly
too but I"m not optimistic on that for this release.

-- 
MST



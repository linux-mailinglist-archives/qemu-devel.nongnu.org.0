Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF662975B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouu5Z-0006kp-KC; Tue, 15 Nov 2022 06:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouu4v-0006YT-9p
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouu4r-0005HM-3k
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668511562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K32805fhnlsuHTr2apmTf31Em7Sa1rsYkvyEzlhm7RE=;
 b=U2gSNS7ElUoeRfrI5idliQL7THZ92JfN5dxoTMJnMo7mQz420blkz6S7s6irxMw1TO7JXC
 viFGa4JJuP3pBQ6PhJphPBlxBMv1EAXPF2SJG6lSTU9H6pkBVeSNvS2qfBR5hdaKi0lODv
 76C4A/0F/gu5PQXcehAozWyo1bmdKXw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-Ky93JELnPfyXz4MLgMrTPQ-1; Tue, 15 Nov 2022 06:26:01 -0500
X-MC-Unique: Ky93JELnPfyXz4MLgMrTPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x17-20020adfbb51000000b0024182561cb2so1396967wrg.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K32805fhnlsuHTr2apmTf31Em7Sa1rsYkvyEzlhm7RE=;
 b=XcwhMwNTBwMBdyIXaFnSLuVjD/WZoayqPzQZ3JCYUTozN3PdJS9rRrwDDbfj2R3BrI
 Rk/DEjegNdpnVLeeTibheapVwmvk63RJf7sMeT+Gt0Xow0/uEyc8qp+nKDXSEE7fcq6J
 B+IJgByD8IzhtuqBiDQlL6n0vhjPtsajIjpm4IP9yb+27jEaa5VxU4jX82QDSPMyxBNR
 60oR/qRhKNlKZnbeI5dhp0FHO1GtuBqUympqP2CTcxFRHc9vA3d3XGiFQH2BH80QzSpU
 K4pJOA74V3vrc/wLoZp0sHv5rTdJI87qccGiDznyzziKHShs/pHwIwYj0TdcBZ1fPFCg
 H1jw==
X-Gm-Message-State: ANoB5pmD1n8YjtEenrXobb8EgJGo1tnHUoRDNj07vvCTecbMfbQ4y32T
 2/DkTczkSGGApZD3n9d0EmC5Lt3ctHtTMdz62DIU6wQ3KHo7rdLsORhBwQp8ZJMUJ4RMe65AgpZ
 cwlRh6o3ujnkRUs4=
X-Received: by 2002:a05:600c:1c92:b0:3cf:7b65:76c5 with SMTP id
 k18-20020a05600c1c9200b003cf7b6576c5mr1097866wms.166.1668511558962; 
 Tue, 15 Nov 2022 03:25:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Psg56BduG9t9pNK197l8z6PM7gR8S3GQma85utyd4H26eugPDblUIq3dkZtbXNFlaoNMmdg==
X-Received: by 2002:a05:600c:1c92:b0:3cf:7b65:76c5 with SMTP id
 k18-20020a05600c1c9200b003cf7b6576c5mr1097850wms.166.1668511558661; 
 Tue, 15 Nov 2022 03:25:58 -0800 (PST)
Received: from redhat.com ([2.52.131.207]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003a6125562e1sm16454907wmq.46.2022.11.15.03.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 03:25:58 -0800 (PST)
Date: Tue, 15 Nov 2022 06:25:54 -0500
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
Message-ID: <20221115062535-mutt-send-email-mst@kernel.org>
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

Triggers failure on gitlab unfortunately:

https://gitlab.com/mstredhat/qemu/-/jobs/3323768122

-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC1525F95
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:11:08 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSGI-0004ag-7H
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npS8f-0004O1-6N
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npS8d-0007Qi-4V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652436189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ed6IrVKI27fjKKxSmivdDOZo8sEPoHgpWxYye4qPpt0=;
 b=bCDP9lqg5THNZmmRSeUmYPildbFLd/2xOC7J4jiKIZqv9zI3SN341cqdX786v1F2+F/GKG
 vR4TElcVGQom2KfZptZPFjJ2BvKAZ1x8jO3T5vGyx+D0YhPn2WnyPGOgTKRMb/FSNQLsAk
 CdVXHfRbHlSpS/cQ5qER9UrWT+tvcDg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-_OWMOCS0N5-P-8JFJUSXEg-1; Fri, 13 May 2022 06:03:07 -0400
X-MC-Unique: _OWMOCS0N5-P-8JFJUSXEg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v16-20020adfd190000000b0020c8fb5106dso2752028wrc.19
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ed6IrVKI27fjKKxSmivdDOZo8sEPoHgpWxYye4qPpt0=;
 b=OpeSjPkPM5ltdmacmGOVJZ0ZDoUyvMnA6PrIeo4BWTiOUSeBo/tcl6EX82KffavPoy
 ZbZ4uPT6MKs2K0U3O8epX54gwft6QOXDWPuuylBeH6YmAdYs+G0aRoEzwoNnhoxfoLJY
 l83Do7hdI79pHl0qywYX66+ZUFRPUIq40QWdDg8Xtaq+iZbFyPyAl7azA6uPopMx5UG1
 xGApCmG9vKb4vybXn2m9ctnuEiGWvf2o1jOeSnS2cnVysDpRVbppXH0mD0Q/AF74aJTl
 CW81ccBxwaBGixC3ORDu4tHoL0ZjsyoaY3Jc6NSeTDSv0rLsjvKIw0ZHnteaH9AsGNR6
 HmGg==
X-Gm-Message-State: AOAM532etKGP359/nn2pobI2T1Z3+xapHvCGWxncIXuq6Lg34ZxRt0v2
 yllXjMmXDvTliP9NpgbHccLabikfSbmIEkHmTt+YR8PHI9vgB7/Y9IV64pMf8yjdLx3SLXj3YSb
 UGIWhVOnYw2VpMaI=
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id
 i13-20020a0560001acd00b0020c811c9f39mr3212631wry.482.1652436186595; 
 Fri, 13 May 2022 03:03:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt+K7Gej/Lskeyofw2csSXUsIrs8SBtBrKB8r+2YMcJRdFJYklONuf8AeylpAXYEkmtg/lwA==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id
 i13-20020a0560001acd00b0020c811c9f39mr3212596wry.482.1652436186283; 
 Fri, 13 May 2022 03:03:06 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfc68a000000b0020c635ca28bsm1722333wrg.87.2022.05.13.03.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 03:03:05 -0700 (PDT)
Date: Fri, 13 May 2022 06:03:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: jasowang@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 0/8] Support exporting BDSs via VDUSE
Message-ID: <20220513060205-mutt-send-email-mst@kernel.org>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 04, 2022 at 03:40:43PM +0800, Xie Yongji wrote:
> Hi all,
> 
> Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
> been merged into Linux kernel as a framework that make it
> possible to emulate a vDPA device in userspace. This series
> aimed at implementing a VDUSE block backend based on the
> qemu-storage-daemon infrastructure.
> 
> To support that, we firstly introduce a VDUSE library as a
> subproject (like what libvhost-user does) to help implementing
> VDUSE backends in QEMU. Then a VDUSE block export is implemented
> based on this library. At last, we add resize and reconnect support
> to the VDUSE block export and VDUSE library.
> 
> Since we don't support vdpa-blk in QEMU currently, the VM case is
> tested with my previous patchset [2].
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> 
> Please review, thanks!

This needs review by storage maintainers.

> V4 to V5:
> - Abstract out the logic for virito-blk I/O process from
>   vhost-user-blk-server and reuse it [Kevin]
> - Fix missing VIRTIO_BLK_F_FLUSH [Kevin]
> - Support discard and write_zeroes [Kevin]
> - Rebase to the newest tree
> 
> V3 to V4:
> - Fix some comments on QAPI [Eric]
> 
> V2 to V3:
> - Introduce vduse_get_virtio_features() [Stefan]
> - Update MAINTAINERS file [Stefan]
> - Fix handler of VIRTIO_BLK_T_GET_ID request [Stefan]
> - Add barrier for vduse_queue_inflight_get() [Stefan]
> 
> V1 to V2:
> - Move vduse header to linux-headers [Stefan]
> - Add two new API to support creating device from /dev/vduse/$NAME or
>   file descriptor [Stefan]
> - Check VIRTIO_F_VERSION_1 during intialization [Stefan]
> - Replace malloc() + memset to calloc() [Stefan]
> - Increase default queue size to 256 for vduse-blk [Stefan]
> - Zero-initialize virtio-blk config space [Stefan]
> - Add a patch to support reset blk->dev_ops
> - Validate vq->log->inflight fields [Stefan]
> - Add vduse_set_reconnect_log_file() API to support specifing the
>   reconnect log file
> - Fix some bugs [Stefan]
> 
> Xie Yongji (8):
>   block: Support passing NULL ops to blk_set_dev_ops()
>   block-backend: Introduce blk_get_guest_block_size()
>   block/export: Abstract out the logic of virtio-blk I/O process
>   linux-headers: Add vduse.h
>   libvduse: Add VDUSE (vDPA Device in Userspace) library
>   vduse-blk: Implement vduse-blk export
>   vduse-blk: Add vduse-blk resize support
>   libvduse: Add support for reconnecting
> 
>  MAINTAINERS                                 |    9 +
>  block/block-backend.c                       |    8 +-
>  block/export/export.c                       |    6 +
>  block/export/meson.build                    |    7 +-
>  block/export/vduse-blk.c                    |  346 +++++
>  block/export/vduse-blk.h                    |   20 +
>  block/export/vhost-user-blk-server.c        |  249 +---
>  block/export/virtio-blk-handler.c           |  237 ++++
>  block/export/virtio-blk-handler.h           |   33 +
>  include/sysemu/block-backend-io.h           |    1 +
>  linux-headers/linux/vduse.h                 |  306 ++++
>  meson.build                                 |   28 +
>  meson_options.txt                           |    4 +
>  qapi/block-export.json                      |   25 +-
>  scripts/meson-buildoptions.sh               |    7 +
>  scripts/update-linux-headers.sh             |    2 +-
>  subprojects/libvduse/include/atomic.h       |    1 +
>  subprojects/libvduse/include/compiler.h     |    1 +
>  subprojects/libvduse/libvduse.c             | 1386 +++++++++++++++++++
>  subprojects/libvduse/libvduse.h             |  247 ++++
>  subprojects/libvduse/linux-headers/linux    |    1 +
>  subprojects/libvduse/meson.build            |   10 +
>  subprojects/libvduse/standard-headers/linux |    1 +
>  23 files changed, 2695 insertions(+), 240 deletions(-)
>  create mode 100644 block/export/vduse-blk.c
>  create mode 100644 block/export/vduse-blk.h
>  create mode 100644 block/export/virtio-blk-handler.c
>  create mode 100644 block/export/virtio-blk-handler.h
>  create mode 100644 linux-headers/linux/vduse.h
>  create mode 120000 subprojects/libvduse/include/atomic.h
>  create mode 120000 subprojects/libvduse/include/compiler.h
>  create mode 100644 subprojects/libvduse/libvduse.c
>  create mode 100644 subprojects/libvduse/libvduse.h
>  create mode 120000 subprojects/libvduse/linux-headers/linux
>  create mode 100644 subprojects/libvduse/meson.build
>  create mode 120000 subprojects/libvduse/standard-headers/linux
> 
> -- 
> 2.20.1



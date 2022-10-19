Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0560407E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5rQ-0004w6-CR
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5gv-0008Vh-JU
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5gm-0004zg-LP
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666172917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PJ5++ay5xSw57evsgGNcEufkF2785F4YPbLCx//LZH0=;
 b=IDLY9Yq6d5Fw5ZjOlGjADBGBh4NG40pfpsUU/lPGXm6DTEpi5G299kLcURulLqCr7XuZvS
 AMPZqg8mIUCB/oel8hAxnPhSMvEKPQyt48pfaoFgYeGSA6qaTZBUcIS4CR/QuW7Tk22t29
 OrFPCXLhDAM4p+Dh9zeszrYHsrjqpt0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-X_38eEO7OpaiiWtJnWsmRA-1; Wed, 19 Oct 2022 05:48:36 -0400
X-MC-Unique: X_38eEO7OpaiiWtJnWsmRA-1
Received: by mail-qk1-f197.google.com with SMTP id
 v1-20020a05620a440100b006eee30cb799so7615953qkp.23
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJ5++ay5xSw57evsgGNcEufkF2785F4YPbLCx//LZH0=;
 b=xGOvPBgwoaYwFI7YoBVKnsodmwQTZgKBmpSdVDwXydjxFp4eZjDn9R98D7zPpGeVLT
 eaygc1TFIbVbmLhlkVvTcLRG2BCJ8ADsPgz+q42p1p6dntfRPw0c9pFpkTKdmOcSa54B
 W2Z+KQJlw1UtIQnQ0CHpVoLcR3U+7FPOEYxiyIJrRwwyf4lhInrZwhapCVmK04bmZkRE
 ZHGbVWLRA7eB8iLD6NfQxP09pwSbbfk8Yww8ypaKwX83TWpexP4aDw2gdZj8epsQQ6q3
 wM+3mghgOQC3/47Xj6yWABw0KHvTozvYPCiyHdTCrK/0F3OdPqKqS0Bdrqgs3L+Ix0SS
 FN/g==
X-Gm-Message-State: ACrzQf082V0vLgXVFn7a5NZfQ7jMD424Cbd2R/wG+5O5PQ4P7j/UR/zm
 mvFbiSf6TFYBtF0IPbbbh2x4IAKbNNs6wNr/30r/a7kmJgfhJ5G4anEeaD7+F6/CJE+N20Rr7PQ
 5c7oY6M4ZY4Jj6Nk=
X-Received: by 2002:a05:620a:bcd:b0:6cf:a7b9:44ce with SMTP id
 s13-20020a05620a0bcd00b006cfa7b944cemr4820718qki.38.1666172916186; 
 Wed, 19 Oct 2022 02:48:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50EzvnZDDRZeNi7fHnPLFvvwHtWMBw86FdP3ljYMki+qUntBa+f8AgT4O/qAdwmxuL/2s/OA==
X-Received: by 2002:a05:620a:bcd:b0:6cf:a7b9:44ce with SMTP id
 s13-20020a05620a0bcd00b006cfa7b944cemr4820703qki.38.1666172915958; 
 Wed, 19 Oct 2022 02:48:35 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.190.19])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a408b00b006eeb51bb33dsm4752315qko.78.2022.10.19.02.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:48:35 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:48:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 02/13] blkio: add libblkio block driver
Message-ID: <20221019094826.zykjjjzlfpvx7qed@sgarzare-redhat>
References: <20221013185908.1297568-1-stefanha@redhat.com>
 <20221013185908.1297568-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221013185908.1297568-3-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 02:58:57PM -0400, Stefan Hajnoczi wrote:
>libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
>high-performance disk I/O. It currently supports io_uring,
>virtio-blk-vhost-user, and virtio-blk-vhost-vdpa with additional drivers
>under development.
>
>One of the reasons for developing libblkio is that other applications
>besides QEMU can use it. This will be particularly useful for
>virtio-blk-vhost-user which applications may wish to use for connecting
>to qemu-storage-daemon.
>
>libblkio also gives us an opportunity to develop in Rust behind a C API
>that is easy to consume from QEMU.
>
>This commit adds io_uring, nvme-io_uring, virtio-blk-vhost-user, and
>virtio-blk-vhost-vdpa BlockDrivers to QEMU using libblkio. It will be
>easy to add other libblkio drivers since they will share the majority of
>code.
>
>For now I/O buffers are copied through bounce buffers if the libblkio
>driver requires it. Later commits add an optimization for
>pre-registering guest RAM to avoid bounce buffers.
>
>The syntax is:
>
>  --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
>
>  --blockdev nvme-io_uring,node-name=drive0,filename=/dev/ng0n1,readonly=on|off,cache.direct=on
>
>  --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off,cache.direct=on
>
>  --blockdev virtio-blk-vhost-user,node-name=drive0,path=vhost-user-blk.sock,readonly=on|off,cache.direct=on
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Acked-by: Markus Armbruster <armbru@redhat.com>
>---
> MAINTAINERS                   |   6 +
> meson_options.txt             |   2 +
> qapi/block-core.json          |  77 +++-
> meson.build                   |   9 +
> block/blkio.c                 | 831 ++++++++++++++++++++++++++++++++++
> tests/qtest/modules-test.c    |   3 +
> block/meson.build             |   1 +
> scripts/meson-buildoptions.sh |   3 +
> 8 files changed, 928 insertions(+), 4 deletions(-)
> create mode 100644 block/blkio.c

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



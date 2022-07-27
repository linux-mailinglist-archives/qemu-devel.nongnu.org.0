Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C315833C1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 21:39:39 +0200 (CEST)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGmsW-0002wX-5S
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 15:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGmn7-0006hO-4f
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGmn0-0000ay-OD
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 15:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658950429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8aG+xqlg7S7qrggqrYU2k+A00Sb6LEOAkj2nCO300U=;
 b=EBM77IKxp0ioZN4sCcKiUx/T8UlzcwD0YMOmVMF1KIL4zbo7r0RJX6/tWhJdL/fffKDRvv
 2e2abGkAjrdULlpokyEV49kW9NXXs1lp2/Zl1V2ovj5uH/rD8MSWRzcajZoRMN1kFAKMO+
 bx4V3Fwxa1/IfMY22oQLMiqGWYCEicI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-YgWvMHJ9M_Orn0rWpMs3Qw-1; Wed, 27 Jul 2022 15:33:46 -0400
X-MC-Unique: YgWvMHJ9M_Orn0rWpMs3Qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0927101A54E;
 Wed, 27 Jul 2022 19:33:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4149B40CFD0A;
 Wed, 27 Jul 2022 19:33:42 +0000 (UTC)
Date: Wed, 27 Jul 2022 21:33:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>, pkrempa@redhat.com
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <YuGTFJ3r7+MMAxhR@redhat.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708041737.1768521-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 08.07.2022 um 06:17 hat Stefan Hajnoczi geschrieben:
> libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> high-performance disk I/O. It currently supports io_uring and
> virtio-blk-vhost-vdpa with additional drivers under development.
> 
> One of the reasons for developing libblkio is that other applications
> besides QEMU can use it. This will be particularly useful for
> vhost-user-blk which applications may wish to use for connecting to
> qemu-storage-daemon.
> 
> libblkio also gives us an opportunity to develop in Rust behind a C API
> that is easy to consume from QEMU.
> 
> This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
> using libblkio. It will be easy to add other libblkio drivers since they
> will share the majority of code.
> 
> For now I/O buffers are copied through bounce buffers if the libblkio
> driver requires it. Later commits add an optimization for
> pre-registering guest RAM to avoid bounce buffers.
> 
> The syntax is:
> 
>   --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
> 
> and:
> 
>   --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

The subject line implies only io_uring, but you actually add vhost-vdpa
support, too. I think the subject line should be changed.

I think it would also make sense to already implement support for
vhost-user-blk on the QEMU side even if support isn't compiled in
libblkio by default and opening vhost-user-blk images would therefore
always fail with a default build.

But then you could run QEMU with a custom build of libblkio to make use
of it without patching QEMU. This is probably useful for getting libvirt
support for using a storage daemon implemented without having to wait
for another QEMU release. (Peter, do you have any opinion on this?)

Kevin



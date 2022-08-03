Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A654588C27
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:31:53 +0200 (CEST)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDXT-0000W3-GP
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1oJDSr-0003Fc-DL
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1oJDSo-0007zZ-3m
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659529621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C++vkXudsq5IVub8BIaJgogWaQmQUMdLIdRy5mkM9pM=;
 b=X381lnew/O68fAQeuptYhqwuaro3Dckh6zqvpMycPZFGyirg1HRymqnCZafiw1B98O+Dgv
 XJXZF4r0HNhhSWWjvKvQDhcGtC9pIddkbvP4eYJ4q0TfEq4DiuuBelxJR0ArdtZUI+sM3V
 Q1thVabwp+TdbUkupGewB4rodkNAx7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-m7A71bdFMGuRnKB2QqHdJg-1; Wed, 03 Aug 2022 08:25:51 -0400
X-MC-Unique: m7A71bdFMGuRnKB2QqHdJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0A20811E76;
 Wed,  3 Aug 2022 12:25:50 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D6B2026D4C;
 Wed,  3 Aug 2022 12:25:45 +0000 (UTC)
Date: Wed, 3 Aug 2022 14:25:43 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Alberto Faria <afaria@redhat.com>,
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
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <YuppR5lWPAqLTABo@angien.pipo.sk>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
 <YuGTFJ3r7+MMAxhR@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuGTFJ3r7+MMAxhR@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
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

On Wed, Jul 27, 2022 at 21:33:40 +0200, Kevin Wolf wrote:
> Am 08.07.2022 um 06:17 hat Stefan Hajnoczi geschrieben:
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring and
> > virtio-blk-vhost-vdpa with additional drivers under development.
> > 
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > vhost-user-blk which applications may wish to use for connecting to
> > qemu-storage-daemon.
> > 
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> > 
> > This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
> > using libblkio. It will be easy to add other libblkio drivers since they
> > will share the majority of code.
> > 
> > For now I/O buffers are copied through bounce buffers if the libblkio
> > driver requires it. Later commits add an optimization for
> > pre-registering guest RAM to avoid bounce buffers.
> > 
> > The syntax is:
> > 
> >   --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
> > 
> > and:
> > 
> >   --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> The subject line implies only io_uring, but you actually add vhost-vdpa
> support, too. I think the subject line should be changed.
> 
> I think it would also make sense to already implement support for
> vhost-user-blk on the QEMU side even if support isn't compiled in
> libblkio by default and opening vhost-user-blk images would therefore
> always fail with a default build.
> 
> But then you could run QEMU with a custom build of libblkio to make use
> of it without patching QEMU. This is probably useful for getting libvirt
> support for using a storage daemon implemented without having to wait
> for another QEMU release. (Peter, do you have any opinion on this?)

How will this work in terms of detecting whether that feature is
present?

The issue is that libvirt caches capabilities of qemu and the cache is
invalidated based on the timestamp of the qemu binary (and few other
mostly host kernel and cpu properties). In case when a backend library
is updated/changed this probably means that libvirt will not be able to
detect that qemu gained support.

In case when qemu lies about the support even if the backend library
doesn't suport it then we have a problem in not being even able to see
whether we can use it.



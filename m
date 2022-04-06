Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C334F66FD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:33:44 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9XL-000293-1K
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nc9Vw-0001JD-FD
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nc9Vt-0002A6-So
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649266331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBsF+SU0EEI1vsb8WZTuk/GR3nXlygaVNg5hscMxn34=;
 b=Lpi9eB8VzIpmrtUDAPwquD4cnICHjFqYz/E79A5kKG7fxogRss813Sqika2LoDcrk5GWzl
 HfJSKp70VmvUDrrzmheprQaW9DbKDgmKVwzBdiUXBulLotu0++xBYtwS0bDnvDJYO6kzrM
 sEIpjUfVxI8bu6WcXE3+MfZ3OV8rArQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-99_HU7AKPpWBxPu2Si9Htg-1; Wed, 06 Apr 2022 13:32:08 -0400
X-MC-Unique: 99_HU7AKPpWBxPu2Si9Htg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5BA185A7B2;
 Wed,  6 Apr 2022 17:32:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 621A84029A4;
 Wed,  6 Apr 2022 17:32:05 +0000 (UTC)
Date: Wed, 6 Apr 2022 19:32:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <Yk3OlNBaEifS9bZD@redhat.com>
References: <20220405153323.2082242-1-stefanha@redhat.com>
 <20220405153323.2082242-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405153323.2082242-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Alberto Faria <afaria@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.04.2022 um 17:33 hat Stefan Hajnoczi geschrieben:
> libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> high-performance disk I/O. It currently supports io_uring with
> additional drivers planned.
> 
> One of the reasons for developing libblkio is that other applications
> besides QEMU can use it. This will be particularly useful for
> vhost-user-blk which applications may wish to use for connecting to
> qemu-storage-daemon.
> 
> libblkio also gives us an opportunity to develop in Rust behind a C API
> that is easy to consume from QEMU.
> 
> This commit adds an io_uring BlockDriver to QEMU using libblkio. For now
> I/O buffers are copied through bounce buffers if the libblkio driver
> requires it. Later commits add an optimization for pre-registering guest
> RAM to avoid bounce buffers. It will be easy to add other libblkio
> drivers since they will share the majority of code.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> +static BlockDriver bdrv_io_uring = {
> +    .format_name                = "io_uring",
> +    .protocol_name              = "io_uring",
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_needs_filename        = true,
> +    .bdrv_parse_filename        = blkio_parse_filename_io_uring,
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .has_variable_length        = true,

This one is a bad idea. It means that every request will call
blkio_getlength() first, which looks up the "capacity" property in
libblkio and then calls lseek() for the io_uring backend.

For other backends like the vhost_user one (where I just copied your
definition and then noticed this behaviour), it involve a message over
the vhost socket, which is even worse.

.has_variable_length was only meant for the host_floppy/cdrom drivers
that have to deal with media change. Everything else just requires an
explicit block_resize monitor command to be resized.

Kevin



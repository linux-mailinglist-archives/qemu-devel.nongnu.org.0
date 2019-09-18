Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D666B6386
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 14:47:57 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAZND-0003OD-SR
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 08:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAZKx-0002G6-Ld
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAZKu-000896-Sl
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:45:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iAZKs-00085Y-Qz
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:45:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 86C46308123B
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 12:45:23 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFCAFF6F1;
 Wed, 18 Sep 2019 12:45:05 +0000 (UTC)
Date: Wed, 18 Sep 2019 14:45:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190918144503.5b7fa83f.cohuck@redhat.com>
In-Reply-To: <20190917160057.11847-1-dgilbert@redhat.com>
References: <20190917160057.11847-1-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 18 Sep 2019 12:45:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/3] Add virtio-fs (experimental)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vgoyal@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Sep 2019 17:00:54 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hi,
>   This set of patches adds the core of the virtio-fs support to qemu;
> it's marked experimental since the kernel patch isn't in yet; but
> it's nearly there;  the spec has passed the voting stage, and
> the kernel changes are queued in fuse-next.
> 
>   A future set of patches will add the optional DAX mapping support.
> 
>   The actual qemu change is pretty minimal, since it's really only
> a virtio device with some queues.
> 
> Some links:
>   Mailing list: https://www.redhat.com/mailman/listinfo/virtio-fs
>   Dev tree: Including filesystem daemon: https://gitlab.com/virtio-fs/qemu
>   kernel:
>          dev world:
>             https://gitlab.com/virtio-fs/linux
>          fuse next:
>            https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=for-next
>   virtio spec changes:
>          https://lists.oasis-open.org/archives/virtio-dev/201908/msg00112.html
> 
> v3
>   Split the kernel header update out
>     The contents correspond to the fuse-next world+a patch Stefan just
>     sent to make that use the newer 'num_request_queues' name
> 
>   Update copyright year,
>   Remove the assert in vuf_handle_output
>     the virtio core code sometimes calls it during cleanup if the
>     daemon dies first
>   (I've not changed the comment about guest_notifier_mask/virtio-pci
>    since that's copied in a bunch of virtio code going back ~5 years)

Agreed, let's change all of that at once when we figure out what a
better comment would be.

> 
> Dr. David Alan Gilbert (3):
>   virtio: Add virito_fs linux headers
>   virtio: add vhost-user-fs base device
>   virtio: add vhost-user-fs-pci device
> 
>  configure                                   |  13 +
>  hw/virtio/Makefile.objs                     |   2 +
>  hw/virtio/vhost-user-fs-pci.c               |  85 ++++++
>  hw/virtio/vhost-user-fs.c                   | 299 ++++++++++++++++++++
>  include/hw/virtio/vhost-user-fs.h           |  45 +++
>  include/standard-headers/linux/virtio_fs.h  |  41 +++
>  include/standard-headers/linux/virtio_ids.h |   1 +
>  7 files changed, 486 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-fs-pci.c
>  create mode 100644 hw/virtio/vhost-user-fs.c
>  create mode 100644 include/hw/virtio/vhost-user-fs.h
>  create mode 100644 include/standard-headers/linux/virtio_fs.h
> 

Looks good to me. I still want to test virtio-fs on s390 (with a ccw
device as well), but won't find time in the near future. Hopefully, at
some point in time before KVM Forum, at least :)


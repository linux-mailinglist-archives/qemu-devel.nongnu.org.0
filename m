Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B832139E64D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:15:40 +0200 (CEST)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJml-00089y-Aj
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqJlF-0007Kf-Da
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqJlC-00004t-Ue
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623089641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0IiXL5ztikHyYgmTP/de2P8BQy8/oO2V5cD2MV8LK0=;
 b=I/uQmXSqNbmraP6gH5czbBes+Pdhnbg5UZ9OAN7wfnFSAxpOjKre/giAFcE7ztiYDgwYYg
 MxAXHeooZbXdq8JA1RGB3zsCRFqadVTR/fjpbvb0rvgNwesYz7CrSFoRWhWJjANdEQYjMU
 02Z7zxEEoSRee+goNJtL59ChyqgpD94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-zIPFX866NimnYV8Kg7t6Wg-1; Mon, 07 Jun 2021 14:13:57 -0400
X-MC-Unique: zIPFX866NimnYV8Kg7t6Wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 152DD107ACCD;
 Mon,  7 Jun 2021 18:13:55 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C685D9DC;
 Mon,  7 Jun 2021 18:13:52 +0000 (UTC)
Date: Mon, 7 Jun 2021 13:13:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 10/11] block: use int64_t instead of int in driver
 discard handlers
Message-ID: <20210607181350.2mviefspqqdsm6af@redhat.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
 <20210505075001.45041-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505075001.45041-11-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>,
 "open list:GLUSTER" <integration@gluster.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-block@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 Liu Yuan <namei.unix@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 10:50:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver discard handlers bytes parameter to int64_t.
> 
> The only caller of all updated function is bdrv_co_pdiscard in
> block/io.c. It is already prepared to work with 64bit requests, but
> pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.
> 
> Let's look at all updated functions:
> 
> backup-top: pass to bdrv_co_pdiscard which is 64bit

and to backup_top_cbw, but that is also 64-bit

> 
> blkdebug: all calculations are still OK, thanks to
>   bdrv_check_qiov_request().
>   both rule_check and bdrv_co_pdiscard are 64bit
> 
> blklogwrites: pass to blk_loc_writes_co_log which is 64bit
> 
> blkreply, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK

blkreplay

> 
> file-posix: one handler calls raw_account_discard() is 64bit and both
>   handlers calls raw_do_pdiscard(). Update raw_do_pdiscard, which pass
>   to RawPosixAIOData::aio_nbytes, which is 64bit (and calls
>   raw_account_discard())
> 
> gluster: somehow, third argument of glfs_discard_async is size_t.
>   Let's set max_pdiscard accordingly.
> 
> iscsi: iscsi_allocmap_set_invalid is 64bit,
>   !is_byte_request_lun_aligned is 64bit.
>   list.num is uint32_t. Let's clarify max_pdiscard and
>   pdiscard_alignment.

The patch tweaks max_pdiscard, but doesn't change pdiscard_alignment.

> 
> mirror_top, preallocate: pass to bdrv_mirror_top_do_write() which is
>   64bit

file is mirror.c, not mirror-top.c.  But it matches the BlockDriver
bdrv_mirror_top name.  preallocate does not call
bdrv_mirror_top_do_write, so it's probably worth separating that line
out.

> 
> nbd: protocol limitation. max_pdiscard is alredy set strict enough,
>   keep it as is for now.
> 
> nvmd: buf.nlb is uint32_t and we do shift. So, add corresponding limits
>   to nvme_refresh_limits().

nvme

> 
> qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
>   qcow2_cluster_discard() is 64bit.
> 
> raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.
> 
> sheepdog: the format is deprecated. Don't care and just make old
>   INT_MAX limit to be explicit
> 
> throttle: pass to bdrv_co_pdiscard() which is 64bit and to
>   throttle_group_co_io_limits_intercept() which is 64bit as well.
> 
> test-block-iothread: bytes argument is unused
> 
> Great! Now all drivers are prepared to 64bit discard requests or has
> explicit max_pdiscard limit.

are prepared to handle 64-bit discard requests, or else have explicit
max_pdiscard limits.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h        |  2 +-
>  block/backup-top.c               |  2 +-
>  block/blkdebug.c                 |  2 +-
>  block/blklogwrites.c             |  4 ++--
>  block/blkreplay.c                |  2 +-
>  block/copy-on-read.c             |  2 +-
>  block/file-posix.c               |  7 ++++---
>  block/filter-compress.c          |  2 +-
>  block/gluster.c                  |  7 +++++--
>  block/iscsi.c                    | 10 +++++-----
>  block/mirror.c                   |  2 +-
>  block/nbd.c                      |  6 ++++--
>  block/nvme.c                     | 14 +++++++++++++-
>  block/preallocate.c              |  2 +-
>  block/qcow2.c                    |  2 +-
>  block/raw-format.c               |  2 +-
>  block/sheepdog.c                 | 15 ++++++++++++++-
>  block/throttle.c                 |  2 +-
>  tests/unit/test-block-iothread.c |  2 +-
>  block/trace-events               |  4 ++--
>  20 files changed, 61 insertions(+), 30 deletions(-)
> 

> +++ b/block/gluster.c
> @@ -891,6 +891,7 @@ out:
>  static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
> +    bs->bl.max_pdiscard = SIZE_MAX;

We probably want this to be MIN(GLUSTER_MAX_TRANSFER, SIZE_MAX). Also,
do we want to round it down to alignment boundaries?

> +++ b/block/iscsi.c
> @@ -1141,7 +1141,8 @@ iscsi_getlength(BlockDriverState *bs)
>  }
>  
>  static int
> -coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
> +coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset,
> +                               int64_t bytes)
>  {
>      IscsiLun *iscsilun = bs->opaque;
>      struct IscsiTask iTask;

Did you want to add some sort of assert(bytes / iscsilun->block_size
<= UINT32_MAX), or a comment that we are relying on bl.max_pdiscard?

> +++ b/block/sheepdog.c

> +static void sd_refresh_limits(BlockDriverState *bs, Error **errp)
> +{
> +    bs->bl.max_pdiscard = INT_MAX;

Do we want to round this down to alignment?

Looks close!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



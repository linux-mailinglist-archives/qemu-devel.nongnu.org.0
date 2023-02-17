Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95A69A8EF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSxjl-00078J-BA; Fri, 17 Feb 2023 05:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pSxjg-00077S-Hh
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:13:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pSxje-0005x8-H1
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676628777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BxrNWm0jPlfIg5AyudhYldwtZ8wqJcJ0TDKhCiB/NU=;
 b=BfVw7OWZHeHc382mVXLWh9HB0Vydpn4EkkCyMfxkpji8S46ly4QbwmUZYfIUOHgpljOouJ
 /oFA0vPNdV/vmPfOs1LieDIceZ0pbfz4janAD81KW/b+M8T8wEf1QKFR7ssVYcQt401kd+
 /BFvdNmWOPuMiCNU67nFE6UoYFlMYqs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-QSqKL7GzPIuSEmnuD_10tg-1; Fri, 17 Feb 2023 05:12:55 -0500
X-MC-Unique: QSqKL7GzPIuSEmnuD_10tg-1
Received: by mail-qv1-f72.google.com with SMTP id
 z16-20020a0cfc10000000b0056f0794632bso1655734qvo.18
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 02:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8BxrNWm0jPlfIg5AyudhYldwtZ8wqJcJ0TDKhCiB/NU=;
 b=puJ/LOVfV4uMGP4+CS9DWQbdBeXQ1X0yV6JJaepKaQrrJQ0mohbxajZRp9Za/yzI1a
 s8A3BRDUsqokUKdnK1l10D/kApGz43zLJlyxs316POG+TLr7hCK5MWo+FdVPSZtYw29/
 /L4tpHeZAwFO0tLqDuOMhkpwRT2uc2VigCakaIuas2QovqdwwjGA1TkN840ojFUdTE9e
 NK3xtMHOKd6zIdVpEOcUFdcypCkyIhABRFV0Em50b0rNnafunE9WpyU7+FPdCeNi8g3h
 b4OXOw1M7oNlNXdtbBle3K3nryxMtojjejo+Y7W9awqMYk2Pv3y8Uj1jIXdMjx0Ifl5/
 MUUA==
X-Gm-Message-State: AO0yUKU7i9PSybJLgAqF1QxU12irnWNuTYV5KD9hHaiqHOmJLvRrqEwi
 XwqltWHx1mLz1e30CoiPBqgmNnqxfwvV6Imt7uTn7h9hfMe8XOIwwj/YjPVWm2Lr7vRLjm/FyM8
 Iqxo6LzEwoN/0HcQ=
X-Received: by 2002:a05:622a:593:b0:3b8:461b:4134 with SMTP id
 c19-20020a05622a059300b003b8461b4134mr294291qtb.68.1676628775353; 
 Fri, 17 Feb 2023 02:12:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8qzRYIFHtGpONvBvW2v3a+3EGXCLVFwP06tsp1CxS9TQu50os3wC8DN4nSSsWiAHjBS9RQ/Q==
X-Received: by 2002:a05:622a:593:b0:3b8:461b:4134 with SMTP id
 c19-20020a05622a059300b003b8461b4134mr294277qtb.68.1676628775100; 
 Fri, 17 Feb 2023 02:12:55 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 cp6-20020a05622a420600b003b9bc00c2f1sm2817475qtb.94.2023.02.17.02.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 02:12:54 -0800 (PST)
Message-ID: <b5098927-79b9-a88b-750d-e42f7fdeab9a@redhat.com>
Date: Fri, 17 Feb 2023 11:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/23] block: Lock the graph, part 2 (BlockDriver
 callbacks)
Content-Language: de-CH
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org
References: <20230203152202.49054-1-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 03/02/2023 um 16:21 schrieb Kevin Wolf:
> After introducing the graph lock in a previous series, this series
> actually starts making widespread use of it.
> 
> Most of the BlockDriver callbacks access the children list in some way,
> so you need to hold the graph lock to call them. The patches in this
> series add the corresponding GRAPH_RDLOCK annotations and take the lock
> in places where it doesn't happen yet - all of the bdrv_*() co_wrappers
> are already covered, but in particular BlockBackend coroutine_fns still
> need it.
> 
> There is no particularly good reason why exactly these patches and not
> others are included in the series. I couldn't find a self-contained part
> that could reasonable be addressed in a single series. So these just
> happen to be patches that are somewhat related (centered around the
> BlockDriver callback theme), are ready and their number looks
> manageable. You will still see some FIXMEs at the end of the series
> that will only be addressed in future patches.

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> 
> Emanuele Giuseppe Esposito (5):
>   block/qed: add missing graph rdlock in qed_need_check_timer_entry
>   block: Mark bdrv_co_flush() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_pdiscard() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_copy_range() GRAPH_RDLOCK
>   block: Mark bdrv_co_is_inserted() and callers GRAPH_RDLOCK
> 
> Kevin Wolf (18):
>   block: Make bdrv_can_set_read_only() static
>   mirror: Fix access of uninitialised fields during start
>   block: Mark bdrv_co_truncate() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_block_status() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_ioctl() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_pwrite_zeroes() and callers GRAPH_RDLOCK
>   block: Mark read/write in block/io.c GRAPH_RDLOCK
>   block: Mark public read/write functions GRAPH_RDLOCK
>   block: Mark bdrv_co_pwrite_sync() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_do_pwrite_zeroes() GRAPH_RDLOCK
>   block: Mark preadv_snapshot/snapshot_block_status GRAPH_RDLOCK
>   block: Mark bdrv_co_create() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_io_(un)plug() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_eject/lock_medium() and callers GRAPH_RDLOCK
>   block: Mark bdrv_(un)register_buf() GRAPH_RDLOCK
>   block: Mark bdrv_co_delete_file() and callers GRAPH_RDLOCK
>   block: Mark bdrv_*_dirty_bitmap() and callers GRAPH_RDLOCK
>   block: Mark bdrv_co_refresh_total_sectors() and callers GRAPH_RDLOCK
> 
>  block/coroutines.h                 |   2 +-
>  block/qcow2.h                      |  27 +++--
>  block/qed.h                        |  45 ++++----
>  include/block/block-copy.h         |   6 +-
>  include/block/block-global-state.h |  14 ++-
>  include/block/block-io.h           | 110 +++++++++---------
>  include/block/block_int-common.h   | 173 ++++++++++++++++-------------
>  include/block/block_int-io.h       |  53 ++++-----
>  include/block/dirty-bitmap.h       |  12 +-
>  include/sysemu/block-backend-io.h  |   7 +-
>  block.c                            |  12 +-
>  block/backup.c                     |   3 +
>  block/blkdebug.c                   |  19 ++--
>  block/blklogwrites.c               |  35 +++---
>  block/blkreplay.c                  |  24 ++--
>  block/blkverify.c                  |   5 +-
>  block/block-backend.c              |  39 +++++--
>  block/block-copy.c                 |  32 +++---
>  block/bochs.c                      |   2 +-
>  block/commit.c                     |   5 +-
>  block/copy-before-write.c          |  33 +++---
>  block/copy-on-read.c               |  44 ++++----
>  block/create.c                     |   9 +-
>  block/crypto.c                     |  16 +--
>  block/dirty-bitmap.c               |   2 +
>  block/file-posix.c                 |  27 ++---
>  block/file-win32.c                 |   7 +-
>  block/filter-compress.c            |  36 +++---
>  block/io.c                         | 108 +++++++++++-------
>  block/iscsi.c                      |  28 ++---
>  block/mirror.c                     |  59 ++++++----
>  block/parallels.c                  |  33 +++---
>  block/preallocate.c                |  38 ++++---
>  block/qcow.c                       |  46 ++++----
>  block/qcow2-cluster.c              |  17 ++-
>  block/qcow2.c                      | 136 ++++++++++++-----------
>  block/qed-check.c                  |   3 +-
>  block/qed-table.c                  |  10 +-
>  block/qed.c                        | 101 +++++++++--------
>  block/quorum.c                     |  62 ++++++-----
>  block/raw-format.c                 |  76 ++++++-------
>  block/replication.c                |  18 ++-
>  block/snapshot-access.c            |   8 +-
>  block/stream.c                     |  40 ++++---
>  block/throttle.c                   |  36 +++---
>  block/vdi.c                        |  11 +-
>  block/vhdx.c                       |  18 +--
>  block/vmdk.c                       | 132 ++++++++++------------
>  block/vpc.c                        |  11 +-
>  qemu-img.c                         |   8 +-
>  tests/unit/test-bdrv-drain.c       |  20 ++--
>  tests/unit/test-block-iothread.c   |   3 +-
>  52 files changed, 983 insertions(+), 838 deletions(-)
> 



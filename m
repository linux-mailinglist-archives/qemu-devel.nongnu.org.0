Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FE66B950
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:52:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLDM-0004Gs-PC; Mon, 16 Jan 2023 03:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHLDF-0004Fk-0n
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHLDD-0005Xm-Ai
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673859086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fngc0drcPb+iE2qdF3kOxgdRsAypzm2OcaSVVYr3lmg=;
 b=goRxd/gbRJskIr++8W2Roi4oPpq2emraLX30B265wCh8bLq3pO5QBwygwUZAtq3JB5QVxS
 qd5EyvAd95e3R0A0uC5UZhn9+2C3WRQz40IlNnbfjLGR+mrj9yx51kL4sb/CJPRJ9yhAKa
 8ulGaByNwlbJXQg3qiuALrWZa03ELLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-3LjuYJtQOV-KlWYWx0jb6g-1; Mon, 16 Jan 2023 03:51:24 -0500
X-MC-Unique: 3LjuYJtQOV-KlWYWx0jb6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso641627wms.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fngc0drcPb+iE2qdF3kOxgdRsAypzm2OcaSVVYr3lmg=;
 b=lrwuVn7Zc5foLwg+yVcKMD8NfeyEYq1reCSxGp3AylBU7DcYAE74FSYspnxJFY9JbG
 2eVCoT+dqqoifzh6dTZZPJ8i7bX86U4CVTnqe13tYst3M4cuzB5Bgy7+AibGwnWZwofa
 HZeoys6LfAEFGNVPMuHLq6w9FMW9LfjRezO4amDpzG2R2blIoTWmiSgv6N6HAGKKMbXA
 xzaovtQs3KF6GnsPv5QFDxMi5ZN1qeKDz9FG640bLPeixKcha9cJttlCT0kFOLJ/kesh
 acAh4NRmKwEkR1PdDNAGqigtlHvrQtfq2bLwzqTQglJ84vg1ukFZG2K48WZsyYCInXkd
 Eohw==
X-Gm-Message-State: AFqh2kqgdlN+upL85qrr0yqrMLhJ7tyxMwlESJXIV4wPv4qRPMhdimcE
 ma0mw5FfRjpu7sOKwiYB9nG9avQbPiAdiIAYwuX6B7A4iDDxpLLlfc56P/XEYfXxhCmR+9bWq65
 z93XdnH7Wuy8WlRE=
X-Received: by 2002:a05:600c:3b28:b0:3da:516:19ed with SMTP id
 m40-20020a05600c3b2800b003da051619edmr16483453wms.29.1673859083818; 
 Mon, 16 Jan 2023 00:51:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtO8CnUTrStyiT4Cmuzl9L/TSUiDmgH1QJIEI81wegI8HnNOZrVF987T//P/nwCWWOcTUZQdQ==
X-Received: by 2002:a05:600c:3b28:b0:3da:516:19ed with SMTP id
 m40-20020a05600c3b2800b003da051619edmr16483437wms.29.1673859083534; 
 Mon, 16 Jan 2023 00:51:23 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm35960926wmq.12.2023.01.16.00.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:51:23 -0800 (PST)
Message-ID: <8d49f839-e159-3036-9f07-221c643081d1@redhat.com>
Date: Mon, 16 Jan 2023 09:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/14] block: Move more functions to coroutines
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
References: <20230113204212.359076-1-kwolf@redhat.com>
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 13/01/2023 um 21:41 schrieb Kevin Wolf:
> This series converts some IO_CODE() functions to coroutine_fn because
> they access the graph and will need to hold the graph lock in the
> future. IO_CODE() functions can be called from iothreads, so taking the
> graph lock requires the function to run in coroutine context.
> 
> Pretty much all of the changes in this series were posted by Emanuele
> before as part of "Protect the block layer with a rwlock: part 3". The
> major difference is that in the old version, the patches did two things
> at once: Converting functions to coroutine_fn, and adding the locking to
> them. This series does only the coroutine conversion. The locking part
> will be in another series which now comes with TSA annotations and makes
> the locking related changes big enough to have separate patches.
> 
> v2:
> - In each patch converting a BlockDriver callback to be called in
>   coroutine, also immediately rename it and its implementation to
>   include co_ in its name, as well as mark the implementations
>   coroutine_fn [Vladimir]
> - Moved bdrv_is_inserted() earlier in the series because
>   raw_is_inserted() calls raw_getlength(), so it needs to be converted
>   first to avoid calling a coroutine_fn from a non-coroutine_fn in an
>   intermediate state.
> - The final patch only renames bdrv_load/save_vmstate() any more, which
>   was already converted to coroutine_fn earlier.
> - Since pretty much every patch was touched in this, I refrained from
>   picking up any Reviewed-by for v1
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> Emanuele Giuseppe Esposito (14):
>   block-coroutine-wrapper: support void functions
>   block: Convert bdrv_io_plug() to co_wrapper
>   block: Convert bdrv_io_unplug() to co_wrapper
>   block: Convert bdrv_is_inserted() to co_wrapper
>   block: Rename refresh_total_sectors to bdrv_refresh_total_sectors
>   block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
>   block-backend: use bdrv_getlength instead of blk_getlength
>   block: use bdrv_co_refresh_total_sectors when possible
>   block: Convert bdrv_get_allocated_file_size() to co_wrapper
>   block: Convert bdrv_get_info() to co_wrapper_mixed
>   block: Convert bdrv_eject() to co_wrapper
>   block: Convert bdrv_lock_medium() to co_wrapper
>   block: Convert bdrv_debug_event() to co_wrapper_mixed
>   block: Rename bdrv_load/save_vmstate() to bdrv_co_load/save_vmstate()
> 
>  include/block/block-io.h           |  36 +++++++---
>  include/block/block_int-common.h   |  26 ++++---
>  include/block/block_int-io.h       |   5 +-
>  include/sysemu/block-backend-io.h  |  31 +++++++--
>  block.c                            |  82 +++++++++++++---------
>  block/blkdebug.c                   |  11 +--
>  block/blkio.c                      |  15 ++--
>  block/blklogwrites.c               |   6 +-
>  block/blkreplay.c                  |   6 +-
>  block/blkverify.c                  |   6 +-
>  block/block-backend.c              |  36 +++++-----
>  block/commit.c                     |   4 +-
>  block/copy-on-read.c               |  18 ++---
>  block/crypto.c                     |  14 ++--
>  block/curl.c                       |  10 +--
>  block/file-posix.c                 | 107 ++++++++++++++---------------
>  block/file-win32.c                 |  18 +++--
>  block/filter-compress.c            |  20 +++---
>  block/gluster.c                    |  23 ++++---
>  block/io.c                         |  76 ++++++++++----------
>  block/iscsi.c                      |  17 ++---
>  block/mirror.c                     |   6 +-
>  block/nbd.c                        |   8 +--
>  block/nfs.c                        |   4 +-
>  block/null.c                       |  13 ++--
>  block/nvme.c                       |  14 ++--
>  block/preallocate.c                |  16 ++---
>  block/qcow.c                       |   5 +-
>  block/qcow2-refcount.c             |   2 +-
>  block/qcow2.c                      |  17 ++---
>  block/qed.c                        |  11 +--
>  block/quorum.c                     |   8 +--
>  block/raw-format.c                 |  25 +++----
>  block/rbd.c                        |   9 +--
>  block/replication.c                |   6 +-
>  block/ssh.c                        |   4 +-
>  block/throttle.c                   |   6 +-
>  block/vdi.c                        |   7 +-
>  block/vhdx.c                       |   5 +-
>  block/vmdk.c                       |  14 ++--
>  block/vpc.c                        |   5 +-
>  blockdev.c                         |   8 ++-
>  hw/scsi/scsi-disk.c                |   5 ++
>  tests/unit/test-block-iothread.c   |   3 +
>  scripts/block-coroutine-wrapper.py |  20 ++++--
>  block/meson.build                  |   1 +
>  46 files changed, 443 insertions(+), 346 deletions(-)
> 



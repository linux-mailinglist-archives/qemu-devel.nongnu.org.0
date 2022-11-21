Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB43632743
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8Jt-0000BH-U2; Mon, 21 Nov 2022 10:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox8Jp-0000AA-9L
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox8Jm-0001KY-0Z
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669042961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cELcGnuwb4nWPUe0cvqm4YPexaNGPcy2BR+cbvjSSs=;
 b=FjjXtd3x4H4GH9EKC7E1tQpqaVYvRL2E/woKiqwZMGz5TBjqcu3Fecj0uCGv4LgsvK0Dda
 hD2gUesk51x+eOfhEnLR9tM9burYwhBnF0Axy5MtJNI7yI22PitsLQLJ+0KRtrhVU3ip+A
 XTIdmP3s/7Aiucct+kPWvWTeqIQoCi0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-YSVY4LKlMmuAqvaLgzLAKA-1; Mon, 21 Nov 2022 10:02:39 -0500
X-MC-Unique: YSVY4LKlMmuAqvaLgzLAKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i133-20020a1c3b8b000000b003cffc0a69afso7019139wma.9
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7cELcGnuwb4nWPUe0cvqm4YPexaNGPcy2BR+cbvjSSs=;
 b=ankXHU2MnmFox7GS8kohiPYEcNSHXvppMbX/RiMIjQVCCAQ2bsye27dIynZjnuuWQs
 /x22w37qiNkEr8/bBxG3b0C91jGdjTv5jr3PeEaJpnawmFIV/gAfrTznXF5xUYqbbliV
 MZHVeVbMxOBgs/L0j/CwX/nCF6pHJrpqc6mZjYxYlZFIffEEw0rtPGYttGr7xm8oy/SO
 Lns2i8fLli9roFkaqQErlkrSriC8d8JTpMXhCb6ihpBL1ShtYgKB2Rx2NE3Fv3ozOPE4
 Zy34r+8fl0Zk9fbROwn73L32Zmsd57KrELDZJhaORpHx7l+XB1nTMdBdYPUB49hjV/0P
 90tA==
X-Gm-Message-State: ANoB5pmtLuY+CrPE1mbMX9gCmcv9cfdCWGp+YGf/kXyyIB2ttprD7q2t
 RyrufaxoQJUIxJYlXg/7PTpcAZVpx6vq/G05caKOlRaSJ3OGMHdnoox+zfbDr5qaUgnF44+hHy7
 BAnKGjOnyFAJT/n4=
X-Received: by 2002:a5d:6b8d:0:b0:236:4c14:4e4c with SMTP id
 n13-20020a5d6b8d000000b002364c144e4cmr11418636wrx.634.1669042955936; 
 Mon, 21 Nov 2022 07:02:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf70oLMPgV2nC+M/T9q6IaqUH/eSs0Dz6FA+UgfSGmTKW+0UYWsilZf9pegnxxcPvrO28Tkn/g==
X-Received: by 2002:a5d:6b8d:0:b0:236:4c14:4e4c with SMTP id
 n13-20020a5d6b8d000000b002364c144e4cmr11418091wrx.634.1669042948438; 
 Mon, 21 Nov 2022 07:02:28 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b00241bd177f89sm10695334wrr.14.2022.11.21.07.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:02:28 -0800 (PST)
Message-ID: <baec4d74-4c61-092a-f508-a6e7018762fe@redhat.com>
Date: Mon, 21 Nov 2022 16:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Alberto Garcia <berto@igalia.com>,
 Ilya Dryomov <idryomov@gmail.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org
References: <20221116140730.3056048-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Ok, as I expected simple changes in a previous based-on serie provoke a
cascade of changes that inevitably affect these patches too.

While I strongly suggest to have an initial look at these patches
because it gives an idea on what am I trying to accomplish, I would not
go looking at nitpicks and trivial errors that came up from the based-on
series (ie "just as in the previous serie, fix this").

The order of the series is:
1. Still more coroutine and various fixes in block layer
2. Protect the block layer with a rwlock: part 1
3. Protect the block layer with a rwlock: part 2
4. Protect the block layer with a rwlock: part 3

Thank you,
Emanuele

Am 16/11/2022 um 15:07 schrieb Emanuele Giuseppe Esposito:
> Please read "Protect the block layer with a rwlock: part 1" and
> "Protect the block layer with a rwlock: part 2" for an
> additional introduction and aim of this series.
> 
> In this serie, we cover the remaining BlockDriver IO callbacks that were not
> running in coroutine, therefore not using the graph rdlock.
> Therefore convert them to coroutines, using either g_c_w or a new
> variant introduced in this serie (see below).
> 
> We need to convert these callbacks into coroutine because non-coroutine code
> is tied to the main thread, even though it will still delegate I/O accesses to
> the iothread (via the bdrv_coroutine_enter call in generated_co_wrappers).
> Making callbacks run in coroutines provides more flexibility, because they run
> entirely in iothreads and can use CoMutexes for mutual exclusion.
> 
> Here we introduce generated_co_wrapper_simple, a simplification of g_c_w that
> only considers the case where the caller is not in a coroutine.
> This simplifies and clarifies a lot when the caller is a coroutine or not, and
> in the future will hopefully replace g_c_w.
> 
> While we are at it, try to directly call the _co_ counterpart of a g_c_w when
> we know already that the function always run in a coroutine.
> 
> Based-on: <20221116135331.3052923-1-eesposit@redhat.com>
> 
> Thank you,
> Emanuele
> 
> Emanuele Giuseppe Esposito (15):
>   block/qed: add missing graph rdlock in qed_need_check_timer_entry
>   block: rename refresh_total_sectors in bdrv_refresh_total_sectors
>   block-backend: use bdrv_getlength instead of blk_getlength
>   block: convert bdrv_refresh_total_sectors in generated_co_wrapper
>   block: use bdrv_co_refresh_total_sectors when possible
>   block: convert bdrv_get_allocated_file_size in
>     generated_co_wrapper_simple
>   block: convert bdrv_get_info in generated_co_wrapper
>   block: convert bdrv_is_inserted in generated_co_wrapper_simple
>   block-coroutine-wrapper: support void functions
>   block: convert bdrv_eject in generated_co_wrapper_simple
>   block: convert bdrv_lock_medium in generated_co_wrapper_simple
>   block: convert bdrv_debug_event in generated_co_wrapper
>   block: convert bdrv_io_plug in generated_co_wrapper_simple
>   block: convert bdrv_io_unplug in generated_co_wrapper_simple
>   block: rename newly converted BlockDriver IO coroutine functions
> 
>  block.c                            | 93 +++++++++++++++++++-----------
>  block/blkdebug.c                   |  4 +-
>  block/blkio.c                      |  6 +-
>  block/blklogwrites.c               |  2 +-
>  block/blkreplay.c                  |  2 +-
>  block/blkverify.c                  |  2 +-
>  block/block-backend.c              | 43 ++++++++------
>  block/commit.c                     |  4 +-
>  block/copy-on-read.c               | 12 ++--
>  block/crypto.c                     |  6 +-
>  block/curl.c                       |  8 +--
>  block/file-posix.c                 | 48 +++++++--------
>  block/file-win32.c                 |  8 +--
>  block/filter-compress.c            | 10 ++--
>  block/gluster.c                    | 16 ++---
>  block/io.c                         | 78 +++++++++++++------------
>  block/iscsi.c                      |  8 +--
>  block/meson.build                  |  1 +
>  block/mirror.c                     | 17 ++++--
>  block/nbd.c                        |  6 +-
>  block/nfs.c                        |  2 +-
>  block/null.c                       |  8 +--
>  block/nvme.c                       |  6 +-
>  block/preallocate.c                |  2 +-
>  block/qcow.c                       |  2 +-
>  block/qcow2-refcount.c             |  2 +-
>  block/qcow2.c                      |  6 +-
>  block/qed.c                        |  7 ++-
>  block/quorum.c                     |  2 +-
>  block/raw-format.c                 | 14 ++---
>  block/rbd.c                        |  4 +-
>  block/replication.c                |  2 +-
>  block/ssh.c                        |  2 +-
>  block/stream.c                     |  4 +-
>  block/throttle.c                   |  2 +-
>  block/vdi.c                        |  2 +-
>  block/vhdx.c                       |  2 +-
>  block/vmdk.c                       |  4 +-
>  block/vpc.c                        |  2 +-
>  blockdev.c                         |  8 ++-
>  hw/scsi/scsi-disk.c                |  5 ++
>  include/block/block-io.h           | 40 +++++++++----
>  include/block/block_int-common.h   | 37 +++++++-----
>  include/block/block_int-io.h       |  5 +-
>  include/sysemu/block-backend-io.h  | 32 +++++++---
>  scripts/block-coroutine-wrapper.py | 19 ++++--
>  tests/unit/test-block-iothread.c   |  7 +++
>  47 files changed, 364 insertions(+), 238 deletions(-)
> 



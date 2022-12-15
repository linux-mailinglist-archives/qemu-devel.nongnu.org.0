Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE464DB5D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:39:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nWB-0002PI-DB; Thu, 15 Dec 2022 07:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p5nW7-0002MV-Av
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p5nW4-00081e-Gv
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671107951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkMSUxFF07Hwzusmu993kPf9Z800lyqmfTTXSu5RecQ=;
 b=iAFP/rYgcNME3oo1GUXvfYhoe4JzQ2T92JZi23iig63McHOj0YQ0NFVZI2ZWcWBBO9Yapm
 U5Fuz+W2BIuGRsQjrmMg7uQWksLt+xb1+fBxstkAHOT/Yhc+ANf2vGsmw4AKYqsEJ1OTil
 +jdxA/of7MENFWjLNCi7J9MWgzXYfGM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-mHldKUbQNAWROpFS_GF32g-1; Thu, 15 Dec 2022 07:39:10 -0500
X-MC-Unique: mHldKUbQNAWROpFS_GF32g-1
Received: by mail-qk1-f198.google.com with SMTP id
 bl21-20020a05620a1a9500b006fa35db066aso5750140qkb.19
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkMSUxFF07Hwzusmu993kPf9Z800lyqmfTTXSu5RecQ=;
 b=WexVngIt7mjQ3fUvjbg5u4JUsYpjXDNzxGhQ6gg2kTbn+dvyUFUeQMEwkNcWlOwWV8
 632jjYiM5tkVTGcyWWRMyi3Wm/VbPYKwG0F4zIsXMJ2wnnQ8jrIKS6RjiryN4diLL+Hg
 fp24rZipaIGKy5yFYrr13D1Fx/jC8xInlGAnlygi5iCE1nI/rGDsdaDS8WWJDg/aVNZ6
 cLHmYW4yVlejb0bbdWPCzuJNEsMnV1oOkpEU7qYt8/GHcfpg6Q3uQSRwtOB6Y7INYc/Z
 MlmIqfwz504UQE0xwu5m5II7ogwjqSaC2C5Yrh+kmuciuGthCgIBxBKYYNMuIUPeWUgU
 KXWQ==
X-Gm-Message-State: ANoB5plpxQY2tn9qQPGFL6Ylmz0txSd0EzXioKJtPO00jqeN1ZpxV/tK
 69CYWHc6TRSzrxao+au498MkQor2nOoot/MDrd/MRTycR6yVk4ZpnQsNO7MTAT//Ts6OZAeXiir
 Rs7qMlE0urnoheN8=
X-Received: by 2002:ac8:7597:0:b0:3a8:45f:66f1 with SMTP id
 s23-20020ac87597000000b003a8045f66f1mr30856955qtq.6.1671107949439; 
 Thu, 15 Dec 2022 04:39:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6j711Hy3jXjxBpybk+V6fKi4dEq9JIlPvwC8fVdF7xBdjm3B/wB7x8scGDvuCeyngAxNTmSw==
X-Received: by 2002:ac8:7597:0:b0:3a8:45f:66f1 with SMTP id
 s23-20020ac87597000000b003a8045f66f1mr30856930qtq.6.1671107949120; 
 Thu, 15 Dec 2022 04:39:09 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b20-20020ac85414000000b003a7eceb8cbasm3303153qtq.90.2022.12.15.04.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:39:08 -0800 (PST)
Message-ID: <fa3fcc48-dd44-8274-60ff-55c253c50e30@redhat.com>
Date: Thu, 15 Dec 2022 13:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/14] block: Move more functions to coroutines
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221213085320.95673-1-kwolf@redhat.com>
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



Am 13/12/2022 um 09:53 schrieb Kevin Wolf:
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

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> Emanuele Giuseppe Esposito (14):
>   block-coroutine-wrapper: support void functions
>   block: Convert bdrv_io_plug() to co_wrapper
>   block: Convert bdrv_io_unplug() to co_wrapper
>   block: Rename refresh_total_sectors to bdrv_refresh_total_sectors
>   block: Convert bdrv_refresh_total_sectors() to co_wrapper_mixed
>   block-backend: use bdrv_getlength instead of blk_getlength
>   block: use bdrv_co_refresh_total_sectors when possible
>   block: Convert bdrv_get_allocated_file_size() to co_wrapper
>   block: Convert bdrv_get_info() to co_wrapper_mixed
>   block: Convert bdrv_is_inserted() to co_wrapper
>   block: Convert bdrv_eject() to co_wrapper
>   block: convert bdrv_lock_medium in co_wrapper
>   block: Convert bdrv_debug_event to co_wrapper_mixed
>   block: Rename newly converted BlockDriver IO coroutine functions
> 
>  include/block/block-io.h           | 36 +++++++++----
>  include/block/block_int-common.h   | 26 ++++++----
>  include/block/block_int-io.h       |  5 +-
>  include/sysemu/block-backend-io.h  | 31 ++++++++---
>  block.c                            | 82 ++++++++++++++++++------------
>  block/blkdebug.c                   |  4 +-
>  block/blkio.c                      |  6 +--
>  block/blklogwrites.c               |  2 +-
>  block/blkreplay.c                  |  2 +-
>  block/blkverify.c                  |  2 +-
>  block/block-backend.c              | 36 ++++++-------
>  block/commit.c                     |  4 +-
>  block/copy-on-read.c               | 12 ++---
>  block/crypto.c                     |  6 +--
>  block/curl.c                       |  8 +--
>  block/file-posix.c                 | 48 ++++++++---------
>  block/file-win32.c                 | 12 ++---
>  block/filter-compress.c            | 10 ++--
>  block/gluster.c                    | 16 +++---
>  block/io.c                         | 76 +++++++++++++--------------
>  block/iscsi.c                      |  8 +--
>  block/mirror.c                     |  6 +--
>  block/nbd.c                        |  6 +--
>  block/nfs.c                        |  2 +-
>  block/null.c                       |  8 +--
>  block/nvme.c                       |  6 +--
>  block/preallocate.c                |  2 +-
>  block/qcow.c                       |  2 +-
>  block/qcow2-refcount.c             |  2 +-
>  block/qcow2.c                      |  6 +--
>  block/qed.c                        |  4 +-
>  block/quorum.c                     |  2 +-
>  block/raw-format.c                 | 14 ++---
>  block/rbd.c                        |  4 +-
>  block/replication.c                |  2 +-
>  block/ssh.c                        |  2 +-
>  block/throttle.c                   |  2 +-
>  block/vdi.c                        |  2 +-
>  block/vhdx.c                       |  2 +-
>  block/vmdk.c                       |  4 +-
>  block/vpc.c                        |  2 +-
>  blockdev.c                         |  8 ++-
>  hw/scsi/scsi-disk.c                |  5 ++
>  tests/unit/test-block-iothread.c   |  3 ++
>  scripts/block-coroutine-wrapper.py | 20 ++++++--
>  block/meson.build                  |  1 +
>  46 files changed, 316 insertions(+), 233 deletions(-)
> 



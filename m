Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571D493970
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:23:38 +0100 (CET)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA93x-0003Mx-B5
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8wV-0007rW-BT; Wed, 19 Jan 2022 06:15:58 -0500
Received: from [2a00:1450:4864:20::32d] (port=37648
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8wT-0001TI-59; Wed, 19 Jan 2022 06:15:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13710037wmj.2; 
 Wed, 19 Jan 2022 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=18JCcxc0XKF5xLe0RgtOMcUl5B0F0mo+Ct1DeR8i6fo=;
 b=QM6QqUbOrGJrFZI6KUsh+j6hV09giGMVWPrzLsQSAiLoeaI5ZrKDbtQLiaXgzK5Mh6
 olSq8lqXFpvkdfGBPMAJUjbJYIQyyUFC2+9KDpjepcoFx/JFpIjRaE5ByA86fKVO2Ekt
 EQxYzxDmj8Uoy2abTgXdUwI+xFV/qTA10O3of7XbY3kTIJGqmU3djfErTMDd63DAzrZN
 vTGg3c90d+tyXWVRr2Eo0veM46J2Z3l2qFYWmOKauuS8uulFPBjuhKGjOdd8JXm6CFQD
 R7POGf3+HLtJj5dXNNiXLEbbT0nvQhFF1U6PdYH6yMprR2UNIekQODh6lmN1S9sy28af
 a3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=18JCcxc0XKF5xLe0RgtOMcUl5B0F0mo+Ct1DeR8i6fo=;
 b=C/sGh7LbBMGRHrJ5KBek2JfTCyGGBajDv3pn1HrvhlTXyh0VS7KLSHAvh6u1Z17UsT
 yGLIhnMHA2uwclm48iNbrM+Mi1Dy5XvBxLsZKN7HxgobntvQnTMjo8Ih7sF6wQId6cNH
 LicXUuOPeyAECQNXYdpS0RzbYmdRrNen+/gsNcNB+QA+M9TxLasF1nnFniR5RguXBBwq
 PopCeDcpMSMOeh3lvM/eAS762hIV4cDTqFhzNE2bfRruFtARCjtyeGO0fJ/TVFWUrg1a
 9gA2eOeHvZkT8eLwPHKKfsw1YOQra1gSz9u4WdKaGSKq+7+vYLSmU8QablOXhkWTxWa9
 t6Xg==
X-Gm-Message-State: AOAM531ffC2J3HiXoRMK7WitdNk5okCmBBGt3ZABZfk8Mjcft4F4mPYD
 6aIpaD04QxlEzTzdiSMhvDQ=
X-Google-Smtp-Source: ABdhPJzbe73snd8ihh0LfJfbPhLDw/qwkuncbS8l+hpaZOvCTufjhEflCASvVdZwQJaHF31DO1HNpQ==
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr16065385wrd.616.1642590951099; 
 Wed, 19 Jan 2022 03:15:51 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l20sm6622929wms.24.2022.01.19.03.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:15:50 -0800 (PST)
Message-ID: <11bd20ed-b875-8caf-8efe-45e2e75621ab@redhat.com>
Date: Wed, 19 Jan 2022 12:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/16] job: replace AioContext lock with job_mutex
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
> In this series, we want to remove the AioContext lock and instead
> use the already existent job_mutex to protect the job structures
> and list. This is part of the work to get rid of AioContext lock
> usage in favour of smaller granularity locks.
> 
> In order to simplify reviewer's job, job lock/unlock functions and
> macros are added as empty prototypes (nop) in patch 1.
> They are converted to use the actual job mutex only in the last
> patch, 14. In this way we can freely create locking sections
> without worrying about deadlocks with the aiocontext lock.

Oops, sorry -- I missed this explanation when first reading the cover 
letter.  Good job, though it needs another iteration; especially for 
patch 14, and possibly to decide the right placement of patches 10-13.

Thanks,

Paolo

> Patch 2 defines what fields in the job structure need protection,
> and patches 3-4 categorize respectively locked and unlocked
> functions in the job API.
> 
> Patch 5-9 are in preparation to the job locks, they try to reduce
> the aiocontext critical sections and other minor fixes.
> 
> Patch 10-13 introduces the (nop) job lock into the job API and
> its users, following the comments and categorizations done in
> patch 2-3-4.
> 
> Patch 14 makes the prototypes in patch 1 use the job_mutex and
> removes all aiocontext lock at the same time.
> 
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
> 
> This serie is based on my previous series "block layer: split
> block APIs in global state and I/O".
> 
> Based-on: <20211124064418.3120601-1-eesposit@redhat.com>
> ---
> v3:
> * add "_locked" suffix to the functions called under job_mutex lock
> * rename _job_lock in real_job_lock
> * job_mutex is now public, and drivers like monitor use it directly
> * introduce and protect job_get_aio_context
> * remove mirror-specific APIs and just use WITH_JOB_GUARD
> * more extensive use of WITH_JOB_GUARD and JOB_LOCK_GUARD
> 
> RFC v2:
> * use JOB_LOCK_GUARD and WITH_JOB_LOCK_GUARD
> * mu(u)ltiple typos in commit messages
> * job API split patches are sent separately in another series
> * use of empty job_{lock/unlock} and JOB_LOCK_GUARD/WITH_JOB_LOCK_GUARD
>    to avoid deadlocks and simplify the reviewer job
> * move patch 11 (block_job_query: remove atomic read) as last
> 
> Emanuele Giuseppe Esposito (16):
>    job.c: make job_mutex and job_lock/unlock() public
>    job.h: categorize fields in struct Job
>    job.h: define locked functions
>    job.h: define unlocked functions
>    block/mirror.c: use of job helpers in drivers to avoid TOC/TOU
>    job.c: make job_event_* functions static
>    job.c: move inner aiocontext lock in callbacks
>    aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>    jobs: remove aiocontext locks since the functions are under BQL
>    jobs: protect jobs with job_lock/unlock
>    jobs: document all static functions and add _locked() suffix
>    jobs: use job locks and helpers also in the unit tests
>    jobs: add job lock in find_* functions
>    job.c: use job_get_aio_context()
>    job.c: enable job lock/unlock and remove Aiocontext locks
>    block_job_query: remove atomic read
> 
>   block.c                          |  18 +-
>   block/commit.c                   |   4 +-
>   block/mirror.c                   |  21 +-
>   block/replication.c              |  10 +-
>   blockdev.c                       | 112 ++----
>   blockjob.c                       | 122 +++---
>   include/block/aio-wait.h         |  15 +-
>   include/qemu/job.h               | 317 +++++++++++----
>   job-qmp.c                        |  74 ++--
>   job.c                            | 656 +++++++++++++++++++------------
>   monitor/qmp-cmds.c               |   6 +-
>   qemu-img.c                       |  41 +-
>   tests/unit/test-bdrv-drain.c     |  46 +--
>   tests/unit/test-block-iothread.c |  14 +-
>   tests/unit/test-blockjob-txn.c   |  24 +-
>   tests/unit/test-blockjob.c       |  98 ++---
>   16 files changed, 947 insertions(+), 631 deletions(-)
> 



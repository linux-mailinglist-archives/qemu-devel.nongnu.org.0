Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C3425B54
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:08:05 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYYkO-00045c-6P
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYYjF-0003JH-1P
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:06:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYYjD-0001ps-Cs
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:06:52 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r2so694175pgl.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ylEbV1re7uQ2XmpbP25RTTwgkCG0jSM2THjiflgIaM=;
 b=i5VEls0Wlyd4MIymsHiL/n5i4FLcHIIw7Jeyw3+vTbqZdTiSCVKfxLbXBGiw86DppI
 LmCqo18VUHGQrJtVP47aMjWUfYZUkRpH5YQYroZNfqpQIcuvEPG7vcQEHkdNo6Zm5y21
 AXr1PMv0aMYBjQcVsNUG/StLp/rO8ZgmHx3Wz1DS5T9OcHBedloLA0qtnQeLXOmDDDhZ
 PbnYdkIHuMwFCF1XJSrDoMEI6ISmHeoEci+IeWUugUFxrT7ifpuVVMa4pCepMzPtsnRk
 oVU+6J2IL4/RSmj+J8NfnrNhIe7O8xu7c7BkYwUoi2xgOQhza+/LrW9RYlee0MDOVQlU
 z5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ylEbV1re7uQ2XmpbP25RTTwgkCG0jSM2THjiflgIaM=;
 b=wJjWv9S08xK7c+6Ikk3wrET364SRMP+E139UgsQ1+utG4XH75ge4hbixuFpEKCQ1wC
 igvZAQX3EvNauGeSzDItyQBPET6AnlvVggqAsRlpfMi2ZRgfj+xwaL8NCI20XSF8Tfvj
 P2YM1Qbl3oaIrRYL9Hy9dEBaWvuYYgo5dAo6mc1zX3EzRg3B2umOwHSuMTQ7sbPBDvK9
 Oc7nrgfN0k7UKwdjFTE/dx3INXkmr3xRlA41fLfb8mQrx2zSf/IbkUndGsTKQ6piOnrp
 LWzhrclsWeqTJfEaKN5CcbT+FBDvRCGbaTiTgClezOFGTA+vol7mvNCriY2412iihGXR
 G7+w==
X-Gm-Message-State: AOAM530qcO3E9buy50ql4EWPebDnnyU2eAbm2pBJD7NL/y5VEmpV1PNA
 XlC518WN2VLVuuXjSOxg+FId2A==
X-Google-Smtp-Source: ABdhPJy8w9Iy1MESrkGoL71Sx0vCIIjQXzGZTJVUhbNhsfucmTlNkB3eagpU7mOPcRsAznByo/Yrsg==
X-Received: by 2002:a62:1e43:0:b0:447:cb0b:4c6e with SMTP id
 e64-20020a621e43000000b00447cb0b4c6emr5704109pfe.1.1633633609168; 
 Thu, 07 Oct 2021 12:06:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u17sm49282pjn.30.2021.10.07.12.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 12:06:48 -0700 (PDT)
Subject: Re: [PULL v2 00/15] jobs: mirror: Handle errors after READY cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211007153904.445009-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <477da178-34b0-4223-c9ff-061478497ae5@linaro.org>
Date: Thu, 7 Oct 2021 12:06:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007153904.445009-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, hreitz@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 8:39 AM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:
> 
>    Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-10-07-v2
> 
> for you to fetch changes up to 2451f72527d8760566a499b7513e17aaceb0f131:
> 
>    iotests: Add mirror-ready-cancel-error test (2021-10-07 10:42:50 +0200)
> 
> ----------------------------------------------------------------
> mirror: Handle errors after READY cancel
> v2: add small fix by Stefano, Hanna's series fixed
> 
> ----------------------------------------------------------------
> Hanna Reitz (13):
>        job: Context changes in job_completed_txn_abort()
>        mirror: Keep s->synced on error
>        mirror: Drop s->synced
>        job: Force-cancel jobs in a failed transaction
>        job: @force parameter for job_cancel_sync()
>        jobs: Give Job.force_cancel more meaning
>        job: Do not soft-cancel after a job is done
>        job: Add job_cancel_requested()
>        mirror: Use job_is_cancelled()
>        mirror: Check job_is_cancelled() earlier
>        mirror: Stop active mirroring after force-cancel
>        mirror: Do not clear .cancelled
>        iotests: Add mirror-ready-cancel-error test
> 
> Stefano Garzarella (2):
>        block/backup: avoid integer overflow of `max-workers`
>        block/aio_task: assert `max_busy_tasks` is greater than 0
> 
>   include/qemu/job.h                                     |  29 ++++++---
>   block/aio_task.c                                       |   2 +
>   block/backup.c                                         |   7 ++-
>   block/mirror.c                                         |  56 +++++++++--------
>   block/replication.c                                    |   4 +-
>   blockdev.c                                             |   4 +-
>   job.c                                                  |  94 +++++++++++++++++++++++-----
>   tests/unit/test-blockjob.c                             |   2 +-
>   tests/qemu-iotests/109.out                             |  60 ++++++++----------
>   tests/qemu-iotests/tests/mirror-ready-cancel-error     | 143 +++++++++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/tests/mirror-ready-cancel-error.out |   5 ++
>   tests/qemu-iotests/tests/qsd-jobs.out                  |   2 +-
>   12 files changed, 316 insertions(+), 92 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
>   create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out
> 

Applied, thanks.

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BD414DDB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:14:16 +0200 (CEST)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4sx-0000VO-Bj
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT4kx-0001Ey-Hb
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:06:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT4ku-0005cH-SU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:05:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso2671314pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gdZmzb41cBVJ3L26iX7wYCpROif9V4koKML563vKBpI=;
 b=c08dKumoaczzhW6suBzUiG+sr4+vTAq/bO11V0IovDhMyFfY/woAGHmfC06tNaR+df
 t7Nz4iQTRlz9J+CkP4NN655UYoO3Fi7XGx1Z9W0kYiS609Z/iuGqSJzTn7lDqtYfKrIH
 o3AwtCeDUf7NnP8tJ9ANSRuZMtVmBt2sOKZ/Ltwqh7uekVcK2f6TpM1yUTA32phLPtMv
 wNvP2OlNR6J6GRrsiP56axewvLsDRTKuY3lIro6pBWoWRoSju5Sc92lrM6LAo4KPi0ZM
 7WABR45C/eS01MYLA8EhP8O3ed9KjH4hwDjrZ5ypeQCt4dstgQlGZnD2d3jK303SG2Jx
 mILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gdZmzb41cBVJ3L26iX7wYCpROif9V4koKML563vKBpI=;
 b=EqNCwYW1u2nfjoZQdAsf4MQD/21dv+KYYYgZEPelXo/pZJS9J0NZhsXBjoSZd/sj1u
 FP5wCuz+Gb3QKkixbWU0Di9MKsWjJ8vinCkntF0BhzdmwRi7hclGC4qUI//yvjYlZYJ8
 xao041guSGyZD20V/NoQKOwPwjdCdyTV4Yxdotq++c8U+F5+shvbp+8ONBMHy+PbtaoQ
 09mEZdMWGEB9OUBUinTJcYVw/b2eLBJ5y2iDs6sXpxHaVk5+KmbULBLkDQ73acZ1F/Xl
 miKYq4efGUgELmtLJfGov8C6KmLN64P15771weY57W2g4IIjxCBZ9jjegJ6eYg3tOaPk
 xWXQ==
X-Gm-Message-State: AOAM5313RNJMcVrq7lXpkbW9zp4jIJgYh30LtliJoduIgPhC1GXiK/86
 IO7s+rh+Xhoy5eUT5KbwK86vxw==
X-Google-Smtp-Source: ABdhPJxhHQaZPwtlFJmurgzuyGGbjKxyrWFBPKtMFpl31TIgmjSO9gFlh60Q/Uonqa+y4KqYjBuOlA==
X-Received: by 2002:a17:90a:5583:: with SMTP id
 c3mr139628pji.133.1632326755151; 
 Wed, 22 Sep 2021 09:05:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id r193sm2895412pfc.197.2021.09.22.09.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:05:54 -0700 (PDT)
Subject: Re: [PULL 00/12] jobs: mirror: Handle errors after READY cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a51243d-5746-260d-3045-b48650aa5047@linaro.org>
Date: Wed, 22 Sep 2021 09:05:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/21/21 3:20 AM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:
> 
>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git  tags/pull-jobs-2021-09-21
> 
> for you to fetch changes up to c9489c04319cac75c76af8fc27c254f46e10214c:
> 
>    iotests: Add mirror-ready-cancel-error test (2021-09-21 11:56:11 +0300)
> 
> ----------------------------------------------------------------
> mirror: Handle errors after READY cancel
> 
> ----------------------------------------------------------------
> Hanna Reitz (12):
>        job: Context changes in job_completed_txn_abort()
>        mirror: Keep s->synced on error
>        mirror: Drop s->synced
>        job: Force-cancel jobs in a failed transaction
>        job: @force parameter for job_cancel_sync()
>        jobs: Give Job.force_cancel more meaning
>        job: Add job_cancel_requested()
>        mirror: Use job_is_cancelled()
>        mirror: Check job_is_cancelled() earlier
>        mirror: Stop active mirroring after force-cancel
>        mirror: Do not clear .cancelled
>        iotests: Add mirror-ready-cancel-error test

This fails testing with errors like so:

Running test test-replication
test-replication: ../job.c:186: job_state_transition: Assertion `JobSTT[s0][s1]' failed.
ERROR test-replication - too few tests run (expected 13, got 8)
make: *** [Makefile.mtest:816: run-test-100] Error 1
Cleaning up project directory and file based variables
ERROR: Job failed: exit code 1

https://gitlab.com/qemu-project/qemu/-/pipelines/375324015/failures


r~


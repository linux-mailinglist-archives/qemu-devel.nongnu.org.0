Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319C509623
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 06:57:58 +0200 (CEST)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhOtA-0007BN-Ra
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 00:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhOrY-0006Pf-T6
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 00:56:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhOrX-0001ma-6k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 00:56:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id x191so3683227pgd.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=zOT/vkTrwQUTfSRO5SQIaZZYc7bjyD/s84TNGK7gJdk=;
 b=kgfYVMqRgYcBsqFsp2ILrFGTdKV7KXoX51o3apb9qUoBqEgQA1oRbJ/t/T5qiHbmlv
 bVPhIXmFek6Pu7ha5KmIzEnaQK6UVpyqxy+r4nfhL43MS/EI8wkYZbb8Edxuv/dcbrRx
 iKE3lQ/QNsAl3G3J35nkYyxKlgieESo2e2yMV+AveVRWSQc4DyAEFBg5NGhQZlT/bxZV
 ve2jgYNf65Hb+gqMykIC8nxgJNPZ3tZj74VL6QT3ChMEzVBqx1tF9kH7hFJkjGAjA4Ts
 CV9ceKPvM6jDxQ4/3AStd6yt+DdJx1QgbmQCPuinzR84yTc19mtXGVB84EIUKiG5audj
 zKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=zOT/vkTrwQUTfSRO5SQIaZZYc7bjyD/s84TNGK7gJdk=;
 b=LS22n9is/dWT4MqrfykEvvMPF6CKejzjz0Y2KIuD8xliHc0X6m+ysunusz2H4lBfGn
 Zu6Q3d9PoyCV7XsBGTbNawD6B+wPXB8CdmsE1IQe1V6ssDD3JlH9JXtA3E3fe2ehB+ch
 agQrJVZjVqC8FZ1pieeCITgDuUqW93nBsmLnGXT7bFej7IBj4nTQ/CARxUX9eK8dEd86
 4HARDR6MO5w5d6Yf8Qm9AFKhs2nw4GH9KwUSCc5n7DYoKZ7R2sG8wpTPC7pE0Twi9apJ
 0LcFcCW0pn+3gPzDJ3o2mMUQ9mZrQKFgdln5IXI3p0mUxJ8T+165t1UtYSBESgEtlz8p
 kTNw==
X-Gm-Message-State: AOAM533qo32a3SPAC7Jb+OrcL5IIYELI6EVIm0vBNRwjHb5D0NTqQRlM
 XSovqc7L4e6m5kZxG1bNGkumSOEn60/YhA==
X-Google-Smtp-Source: ABdhPJzNY6HaTYT2swsuYOT6dy+3gCBT8SBXE7WAH5DpAcs6DsS/iKe6M/29M4lr0Z3EB/0zsi2Ieg==
X-Received: by 2002:a63:8bca:0:b0:3aa:74c5:6e20 with SMTP id
 j193-20020a638bca000000b003aa74c56e20mr4292072pge.13.1650516973152; 
 Wed, 20 Apr 2022 21:56:13 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c6:6fbe:b2b3:2c53:c732:d443?
 ([2607:fb90:80c6:6fbe:b2b3:2c53:c732:d443])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7809a000000b00505bf88a17bsm20973387pff.214.2022.04.20.21.56.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 21:56:12 -0700 (PDT)
Message-ID: <70566475-e880-683b-a455-f939ea777418@linaro.org>
Date: Wed, 20 Apr 2022 21:56:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/4] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220420191634.1402437-1-richard.henderson@linaro.org>
In-Reply-To: <20220420191634.1402437-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 12:16, Richard Henderson wrote:
> The following changes since commit 2d20a57453f6a206938cbbf77bed0b378c806c1f:
> 
>    Merge tag 'pull-fixes-for-7.1-200422-1' of https://github.com/stsquad/qemu into staging (2022-04-20 11:13:08 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220420
> 
> for you to fetch changes up to a61532faa5a4d5e021e35b6a4a1e180c72d4a22f:
> 
>    tcg: Add tcg_constant_ptr (2022-04-20 12:12:47 -0700)
> 
> ----------------------------------------------------------------
> Cleanup sysemu/tcg.h usage.
> Fix indirect lowering vs cond branches
> Remove ATOMIC_MMU_IDX
> Add tcg_constant_ptr

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Richard Henderson (3):
>        tcg: Fix indirect lowering vs TCG_OPF_COND_BRANCH
>        accel/tcg: Remove ATOMIC_MMU_IDX
>        tcg: Add tcg_constant_ptr
> 
> Thomas Huth (1):
>        Don't include sysemu/tcg.h if it is not necessary
> 
>   include/tcg/tcg.h                |  4 ++++
>   accel/tcg/cputlb.c               |  1 -
>   accel/tcg/hmp.c                  |  1 -
>   accel/tcg/tcg-accel-ops-icount.c |  1 -
>   accel/tcg/user-exec.c            |  1 -
>   bsd-user/main.c                  |  1 -
>   hw/virtio/vhost.c                |  1 -
>   linux-user/main.c                |  1 -
>   monitor/misc.c                   |  1 -
>   target/arm/helper.c              |  1 -
>   target/s390x/cpu_models_sysemu.c |  1 -
>   target/s390x/helper.c            |  1 -
>   tcg/tcg.c                        | 34 +++++++++++++++++++++++++++-------
>   13 files changed, 31 insertions(+), 18 deletions(-)



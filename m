Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6F44BD4D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:51:19 +0100 (CET)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjKA-0005fw-F0
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjJD-0004Vs-IF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:50:19 -0500
Received: from [2a00:1450:4864:20::435] (port=46655
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkjJB-0005uN-UV
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:50:19 -0500
Received: by mail-wr1-x435.google.com with SMTP id u1so2589307wru.13
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 00:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YcDxzF8oep6itqbVRUGyPYWzRNaQdIKyKcm3q/DKuWE=;
 b=GHlA688ZAHcf7qD/jtZZff6KgMIdGPw48gk5u4gulsDrfoYYlzK2pGXLC7L+B+2nUv
 OBfQcDj8l6Q22FAYHpjrHxVQDO5Rz2tU+QmT/IUSLHYo3iOn9y2JnHUEBvXSyuRRIL7g
 +BHwmex8bC5svrh5sID0kt22tgzEtB3MSJLTqTyKNhBshxdvxaZiPjvL+2sLRVTGrI32
 EcwrCYI6Z5YlDwfa62v8UcxM89+ax0q1/aw91oeSzx5BevitHdQ9fp6A43U+CrjKpDPS
 01rjKi++DnGe61mQcWXFD11VEvckRfBFb+Hkb6VqyFvj2IBVQ+gMp1RUtclpjMCRy58f
 RaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YcDxzF8oep6itqbVRUGyPYWzRNaQdIKyKcm3q/DKuWE=;
 b=PUnS5/TrtpWZhKfXFCBpzNesgMKugNSn5IzWcfqktuNiCOnG2otBBBIu6vIuECw/8N
 ONybc5KZ2PaqSUDld1dfnBitqeX1wIJuvMdVJAblfzen0aIyHV7qJ9cbFypHe5Rw9be9
 i+ReGtNTYSE8SUIZmM/45hiASypvdDydqow54LfLV877hXPqLEk+/Yuoi2Ba/ODkgy5Y
 w8OOuAVGWuQq1SJVQ7r3yGunwBO/88Qaov74iQUUL0KQgcW/cSa1XKzUs1bw/inhL5mx
 0D8V8BvkoQy0uVQvjXGeQD8QUFt0nTgriBb3iWNBV2kAVOTKjfpo5f+mUv0ro6CjPAOX
 OaKg==
X-Gm-Message-State: AOAM530F51B8lIrpK17D/fxJaxSq1vS53Ni1kJ+oPQI2cd+X3Tgst7J2
 lGhCsgYMoVzRiHFLL4TIlnLchw==
X-Google-Smtp-Source: ABdhPJzoNaR0Kk7ENpbHBo0mLry13tSSqiYuNu/uTk8K1zcKFeujkK3odg65QhBll1GYdTAR/D6VCw==
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr18133936wrd.206.1636534216316; 
 Wed, 10 Nov 2021 00:50:16 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id c16sm21573109wrx.96.2021.11.10.00.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 00:50:15 -0800 (PST)
Subject: Re: [PULL 0/3] jobs: deprecate drive-backup qmp command
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f13bcb4a-63a9-7f54-cb54-75def468dd2d@linaro.org>
Date: Wed, 10 Nov 2021 09:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, eblake@redhat.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 6:52 PM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584:
> 
>    Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68k into staging (2021-11-09 13:16:56 +0100)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-11-09
> 
> for you to fetch changes up to 1084159b31015e003946d199cbfecaec282e0eb2:
> 
>    qapi: deprecate drive-backup (2021-11-09 18:21:19 +0100)
> 
> ----------------------------------------------------------------
> qmp: deprecate drive-backup (use blockdev-backup instead)
> 
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (3):
>        docs/block-replication: use blockdev-backup
>        docs/interop/bitmaps: use blockdev-backup
>        qapi: deprecate drive-backup
> 
>   docs/about/deprecated.rst              |  11 ++
>   docs/block-replication.txt             |   4 +-
>   docs/interop/bitmaps.rst               | 285 ++++++++++++++++++++++++++++---------
>   docs/interop/live-block-operations.rst |  47 +++---
>   qapi/block-core.json                   |   5 +-
>   qapi/transaction.json                  |   6 +-
>   6 files changed, 268 insertions(+), 90 deletions(-)

Applied, thanks.

r~


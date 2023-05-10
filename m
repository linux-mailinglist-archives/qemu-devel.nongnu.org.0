Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EF6FDB7A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:18:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgt0-00071m-5A; Wed, 10 May 2023 06:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgss-00071N-Ji
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:17:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgsp-0005NQ-F9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:17:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso12106815e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683713838; x=1686305838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VMzV6GyHeA1K7mVCpliRPDh1CLfnMMyJexdOZ4FfhXE=;
 b=uBjEt6HStawXOM5ftvI38atR1d6ogNHVfM1rCwlJ1LO464OCY3abrC+L9vuoiww5Nt
 Mivmqyqu/Q/9sI43+Kl4L2/utN84sXNTwE1Iv0B5zCVjF0O41KaVqsfFuNr6OKAxyn6y
 EVod9g1ENvTWcJG6Zm1dlGf9C7tBWyfS8HR6syFeoRi48TA59KhhwHOBzyn96IobXHPN
 n7gv3i3niY2KS/awq4SUuzJqG4C/OuA7pGw6wh1k1fKH+5vd2uwJO5YZ0pzZ8g5K2C9+
 mDRg59wJNB/gJnnvrRkfgs6Q3kCyEtd5LlD5ZXecR9HSPiSG0/tydm+cxaLb02Nl+1z1
 IpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713838; x=1686305838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VMzV6GyHeA1K7mVCpliRPDh1CLfnMMyJexdOZ4FfhXE=;
 b=ZjXPYZyauJGLFQERDNDjOkihfM9GcLCw+kAx3jO0EqWEvQ1oNaIEl9XvQTCM2brQ6W
 cAKDLRCZHPocHh35uqn9nJ0E5+gSyGX1W3xABpctuvojZR2+o0GTPrzlETI98EE9VTTg
 83PZGdfxaraw8QzJW7XObVBLGK2JmO0U+iwNYXOl93lEnBLuU6TL1aLQ6QMiwMWLv8XR
 dtyta6wNJEetAzyBt5GSXdQU1T/CeYYg6bLbneTmIQmOnMGH+u1iqtZNSWMIR4xqNCnw
 fE67vH3HP7p14bL7v4YIZ2nHa0d5kM6+eJJ4H6iPsFzUI4xH/5Lx40tCAKcOuy7GNN7F
 NGlw==
X-Gm-Message-State: AC+VfDwZjC/s4mz8kCREaN+uxQgkNWnzNYbUZ1xx5dujB3nHhQlR43jD
 NVmCGeqeMbZlk0CObVWNtLX7lA==
X-Google-Smtp-Source: ACHHUZ7igfZVJRVccBfcIkdMOhswnGdyO2Hi26VU/ZLl+w/7LXxYk1H7UTs/KBRc1BgJgI95R8jmFw==
X-Received: by 2002:a5d:526e:0:b0:2f6:a8dd:f088 with SMTP id
 l14-20020a5d526e000000b002f6a8ddf088mr9685429wrc.62.1683713837824; 
 Wed, 10 May 2023 03:17:17 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b0030632833e74sm17033128wrd.11.2023.05.10.03.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:17:17 -0700 (PDT)
Message-ID: <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org>
Date: Wed, 10 May 2023 11:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/10] Migration 20230509 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/23 20:17, Juan Quintela wrote:
> The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:
> 
>    Merge tag 'compression-code-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-08 20:38:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20230509-pull-request
> 
> for you to fetch changes up to 5f43d297bc2b9530805ad8602c6e2ea284b08628:
> 
>    migration: block incoming colo when capability is disabled (2023-05-09 20:52:21 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (20230509 vintage)
> 
> Hi
> In this PULL request:
> - 1st part of colo support for multifd (lukas)
> - 1st part of disabling colo option (vladimir)
> 
> Please, apply.

Build failures.

https://gitlab.com/qemu-project/qemu/-/jobs/4257605099#L2241

    85 | void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num);
       |                                                              ^~~~
       |                                                              u_int


r~



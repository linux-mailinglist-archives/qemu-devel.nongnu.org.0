Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9176FDDE3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:35:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwj2J-00012F-69; Wed, 10 May 2023 08:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwj2H-00010U-Dp
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:35:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwj2F-00026T-Kt
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:35:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315712406so244968075e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683722110; x=1686314110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4OmLUr7LTQ0hj+qmOVOXduXS3+EOlTYkssmhDbDZ28I=;
 b=Zo33HZ36aF9CX28QtUzlIjpZCEJ7LwmBy/L/DgWCA2dG/xsOxA5uJvFluoDDLL2uS8
 qKQJ6qxg+8tAQ7cv7/QPxy1myM1u2vKlDFrelBhZ6mpgsEzisHiyt/+/yc6ADN7FnaKZ
 bcgaDh5Pz9Dg1lCB2tW58GE46zZx3DTRY28YiQQBptUQSfQ6ZyzhMU14NwlRk7Fvnnlr
 uEX6e25zMK5hZlZf6bRFV5AYfSHLfzAqdL4PLJnk3zSePD8e6rNKQ1V44/cVezVgiiYa
 LzEYd/XFE2rbEkrkar6ANV3CpX5OKgF1/M20R8DbTZgVbq+R3hJD0ziuK7mMOtElcJVM
 ieEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683722110; x=1686314110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4OmLUr7LTQ0hj+qmOVOXduXS3+EOlTYkssmhDbDZ28I=;
 b=lV3H8kSbCoGT5dEKxETZDCdo9ps0Z42eCLKJ3ys0a7AoijTNbssT9o+AbdA5RUE4BF
 EHNaPRtk/8CMS3XbvJyugzYJ8TnpfDEZAycPAndg25w2UOfmtT/LD1xPwDmkmzT73Xll
 P+W+FAiwcJU0G1TCD6PKymGFbfSy/hxGW9Ru8XLRzWlSp0tmmNEW7ipmLM49QATx2R0r
 END3cJNWoR/TBEUgiQ8cKUOWCMbtJK8w/HMY5/NwQPQ+iGZOgpAKHGnPoiJTuOIgsLEb
 TdcW0wByBNGa5WXDr9fpZWUMm/3l/Xg0BuZLPfgLQUqWqNXM5/bvWPbG4AyUR5SW1JsY
 D1EQ==
X-Gm-Message-State: AC+VfDy3hcV8HgEOSWQXqnNABbG1kcrAhAwpftVspk/GPfKUzn2n9Gsf
 i/4tKLJ2FouHOu9mCv6AzsBO6Q==
X-Google-Smtp-Source: ACHHUZ7oQ72QMHZoDd/rMDHpYLcLYBbxlO7BxwElP87vIFkL6FsYcjYQTQk+vCcE7TJiVlZOGCCxug==
X-Received: by 2002:a7b:c856:0:b0:3f4:2d85:bcda with SMTP id
 c22-20020a7bc856000000b003f42d85bcdamr3012158wml.19.1683722109846; 
 Wed, 10 May 2023 05:35:09 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfdec6000000b002c70ce264bfsm17220486wrn.76.2023.05.10.05.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:35:09 -0700 (PDT)
Message-ID: <fbe67cac-5135-219f-6c15-7e63e58ce10a@linaro.org>
Date: Wed, 10 May 2023 13:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/10] Migration 20230509 patches
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
 <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org>
 <87ild08jjq.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87ild08jjq.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 13:20, Juan Quintela wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
>> On 5/9/23 20:17, Juan Quintela wrote:
>>> The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:
>>>     Merge tag 'compression-code-pull-request' of
>>> https://gitlab.com/juan.quintela/qemu into staging (2023-05-08
>>> 20:38:05 +0100)
>>> are available in the Git repository at:
>>>     https://gitlab.com/juan.quintela/qemu.git
>>> tags/migration-20230509-pull-request
>>> for you to fetch changes up to
>>> 5f43d297bc2b9530805ad8602c6e2ea284b08628:
>>>     migration: block incoming colo when capability is disabled
>>> (2023-05-09 20:52:21 +0200)
>>> ----------------------------------------------------------------
>>> Migration Pull request (20230509 vintage)
>>> Hi
>>> In this PULL request:
>>> - 1st part of colo support for multifd (lukas)
>>> - 1st part of disabling colo option (vladimir)
>>> Please, apply.
>>
>> Build failures.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/4257605099#L2241
>>
>>     85 | void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num);
>>        |                                                              ^~~~
>>        |                                                              u_int
>>
> 
> Grrr
> 
> And the worst thing is that hate those types, tried to get then out
> long, long ago for a similar problem.

Where do these types come from, and can we poison them on the qemu side?


r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B180E52A59C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:05:51 +0200 (CEST)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyli-0004J9-OP
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyCv-0005xy-Jr; Tue, 17 May 2022 10:29:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyCu-00084o-5U; Tue, 17 May 2022 10:29:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id p26so6449066eds.5;
 Tue, 17 May 2022 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4L5vTVim/+cPnFw8LTkSDAIec5KzgWLWSIEvVqv6HRY=;
 b=Q9PFd+i/OyKwgK+Yn99XU2kfB4y05RFyzWwfcOpPWHYDl0fYF7wAEP5LeY1cDuqhMU
 qfIb6CpI198qC8qBiCRax5A7yoIRP4VxjzvpGnZGQgFezMxuh0XprR4bQm1Joue+toBm
 Kd8q10Fgvl/pIIy7PgKFfui2KG7pTV+SyiRphJqZTeg0bqtdwmM+zOMA7GlmHjklvnBh
 m95FIFZg7KreUsWd7+JubBLe5/O90eNEJopp1HbuzmLGZ95cYQyAI7GjDLQ1VLjalE7T
 C/GD62cIOmysATZkZycuK2hzckaKEo8DOEkwgAJNXF+KdhUMiP6DZf0//3oDUBdT2cIm
 fhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4L5vTVim/+cPnFw8LTkSDAIec5KzgWLWSIEvVqv6HRY=;
 b=rSlnxEFE4G9u4/GV/qjzEijxMP68SWmpEwwQu4+5X+/9TG3fD1x2tB3M2+QpqjV/K6
 Agqp2/+xNmYskpFn9OqUAiXAMK/3DaJFVnoUuZ2lXbxbpTsaptQfaBRj85qhSAm484qI
 nAqB2Q7QX075gqeKax4VWJb5eNgYF8iu+kM09cgOaIfUixEzGg2GkD7hRQyMr0AoEpYJ
 syQrTJ7CRL1mhOtsLF3klpCVfBHk0/EH6EJ+oXancUWXeZJCWkbJwhLJ8wMbTboiIlRD
 KyxaNNPYsxt41ynRxAM6R8y8aZZQJ+u0zeiX2v/f5apwlkxmjlagY29Cnk/JIVFLbQZd
 RhXA==
X-Gm-Message-State: AOAM531DfpyFltMFC0gYn92W6HNVRzwzOj/+ZixUOb+7tlLC29Ettrsp
 BM8V5RyCHBH8seyQ1x/rKAanAL1K+sAxxg==
X-Google-Smtp-Source: ABdhPJxq1fKiuLsLOnaMcS5GuScRke0YC7YuINcLxmNGifV3dBB3iaZmbbR8PihGkUoOosYsElj3qA==
X-Received: by 2002:a05:6402:35d3:b0:427:b3c7:f7f2 with SMTP id
 z19-20020a05640235d300b00427b3c7f7f2mr19179533edc.152.1652797790456; 
 Tue, 17 May 2022 07:29:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 x12-20020aa7cd8c000000b0042aa08c7799sm5006400edv.62.2022.05.17.07.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:29:50 -0700 (PDT)
Message-ID: <4d2ae399-9cd7-599c-b788-180832fbc907@redhat.com>
Date: Tue, 17 May 2022 16:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 18/18] block: Remove remaining unused symbols in
 coroutines.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-7-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/17/22 13:39, Alberto Faria wrote:
> Some can be made static, others are unused generated_co_wrappers.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c |  6 +++---
>   block/coroutines.h    | 19 -------------------
>   2 files changed, 3 insertions(+), 22 deletions(-)


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



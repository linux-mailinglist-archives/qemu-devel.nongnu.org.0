Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7869844E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:18:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNHs-0008Jl-EJ; Wed, 15 Feb 2023 14:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNHp-0008Ex-Iv
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:49 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNHo-0002eS-25
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:49 -0500
Received: by mail-pl1-x62f.google.com with SMTP id m2so21262564plg.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jw5VZKpJZ3Csm4Rc9gqE1FuvcpXrnsDWvZC+u6ecXuw=;
 b=Sh4rV0+IRhngrJGhxR+LS88zlXfhcuBByzFiokDcZQkC3gQ/trfmh+zmLI0WK56VMI
 PTFbQXhG54mItkLDjFwm8uODJwnBpR31+oZoS/tVpVTy8UCGlb7hFt27wTViMM5+1Fwx
 zGGFnTvtz/srBX/Qnaqie76inT3aHwUijXYzVX0WJp+bZgaOmIQmNr+jQCyS+dyb+9W1
 GQgZyNJs8KCt7kuAvBQpVAXwDZxp07RhRW1JCq0ifHOwGJGZoBFZvhoiCCs9l7Zmsn8/
 McNRWHkdXVKbTFGMur1YSnXWgRsFvaje9oOXu4AnYH+XmywlrPCDEU1jf7gYWmdMU+ma
 WGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jw5VZKpJZ3Csm4Rc9gqE1FuvcpXrnsDWvZC+u6ecXuw=;
 b=T5KrQ8BwySA4XBxNTOk3qB5Q8/uvBmUl6VFcUAsRXtHmRuLn0mj1Nuyy5Va4oJgZ+n
 6z81l0UcJHMjkRnFlBZuPbrD9iw+LdVPbExkwCqQ/z9LIQ4MQ9WH9PHYkkbPlQQhoG1c
 4Fo1nXcPjzWci1g1aEN8Alzop3pLrcYL9ib/Y+xG3bAEVvzb+25YLI6t3x3DHAOfC7SC
 MX7Y/VeZpuQMPy4MM9caO4Z/5/VMp/XbzZ0rPW35nxgJ/iK0qyAC+D5Mv1O12/aNekP3
 +P1Bxf0NhXWbfx3pSpaHqjTJ/Z28qW6d3Fvc49/Il0DI4p3X1ZkqKFEf85jUc0pP1fm/
 xg6A==
X-Gm-Message-State: AO0yUKXWYzZa18bFEqzcGK7FtrC6L1bzrj/ypqlhqoi77P7ZT4qfH/7D
 CufmIffr3jZtfhXQQ0m/e3egMA==
X-Google-Smtp-Source: AK7set8ahCcmMH5Ythj0y+z2mjI4oHkdAC4FMRNHl26m2idhYtpHZEfMSZXhYPOrtmnO3t7YFzb6ww==
X-Received: by 2002:a17:902:facb:b0:194:d664:be3a with SMTP id
 ld11-20020a170902facb00b00194d664be3amr2891975plb.16.1676488666544; 
 Wed, 15 Feb 2023 11:17:46 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k19-20020a170902761300b0019a87ede846sm8397850pll.285.2023.02.15.11.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:17:45 -0800 (PST)
Message-ID: <7e73cb60-4754-9112-9c96-5ab874ac40cf@linaro.org>
Date: Wed, 15 Feb 2023 09:17:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-18-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> The function is only used inside ide/pci.c, so doesn't need to be exported.
> 
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/pci.c         | 6 ++++++
>   include/hw/ide/pci.h | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


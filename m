Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC7698420
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:07:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN7M-0008Hi-WC; Wed, 15 Feb 2023 14:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN7J-0008HE-Bi
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:06:57 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN7H-00038j-JG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:06:57 -0500
Received: by mail-pg1-x52e.google.com with SMTP id c29so9136493pgm.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jp9/tF2Ji8DVnha4EZe9kSyWCjwIFyA2E4OWMS/YdD0=;
 b=HeAXivHIB2H7apq+GPeTqzT9Xg/SkLnyXd4dhi7gv+iTxcFyDnOJwLnPt+x53dWADH
 Kk1BJnWvCJX/pp1OSLV42vBh3UFoETbh6xIBHsd16ueTllbqjmhz/z+bZlg9bGQTuRTs
 PYMZWB+KlTpDvi8Kv9ItS0J5ZRaAZafjpeP1eHNN2A0GZKSFnfvFAmFkfUu6G7JgDyOt
 wpDsHnyvqafV/KWGjhOleIDeS+0vSnbf1W4Hn3uVnj3EeNF2mTMmrsmUsIOGxvyBs1B/
 bXnZE/aWax2n8w72Va2N0VravwPMdKG3ry/GhXOaOznvCqzpdNgzjpvnpyEkKejqu79A
 s/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jp9/tF2Ji8DVnha4EZe9kSyWCjwIFyA2E4OWMS/YdD0=;
 b=CKsPw3Mb6PmsdZLUtETeNshnoe8DUcbb5g2h/E5JXgkBZlBs5TI0Z1vbmGBdnJgtgR
 4f49RJU2hAsqriMpepYEixjiEl2TklT0cYtJkKLJ7HcpqPyQlGXKkoOYr0IekK0B+OO3
 rjcVQOHH/WFoj/8IcmjBjSCQ2ohn0VvbomDRi+WZndVUxxtrRYjFUbBU+MzMF4HtcEob
 tISun2PVahseou09dvxF0gMb31upSUTEoWJsYuConnQ5gnTKdnh5wfFlzbsDsa+HL42N
 DyfomlCMdRWKvPAbyhwY4ivuTlNCcOJM2409ZAvmpoKiiGoa8uUgnyn02peajhei1bjK
 BvLA==
X-Gm-Message-State: AO0yUKXhzgs13wpucLpbmgf9o64pmQT/gHYa9ZLXIb8AlrRzyS27eLdY
 tuFx5KIPX4niZJhaGALaALi32w==
X-Google-Smtp-Source: AK7set89P7YQSEbS0TAuno4igvsoLksVjQ6Myibn2o0qtR1gldJVvTYqhyZ6mpva9ln1TpRI4nIKXw==
X-Received: by 2002:aa7:9591:0:b0:5a8:4ba7:5840 with SMTP id
 z17-20020aa79591000000b005a84ba75840mr3048824pfj.26.1676488012318; 
 Wed, 15 Feb 2023 11:06:52 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 l13-20020a62be0d000000b005a7c892b435sm12038030pff.25.2023.02.15.11.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:06:51 -0800 (PST)
Message-ID: <8d44e9a8-3b7d-fd38-ebd5-aa514f87e4da@linaro.org>
Date: Wed, 15 Feb 2023 09:06:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/20] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to
 'hw/ide/mmio.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 2/15/23 01:26, Philippe Mathieu-Daudé wrote:
> "hw/ide.h" is a mixed bag of lost IDE declarations.
> 
> Extract mmio_ide_init_drives() and the TYPE_MMIO_IDE QOM
> declarations to a new "hw/ide/mmio.h" header.
> 
> Document the SysBus interface.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/mmio.c         |  5 +----
>   hw/sh4/r2d.c          |  2 +-
>   include/hw/ide.h      |  3 ---
>   include/hw/ide/mmio.h | 26 ++++++++++++++++++++++++++
>   4 files changed, 28 insertions(+), 8 deletions(-)
>   create mode 100644 include/hw/ide/mmio.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


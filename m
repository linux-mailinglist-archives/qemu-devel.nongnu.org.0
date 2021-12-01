Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77C46585E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 22:29:55 +0100 (CET)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msXAo-0005rY-Cl
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 16:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msX9T-0005AM-Eb
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 16:28:31 -0500
Received: from [2607:f8b0:4864:20::72d] (port=36672
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msX9R-00052a-JJ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 16:28:31 -0500
Received: by mail-qk1-x72d.google.com with SMTP id i9so32612776qki.3
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3GIKt9QDVKFgLus9QeuhFuTU44OWM6CdvEBokKMLyk=;
 b=VvGNdcvUKjvrOLLDm59QO5Z83VQfMQvOs2DV/iUdXwnpl5+yvTueLGNIfkm4UsMcHE
 8DnjKx6M6R0DrQcuA9fKFpftUIRWZJPZVSoSe603Nkr7n6R2/7976iWAIMGdY8Q7RZIp
 g8r33lgW2oy58svr8sWY3hDHfZq75FdBom8Po/yfI8HvDFGX+mxQ/K3mbQT9giIBtmAT
 r0AsBHe3+RKIJMGqV+DrAtLrY1evsUPny+pZ/rjSWoz9M55fBSLCXM/X5UocACHdtLxn
 oOF6cfbAW8TS9RCN0/j8K0WRfk3wpYToSKFzhRTkvWMwx1r8clmcH6oSIpJ3d6dkwdWy
 HC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3GIKt9QDVKFgLus9QeuhFuTU44OWM6CdvEBokKMLyk=;
 b=4enS/DpsXezxlhktw4tNv7wLyfVngMG1ddrQNYZlmC37fXVLQLHgGqccKcRwen/umA
 RxidYTkH4unIfO/7ckAg8dkJGwUuU//PdC1H2JUFK/ihWr4qUU1Uicc0tgaKhiT4qgqg
 bMb49JoE74PbhPRMLrEdJChmRFfn+oapPRPKvT98LWuFXg62jd8z/9KV8qC+BwLtSbmp
 5+5dC3AJLn1EGoNAhlFZ7xS1MBouRbu+MZxXZogkb0cIQjEIHcbw18ALSFycZ6RAFxMm
 ni02zqwgx7GviGox5zwxaBKJNoBrI/HjBPIos7ypyrU/dtK9Wrwq2V3n1vF5BatKVwq1
 IhIg==
X-Gm-Message-State: AOAM531mtdogcmO0ANJljgI+bvhaBZbsHVCgRxtEKlZhI03QYJagWbUt
 15VyBeLRdlG2TbMOnLw2P6F1hw==
X-Google-Smtp-Source: ABdhPJyOJlbmLjotplmYz82uy9c8+J3R5+95oUHX6TUDtLriFwuvG6uINyt/2HnUyu8gf7svY6NzOQ==
X-Received: by 2002:a05:620a:3728:: with SMTP id
 de40mr9166273qkb.68.1638394108577; 
 Wed, 01 Dec 2021 13:28:28 -0800 (PST)
Received: from [172.20.1.209] ([12.86.33.50])
 by smtp.gmail.com with ESMTPSA id m4sm486800qtu.87.2021.12.01.13.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 13:28:28 -0800 (PST)
Subject: Re: [PATCH v12 16/26] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
 <1638346585-3436-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <254fe20d-2909-0dbe-94e0-fae797a2e0fd@linaro.org>
Date: Wed, 1 Dec 2021 16:28:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638346585-3436-17-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 3:16 AM, Song Gao wrote:
> This patch adds support for disassembling via option '-d in_asm'.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   include/disas/dis-asm.h  |   2 +
>   meson.build              |   1 +
>   target/loongarch/disas.c | 612 +++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 615 insertions(+)
>   create mode 100644 target/loongarch/disas.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


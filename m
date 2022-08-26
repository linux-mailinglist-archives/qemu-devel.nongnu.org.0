Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9045A1DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:45:07 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNT8-0002FD-4Q
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNQb-0000Ws-MU
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:42:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNQW-0008Ct-T6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:42:26 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so48554pjg.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VYLxyeKTbVSVpsWlGr3ydDNomQQNC/ziLiWuUn1r/vw=;
 b=JVpt6oNpALHvlJI6RtD0a9RgABb39exsVSC4GS30ijFq9DxpELJjLP4BneSG2F001a
 6md6BFHFi9mxFbO2lj84p5VM/KOUKHXzMfGQlQivpvUQbsATT7Ty0hZfKVCqFM/7IAN9
 BjJQpDSSRl4tedNlLpQVdpYlq8r+fveeiWYJsjwXLtlxkev/DfEJm1+Xw2U86dbfWus0
 QDb57LPJAM+csynjhWjoTowc+abs9phcOqNdtM3h+MlQbVuc4/+HoGLgthvjL0GVPPFu
 U+FsokjDnmz5F7ma/QOE53zlG+G9+6roh8P05gl25Z4fFqiNF2orCtGw755SpBrK89Sz
 L13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VYLxyeKTbVSVpsWlGr3ydDNomQQNC/ziLiWuUn1r/vw=;
 b=SCnvsqJAihnptJp+1BAZOq8oqTqy9XMaqGIeq/PSVFrxgBShYqeG8TIYTXjpy7vLXH
 C1IaO/EZE2vONyTmwapxFOQGbA709w5TqqCuZCjMNZM6cyuyq8203RlEWwI+8MgXGXJ/
 5xjcWjQlp4R6eAT2uFDNiSbY5S94upVnV+lPO5Xq9v7SPM26ugq7/NqmGYplGeghas2F
 oqs/btmXj4CXNNvJtIDFKdXuY9xF8DPo6SZCGm3tu++XytHXmqKUA2ohZB9uX1OjGOCs
 4hioS2KYHUyvuY32q1cFtYjst2eJndMtQOSikJW9CdxlZIcyJL5JT5951rJPOdYfhe4/
 Al4w==
X-Gm-Message-State: ACgBeo1urd5dxqr9ldFv9nmEToNFVScZium8kGtNICVPEtJwzVbxaPbg
 g3iS118H2OPpOdzh1krbVVGDqA==
X-Google-Smtp-Source: AA6agR4IkzxPRJ3RJJ8K7GTk3qI3OylGzwVEGwtLCRnCUgGumLE0ZXrcdKo5Fsx2yaVR0Vg/kb0chA==
X-Received: by 2002:a17:90b:3852:b0:1fa:e83b:3d2c with SMTP id
 nl18-20020a17090b385200b001fae83b3d2cmr1664543pjb.125.1661474543213; 
 Thu, 25 Aug 2022 17:42:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 d65-20020a623644000000b0052d40c4c06esm260991pfa.39.2022.08.25.17.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:42:22 -0700 (PDT)
Message-ID: <dc047844-cc80-36fa-5818-6d1fceba2585@linaro.org>
Date: Thu, 25 Aug 2022 17:42:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/18] i386: Add size suffix to vector FP helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> For AVX we're going to need both 128 bit (xmm) and 256 bit (ymm) variants of
> floating point helpers. Add the register type suffix to the existing
> *PS and *PD helpers (SS and SD variants are only valid on 128 bit vectors)
> 
> No functional changes.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-15-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 48 ++++++++++++++++++------------------
>   target/i386/ops_sse_header.h | 48 ++++++++++++++++++------------------
>   target/i386/tcg/translate.c  | 37 +++++++++++++--------------
>   3 files changed, 67 insertions(+), 66 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29049D4C8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:03:29 +0100 (CET)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqO0-0006Xa-4t
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqJA-0003nf-TH
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:58:30 -0500
Received: from [2607:f8b0:4864:20::102c] (port=56317
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCqJ8-0003qu-Px
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:58:28 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d5so887329pjk.5
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Sf3SU7BojMidxP296DgtQGjYSAhd4A+tPfJDpgC+k4=;
 b=E4ExHVyBtH8tFTK1gpq8EZOoV3i3s9ORJx7bNaNnCOepTrQhdtvZAiGgvQ8pxsKt/U
 0I/WcBH5qz1QtxKnLfbrlLKLf8ldjL19wJp/S3x+ygVHxQ2nDLl7BiZsNzbt7a5zMQ/g
 ysVr5hXG+vKIThgrWMI6MPWFvmDyNNfJCRW7p9nPiYIe48ucjmu7qKYKpnPdNsKGtwWs
 9sliDfIeQED0Vp2PDOU9qK3YIOwNf9S8y8dFFVJw+YZQEhagGf0JdmiAPp1PSLdNqkK4
 eLslpzNJtVOr8Qe0uqMBts3wz6El5Mv7wZvOGPR+BXehV8aoTFzApphGJCF+YoouUMsN
 QABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Sf3SU7BojMidxP296DgtQGjYSAhd4A+tPfJDpgC+k4=;
 b=l+ZuXn2A9Xy3m2nOEMlMA0BZe8WZPBApvoB4V3REDjowfDtEVXu5GFrwiemELlPYMq
 Pue76VfbtlJhFzNqr3vWJ+OsIGGfENWcDw5nOJaEHE7csKeTABh018Rr/1VT5q+r4z8X
 4egG7PmcKBb6pisSZZSC+AxHARQ2fSZ3pNzP3SRsok5wUoLEs7IEmBVhlRb442IcKwUJ
 tO4jGVkeEAdCw9ii/5oOZMdsKaWjt7KgIgfE+MAwYihoFJXsQejhvxHXIyGFha1FZCa3
 ejTSMvP2ngZHc+xduDS6/LXJKMl/kwUYyH0hBIijUE7YjsntStdbzp2PqV2+j1+ARCq/
 9rnQ==
X-Gm-Message-State: AOAM530SlX/h5NPpSif0zveQ4KCfISI6YHkU8ViTJPsPNWenlprhq9uY
 RibVbx/C1yqs83BOBTOQ+TEdQg==
X-Google-Smtp-Source: ABdhPJwKhyb9RpGW2krPplJSiFuzCLMUhcigp9lPmzF71ruoxmrYY6i71LisBBrKgPgA+hriPEDaFQ==
X-Received: by 2002:a17:90a:7084:: with SMTP id
 g4mr10700011pjk.5.1643234305181; 
 Wed, 26 Jan 2022 13:58:25 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id s6sm17878012pgk.44.2022.01.26.13.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:58:24 -0800 (PST)
Subject: Re: [PATCH v2 03/14] target/ppc: Introduce powerpc_excp_40x
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-4-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <097df4a7-abb2-5fa2-4dc5-71721b5b0a0d@linaro.org>
Date: Thu, 27 Jan 2022 08:58:17 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118184448.852996-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 5:44 AM, Fabiano Rosas wrote:
> Introduce a new powerpc_excp function specific for 40x CPUs. This
> commit copies powerpc_excp_legacy verbatim so the next one has a clean
> diff.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 474 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 474 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


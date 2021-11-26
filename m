Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53545EA9F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 10:44:00 +0100 (CET)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqXlv-00042f-B8
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 04:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqXkq-0003Ds-8R
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:42:52 -0500
Received: from [2a00:1450:4864:20::433] (port=33468
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqXkd-0006qO-AT
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:42:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id d24so17421060wra.0
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 01:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rdML5j+T+1ub0Gdh+FkJpaKi7HYHUehIgZXhTrliCS0=;
 b=lgIeW8Ota/iXEDWa6P6ltB3JSkUtCBJ4COwZHCFfzwUacrhiwWkQ0rRlnv9Q9WXDEf
 jEBVmpMbfXCBNVNNxWu9NG5eHtCNE+kY7umoz8wI3g2jp6tU5ldprCrownoTDKh2OA+i
 WrCu1LyGGkONwctu2I05bbdxBrRveaWACLuQ72iEAUR4J7bWev836WiZwviwU5v2C5ae
 D4UshFrkX5jcZ13JKRuwnDZlgl3XLVseo35LHQGNSEgTmypD0ZTtnWgaa6kp2PGHRtEK
 xbIIWdfMZ+1l/N0opsyoV6KPRv0xHn1Hx1A7GRVi6hB50Oc8d2DfAobZ93oQs2cFSYz0
 NaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdML5j+T+1ub0Gdh+FkJpaKi7HYHUehIgZXhTrliCS0=;
 b=QDZK/XRXkwpAwOeBLjxjlQStKuOkGIODo5ixIwV+HlDbD+mbI1dtf0EYEB94YV8qRy
 EeD6vrNPc9PnDsbBwCuvtjHWIURvl5+7wFNnfgvL9vwK7DO8bEHekvN0njxX/vTVNrtG
 h8M56VhGom35RzewDPRtpqE0HG03euER0PqDqPn1RJkHu187v3JUE5KAZFuaZP1BBNf7
 HYs7pzgVyX96H+Q3cy7+hxYvLLfMfyMO4zdvkslDvEXe8kNr81g7T+pndPhX78+cVGHR
 JOPWJMBL3TGyDr8oE7dnwZW4dhfRyseqnybYV8+pKWLkLgxBVLSxNnkKhLV8+1DM4GIX
 mqug==
X-Gm-Message-State: AOAM531BySvCFyoJZg5yGAIK1z073dtJzHP0SKIIfPklDxTK8a655OpS
 ZZjqckSsE/7al+Xq+SHoM7i9tw==
X-Google-Smtp-Source: ABdhPJw++K0VXZKA78xEcR8CB6P6/BaRuCtNbQVVjmk4g1gXeqs3vdGZdCfNqxHjcD7jzBF35NTELQ==
X-Received: by 2002:a5d:480c:: with SMTP id l12mr13192531wrq.518.1637919757527; 
 Fri, 26 Nov 2021 01:42:37 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id z14sm5574215wrp.70.2021.11.26.01.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:42:36 -0800 (PST)
Subject: Re: [PATCH v2 1/7] accel/tcg: introduce CF_NOIRQ
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
 <20211125154144.2904741-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13383bda-3854-8133-44f0-754952bfc552@linaro.org>
Date: Fri, 26 Nov 2021 10:42:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125154144.2904741-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 4:41 PM, Alex Bennée wrote:
> Here we introduce a new compiler flag to disable the checking of exit
> request (icount_decr.u32). This is useful when we want to ensure the
> next block cannot be preempted by an asynchronous event.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - split from larger patch
>    - reword the check in cpu_handle_interrupt and scope to CF_NOIRQ only
> ---
>   include/exec/exec-all.h   |  1 +
>   include/exec/gen-icount.h | 21 +++++++++++++++++----
>   2 files changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


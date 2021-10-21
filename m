Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8367436C55
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:46:05 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdewu-00013b-6p
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeGZ-0006v7-9D
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:02:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeGW-0001yM-RL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:02:18 -0400
Received: by mail-pf1-x432.google.com with SMTP id m14so1601379pfc.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FNj7rUBJnZux10sXvCPS9kdHFpvGLRa+UUCv+G5xk2g=;
 b=p/BchLw+GGwrxOgjO+EYQQxyJIBG5xATPA03majSReMVJoQP8irVeLsiWPm+0x5jr4
 sXkHGI7rC6PTvNrY9iEhN9GcN8HHiR0qTvO07+AezXh6+AeieZ0z1k4b74x91z5BEZd2
 7mlIUDSyDDAqEum5+75mQ0//qg4m6VmATilN46WAI+CZMUuoCjaMe1MsI7XvSZcf19AS
 +FYyvU1tdPT5GuS3DiMgxZD34yFP1B8/X6Nfo023FAMMO5Kyh3W0NoU6CT9Y18ZPk2tC
 SN/piUywq06ORwCUCUFfsAn27m3jGlIV6BwINKBDTFF9dSCIqlR7FMkAwT9QW0EzDoPy
 R97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNj7rUBJnZux10sXvCPS9kdHFpvGLRa+UUCv+G5xk2g=;
 b=Yr5NYxk2vMXTzSoVvK1j3kNRKqy0yIVGs0TmfwVVBHGZptc+fAdJl0LjflhtI3xlDM
 z2wmxZXa7xlylhBkgtXln+oOv0ifvTwPj7tFJJGWzoOifIk3mir21qYDcnpsdpPdcLBU
 qxMe8svPhaLFPTGlKhlvm9XYTfyvccvI9/lWqmJ3mra97YqafmVQVPlQY0Jh5b261o4i
 nx9OWcWuKDP6gdHytzxzPUjHGZg7ahmuzDzcsc0Ts7bvHsfHaKpbZt4PTiYoBrzHNkAv
 3KXhNYEHshbg+DOnuKvnd53+GuweeCSeuDG0awIyj0Ed8dCRoABkBa2vMKdhoGi1ddM4
 jkHg==
X-Gm-Message-State: AOAM53360O0HppIGvujIxmDLqk6a4V4R6N5dK99rxzrlZTR60jCI2Npk
 qL09jhsye6tCzF0hfm1bu6G35Q==
X-Google-Smtp-Source: ABdhPJziuvpYyygeBvlLyegCp2z6azPaX3Xqw2ZAzVlRzqpR+gmil3FuV2hgInh3HbiyutjOO4Gx/g==
X-Received: by 2002:a65:4008:: with SMTP id f8mr5955316pgp.310.1634846535314; 
 Thu, 21 Oct 2021 13:02:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j8sm6624889pfe.105.2021.10.21.13.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:02:14 -0700 (PDT)
Subject: Re: [PATCH v3 02/22] host-utils: fix missing zero-extension in divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-3-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b106abfc-6067-aa81-5d43-cd80d2265b8d@linaro.org>
Date: Thu, 21 Oct 2021 13:02:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-3-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> *plow (lower 64 bits of the dividend) is passed into divs128() as
> a signed 64-bit integer. When building an __int128_t from it, it
> must be zero-extended, instead of sign-extended.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   include/qemu/host-utils.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


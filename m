Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1B3E4E42
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 23:06:01 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDCTA-00067A-SL
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 17:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDCSP-0005PZ-VB
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 17:05:14 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDCSO-0005wf-HZ
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 17:05:13 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so945812pjb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1xTm8KO4njgMGgBQ0Z1uauQ+fjikjom5/+TAa67CU8U=;
 b=pFwbCtupUYhEY1DQRGysO6rkGHLZgotqM8bxU55g7lYUlAXiRXdkVllJGuR/2lo12/
 QDpB8+3VW7VP+00t/Ppgk4bjZyFi7AINKXewDyBkfC59AUnE36bppc9HAtYHwzFx7yLA
 AQ08NRyFeVIzUzimxVyl2zxs5SlnDaXKouzwtwx67kOCSguhkmiziZNywT1aPou3TWxR
 bNkoVX7S8dIATGsp1swybPmXKg0D0rFh9giXe1i1tZmBInokYmbRK52OidCsTiKyWIVW
 AIATs49mEOQEwhjmRvXxNGKEq9QJNHJh3Jirt7Kwqr2fHoD5OEDrHDs88IwilnqzAHon
 fr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xTm8KO4njgMGgBQ0Z1uauQ+fjikjom5/+TAa67CU8U=;
 b=BSCu3r1nQ4MKrOeytLaPBQ0F/u+AYJM17IdRwJNNDFun1nl/dOFsgweVIVtUAlIA+k
 /FYd1/jXlxkn2JeRDemuiw92cYRjpx8UXhkUh4j9dsJT+qK8hnkrz8N4/3Fn7yYAPz4m
 XPLM8SymVCsA1zFp9yTU3H0e/dsS177nkJCwY13ssXBsJYTlB/+UGD+JsPTMJWIv7mTf
 L1b5eXwRQWhJoO6uXKSisx42c+y171tLSl3dZ1eRJ7jntDfM3LdkfUiG3q7eDz+kKLA0
 EnMw4M79rlfpPa/QvcXyuzx6+RfhZChT8f39AGaAgsTieQGl12bRIW9H9yFL6tsiMe+o
 bl7Q==
X-Gm-Message-State: AOAM533RyemvGJLt9fq1LLk0z1oSpNrdv4FTU5K0t7c9f303yLu1VJiO
 o+jBNfPSF+rVv1DbuHnsKpCtCQ4YLrPu5Q==
X-Google-Smtp-Source: ABdhPJzgMKMBvHWyeEyQICflNX054PPr1EIrkEtZ8d3pc5rtR2MFUiP6GnyqJJky05NbNtwy2w9MWQ==
X-Received: by 2002:a05:6a00:22c3:b029:3b4:e9cc:b6d2 with SMTP id
 f3-20020a056a0022c3b02903b4e9ccb6d2mr19430556pfj.45.1628543110755; 
 Mon, 09 Aug 2021 14:05:10 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id q1sm21835039pfn.6.2021.08.09.14.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 14:05:10 -0700 (PDT)
Subject: Re: [PATCH for 6.2 29/49] bsd-user: Add system independent stack,
 data and text limiting
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba4f98fc-5b2a-d258-1205-98ee3ac8cab8@linaro.org>
Date: Mon, 9 Aug 2021 11:05:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-30-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Eliminate the x86 specific stack stuff in favor of more generic control
> over the process size:
>      target_maxtsiz  max text size
>      target_dfldsiz  initial data size limit
>      target_maxdsiz  max data size
>      target_dflssiz  initial stack size limit
>      target_maxssiz  max stack size
>      target_sgrowsiz amount to grow stack
> These can be set on a per-arch basis, and the stack size can be set
> on the command line. Adjust the stack size parameters at startup.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> 
> Sponsored by:		Netflix
> ---
>   bsd-user/elfload.c |  2 +-
>   bsd-user/main.c    | 51 +++++++++++++++++++++++++++++++++-------------
>   bsd-user/qemu.h    |  7 ++++++-
>   3 files changed, 44 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


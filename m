Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905443A6FCF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:09:20 +0200 (CEST)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsstb-0007wV-9x
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssrD-0006Sf-7k
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:06:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssrA-0001K8-A1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:06:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g4so10426817pjk.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=X8OgcPQPaXH/sYlk2+ksosTRLSH+SoriVHl6K8K/588=;
 b=SHrvUJ6R5yvktoO5EY+YOlGlJgTNCCFpg2iWc8eMaCcv7ku/h2vscS0v4GodRvH4i3
 oT/pEdGPCANuCMo+ImbxcRvZXKxAPlE2jf33oqr4A/Si5U6JV3kTwflCiKlZx4NnkPtT
 gUhfoLqryHpcRqs10ff+Ekm0aq4x4LbeRM0QqnOamf1h28r1PT1a2uaFDExMENISXrpn
 yjo9TFFNUgZ3JRFCA8HPmQHVny2VIBIWlaiTynxkwYBrd3356jlv0uJ/fA7xBu73Sts3
 kfYBgkcDdgKDPu761ckny8+Upca+BhY3weHdl4BbvlsIoudiPyBHyx9hQ84K3/XE4ST5
 xMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X8OgcPQPaXH/sYlk2+ksosTRLSH+SoriVHl6K8K/588=;
 b=FS0DK/dAh2x0d1q0/ZjQQJGcmXyl7IBKKB7iYoXv0tTC/gxKjTYeiRnSSXRATcadDf
 FovanypG6dwjspMOMMvK+naGzsEhuqY+eeL2LnCMsgg8WcHS0Nr4FJA74FzLc7qWP5Jk
 z84qiWNKlLuEGrOiOGVPr6/m22gLboG/ylij3APruriKrbTGXPh/F1m52qRwdy+2mmpq
 OEWkhPk7OMj3tXXAgA3tgXG3tmdJiVt64sagh4jW4wBhhSymtLHL2sT9sI5iKAXJyD0c
 gz6nIpTPi8USni9j9sENq6mpebJcRbhLBTrBN7YydD/zXpT6gLj9P7inYayu1BjjPCzt
 gRbg==
X-Gm-Message-State: AOAM531KdT/VNUXe8R5or2uYCSsKSLVUWOsPdyTuAhrnXdTYLcUIpAM5
 ZMiJSmo7Tf3i6jA7KsLt+cdfNZIWWo+plQ==
X-Google-Smtp-Source: ABdhPJz+rdGIjKvl+53NWiF/PcyJLtzsE4t2SR3t7I2FPiqDddwhk5hLk9pSPvfDWQ9DVaAyHX8Pyg==
X-Received: by 2002:a17:902:ab96:b029:117:1f9a:9ad4 with SMTP id
 f22-20020a170902ab96b02901171f9a9ad4mr839205plr.21.1623701206767; 
 Mon, 14 Jun 2021 13:06:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y18sm4625247pgk.53.2021.06.14.13.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:06:46 -0700 (PDT)
Subject: Re: [PATCH v2 19/57] target/arm: Implement MVE VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c29860ea-a255-b902-9498-dc4e8970ef59@linaro.org>
Date: Mon, 14 Jun 2021 13:06:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VABS functions (both integer and floating point).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 13 +++++++++++++
>   target/arm/translate-mve.c | 15 +++++++++++++++
>   4 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


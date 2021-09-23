Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A189417178
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:04:00 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjvq-0000vU-Jc
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrr-0006CJ-Ub
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:53 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrq-0002av-2X
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:51 -0400
Received: by mail-qt1-x82f.google.com with SMTP id e16so9033957qte.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m02CTkaJvOt8vebGe9ytTOI1qXpjwEGR4Uir06EQOog=;
 b=XWUPaHjx6jnCUkgVGXQeJpBgwrYK4z8YxRyR3pzqn7vlFva4W3dKJgMGipDb+EWurB
 3zj6Hon7VWcbQGQPyQyV4HLhni61WZcPCEUF+gFkCtZEYCeE79GqqWktrM50OxnkTCrF
 mkPViqSud6ysKse7cdAmK5SIJTSc7pPpc9ImPaWtBT74Vbo4+ujpdFgVBV+B08PHdiLq
 NmLesmwK9wqqwZ9FY7GXyhZHpXQT2bONLDRwC8WiZv1BYhirRMmDO0cngMiuJ9lSJD3J
 Ms3MntJBx6Debr/dWwu+9m45YryXS5zjWDCNe+4WEi3K6nOJaFkj+jARDAbscB1Nhsux
 8iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m02CTkaJvOt8vebGe9ytTOI1qXpjwEGR4Uir06EQOog=;
 b=rY4PIl23nTPTZM6Db2oCw/OWkOgqO8fUpNxW/QZQBD3NYUu2FBowd/Vm/+yx4s5/Di
 V8nTTfIfStCLYvsI8TJiodS3Qr+s1E8hAWAyeIQROOXM8948Sf+B3AeQE55G8PgPoFjd
 NtTz5BvucyXYVuAcNvmYfKWU6koeNJeNeDWX190GKleIQDVUkKfnfnIYWaAJAZ/mPs/r
 ZPHvQKGckhFa1fncvVnPt0VVgl7nRx9yFcLDOqmM2g2dVuLEE0nutY/f9rY6tEDuZqnN
 fNMJBTPPqzEG31MlZFooabS54bqzrUVfcUTKYFQjtBpH54Y6+m4j+bugzGeGdTJIWHtv
 KVGw==
X-Gm-Message-State: AOAM530F1XTrKxJjycDmfP0hm+m2SjLa4N406IJqo/jVAlnhgRjB/j/o
 q1uXwBqQ1XGtHNm3mZHT5/F15g==
X-Google-Smtp-Source: ABdhPJzoIwBt/1JBLLQL+3Fu5ZxYSMw22Cmgpny7XzDz7eQBIaxPjITnbntUrCzZgoTvoNy5+p+FvQ==
X-Received: by 2002:a05:622a:188d:: with SMTP id
 v13mr3646681qtc.294.1632484789097; 
 Fri, 24 Sep 2021 04:59:49 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id v23sm6035700qkj.76.2021.09.24.04.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:48 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <261b4ee5-07d0-ac11-21a6-a5e1c4865fe1@linaro.org>
Date: Thu, 23 Sep 2021 10:36:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, f4bug@amsat.org,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> From: Mikaël Urankar <mikael.urankar@gmail.com>
> 
> Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
> checking to pread's return value.
> 
> Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -        pread(fd, g2h_untagged(start), end - start, offset);
> +        if (pread(fd, g2h_untagged(start), end - start, offset) == -1)
> +            return -1;

If it's not too annoying wrt rebasing other cleanups, please add the braces now.


r~


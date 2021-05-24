Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA238F22D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:19:39 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEEr-0007CC-DS
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDvi-0003Ol-0L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:59:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDvg-0002Ig-DK
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:59:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso261775pjx.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tPP3xMm+3hjvzZlNztKKZE+v1+/RwXMmRVn8PePSn+Q=;
 b=cVKbKge6edGSPh7eRIQNi6QSWb53MiCMwYKnSfwxqtNbqJOfttwHrpMyQR9eyApV+M
 Gmx4D1HRapDDNSu+pTgnU1TZgmx1U+sgnsrdiH5fGDRlRVJFYDV7lcpNfLk9BpEtojQr
 6J8JZgwbafUjQ2TGlIrYaBSMhQx+caBVYxBE2rZS+MGtmijtgOmMhr5yywP3DamgrZmP
 aUXoFIGo17ycuya+Ii561FXrLQ/UngQOEc8fq95VGV7GL2yoAxXZpLUrx/GE41M49KsS
 3U8B9i/idzjbSOpvgRNvUQqy65qm3nf9CfsV7fc5CwDgvIqkDv75IwKD7c80S5IojhNw
 RegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tPP3xMm+3hjvzZlNztKKZE+v1+/RwXMmRVn8PePSn+Q=;
 b=HByfyyit7ByPebcLEnta/3RYwzdNb4LrmqnuBGenTT5J4bHLiPQXoG0V7CUPccuzFZ
 r/df/UNx0ekFyKbAsUF4q20SJFtnxi0iesnw442Gihb9s0aVkgPa4ZPkMcKxMRvwk6YR
 TfYuVvkZlEdrWfPYJXAoPomq6Z63MygCl1rpHRr3NUGBaG2Adm4eafd//EkXMCP1iap9
 ktMrDsjNddnWgDdeioEK4Nc4Ok1nFO/zMDwmUOJwxNLczL9lYU+Fr4nMKu3Z4IoQQo9O
 glPRI37ImOBKETl5i+c191xWOtcNNovLDqdxPYjS8O5CsjE5XGGB4MhsV4yK7fmG1f5A
 1wGA==
X-Gm-Message-State: AOAM532WxacniUuIbk0wwozlD5PWrPNkJtLO/M6K3VKsNK2oVabMhRb/
 H3CVvU0V5PnVy1zg0BXsxxS8cXILhSkdhg==
X-Google-Smtp-Source: ABdhPJygk+jd+tE7dmwFikHjjg56g1qjtfLbgECBgsGiabJh8DLVRP3hlwv54emdO1W9HpVgK9oRDw==
X-Received: by 2002:a17:90b:1b4f:: with SMTP id
 nv15mr128183pjb.56.1621875586961; 
 Mon, 24 May 2021 09:59:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y26sm11976471pge.94.2021.05.24.09.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:59:46 -0700 (PDT)
Subject: Re: [PATCH 8/9] target/arm: Enable FPSCR.QC bit for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02b5ed61-fbb7-0086-a615-8ef375b23e9f@linaro.org>
Date: Mon, 24 May 2021 09:59:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:28 AM, Peter Maydell wrote:
> MVE has an FPSCR.QC bit similar to the A-profile Neon one;
> when MVE is implemented make the bit writeable.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/vfp_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


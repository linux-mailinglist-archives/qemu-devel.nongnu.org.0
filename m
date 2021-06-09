Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DFF3A1DEE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:07:03 +0200 (CEST)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4Td-0005N7-UM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4SR-0003rd-6W
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:05:47 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4SO-0002SM-9i
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:05:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g24so2156437pji.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=t/GcnXkt0B1zDhtD0NhFS2xFgiEOdnKcD5sSNab1NCI=;
 b=jr+ewOnscH9behmtwWQwgePBlr+vXWl9ANPIvp6weQUXwsn50EgtMnKmveH+fR1T7M
 6ph3XkoxltUMQpV+RG0t2uZcNttbb2KysL1Xib5n9bP/ZHa4UD4BHPIeLIAuJ0W/vOS8
 gj8NkfZswY5272liAhYQqagn7vcAoS3CW4YVHl6+jy3vNCKp+u4AsrUWiMFZ6Fn7uFtj
 uT2wySY/8B8nwoPJn6nxwTdO1VPauvdwRwJAz1YYEudCOl4ehMGq4u2M8lNJmIMZfAea
 AvlKu2n6/Belu9nossmwx2M+D2CZjJBJEziV+dMhtjBNVcANyLGTeZO0wxMaLyUTZVrY
 RRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/GcnXkt0B1zDhtD0NhFS2xFgiEOdnKcD5sSNab1NCI=;
 b=GvyYAXtr0gjU7WYQcKXl05X8jzaDnA/bpKpwkDCi5gKPSQKOrk0f1DxFs6xqf0Kfrv
 +MedLn+ftPH7DNtFsNLHFNViws/1lJEy2h3xWCYmNPCDVfddByMcFQls/z9ANftYUwlr
 x9TmDXJ1PqHyHCKiP8CSAzVKtT6O28eWMhGKCt/98VwGOVfCF6t435IeehveM/MzRDCD
 WhLsgE0CamVRcPd+fSdKQ3adgMlfUbMUBjoaR266eaC3/1G2zE4tNPW1EAoX1hreVBqO
 xPgPUfR2IiStEOXB2z+IgdDGr5Ysr5hK2l8dVXsxIEbwmXdzJEWFa6/0JoebIxxeUssC
 P4uA==
X-Gm-Message-State: AOAM531scMCZi/+qeovCdnkmTODElCLupsQAefZTeQzh/iQ+jlx9WSvR
 5KtvlP1QIVy4XMomeKBvZ+OdpakcVol1FA==
X-Google-Smtp-Source: ABdhPJwW1rYfaqvsy37A3gb/5K85V++qpIJd2m3DNzwOMorvDpou/CWrkMZJG4jkUFje2gFYTxzeVQ==
X-Received: by 2002:a17:90b:1113:: with SMTP id
 gi19mr11974837pjb.96.1623269142518; 
 Wed, 09 Jun 2021 13:05:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k136sm362881pfd.87.2021.06.09.13.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:05:42 -0700 (PDT)
Subject: Re: [PATCH 47/55] target/arm: Implement MVE VQDMLADH and VQRDMLADH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-48-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91f3abe8-f3b9-5401-10fd-e9f01dd0d319@linaro.org>
Date: Wed, 9 Jun 2021 13:05:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-48-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
> +                             int round, bool *sat)
> +{
> +    int64_t m1 = (int64_t)a * b;
> +    int64_t m2 = (int64_t)c * d;
> +    int64_t r;
> +    /*
> +     * Architecturally we should do the entire add, double, round
> +     * and then check for saturation. We do three saturating adds,
> +     * but we need to be careful about the order. If the first
> +     * m1 + m2 saturates then it's impossible for the *2+rc to
> +     * bring it back into the non-saturated range. However, if
> +     * m1 + m2 is negative then it's possible that doing the doubling
> +     * would take the intermediate result below INT64_MAX and the
> +     * addition of the rounding constant then brings it back in range.
> +     * So we add half the rounding constant before doubling rather
> +     * than adding the rounding constant after the doubling.
> +     */
> +    if (sadd64_overflow(m1, m2, &r) ||
> +        sadd64_overflow(r, (round << 30), &r) ||
> +        sadd64_overflow(r, r, &r)) {

Ooh, ahh, an operation that doesn't even exist in SVE2.
Nice use of the new interface, btw.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDD3A6F13
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:32:10 +0200 (CEST)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssJd-0003FD-Jw
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssHI-0001Zo-BO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:29:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssHG-00034H-Ku
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:29:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c12so11342623pfl.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0AVJJPK+5LgiBD1Zr7rUGG/EI24GQJyzjdlN0hv2jWE=;
 b=cvwQKXk95xb7KXdRfdkIqhnp6FFyX5g+uhy0PxkslYe40rt9WD26su5BVRmyVHnFO+
 ma94lRnW6Jqfcb6Zrvmawny6mt2TgF6WYIpMkMWzKhLYVI+zxSBR06hM+b8PkOiiPtAr
 OlHqvyrsiL7fgQ1pZewi1MM7bWnZ+Ngtz4nUU4ijfI2LqaFQHfleOg8hI9Lg/TurkG5F
 oC7byO9SMwqHdwMf+k/0wQq1/6i3rXbV3GiNEWbdkcauPu9oBCRqnmm5wPitcG5D0An2
 ZUFZLf/thpPrdJ/ooMWVxefii6VS00cE8WmgfNJ5wSOl6NtH/kCsSja13DlNyDpKoWzo
 d/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0AVJJPK+5LgiBD1Zr7rUGG/EI24GQJyzjdlN0hv2jWE=;
 b=tWXimyC6XIvKc/zjSv8GMtEJko+8PcuK9K6d09sRAqffH7/lJapPvaifyM/GB4qcFf
 IGFT3T/Gu3+GAkdWKeCf+PV3vBMgozvBq7WHALz8wFWEWtSpqKDly6mWgwSJfqaZO5yJ
 IHiMfI8I4iZu/OB6Ct/gqEOB3bNGY5RgAsTaI/3YTkwQXdiQouDEphd9053wrRIp6oVS
 ZQkSIXQTX3e2Ws0uvBk4/6hm4sCAxDQHvNk9seqU7Vj4W+0fsV5aeNpUSjsaRZfgPr+X
 nR/9OR+PBSyfsoadbnSb9NcmB5pghQvNIDYiNmimhKIQWtP/ojUUdydvIHe6PWfDb6KQ
 S+7g==
X-Gm-Message-State: AOAM530qNZR+9bckTGs6vhdGKvf3gwmZ3h+8f3/Q9Nbe0Rn8lMscdWOq
 FSPVuyD6tQ3V43etXkTHn4Zg7qHCmvxx6Q==
X-Google-Smtp-Source: ABdhPJyzQA6Ps9bdEnw78N2ha/tl17K/PRO/hFH6G2eoelD/wOZ+fepBg6tMkXMR1/AixqFzslQoZQ==
X-Received: by 2002:aa7:905a:0:b029:2f6:d759:6c2d with SMTP id
 n26-20020aa7905a0000b02902f6d7596c2dmr521915pfo.33.1623698978468; 
 Mon, 14 Jun 2021 12:29:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c15sm14298443pgt.68.2021.06.14.12.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:29:38 -0700 (PDT)
Subject: Re: [PATCH v2 11/57] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <079d20d6-336e-2a95-8b3b-abe5d1604aec@linaro.org>
Date: Mon, 14 Jun 2021 12:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
> Implement the forms of the MVE VLDR and VSTR insns which perform
> non-widening loads of bytes, halfwords or words from memory into
> vector elements of the same width (encodings T5, T6, T7).
> 
> (At the moment we know for MVE and M-profile in general that
> vfp_access_check() can never return false, but we include the
> conventional return-true-on-failure check for consistency
> with non-M-profile translation code.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


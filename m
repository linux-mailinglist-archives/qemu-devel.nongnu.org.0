Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E0340D6B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:44:25 +0100 (CET)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxdA-0001GE-5Z
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZY-0008SV-QX
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:40:40 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZW-00046u-Su
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:40:40 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so1678216oor.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S8BecUbGKusNgxBfQYWgESkKlmAd3uL+QRkM2+RBa4w=;
 b=DLTL3GIE72fTjtnUcUMboA4Ygt1MplqovORfo9U5vcWhq3VyqTgX3kTYPoks/qFoai
 5E+IhHbN9Lf74foiHdHaTDe4O1UbjyjRbXrsz29l2TBYKI7p8qPfTfHKPSrBSpaXp12Q
 wTYodwuliz+BWaXAuHJlXoJBuiB6J0stlxBuaDJ3ryelCZ7kAabgWSu73RUNyNfhbADo
 bcZnpePoGJXZCQ1JyKeHvvN6659IX7NQAIjiMF5970TMhqdu2dB3mjxdtUgxeufWDqhr
 L/HCMnWc/Rc13KOYSr9P8SZ6g6ug8bZrw/pOy6jqD5v8ZFewP+p0LlLIJH6Fo4ouS7MW
 A2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S8BecUbGKusNgxBfQYWgESkKlmAd3uL+QRkM2+RBa4w=;
 b=PKNJT6pQQ4Fv5ESQ/6seTfbB0enFkO70PR4E+tTFSHdLYyE4goZQfSxH4ztNUsjHiq
 /uvpoY/iI+q94i3Mqd5bULdwobSd8dXlziCYNxNFJo5i/qRUGdSyOBRc5r0uzOhwCyK2
 DKYUeLvHtVXCQxamiWqKgGqE2NHFEsS4rrIO0R6sIqUj93WSL5nT4QqtTZmsPF353KmD
 kJ9J+a2ShfwtUcgQJHVz3kFkpTmmbcF1ZXZTGpIl4vZcUxHFhyHcd7BNITvyhdDS7fE1
 U58/zCaXEAtGq7QZgRNKW2jyLwMdp1rqaIXGq3RWWAT7s+3VFXxFDUcae879fyAuF6q1
 fXsw==
X-Gm-Message-State: AOAM530AECvjW/4bg38oUaFxkxqJw33mHYZmoloenmmgLNo43pUwFz08
 A4xT3U3+dqZdE2U3mFFABUgfTw==
X-Google-Smtp-Source: ABdhPJxIe61/Z2FhwU4X8Z+xqKfNssTgefvu+zDVUwZRzAO6xz3s2xKFEKgANfz0Tt9L8zLTrsVQLg==
X-Received: by 2002:a4a:e70a:: with SMTP id y10mr8585641oou.75.1616092837843; 
 Thu, 18 Mar 2021 11:40:37 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 106sm640655oth.81.2021.03.18.11.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:40:37 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 3/5] memory: Add offset_in_region to
 flatview_cb arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50e1efc4-c060-2374-e535-6086b57f2e6e@linaro.org>
Date: Thu, 18 Mar 2021 12:40:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:48 AM, Peter Maydell wrote:
> The function flatview_for_each_range() calls a callback for each
> range in a FlatView.  Currently the callback gets the start and
> length of the range and the MemoryRegion involved, but not the offset
> within the MemoryRegion.  Add this to the callback's arguments; we're
> going to want it for a new use in the next commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/exec/memory.h           | 2 ++
>   softmmu/memory.c                | 4 +++-
>   tests/qtest/fuzz/generic_fuzz.c | 5 ++++-
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



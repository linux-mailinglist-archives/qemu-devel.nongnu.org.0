Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E706D2446
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:45:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGvJ-0006OM-TX; Fri, 31 Mar 2023 11:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piGv7-0006O2-U6
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:44:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piGv5-0003Vc-6C
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:44:04 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso25852964pjb.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680277441;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XzuonBlNE8e7gvQH6qpIySG6MwpShbQueNx6mNUAAE=;
 b=LquvyJd357l3Uu9Xgmpm6esqojfkaACyuh5IItddde4UONRP2CPHZH0Fxqq3mVbckX
 CXs9UD6u63EfmGPML2lEUe55cdOBwD73CWbx8LzXxTg433tlFsPbG7eR0A5I5sWMaD+8
 s3wejwytn5VGyQvbZpmMoVVG0WliU4HoBmEKa+0YMv1G6I/JAmoc99Lez8FjNFUUHbPC
 RCuNV2rU75vhjJ9M0b13o9G2OgRl/ajd1+i9LSU54UJ4Yk3pqICVtcyRzCzDZyt/7FK3
 3hOFAdZacQv7F5P0JcC8CKH3yJ01wdvu/MM5PdTgbz6OZTzwWU2lpo3dXDXVqrf+BYVk
 xoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680277441;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XzuonBlNE8e7gvQH6qpIySG6MwpShbQueNx6mNUAAE=;
 b=NEvJyw5cpfr/IK2zvcv9LEsjoyADjdm0yzxXp32ousHrWAq2fFDAQXlW6Sug8RcwaQ
 MH6LmgjAvWweUqVjKTj+iO8J7UnFjApuKFZAiFcLNd7DIj9sYToNumaJqhyn1rFVEVxB
 s1TZ6bX0Fv+KD6NSBZ3NZO5ARPC2g1iO/GutGZmmfhGUcBfDETRTvXqjvFsgd5A35RqB
 8HYLCuFuecQGQY/X/KYlf0rkPnJsuiC0viwLlQiAqvFqOf90ghMDFasNwKfJ/jtPPnPB
 AKp+kV2kiVbWiiY11eUDAtPI9VZAw0tryvvQy+zUqvyAO8rQC6B4pkxyYURsJfUL7kbE
 wOsA==
X-Gm-Message-State: AO0yUKUnvIrksxNXZjKFMB3kdoeO+w/qA9q49l3Upz7mNq25rCB2jLAT
 eq2b0Iv7L/pNQ7yVZlT2aW+kfg==
X-Google-Smtp-Source: AK7set/cXUISU9dfu4D+/rzHf02QmACQFSH77iNrqkn2SWXrjU2vJFYwQhULiwlS6SJyPJ1qEiz9Ag==
X-Received: by 2002:a05:6a20:78a2:b0:d9:4019:1dd2 with SMTP id
 d34-20020a056a2078a200b000d940191dd2mr21298404pzg.24.1680277441410; 
 Fri, 31 Mar 2023 08:44:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a6568ce000000b00502f20aa4desm1763624pgt.70.2023.03.31.08.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 08:44:00 -0700 (PDT)
Message-ID: <e7d7951e-4941-2bc7-aa6a-7c7d10fc1f70@linaro.org>
Date: Fri, 31 Mar 2023 08:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to
 merge_syn_data_abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 07:50, Peter Maydell wrote:
> We already pass merge_syn_data_abort() two fields from the
> ARMMMUFaultInfo struct, and we're about to want to use a third field.
> Refactor to just pass a pointer to the fault info.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41613471BEC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 18:41:24 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwSqh-000693-Cl
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 12:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSmy-00046N-Ax
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:37:35 -0500
Received: from [2607:f8b0:4864:20::52d] (port=38637
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSmw-0003GU-JW
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:37:32 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s137so12549434pgs.5
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gh0RHGql8dCapvjE2Ze2aJuQbF/9FTfF0A3mHoTFCYg=;
 b=qJf16rkVMbZX+XDRsix8IZaJkWVc96u40JooV6Dpp60D+mVda1ZhqMXGU7j8UbwpsN
 5wLUtd+18e6rTjFHluhMmKPlZIb9KHWOtJ+/4dSnKSuhHXCrjj7TAmzoKnq7hQVaTV2U
 qi2x6h6tS0KnSoX87w2M1/L4xRRYx9GWVJ6M+68TSSu/XIf33bZBdLGz79skBCipjFoj
 p0Pk+/QolDYHhMuJmUWLSLxsTTEMuiG5e18dWqUZ6jU+GsgF06xp6bY6iXziGQzZPsSa
 C6+wVUFnZwmudWws9ZcM0V6H9HkhP6pikaGUd9Jjitx7CPPBXOuU7rGVBB9qLSbXRNjV
 ZJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gh0RHGql8dCapvjE2Ze2aJuQbF/9FTfF0A3mHoTFCYg=;
 b=c9Uonb4U9Ta1d6EhwdTymGtWogMIjJqZr/AJQUA29WxF4XVk2KJDzZABeqaOBk6mwC
 5tzYN3GQY5UVAwzc6CQT0B4vxTnhI6ykjw7dKKGVcXgCTJsCDThoGixUJnQJh1gbWprA
 xCuLyuKve8WAAPtNfKnDsBdQz8rV2/BQanHDULiECn19Jt9qbLeTEqJLYvG4zvN6jhcI
 YfcwRyystx0bxotkFzGiWYDxWA/d6W1/yikWIdxD/F8WijZ7WeeMB9n18GIBz+7BCYet
 Nbw1M3QPxcq7doQtzDf/oIfVUQv0CRjNCJ689l4pcc8c3AjOeT3/buoBgoZhC4OlKls0
 LC7Q==
X-Gm-Message-State: AOAM531VPr276vZ6+pfsLeRCCAgYkgTIGuW8PPareVjoeAXzyIPjjQRK
 2dRWV3zum3w71RUp/CYgbEE3OQ==
X-Google-Smtp-Source: ABdhPJwUE7rndxdr6B6ViIl70hkc4DLLqlmISa4LNF0pLAnUEtkiILTzuLM0NSxC5zjLbZBG5xIhQw==
X-Received: by 2002:a05:6a00:884:b0:49f:f5b4:5d17 with SMTP id
 q4-20020a056a00088400b0049ff5b45d17mr28248591pfj.55.1639330649215; 
 Sun, 12 Dec 2021 09:37:29 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g13sm4492169pjc.39.2021.12.12.09.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 09:37:28 -0800 (PST)
Subject: Re: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from
 TableDesc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f11d97fc-18cb-dd23-e071-fb0bd1f41b8d@linaro.org>
Date: Sun, 12 Dec 2021 09:37:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The TableDesc struct defines properties of the in-guest-memory tables
> which the guest tells us about by writing to the GITS_BASER<n>
> registers.  This struct currently has a union 'maxids', but all the
> fields of the union have the same type (uint32_t) and do the same
> thing (record one-greater-than the maximum ID value that can be used
> as an index into the table).
> 
> We're about to add another table type (the GICv4 vPE table); rather
> than adding another specifically-named union field for that table
> type with the same type as the other union fields, remove the union
> entirely and just have a 'uint32_t max_ids' struct field.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  5 +----
>   hw/intc/arm_gicv3_its.c                | 20 ++++++++++----------
>   2 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


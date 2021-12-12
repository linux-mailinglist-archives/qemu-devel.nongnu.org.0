Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7D471C47
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 19:44:47 +0100 (CET)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwTq2-00016z-Bb
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 13:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTmS-0007fd-RV
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:41:04 -0500
Received: from [2607:f8b0:4864:20::531] (port=41621
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTmR-0001oD-9a
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:41:04 -0500
Received: by mail-pg1-x531.google.com with SMTP id k4so12643567pgb.8
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 10:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CrXfzSUW24qLsRryQEUuHDcqLFeAuK3a8SD9wIXDpd4=;
 b=KV1kWzc0fVnZ3hrvE4U4OibHaXvn+BlT/zdcz396eCQwRNZCRVSqLne0LZo/fuSEMi
 mCNawiblksOH0fvKGKXcmqoIg/mKUsevlUusLdCV3XppqdkNVq1U7YtE4tZq0jUuCfpv
 xAd59SQd/ZLkspwJw36PIqNyZxciaiRI7+wP6LORZCJErRFKD1c09uRa/Bi7zfSSwmFj
 SUP5SsQxiktfmIE4BeGYGnTWwReocCCPSiHpGnMP5ViBZUx691ZhYYWN20LEJ0IQuRqQ
 NqhuBsXFP0j8sRp16YBVaezef6z787W2PgtfghJ+UeHOv9KXMLdv0kA21sxFI84kcn+x
 TIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CrXfzSUW24qLsRryQEUuHDcqLFeAuK3a8SD9wIXDpd4=;
 b=7XpI/tjMd6neIqFSPxGAN/4/A8t0FRkrcGoyM6lhw3MTF3H57tCWj3bQZ46Sxxbwll
 i8AN9HKizqB0wVSCfbueB1fMmVReg8cV2liB/hu42NKgL8XCjqsDOriGsjpg0u1KOTli
 R/HMARcHfP3vYku0EnauhD4Usupb4MDGPvqyrcm4D4nPnonofezo+T+EODLUixNPe7bC
 Qqk+Jp4ag/U/WX+D94EB1kNT49HX9iog6iVIuwpHjLLfToOKycfARliRCqS1ZtpUAUlq
 WubpHc48SphJ2aBL5CVxZYen4zJ4kjHQlH7Ia5287CeKpKH8f47o+6HrAdQVv+ue4D/f
 TJUw==
X-Gm-Message-State: AOAM530jzTEPWQ3Z12W/Y7KKp2vInfYXy4lxZs9yvhxV5Wipllwyqj5/
 BvbElLzukBj2RYU1yINGxyDmBw==
X-Google-Smtp-Source: ABdhPJy80cTEwticOOHR8YhshWvXfTURpK3gKc6ES+EL+9p5IGKL+/RLiDry0j5Ml6ztL+EkVK1Ixw==
X-Received: by 2002:a65:4381:: with SMTP id m1mr4185807pgp.375.1639334459465; 
 Sun, 12 Dec 2021 10:40:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t191sm2525331pgd.3.2021.12.12.10.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 10:40:58 -0800 (PST)
Subject: Re: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse
 GITS_TYPE_PHYSICAL define
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f878f8b5-f439-d410-06a8-386b1d93cbd9@linaro.org>
Date: Sun, 12 Dec 2021 10:40:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The GITS_TYPE_PHYSICAL define is the value we set the
> GITS_TYPER.Physical field to -- this is 1 to indicate that we support
> physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
> field.) We also use this define as the *value* that we write into an
> interrupt translation table entry's INTTYPE field, which should be 1
> for a physical interrupt and 0 for a virtual interrupt.  Finally, we
> use it as a *mask* when we read the interrupt translation table entry
> INTTYPE field.
> 
> Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
> ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
> field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
> use of the FIELD() macro to define the fields of an ITE and the
> FIELD_EX64() and FIELD_DP64() macros to read and write them.
> We use ITE in the new setup, rather than ITE_ENTRY, because
> ITE stands for "Interrupt translation entry" and so the extra
> "entry" would be redundant.
> 
> We take the opportunity to correct the name of the field that holds
> the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
> GICv3, which is why we were calling it the 'spurious' field).
> 
> The GITS_TYPE_PHYSICAL define is then used in only one place, where
> we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
> essentially a boolean, hiding the '1' value behind a macro is more
> confusing than helpful, so expand out the macro there and remove the
> define entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 26 ++++++++++++++------------
>   hw/intc/arm_gicv3_its.c  | 30 +++++++++++++-----------------
>   2 files changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


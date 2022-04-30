Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170D51602C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:51:11 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkt7W-0004zi-E7
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt6G-0004Ag-Of
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:49:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkt6F-00065F-As
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:49:52 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4511232pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fb3pzCfXL0H+vRmqnTPnCUhRs3YjdWqHTyfdqbdbut8=;
 b=ZAKrXEMC8WH4sy4LicQartZ00FnC09IesbUAQ81bf0YmqIOxHote3h2dulF5y92fz5
 pSgSN5Bm8ipuQ9swRAQGavYAP8VaYg178G/ceRscIpvSoCUCh7RSLmMF/U7BFXVtfnQh
 NamADOQxf/MBNCTchuVMWK8Xr3n22IykkuVVGMJU0tLECcvylV9++/ej9eMSUaXR+J50
 o9OfaWGoohYK6RBqxNo/xGNAQ+cF2DSGCoZzIA5ys5U75biZi4oCN6PRRCXtyhy3BWN4
 DKCfrbuB3+R1al/Tj9SrXCH0BnbM2WuaGYl5g97zjp0OQVBzdb7O+aghLp1/R0mrbcRP
 MX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fb3pzCfXL0H+vRmqnTPnCUhRs3YjdWqHTyfdqbdbut8=;
 b=COBEazhmTIbE8YZQQ6bsuLF+vnPYGMZ3K0OtIEdBc1nNep4c3f0NShNvHRF2U/rGOG
 WCgj30dYRS8+5QiinGipKbL4J8v2ZHv2+Sem8yGMTJXb6j8Hsc/hAmTb2mIUhxakR4nE
 I93RBtK09MI8N6wT9oODKMY62ihBJgfLnhLQc542AL/Xs7VZBiGO6KUmbIg8d72oZos6
 KY5KHCTvRUF+ZyEkW910OKT1UrIbM/nyCze39z5o/EHT9zOhq9fRrXvWBT0mCx/eHX98
 AMot2hYDz0sfXYDZg0gNPk2LyOqXmDsfBeX1km0VdGA/NWGB2hheKaRXjURRI8WOTcm4
 uaYQ==
X-Gm-Message-State: AOAM530IX3Po76lP82FpEG4/rvSgpUPhxBcD3wZN1m4Qk/MUrjf5jsUQ
 w87Dt4BZM1mO1UKpsKi6bEBMcA==
X-Google-Smtp-Source: ABdhPJyYMlA0aZ54FMw9FGVGKmrPXNRLtu83+gOuz2vYrX2GFlZVqUCW/F05e7Y1jFsxuDzVVfxAJw==
X-Received: by 2002:a17:903:11d1:b0:151:9fb2:9858 with SMTP id
 q17-20020a17090311d100b001519fb29858mr4949591plh.136.1651348189862; 
 Sat, 30 Apr 2022 12:49:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170902d5c700b0015e8d4eb234sm1828774plh.126.2022.04.30.12.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:49:49 -0700 (PDT)
Message-ID: <280d07c0-2027-004a-c9ad-68885151ee2c@linaro.org>
Date: Sat, 30 Apr 2022 12:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 07/12] configure: move symlink configuration earlier
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> Ensure that the pc-bios/optionrom and pc-bios/s390-ccw directory
> exist at the time when we'll write out the compiler configuration
> for them.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 49 ++++++++++++++++++++++++-------------------------
>   1 file changed, 24 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


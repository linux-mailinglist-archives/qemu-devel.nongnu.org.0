Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E964203C8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:40:01 +0200 (CEST)
Received: from localhost ([::1]:56846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7L6-000236-5B
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7JC-0008PC-CE
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:38:02 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7JA-0004eM-Sy
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:38:02 -0400
Received: by mail-qk1-x734.google.com with SMTP id q125so14464771qkd.12
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qp5fvWZf9Vf0qW3BowBIvNBKUP9tUWEJsZx1ipzjlEU=;
 b=dcwUaMfLX/ral/vVKGXZvmWucgo8zg3PIa8PbmmuguulyafNCxDfYDCwKnYSoRdVX2
 oWCvi3ARuZaLyOmFWVTdyy6HaLGUR9/ujYqhlU5XHnY/EfRD8IPGZr3K+XKL85WUit0f
 gHOBnS+YRseQGNmIdK7vzvx4K6TVEm4jv55Nj3zaRYylx8jCo2U/V0jr5MJm62ljQ2q/
 Zn3y4nUFwwAg29lVp8aX3TLHWJnBsUvLI+Tx0MGsqWtaVp7kKuwzZwoooupwneiyEhDJ
 pvlHK//ApSeYWoUXSdiMuizRefn2DCqd7AoloNFU3FmwXuRHqWIcuCWBMePC1OZIbll8
 1vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qp5fvWZf9Vf0qW3BowBIvNBKUP9tUWEJsZx1ipzjlEU=;
 b=fXp7LmlxGwNCiPxrsctWig0yHxynU6njSicpQiyZzrMxH9WUyyQzH0y29R1qhaMjX7
 uZQA5xE660u8IluTs8WORyubqGYkRivaLlilJX6pu7iN3KRTJf51hZ4itHkKYnhfz4oc
 GyAAQiSLBpO9udTcsRjw4gCltEwa16vWIBkvvmkCuev3AI6wO9L62x2WT1UoWQlu1Qkw
 Ixkkh4iWzyXYPZe3MOUk6LPrWqqglImGVc90wneBw8NHvmjtdBIIqP0GoD2gIozxilLk
 tdal3Z0znWebp9vvo4eAdRWTXOkY+m9mqyuSKozj2rDezplbJpHovU6A8zaDBBH64gi0
 D9pw==
X-Gm-Message-State: AOAM531OpfqleJIm2GGImonCBoz1X1WMoquh9j4GvkGPNc9fqQ9finGF
 f+4TTCf0oAyVckA/SBmWaKfW1g==
X-Google-Smtp-Source: ABdhPJycyY5Grw1wK4hpylYCxqUlPHKyHUEKcFByCZH893FcqnHDZoSaVljDlM7NYnx6PFh7fHZ2UQ==
X-Received: by 2002:a37:6c83:: with SMTP id h125mr272968qkc.486.1633289879936; 
 Sun, 03 Oct 2021 12:37:59 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id o23sm7500119qtl.74.2021.10.03.12.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:37:59 -0700 (PDT)
Subject: Re: [PATCH 8/8] target/mips: Use tcg_constant_tl() in
 gen_compute_compact_branch()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5cb55e3-5c7a-b9ca-f0a5-02f0efcff644@linaro.org>
Date: Sun, 3 Oct 2021 15:37:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> The offset is constant and read-only: move it to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


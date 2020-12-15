Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19512DAE93
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:10:33 +0100 (CET)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB28-0006OV-UF
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB0c-00059s-6E
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:08:58 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB0a-0005qD-L1
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:08:57 -0500
Received: by mail-ot1-x343.google.com with SMTP id i6so19445036otr.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YRXyO+7TnIaCnGdr4kG4wDB6c58pWaVj0j0Ctcy6nPI=;
 b=vsMbo+tXy3ffLUjvJqYwzi7ZK+zNhPwZAwn8sZvWmQBQqlAZL2WLefDVpPkgq1JJa7
 DYB3q28JAqKMWU2qWLR/BH2OA4on2uY58isZuiAL9sZ6b3k9zb7E5Gpx6fB467isUinH
 nbM7jM80gAK6F08KS6sdD9GZVcFtw8sanpwm2rYYW3SHNlqBVQ3nhPecZ+8gbjcJob7z
 ZpQBXHSe3nNK0VWcDdvdw17dMmwvUYnSJiIyp2gZ3si8cNFWDnRdhfMlxkBAo4QBG40h
 Gs9V6mpCB1/sYSPCC5BWbYG9pj2i/s/fmt7/3o5tqYi4UqqnIXao8+R5obGlbRFgiW2h
 Gahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRXyO+7TnIaCnGdr4kG4wDB6c58pWaVj0j0Ctcy6nPI=;
 b=I1fHR2KHd1yrUz/kfqBHhQv5AB+U6H6XtvxD8QqHd8QSZPDxU5UgtJ7wVLi/rNitWI
 fIapHfangtPsj6+UfmaORSAfc3Yoo66ZzIfGFu7qniQH2x9hcugTPz2RFnRjzIQziFX8
 vFsADEn43LQIqaVb4OncNHv2JlxBMwSj448U9TAx4CsrovqPrwyemPuyQ22ONXtCx5kL
 ZaoNTiK2NVUhM2rcKzrD8LBMVxlkQgCnKmevazEoj3GIj2ZpNB+EKmE0F5JdUVXSTYYu
 VLTd/iIjzz7zaiQrBlU8pMueXodOd9LwfN62QhU6Dm3zKhvqKFhgpWsqSA8CWqsyXM3M
 kGPw==
X-Gm-Message-State: AOAM530tAq3+K9rNDjUiNw4AG1lj/SdcQU5eIoDikQEAVg0rAhCQIdBC
 pm9gVwhP2SF2IDoftxoF9XWBnw==
X-Google-Smtp-Source: ABdhPJyL3XxZCFlO9Uijv0lbYFXcnldsMAFK5r0ZxzlmranPzNLFSzPLcGeN55XnuP1qJz6Y/8/E8w==
X-Received: by 2002:a9d:3ee4:: with SMTP id b91mr16441000otc.86.1608041335605; 
 Tue, 15 Dec 2020 06:08:55 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r204sm4799797oif.0.2020.12.15.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:08:55 -0800 (PST)
Subject: Re: [PATCH v2 10/16] target/mips: Replace gen_exception_err(err=0) by
 gen_exception_end()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <849d30da-dfed-e588-4c7c-c140acebef4d@linaro.org>
Date: Tue, 15 Dec 2020 08:08:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> generate_exception_err(err=0) is simply generate_exception_end().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD064F643
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L2C-0000Qh-Co; Fri, 16 Dec 2022 19:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L2A-0000QP-P1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:26:34 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L29-0002iZ-5S
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:26:34 -0500
Received: by mail-pf1-x431.google.com with SMTP id x66so2841850pfx.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QUGIKvI5RD6g+0zL9jJpIZiqKf5JyREyunpyk6FTLX8=;
 b=lSFF89083LbFTgiYdF4F6NXy9DD+Nc0safShQ9bNUTO/mTIeOcG5jhmjzBj0tkYDuF
 u3LrNDjnXEQxrXCtP5sbEmcbTjw2Pfp9BfTNT2tyWAo1gYiUiXSDlOg7yBzdQKo8QKaR
 EexxABXsoR4bjWUgfkAfMPhpOF5OKokaAm71EQ5TdkFmATtfBibjqRRFuef1Cd4U5t4Y
 W4GiOIU+AnJeWnq3WOc5e/xti/fn0YIlZz+sFCimRWYMzNPbrQXJN3YhtHMMdmfREDA2
 yEexjisJTno0S1KKi2FSpbibIZcd1iiMxoVsti67ArorVegybojlVxRGIjFLKFUUj4kl
 6YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUGIKvI5RD6g+0zL9jJpIZiqKf5JyREyunpyk6FTLX8=;
 b=VxPPdCqjCEv8GZjhN/kdDQyiukNlKGOkc41n+fRaYYqzihVeYp7BbabsjuPZfskQR/
 hd9PP1LVjp/lrOJAK/Oko998Vmwb/YpOVorxVT9K/HLKZz0T8IhMTU+VnJBJQq9EbHug
 AQ5iHzzEeyzmYaOUaCqHFw6svprsZQHyZxysKikhBf1keK5wpZ4G+cyTKWIHNaG4y9nO
 xmCK3r4KwpjixWXXaz2MV51Eta1v1hNTDEEForJBGxTEu4qNPXT5H6qEDCIsAUv7ML64
 a+5X/KU60b6YCpj2Xqkm3y5Iv3YPGKUsPHLv1rJg50Ah6124wWprEccQBVKMns/3GTg1
 f4Ag==
X-Gm-Message-State: ANoB5pl4FzUqAs8er44T9o6e9s9Og7ov2rZQTrunPGCSUcgIrvgVQShC
 CnYg+dzWQewKY9spy9ha6g3OaQ==
X-Google-Smtp-Source: AA0mqf6d/DR1/W9rTpll6+Zi1WeQ0qYv20jKIJEnwKx+imxjYL9DxzGJTEPHyZ9clrCyeOwmDAbZ9w==
X-Received: by 2002:a62:6081:0:b0:572:24b7:af17 with SMTP id
 u123-20020a626081000000b0057224b7af17mr32214978pfb.10.1671236791061; 
 Fri, 16 Dec 2022 16:26:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa797af000000b00577c70f00eesm2050283pfq.22.2022.12.16.16.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:26:30 -0800 (PST)
Message-ID: <c85303e7-22ee-9a14-f674-b541283661d2@linaro.org>
Date: Fri, 16 Dec 2022 16:26:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] sysemu/kvm: Remove CONFIG_USER_ONLY guard
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
References: <20221216220738.7355-1-philmd@linaro.org>
 <20221216220738.7355-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220738.7355-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 12/16/22 14:07, Philippe Mathieu-Daudé wrote:
> User emulation shouldn't really include this header; if included
> these declarations are guarded by CONFIG_KVM_IS_POSSIBLE.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5432D8C5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:42:18 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrzN-0002bk-69
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrwz-0001Ku-7w
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:39:50 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrwu-0003Mr-Nd
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:39:48 -0500
Received: by mail-pf1-x429.google.com with SMTP id q204so18396911pfq.10
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SBPvWNHDsEbhoJxNIFzVqRxtTF9/e8OCy9RiInJBJt0=;
 b=OC1in8zkwMq+QdG1Ew1O29gH9SeX7He3VjifENAQnsgzmFeoOmQ6gBaOCDSWnFbqkz
 GkaQEmvDeOuP+Gy3Xf+PTeSFwWkmf8rllNG2/wAesUD90EqKHzriKeEOX54oMcXiT//C
 4D//h/NRlTshIEk3sNPoV9ukdB13LBLlNFtan5rF+r6tMVrxhSh8Uxtv8uuGqzOk3t7u
 TXdP9M0YE3dXwTFVEoACebMjzOoyfKKQSMJ9EuZ+euEnHr39xhWg01ZscLK5snKcrp4z
 ZEIpShTz7tVeRktkD5s/LczWTonQ/5nrrENjvKWMvW/wwtpYms50ElGRk1nUvCQ9quwh
 YW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SBPvWNHDsEbhoJxNIFzVqRxtTF9/e8OCy9RiInJBJt0=;
 b=FklcvXpi2Lga9ESY9Doeg98ZZ6Pl8o/XLTP0WKtcNjlL8j4AqZTB/oV7dFpzcC0nQn
 dPqDl/LpmBJTbNSMnggegThe9Cw8Jp/Wtn3evd35Np5YMMTI8ebNyTGT/fWaFUSI43sV
 I+htNYCWufXuaPVYLj6liq8eRgrDAQMXQQdY7GTomMuCKjqqCdlQhcL3zab2JbJ6LXtU
 26sfvwEY0LAgOjS6rz+aYBSQN37tHfNwgR0RTEfOgBgEIDc1cEUfJ+EaeNmNIHWfZ91f
 tHmmHnZIvqdrrePfN3HOig9EjN3UynMnQLApGOOyLfNdlT8wFHxuK+6Cqnxygb+7NsZx
 ZVnw==
X-Gm-Message-State: AOAM530NxLFSmvUEyfSQgLK5ZTGrNu3ugEbYnK6n1bPOPYyqZBmWVf/u
 XYjw3zOjzItmm5zsrrjTPC/Py3LfHbRVPQ==
X-Google-Smtp-Source: ABdhPJwRnB7KiosHbY281/RdVHgKucFm++YDLgM9lLGiCaQ1OdfHrbkFclhzzoQoU+PhE9DzbDBt1A==
X-Received: by 2002:aa7:83cf:0:b029:1ee:f550:7d48 with SMTP id
 j15-20020aa783cf0000b02901eef5507d48mr4784134pfn.12.1614879579834; 
 Thu, 04 Mar 2021 09:39:39 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id u66sm49355pfc.72.2021.03.04.09.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:39:39 -0800 (PST)
Subject: Re: [PATCH 09/44] hw/arm/armsse.c: Use correct SYS_CONFIG0 register
 value for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc86b56e-434a-785e-5cc0-5b7c41714f2e@linaro.org>
Date: Thu, 4 Mar 2021 09:39:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> In the SSE-300, the format of the SYS_CONFIG0 register has changed again;
> pass through the correct value to the SYSINFO register block device.
> 
> We drop the old SysConfigFormat enum, which was implemented in the
> hope that different flavours of SSE would share the same format;
> since they all seem to be different and we now have an sse_version
> enum to key off, just use that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/armsse.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


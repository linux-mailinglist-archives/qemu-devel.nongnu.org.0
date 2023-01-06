Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A335366085D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 21:36:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDtRz-0001II-A4; Fri, 06 Jan 2023 15:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtRx-0001GY-7p
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:36:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtRv-0007lF-0s
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:36:25 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 185so1393725pfz.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 12:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WLfKZTA+hdsKPRq63D62Wf7IIcPLQv1De1Qt1eVaRtQ=;
 b=JniOZ/2cUu2E1biC/jxFbXofRDwTQZpKwjHery8ij1SQw3JQDHu5RMK/O8BDz8akbm
 mqK8dLKbPuHemzjWHQXQDpDTrTH398epDwSLCzdq29dHjGUxZFQ4MVleqLlVjkueH+C8
 pvbE3VnaIGa64UvZbGXb5cNUSHs+ljsGQGm7u1ToRTXQQnfqlADvbDhr5QPztLYM8wSX
 hAp4nFqaPuh8Xaa7iC7jFAdAHDw7EVYt3C1X0TaAXPweI9uoVXydOAcILnlUSAlLLVbT
 X+K142lOEGLEPg7K72fxf2uu3LUU2XfOLLsGVQ+zuvNRJ5ZoDfVNpeqlSkpb6SfMjSLy
 lD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WLfKZTA+hdsKPRq63D62Wf7IIcPLQv1De1Qt1eVaRtQ=;
 b=tVW8zWwyiXGmG5htJRWjWM0/zkRqhteV5GcWVtI8bA0afURuo59LQu9wPn5kHvCv1u
 obkzTdEn5+63XTev3efd08mxNwqWVnv4g/VfQfTd0gsNPXWy8xRoDtvDlM5LkrcagKEL
 zYIwEEndUF6mIj853d3DwH3db/vQhC+rj2XFOKb6PL5fO+0xPFunounKnZ3ETRNFgOAp
 H/hHWcCnCAd/X82nJRgO+eMChemSWM47bzJNJ71qh6PlVrGeXDVF8PGgGwtgZIpeavSK
 cCmfXBBxBvMiV//ggnQ+lLuTo5eKEamhE3ChJ7I2OVWsd9A6zQKv2JEIx8hbsUFB+/6H
 0iUw==
X-Gm-Message-State: AFqh2kr0bJGmg3av0eLtJjkkUNHp5bTFBxC4Iab3wJ6nOf6tLzPxR9mV
 NpZeeWjkIgPduSyncVtqnrqaJQ==
X-Google-Smtp-Source: AMrXdXt3VtfSq7J6h0807yzEPeDrLKwrxRHLLCQQclWdnriJnce84ZZT7k2BQAeDVb+3KMPu+H9fkg==
X-Received: by 2002:aa7:8284:0:b0:580:e549:559e with SMTP id
 s4-20020aa78284000000b00580e549559emr41314431pfm.17.1673037381443; 
 Fri, 06 Jan 2023 12:36:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 y9-20020aa78f29000000b0056b9ec7e2desm1493617pfr.125.2023.01.06.12.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 12:36:20 -0800 (PST)
Message-ID: <0447aa15-338f-131d-bed5-49e768af1a48@linaro.org>
Date: Fri, 6 Jan 2023 12:36:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/21] target/arm: fix handling of HLT semihosting in
 system mode
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 08:43, Alex Bennée wrote:
> The check semihosting_enabled() wants to know if the guest is
> currently in user mode. Unlike the other cases the test was inverted
> causing us to block semihosting calls in non-EL0 modes.
> 
> Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=on)
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A367ED5F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTPp-0001Ou-JQ; Fri, 27 Jan 2023 13:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTPn-0001Mf-I6
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:25:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTPm-000676-1M
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:25:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso5505044pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9MS/BLnik8on8d2NXgt/Ng+2HA5QA+KTHqcmNxri3rc=;
 b=CQ5LrfKElmRGgGqhh93gqGeyiO4FcRb2+/Zj//1e+OCPIO1xzhCQVDJVLToB2cvGce
 zBkuEJcVp6RjeiqS4oUVk3lsJkPWjI2v2rBZGXuEWF2496GIhRSVYYOXyviHpZ7l3TS4
 CUhq/eHW5oxte3gRJ3rEGsqsqzNfefmrLhS0F5VGbJ2UB3TgoSiYf8Sf0C/ZBGUKGsG4
 DAyTg9a/EilMGXzUU8//gMV6QIGmTyRo6LYml7R+3dfVTrggh6fg5pzZ83jEJnGp72Pw
 wafh2hEHA5mmPBHOG/NufctvpxemXepIyD6liH6AvL+2tRTIj+N7xxXy0o0ZWah9NN3i
 Hf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9MS/BLnik8on8d2NXgt/Ng+2HA5QA+KTHqcmNxri3rc=;
 b=oEO3Ln2o4wufGlV5e1kGeLqGt0VbkIdzPl2i+VY7qaquEMP5AOA5ZgZiTaMZBnPxm1
 yW8A9BMEYkBgCgEOOhezMnnlvlXlzeAvRO3WVxrCwHtrpfqoEHyRLEtPT++3e2M8fUtM
 Tfwlg8GTWi5L7AufbA0ZN3lvhoF+BPhRmGVOY5ZvnwIXEFvgGdUCLv/2LVuKlwqUA4A0
 DVWeB9mGN1CAQ5iYxePtExw0WXgxabb3Rq/NGTgE3N6mtbiaqOdIcBp7RhECe56dGWKm
 F4aXaPigpq3LGHIguLqkq3HOurv4/sKeOyL2fJjUYlQxN0mqJyw7DptFFunRHVNGy6JB
 e73A==
X-Gm-Message-State: AFqh2kq0YLwyuD2u3OgERqthxbUcTYCuVNTHpZeqgrm4vUV9m008cjhj
 WaJyRB4oLJCbtERFQks9uvOkE0aNcJz3Q1dI
X-Google-Smtp-Source: AMrXdXsAE/Fe/tAk8KF9LkIHmid9QhpqyJ8YDI+uDRhGaDaB7egw/1kwxFJyIOByp9Vxmw8PULD5gg==
X-Received: by 2002:a17:902:ce8f:b0:195:f3e6:ab9f with SMTP id
 f15-20020a170902ce8f00b00195f3e6ab9fmr32577725plg.51.1674843928693; 
 Fri, 27 Jan 2023 10:25:28 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s9-20020a170902ea0900b0019311ec72e8sm2804230plg.253.2023.01.27.10.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:25:28 -0800 (PST)
Message-ID: <5d9c3ed3-94ce-16c6-01c5-75614c350754@linaro.org>
Date: Fri, 27 Jan 2023 08:25:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] target/tricore: Fix OPC2_32_BO_LD_BU_PREINC
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
 <20230127120328.2520624-6-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127120328.2520624-6-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 02:03, Bastian Koppelmann wrote:
> we were sign extending the result of the load, while the instruction
> clearly states that the result should be unsigned.
> 
> Signed-off-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> ---
>   target/tricore/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


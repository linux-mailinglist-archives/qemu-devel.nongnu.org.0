Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACCE6608DD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuOq-00054e-LA; Fri, 06 Jan 2023 16:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuOm-00054N-Pr
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:37:13 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuOk-0003ge-Ea
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:37:12 -0500
Received: by mail-pl1-x634.google.com with SMTP id jn22so3000365plb.13
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCk7wAuifaA5tVuhW9LU5SOgiQQP661C4Mo+wxQIJtE=;
 b=qWhVe3TJhToXAzt/0PlvGdxBQnTeYpcT/GFDSaNqDU3jbGpwcgnZQ3PseaLRZ4AEE4
 9J6YFzNDL5x8vyuaWvPNQxsCXed/vwA41nUM3qNyL0PVZq9fPY54AgLU0pcFEFNGgXjE
 PLtddm88B065fdiaGtcYfJIlRtAoPZ+srAOhf+hTJfOyc284bcp19xiujo6Ts5JeQ84X
 RKfezEpcIVBD+uA3LBoSkbfLI9ZIaWospbsDcqlTZ08atLkqxW1xtUX83SPLPzzVhb/i
 sPT+Ic/S+qouWbv1bzYB7CQmT3PgPX2sPlsZks2kPNjoWwEPkshFoLHTy3/wFZUJjkju
 q+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCk7wAuifaA5tVuhW9LU5SOgiQQP661C4Mo+wxQIJtE=;
 b=jCzBtWKLFU4v4JMHlk9YC333qF5jY8KcslYQy8cmz9MDvoE/gZYBYQY5SxDW6R0Ae5
 +JO/hQDmaRuVDLHSZZiD3j03oYw0ukeKXUHjJs9VLlW0CWsEef2wa0v8mROYrstpzQU0
 kbvWiri/+ga5IySXK4cVMddT4Kb7iSlWvzPt5iIk32BgNqKnX8qhwtiGP5RgnxAWnt8S
 SovrgQHFQUxfwSbgm7QqCkQ2L4wGMpJdWmJuPutCHK25IXnadYF6BFwHCQ9opLnFt+yt
 FQffgf8rANvrrdDTGiAo+WVpjwl8R0kyfaOTAdRVhw5qYGrboyBNoS8vGXsGO0FYRYX5
 kpeQ==
X-Gm-Message-State: AFqh2kqFO3sqbU9eC4/ClLBy6S6YRWMGKIo6jjc+EaxbR4k10f9vA19K
 djuzH2oTVPB1ov/Jwx1vXUQBiQ==
X-Google-Smtp-Source: AMrXdXvAtkUkMWOhpwn2oLEiEm8UoqRgDOIf3GYJmQSZpkBd6oqDAjakTM7kU9P7SqZoTYwOTrUaSA==
X-Received: by 2002:a17:90a:67cd:b0:219:3e5f:2a65 with SMTP id
 g13-20020a17090a67cd00b002193e5f2a65mr60563350pjm.36.1673041028036; 
 Fri, 06 Jan 2023 13:37:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a17090a6ace00b00225d92d69b6sm1324269pjm.29.2023.01.06.13.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 13:37:07 -0800 (PST)
Message-ID: <f70a9b66-4c1a-33dc-ff39-42b86b9a96f0@linaro.org>
Date: Fri, 6 Jan 2023 13:37:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/21] gdbstub: make various helpers visible to the
 rest of the module
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> We will be needing to use these helpers between the user and softmmu
> files so declare them in the headers, add a system prefix and remove
> static from the implementations.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  25 ++++
>   gdbstub/gdbstub.c   | 271 ++++++++++++++++++++++----------------------
>   2 files changed, 161 insertions(+), 135 deletions(-)

I suppose the renaming could have been done separately, but whatever,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


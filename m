Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100C6EF319
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:08:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prd0F-0007LF-9p; Wed, 26 Apr 2023 07:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prd0D-0007Ko-6N
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:08:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prd0B-0000G9-IE
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:08:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94f7a7a3351so1318565466b.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682507278; x=1685099278;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MoZYQsxxiV8bzjpr4hn5qiPECq7y7xwbiLqo2QEGA+0=;
 b=aLoguzaMB9t9asLgNT4AXYaIhcIXF6LBv/4iWuHW4ocNUW+clbZYFYllH6A5AImihF
 f8yvp0zVxqDLTHdxtnI6beesYuCc78NIABigzd3tdhwTj1jCb2xjg1i/dFtfkHZU4fZf
 SxS0ad3r/sgHD8eCO0cbQY/HoAg8WVmkSEg9/t2nCvfwXZazj5+LjOqv3jd2MyRrz8nf
 VdFM86z2oK6dx5x25n7GLLtKtlnN0GSbVG00v67fqR3jFzmVcsijFmBdTvfNO3i08xML
 p1WuBPKuJ6Z4cqh2EvC7srv5SXrVti1OXU3sVx6jUm6zgXsOH1QP3+IdL7P/Ta3lmgxx
 CodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682507278; x=1685099278;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MoZYQsxxiV8bzjpr4hn5qiPECq7y7xwbiLqo2QEGA+0=;
 b=iMtpTDXfdfZPVV6DQnHad85YWVm5PgaCK6bwM6wXKmdYh+IAYYbDxm1bFU91b0Udqr
 apW9E+N+lv6XY/ttuH5xZUP7NzzKw6ud7ua2tO5mW7sj330N4cNFdO7GBcF/alD4sJ0X
 u8xUc0cjHXqYrCEFpep4eRLvJqFwyncj7x4pgEy0JQB67iHHAiwlArXYvkT8tjqiLS6H
 9TdA4QoNZorwC20rL+xwbJk9RLWluVK4Q4MVQM4c0O8AsBPKNYQOKpkI+GWrsUu2inHC
 MTMCqKev2KtlPr3Lh6irOkq2xFQq0P80AzMC6/pZjGXupdxNXtd2rvpXsLVH4sOobpCJ
 eTvA==
X-Gm-Message-State: AAQBX9fEENK2HohY35ABpQzTdY06U9gJEMtuY8BM+U3eXrlFP3rtOyEQ
 EPD5lCwZxTK7Rf1XR/v1zP7R4Fo97qDBFnpZbAeSXQ==
X-Google-Smtp-Source: AKy350Z1qLy6A/STAdIHAba9Bf+TuLyDYqcrrjwEguPisvAJ8HYiMfGYyOITDgY3ZLhC6uBhJ5x61A==
X-Received: by 2002:a17:906:40f:b0:94f:a8fd:b69f with SMTP id
 d15-20020a170906040f00b0094fa8fdb69fmr17348577eja.18.1682507277702; 
 Wed, 26 Apr 2023 04:07:57 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 cw5-20020a170906478500b0095728d6f3b6sm6491788ejc.125.2023.04.26.04.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 04:07:57 -0700 (PDT)
Message-ID: <a9880b85-63ab-122f-9fdb-58fc887a120d@linaro.org>
Date: Wed, 26 Apr 2023 12:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] QAPI patches patches for 2023-04-26
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230426055744.1041930-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 06:57, Markus Armbruster wrote:
> The following changes since commit 327ec8d6c2a2223b78d311153a471036e474c5c5:
> 
>    Merge tag 'pull-tcg-20230423' ofhttps://gitlab.com/rth7680/qemu  into staging (2023-04-23 11:20:37 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/armbru.git  tags/pull-qapi-2023-04-26
> 
> for you to fetch changes up to a17dbc4b79a28ffb9511f192474ffefd88214cde:
> 
>    qapi: allow unions to contain further unions (2023-04-26 07:52:45 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2023-04-26
> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (2):
>        qapi: support updating expected test output via make
>        qapi: allow unions to contain further unions
> 
> Markus Armbruster (15):
>        qapi: Fix error message format regression
>        qapi/schema: Use super()
>        qapi: Clean up after removal of simple unions
>        qapi: Split up check_type()
>        qapi: Improve error message for unexpected array types
>        qapi: Simplify code a bit after previous commits
>        qapi: Fix error message when type name or array is expected
>        qapi: Fix to reject 'data': 'mumble' in struct
>        tests/qapi-schema: Improve union discriminator coverage
>        tests/qapi-schema: Rename a few conditionals
>        tests/qapi-schema: Clean up positive test for conditionals
>        tests/qapi-schema: Cover optional conditional struct member
>        qapi: Fix code generated for optional conditional struct member
>        qapi: Require boxed for conditional command and event arguments
>        qapi: Improve specificity of type/member descriptions

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~



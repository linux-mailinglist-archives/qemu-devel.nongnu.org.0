Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB369EB68
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:46:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcKd-0002Iw-SV; Tue, 21 Feb 2023 18:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcKS-0002Ah-AP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:45:50 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcKM-0006b5-9h
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:45:46 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso6605568pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05d66nY10nAt1ChOCukmV901f07iwdM3JluporyJIJI=;
 b=p9nbMV0HAp9HK47jn83N+eDA9rKs69qQXSYpipqiI/D/pHUSRHVLdrHlrOb4fw+AGV
 yUFFzusZARPPE4o1syDrX5jzXmVapNWiRafiIXkqw5W3DkvOmXp84tQJkLYwJSTR0NfI
 uFZ0BomXtvpVkyMhw/AunwZ+5bdNyngkRSgUqPk9BMoT3rX50iArmAE8U0LTvdHiNqYN
 M4J+jsMOFU41tF6MFpd8SShm0f9c2SaEg4naoKqpv4ChNVFRBu2TRkh/2JGooQQiksiZ
 y0xxwPkhGxc7GjZZpgbh6TQqqP4NW5EidG+QZsdzlfMD+MkumOgy0/w9kKC0/d40U4qo
 grVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=05d66nY10nAt1ChOCukmV901f07iwdM3JluporyJIJI=;
 b=53mQl7ZyaPMjv4eUOWsj01xxweyPXmvFurbcbrmQaQwyWlQ9H1qEpHQ86pKCdktPCv
 BQ507HtJ4Ye4oH2eYJAOys+6ZZXjDuUL8uUU7QmytvNQMSeI+dR5xiBpgdh55t7Q7qRZ
 nFi+oQjR0OMBP0vs8kb0eXFgSHlk1b/4oRsIybK9hX7moz5xO0n0jWKC4FAYo3q+4/WO
 2Ubwwjor/ZPnMv9Iq3wll7m0l49KaiETmeQBaqWjSTbNDH9C1wK6NVyrs4e/SPg8nRvS
 1sJ02adAXzGp4mPJFpNiZXzdjhaxQ5s9R0fOuvxQzvRo4Zbi6KyGhVWnY1/nPZPJQhSY
 skPQ==
X-Gm-Message-State: AO0yUKWGLIHRkyeAWt0rpkwqxFlUKxzjQcs8i6tZG+9BHLkpyjtzKShx
 2QBSimL9+HJ5ByLfKdul4ZO18g==
X-Google-Smtp-Source: AK7set/ihcekmdazlfMGpBf883zifqhXjb58yUp9QQp4s78VDf+ruMHrmjEhABYyNqAFpTHLlAzGcQ==
X-Received: by 2002:a17:902:d488:b0:196:5f75:66f9 with SMTP id
 c8-20020a170902d48800b001965f7566f9mr10253170plg.63.1677023132303; 
 Tue, 21 Feb 2023 15:45:32 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170902758900b00186a2274382sm1855979pll.76.2023.02.21.15.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 15:45:31 -0800 (PST)
Message-ID: <7bc4c5b2-058c-c60c-1842-09a23fa828cd@linaro.org>
Date: Tue, 21 Feb 2023 13:45:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org, philmd@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-3-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221153006.20300-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 05:30, Pierrick Bouvier wrote:
> Windows implementation of setjmp/longjmp is done in
> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
> perform stack unwinding, which crashes from generated code.
> 
> By using alternative implementation built in mingw, we avoid doing stack
> unwinding and this fixes crash when calling longjmp.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/sysemu/os-win32.h | 28 ++++++++++++++++++++++++----
>   meson.build               | 21 +++++++++++++++++++++
>   2 files changed, 45 insertions(+), 4 deletions(-)

Queueing this to tcg-next.


r~


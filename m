Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58A3E38F8
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:18:09 +0200 (CEST)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbCK-0007hZ-UZ
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbBb-0006pn-N8
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:17:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbBZ-0002Ls-4k
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:17:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id c16so12861587plh.7
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AR52WIDxj1Zxb8go1mJwsLQJ3+FI8NCPz99g9ipDjlw=;
 b=AQUwqkVZIaXemmbhPsrX/xJdp27Ddq113LVi1wSjIZVnuxnaGEf1v6+iBEFy+k3GwI
 brvthQioJWUpDiRcXCCToe8vOZWxmnlcUohQrmecqRBcMl6A4vf/T0seWUxRA4AIYamb
 nDODzXzlGIK8b5H6Hw1ui6R7E6c/3anqDiqSfkJDLG+BkiDrLstDf+RYWg73u0zD9M3M
 pfiE3NJY5FZU9EzaNT9QPStEdq4Ve0mzqQJsppD8ng7nUnLvkPOGrOl2oWVo/mFDYqbG
 MCnfZqgjDzOdp5cb4CFsWHLkrsytnFCN1qODeQY3Nc8XjTrjbLiaWVWARQLb52tkdZeG
 nFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AR52WIDxj1Zxb8go1mJwsLQJ3+FI8NCPz99g9ipDjlw=;
 b=E4eCH09L+kuyACHDbmlhA63o9wFu0vN7TClBHP0Bbv0vY3sZluPY+IxjoxeZv2gQU0
 O4r3sRrgop8W36esIo8y7vrQc9Rixd+9Z8HljI7kP63NxotawRg7ytQf26X4z0l+XoNo
 TtakIikRaochCQW8O5XwkXq4+cnKpKyhZ2ejXF2T2LzRD9FBSq8Ka3XYM4+ynA1B+vDj
 oLEAjr2tVa2pZx/xIZTssvPCLNC5p6/dI1SCosp+S8EmNeABGfVVTyFa5IBGcQ5162u0
 7tiJhp8XvuVBGQLpK8HbUlUsI75RSTn99QgbYZI+1qYvDWLo7lMs26eCTnS5PxA0+7fL
 s1yw==
X-Gm-Message-State: AOAM532nfIAJUOkwr7MtBFCaiIE2j1Niq/JMI35RX43uLApb3P9Z5ScV
 tsj1Hn6iM2ccr5oNffvCr0npuA==
X-Google-Smtp-Source: ABdhPJwoQLLtkJqFYlPh/bBMJxUa/6mD9taEbwM+JIAaOHoSRR+hMp5eCDcZy6oAx9szwAW9bjH+Qg==
X-Received: by 2002:a17:902:b098:b029:12c:8f60:514e with SMTP id
 p24-20020a170902b098b029012c8f60514emr4342338plr.46.1628399839551; 
 Sat, 07 Aug 2021 22:17:19 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d17sm15436228pfn.110.2021.08.07.22.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:17:19 -0700 (PDT)
Subject: Re: [PATCH for 6.2 16/49] bsd-user: elfload: simplify bswap a bit.
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dc20f97-7b53-c44e-3537-5fc77716f2cd@linaro.org>
Date: Sat, 7 Aug 2021 19:17:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-17-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Reduce the number of ifdefs by always calling the swapping routine, but
> making them empty when swapping isn't needed.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 97 ++++++++++++++++++++++------------------------
>   1 file changed, 47 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


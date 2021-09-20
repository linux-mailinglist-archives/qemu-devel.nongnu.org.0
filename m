Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B1412964
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:25:50 +0200 (CEST)
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSfV-0001ct-8c
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSdm-0008Go-8f
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:24:03 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSdi-0001tf-4r
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:24:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r2so18933042pgl.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZrO5J/U7EA1Vbbsw0bQwR5f3Ae76Sk7/HV9tGiW6y+A=;
 b=SehmhUTu2Dcq32rClp1J/7XX28dBDAiMg2+VWDS2OeVYvNse492mOKCrfjQLnnUk1v
 CTHARhm5B9YtNYH2ena+7G2o6aj/ImEHTOn0TcJbcdrKEUqvZ/wgKVDbshV3M8/o5xHV
 GS3WGFNgxqP9u+aihDUSDfzscBpnscJiHZ99TKU2Su0lN5PV9jzF8D1cZKsXsHD4KeeG
 Yfb5a5fAX3+lg9W23osXhjhRo/+n1N/PI580qC+Cqg9JWxa0JtqFd2s95m0AOJkgIiiq
 FdHwXhr/0ErgTfuAGeg3stxfifV5fN1cHyDz8/07ETiZVwibe/oB6hLjyg1aV5/tvOlL
 30Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZrO5J/U7EA1Vbbsw0bQwR5f3Ae76Sk7/HV9tGiW6y+A=;
 b=lp3ozxS2syOoQVn6Cg3wAWXXX2/La0ck2X/WqI3I6VTONj1FCXwqmFs+WsJ9L7FxFH
 LC8Yzz0IlUddUOxar+g47lodmpzxJD7ckcf5IbgZmqeDaEpzU/TtfrFTCDUkfYMsXUyk
 DR/Oxhb2eU77dT5WDAX49C2TDQu0mWWy8B9wmE6FY/yS2+js/XVu6qcoOgCmNyDWR162
 vekZyvZKKgakHgudqoz62G3sLKv9h5535E87n8WUS+Fq1co9e0OKDnQU2PfYFi1LbW7F
 K1vifnyiAkWK2tLlpGoFKNtiYPDtdVu7voDpV/2ghqhpq+VcmEKQLRHS6i3tA7nN9+WH
 setg==
X-Gm-Message-State: AOAM5320qM6up7caVKuU7JbxFXkczPrBg3JzcZxwtuKoxW6q8rQhlm+Z
 crqogmGHyOD+DQ05NXQJNMEteA==
X-Google-Smtp-Source: ABdhPJwF0CN/oHBKTJN6V9NkksTmosADJUyi7RikX/GAFzubpDhVVA5baMxFMu6u4C+l5Af7mwjMuw==
X-Received: by 2002:aa7:9e0f:0:b0:445:636b:3305 with SMTP id
 y15-20020aa79e0f000000b00445636b3305mr17770367pfq.38.1632180236743; 
 Mon, 20 Sep 2021 16:23:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o16sm16961119pgv.29.2021.09.20.16.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:23:56 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] Hexagon HVX (target/hexagon) helper overrides -
 vector compares
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-21-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c44d217-0634-b60f-3df6-b5c801f6d10a@linaro.org>
Date: Mon, 20 Sep 2021 16:23:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-21-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 103 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 103 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C382F412952
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:19:46 +0200 (CEST)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSZd-0001BT-Ag
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSYl-0000VX-40
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:18:51 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSYj-0006zM-DB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:18:50 -0400
Received: by mail-pl1-x629.google.com with SMTP id a7so3468259plm.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dehfmk81ZLFfYAJk7NFrLIpD2rZV+I7i22NKwt4k22Y=;
 b=E7/oIi3pnM3Ssq7QirrnkHdKntFaar64yyl6rVSp1ohxQiuRDuZlAYvOH0aCyZuHny
 B2spmxoe7WGMgjf4scEPKeaDLcSpHeQodah3eHu/WT791+Q0oRKQbmYSQFRsCyZlvZXA
 e1jGhRDWiju3j8GPyQABkXZmcs0RWrcc/GXsEDwnm66QVsE6xB2aUjPWpqPsqyh/pDCK
 vsg4qjfgv8gJmZ4SPfoXZ5r6wrFn6gtlzKFHImM3acyf/Sp4/nu62k5wUXar98qXdFN/
 NQcYo0TDZNMNmiw2H4Q3fgxw8YoKZjVRNBOcioKPgeqIIj6fxm6NOMW4bfCXGIkSsS4N
 NA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dehfmk81ZLFfYAJk7NFrLIpD2rZV+I7i22NKwt4k22Y=;
 b=vB6dlL0vJz1fqBEsJ4oC925Nr/SWF9HJBRsvKIGVUVbFQJJg8oY4FrGoo4EbSJHycy
 I+TaXYPbWFuJP6mlU2XNo6Qh/BJbAIxdGAXCL5eP9ryBF5RUzsvweC/KRGHC9Tk7IoLA
 oFypNHCP2k+gKsoFvTVmvXwm/hbIyK+KrumoiHDkYiTdNNoMOICJKlMIfktU8G0aMp02
 7OVLYXqPC2h0fHQazIS2V9M/foR3mMfAjhd1Zlq+aE9RfTUDskdtaRdBLLUSDp1Tjt85
 /rRayK6Z0p9wfcwu1fgpnS/E/hbXnUxyTKPRt1o+Gkw0E26EyMh5bGWtTSbVKJMClsEi
 fnZQ==
X-Gm-Message-State: AOAM531oJojPkl6Y/eWm/f7W9X8VKjBBi2AFgoHUQm723ZWNdqUkGsm4
 k5XFIxGGlI+UZJm+IQY+EAekyQ==
X-Google-Smtp-Source: ABdhPJzy5MbF8yE6Y9KP0HciaHBMISnhSWjFq/n3sbPlSKQq26rqF1RhrV5nWb/nH93hohjF2XpaIw==
X-Received: by 2002:a17:90a:7348:: with SMTP id
 j8mr1683320pjs.104.1632179927082; 
 Mon, 20 Sep 2021 16:18:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q1sm454016pjq.5.2021.09.20.16.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:18:46 -0700 (PDT)
Subject: Re: [PATCH v3 16/30] Hexagon HVX (target/hexagon) helper overrides -
 vector add & sub
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-17-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9361755-9bea-4239-3ee4-644a7794af9f@linaro.org>
Date: Mon, 20 Sep 2021 16:18:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-17-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
>   target/hexagon/gen_tcg_hvx.h | 50 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


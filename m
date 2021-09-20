Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C908412960
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:23:01 +0200 (CEST)
Received: from localhost ([::1]:50156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSScl-0004Wt-MK
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSaB-0002Ue-AP
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:20:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSa7-0007tl-JH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:20:17 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so1135796pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rxt+PIMnE6modRwdaR1NC58z1gkBqX4duWre7QHg2rE=;
 b=nnh+oYNHARmJann2t9pus/OcRFQDr19OJO4FQXuUhuMOdNT0FU25sxb5J4/kPLMeHg
 pW7SfHiAv4Rr/67JKOMxnAHNR+eVXMA/9YzJagFTUO7KKMD+zoeC9thNO8tRZr7fRRNr
 nZHBaKyMyva264UTlaoxrKbSajB3/f8w37+riYgxy9ja9bFocD5qbf0DSs8J8Ek6spyy
 vFNAWO/mCm/LvCAh87xrhSrRlyAAruDOzyg5ps/C2L2dyxY4SFqognzw1YVA/NBX2L6t
 S1jnm5Ip3T+9QZVhvLGXZtvUehJdK1nxgPuiF26EsWuNjgPHYsoxnmtQm1hEWp1/D6RY
 ZFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rxt+PIMnE6modRwdaR1NC58z1gkBqX4duWre7QHg2rE=;
 b=zpXyiq/w2dDOh9QrQ16aVDs20HFknyXPQE+PdwwplV6wUVGeTImXQJvOR9t5FAceDD
 Yd0F+4N6zDyVrZnHa2SWcKWLjz0KeLAtdOUiM8zEs82L2hXiSCyFvlJDT2+cQ+M+9I1M
 pc6iKbQUYYsW5xxIm5TTwqgNigY7TUSYHkSBXgGhS9edjsUguQ830Rt/fNF1NdZ+dhJH
 yRBbFdKi3JP4jpIc7tBcBaG6iqiVFs9Us8A3lBxyfC+eVf2ip/XuLnclD/sSKuzirFDY
 8OnUT3Wgvo6XjdeRsiTyKV71qeArnV668MLWUObu7XrbqUKn8BspMOTt9LJ0+YbrRo4K
 YDfw==
X-Gm-Message-State: AOAM531UtM6UcbbPiQa3O0Q6CBfzPWSh+mSkErcvW3wWLXzNCzcdD45t
 wzpFSTIaIDbORecq8oogY/AQ8g==
X-Google-Smtp-Source: ABdhPJwZ9XuuVRERpXP2sU25CkA8AXltCDbcV9zRlXtdUScfDMas+jpTd+HRoRYj+pwbC3R1u2svWw==
X-Received: by 2002:a17:90a:cb14:: with SMTP id
 z20mr1677428pjt.230.1632180014400; 
 Mon, 20 Sep 2021 16:20:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z6sm445002pjn.27.2021.09.20.16.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:20:14 -0700 (PDT)
Subject: Re: [PATCH v3 17/30] Hexagon HVX (target/hexagon) helper overrides -
 vector shifts
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-18-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <520b1760-1717-15ab-8140-cbfed7221826@linaro.org>
Date: Mon, 20 Sep 2021 16:20:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-18-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
>   target/hexagon/gen_tcg_hvx.h | 122 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 122 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


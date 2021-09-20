Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E033C41295D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:21:59 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSbm-00035q-V7
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSZc-0001ht-A6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:19:44 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSZU-0007TF-DS
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:19:44 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q68so18907059pga.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Jd7s0LhlG63agflxyYlpxtIyFM4sW9fCdOiu+fz50k=;
 b=wgAgDagmXFSfLC0wIOKHCvisIptEeU0gSHZXjJJDctmkTajsXRQCN9QxWImcgucmd4
 x+vooHuwOYJW9X07ngr0BS4CSfvmBBK28ZuXiYKb10x3rtkt1G+a9gGddq4Jzuo8EYIM
 frLAYwS1MAeOiqgTZul6EMSdsxCdJPA0M6gGcWc2LETcR5kL6vVGhu8fy6XS4DOFbQmb
 vZf5y1RrHa2D/vYC1neefOe8sRgLKAIEWUfWp69EXirGRdxhBcU+210NS7AxAql5WNm5
 0fiz5cgXCs0e2hGmwqERphQ/EIzRkkgHO+JMulIXb6TE6qzT/BbxNgn5OV2NKhFcph3d
 lL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Jd7s0LhlG63agflxyYlpxtIyFM4sW9fCdOiu+fz50k=;
 b=dVUuoFUvp4xYXS/t/40rt504oWu4gRNwgEXSRvqD851TTsVzuiz68SIr7ld/IJbpDh
 bEcTlIUCDa/9iz1nu6ls1ULzqjaq0FKmEP5StoZYr9dCgyba4/bgBl+9tomn1ACRGTA6
 +CmM2+//KMBOXaEb/26uafKKbx5m8FoqoWhNByD1tmqdvKASwi7tHtuqk8+ETY4iGSrY
 RQCixvsdBfoxwiSrtnRCgVdaa7i3q6Iu1gAj6Qay4cKYsRzIBAt8gRNX/bY0sXcQ9Wa4
 2vXU6yp6VbKuAb9J1qaNPsG8sZtSH34H2+gNJgNLd2AhIL52ZaSv7HEFKMOBgJNZWVo3
 7v9g==
X-Gm-Message-State: AOAM532KT5VBWgyyDShMeyHeq7ZQKM+F2noIzmgNyeD6SUlvLhoIA3+B
 kkYmrrL9JkLWo4mvtIwdI54yrA==
X-Google-Smtp-Source: ABdhPJxQPlQyqageT/npJudGarFNBx55Flok0l0cRMk6qIVY4dPL9GURagc6Ulh7F84xWoYuakmRSA==
X-Received: by 2002:a63:131f:: with SMTP id i31mr25793212pgl.207.1632179974968; 
 Mon, 20 Sep 2021 16:19:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m20sm2745427pgc.25.2021.09.20.16.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:19:34 -0700 (PDT)
Subject: Re: [PATCH v3 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d64cc366-b896-1806-16a1-7df56cab68c8@linaro.org>
Date: Mon, 20 Sep 2021 16:19:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
>   target/hexagon/gen_tcg_hvx.h | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCB4402FA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:14:36 +0200 (CEST)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXKl-0001ig-QG
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXCp-0004sN-3Q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:06:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXCm-0004Pd-Jt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:06:22 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t21so7423454plr.6
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUvTfaJybfBDtzbchqvLYPCC7G6uOdBTrOJzaMTstmE=;
 b=DW2ToHnWi8DXYCiMFXCBYEA9muJbkdl6gilX/JsLLOzbVO8VS0k5Qbixk+wi1qOH7m
 CWFNpBNmREBj3+MZNNrENsZGfS+7pNIEt3mFzdpKAclgOha936glCQVkP/Ri1g+sb9zT
 td3t7u/64Bba/VUNLkUVpCOYqxcdItFlTuvua+vBhevIYHU4If/sqKPi4gVbhxpeVMvJ
 BqvqgIF/xWEZa5y7YbmIDSRsj++YOPnwErdYuMIxg9h1wD3llG1wDCbyGAfeMUsBCaBj
 9fi92Wdz61mMW7LkA+z+geUnQjq7qdCHbCcNLWDi/9AwOXpTd6ZFz3IVIVFwnklYvNe6
 gFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUvTfaJybfBDtzbchqvLYPCC7G6uOdBTrOJzaMTstmE=;
 b=qBFFrmDuZW7I3Hou6IeFQ9mWmty0qVaoTy0+UVDCFLu69TLPQk5mB2x+Kcnw3kmlQ8
 Iph7jdzm6tmLgBCK09BParnIynIvpUSBQP/TB+Gc+nQbkRKlu9XRUsdjk9xf0dPAM+2V
 iRU2ySKDjFGO2qWb0Kfw6Mnufq0+RCO7aVsLWJb37x/Oyz5teTlXrv2IXWXAOuejoeW9
 y31j+pRl2ZlSYNSjscpIoa9q3QYgxBauTMjQfL5CHxPaX1Py4WmL/eiwnyuJ4Ape7av9
 1OCtucGiYlG29A2BZ3jj2vvPQIz6cIxmgG3vLATN8kyJn+gBexRr+rAAF8bBdiWr0cWy
 nfXQ==
X-Gm-Message-State: AOAM530K2R1R7auat2yPhp94C8WZk0uA6r7Kk0LnUzkJDCr0i30WK5Bp
 yqthgfA7oPWvRuWtHBmeJZX8kA==
X-Google-Smtp-Source: ABdhPJyDF1iy63oAcX1D23EXipUboMWx8btcyBEo8jUglWtvuRkYadcwT/wZCLtrSmVN2V9foPEl/A==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id
 kb12mr13522591pjb.176.1635534379193; 
 Fri, 29 Oct 2021 12:06:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 145sm86335pfx.87.2021.10.29.12.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:06:18 -0700 (PDT)
Subject: Re: [PATCH v4 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-20-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3249cc71-f29f-d602-387a-004c10f2cd7d@linaro.org>
Date: Fri, 29 Oct 2021 12:06:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-20-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


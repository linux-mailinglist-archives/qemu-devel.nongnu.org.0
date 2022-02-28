Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B04C7B61
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 22:11:03 +0100 (CET)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOnIK-0007PX-Ei
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 16:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnGg-0006iM-OV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:09:18 -0500
Received: from [2607:f8b0:4864:20::632] (port=46901
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnGf-0007Yr-9p
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:09:18 -0500
Received: by mail-pl1-x632.google.com with SMTP id bd1so11763849plb.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 13:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z0nG/GKuHWJcGV3e3OkK0e/6NBeO6jh4ddpYsiqPsJ0=;
 b=zavDwfNl1olPMp0qGQkzdmC80l0/5iOGpwjBNRKGNNMAsauTDezkCHz4sbO1wE5MVt
 va/FtSLsZz6oEsZXWH5aBtapXrFGdj9mRD2QqCHkGMDXgmV4pRAjUDdWXwwhKsfuDaKw
 TKreylA3j4fdVbF05LfjiczhS7EDm9upJ9M2xEyUGUBT9KMEj2xPdekaC//vVdFgPDPT
 L3ifztjuOxo3CYlGOSpRcbCNbK5JLxU9nUSAFgp4utXFU6zIxAk/XJYXAFC/PwNxD067
 LQj6To7scMwgF9k+ybpExEM0eD8dFOUQqanNDuE8grVt/+E0oaRcYmu5Gn+KM+EnPHrW
 +zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0nG/GKuHWJcGV3e3OkK0e/6NBeO6jh4ddpYsiqPsJ0=;
 b=P9TKKg3Q3vbPim4PXSC9rMdO7R6m6/4c3F4kcDPQQIwbKiTPQ+q5YkIfPz68NuvJJt
 xQmNyioOIoVk5gzL9AqmYhfRCP0reSfwGZGdrho9sPPCBwElp9XXAMkTJzX5j41p0xXX
 WCGcLALgObpG6hPfQWOTytCPgNq+A1BToNny01xbGCkXgW0yaeJk3ayR4T0SElLsFm8e
 nYk5voU1I9bwHNmmqT4l5Gy1TVMNyyKYpiQngshG6bxhoUfipx3gA+ehs2mwX2LJx+YN
 Ny7Mk83FY0TKRq6NrOvc7VRvW4WRzadoqVwVdTo2JpG1u5q0D+XQgAmdN1dSpt2A3GcB
 uFfw==
X-Gm-Message-State: AOAM531+WyeCSRUsKOMD3v42SPsYue9h2A+AI/Njqt0wCeqcaFNauxiO
 PEFbCEQYTMlICnbUkFInPYiugw==
X-Google-Smtp-Source: ABdhPJz1Sn6vVx0WZkoFqpvHXhYzFLp3XgldgkJ5E+D6x0zEJTn9nO6Ndkzlp39mBoyMaByTe/UqCQ==
X-Received: by 2002:a17:90b:3145:b0:1bc:5855:f94d with SMTP id
 ip5-20020a17090b314500b001bc5855f94dmr18567676pjb.55.1646082555751; 
 Mon, 28 Feb 2022 13:09:15 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b004e15a113300sm15130163pfu.198.2022.02.28.13.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:09:15 -0800 (PST)
Message-ID: <3407eec0-0612-81ce-dd9f-5c7790b564f9@linaro.org>
Date: Mon, 28 Feb 2022 11:09:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7
Content-Language: en-US
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <20220227113127.414533-1-ziqiaokong@gmail.com>
 <20220227113127.414533-2-ziqiaokong@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227113127.414533-2-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, tsimpson@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/22 01:31, Ziqiao Kong wrote:
> The last entry of DEF_HELPERS_FLAGS_n is DEF_HELPER_FLAGS_7 and
> thus the MAX_OPC_PARAM_IARGS should be 7.
> 
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> ---
>   include/tcg/tcg.h        | 2 +-
>   tcg/tci/tcg-target.c.inc | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to tcg-next.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0096C6FAC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:50:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfP3I-0004Ab-GU; Thu, 23 Mar 2023 13:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfP3E-0004A8-Uk
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:48:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfP3D-0001L5-EA
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 13:48:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso3802671pjc.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679593714;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tpSHgag7oDF7b3XX7frMCFiFI0qk+MEf1++jYO8FlS0=;
 b=FuCwYF0P/8mjjMlF6KC7Z9X6H87xu7PPkoIJ8Jw1A7i8bviOPz2XehGLxIryNHaAT5
 1+/ugreR8S6aXmnL5q0Jnu3NuM/XTeUVWpD16uACvMWN/Ytn7rvSpaGMiuDaXooJ2HIQ
 +h4+oXUdMp54tFtgRnMKZmxr1JbUlo+v4+xvekR3JkaIKVocy1sAH8UVNTUhuu1PJ32O
 /dtHR+qOWn1FpLbcFErR3V+VmEDS3CWquPXvzqV4oS41GTQf3DPN0hLp83Pi3owioXM+
 TcN8Od42U05eWyZYscts5yNKLQ+ODg0trqDgK6JzEqq1fU+Xjg/s71HC0yAuzdR35oSg
 yHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679593714;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tpSHgag7oDF7b3XX7frMCFiFI0qk+MEf1++jYO8FlS0=;
 b=Jr9ygg/LTMiCLTiNctKAMTdU6YyCnu7EmibVmdxtpyV2DbGDf5KsAuAgIMuAN0p4BK
 PR4EKYrfe4fz4t7X1go6yifQNEJdxQNuv2rHheqRw/Th5FK7EdTmeiufjpip3dCEOor9
 ZIDVNhOv/Yyp8y5cFMTSKf0jyeXcRJK4lwEjeOvhjaBC0o3Z9KEmtzNMgu4jgJB3KOr5
 4XVqxT0FyL/VLXCtW2RKMS8rNb2hFKdIVkti1aey/reATMIunUk/dzhlXntg8fhwlLCr
 DOtnP/KOntnwoVCQJuuK6Fzzc+1G7WJFGrlYzNZhkvpvKLVhngQadzfOQS5n2fYRJ/14
 fXjg==
X-Gm-Message-State: AO0yUKUwaC0CT1YSppJCAJA37Pm1ZhngZlafHCNZiX3CenKNo09ptYqd
 02UHfggsYGNdEO6ShJ+eqmVO3g==
X-Google-Smtp-Source: AK7set+iBaXID/Fa2gihfLgX6ZV5kRNAtORGK+e77cVhXOZ/b37dFwxJwi8p4wxPb+0+4mG5HugN1w==
X-Received: by 2002:a17:903:d2:b0:19e:6e00:4676 with SMTP id
 x18-20020a17090300d200b0019e6e004676mr5698835plc.61.1679593714065; 
 Thu, 23 Mar 2023 10:48:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a63eb4e000000b004fb5f4bf585sm12020021pgk.78.2023.03.23.10.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:48:33 -0700 (PDT)
Message-ID: <f5c385b0-9d84-f8e0-704e-fe7d9ef1747a@linaro.org>
Date: Thu, 23 Mar 2023 10:48:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/8] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-8-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322202541.1404058-8-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/22/23 13:25, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay<aaron@os.amperecomputing.com>
> ---
>   target/arm/syndrome.h         |  7 +++++++
>   target/arm/tcg/pauth_helper.c | 16 ++++++++++++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


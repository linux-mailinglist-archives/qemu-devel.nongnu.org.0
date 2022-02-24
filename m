Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC84C3859
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 23:06:11 +0100 (CET)
Received: from localhost ([::1]:54148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNMFW-0008LI-0M
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 17:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNM9O-0006aA-GW
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:59:50 -0500
Received: from [2607:f8b0:4864:20::1029] (port=38888
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNM9M-0005Dw-EN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:59:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so2387002pjb.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TE/mODfiCUKTnc4XJV/lwSXiOvLUITycvDZpEwgtveQ=;
 b=gRaDCnZ1MS/L0NUS7LzWaMWLMdhI7W2Bf4AiahKXVdIECaEYNErkyKdPrHHuz/2J9s
 X+r1mmd2wPRYUJ2iFFZEOIE+p6M3hRxVk5JVnPFamPiJzrsZyCYFkrq3ASWMAt0qjsb5
 h5xGh0UQohY94K9gNMBipLoyObVnI7WnlHg9jYGEh8aCOrsH4S5vxV+6PffsU5kl6Ur9
 J/RnFS4FYsUrpjA/opoyf0jTdL5kvrduOvqCgVPxJ7XXVWOtTPW9R7+lBPy1MZMgMi8r
 P9w9j48H/Jj0VrcJLwxnAaymYZ50sExeUoTZMtqsSfOzSNLMqCOmEdk20nRaVSuYOHi7
 tCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TE/mODfiCUKTnc4XJV/lwSXiOvLUITycvDZpEwgtveQ=;
 b=YabQyOGT57Xt7AcZALfN/rmefEmz1P5xw+MJhPM+zYxI1s4wfmoexRhOY7Esp61Nk8
 Oo5lpDHu/gW5stQ+LGfztygyBsZo3q9+F48iBMd2k9hXTLdzaOQqKifFOKR6Ba36yfZ4
 2Vjwa0+4COz/yKRSXMMXdVRgFIK1YRBGMSs10s6vuWh+poPz1lRULuV52x9D/Qv2Bs6z
 j8bWr+Zn+ASGgl4Z2ObjeTOwCy/7XHsNiTl1MlpbIJs7LKSN1IG2DTDmy0SeB3w/vY5+
 eakcbBo9+tGgGNOQNdIL6zVgC9TKh/emo3yelaIiUjh4GKKkgfBz82OyfsY4sAHAt+tz
 2FNA==
X-Gm-Message-State: AOAM530oXCsh4FvOBYyQ+rgZQDSWSLfyeD9Aapqq90nEsfDLwcXI0QyP
 F8u30/FKZwtxN/JWcroJvwUc/w==
X-Google-Smtp-Source: ABdhPJwZj0cIgrSbxzK9YVPgNGkGfHLIcSL8G07gy+rEOT/6U2XwZb87vzATIh7kK6N1uesOfOSSCw==
X-Received: by 2002:a17:902:694c:b0:14f:bb61:e7bf with SMTP id
 k12-20020a170902694c00b0014fbb61e7bfmr4254708plt.159.1645739986783; 
 Thu, 24 Feb 2022 13:59:46 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o3-20020a056a0015c300b004e17afd9af9sm474173pfu.92.2022.02.24.13.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 13:59:46 -0800 (PST)
Message-ID: <ee30da51-bb2a-8309-6405-e2951559e3b0@linaro.org>
Date: Thu, 24 Feb 2022 11:59:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] target/nios2: Shadow register set
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 03:48, Amir Gonnen wrote:
> @@ -88,7 +93,9 @@ struct Nios2CPUClass {
>   #define   CR_STATUS_IH   (1 << 3)
>   #define   CR_STATUS_IL   (63 << 4)
>   #define   CR_STATUS_CRS  (63 << 10)
> +#define   CR_STATUS_CRS_OFFSET 10
>   #define   CR_STATUS_PRS  (63 << 16)
> +#define   CR_STATUS_PRS_OFFSET 16
>   #define   CR_STATUS_NMI  (1 << 22)
>   #define   CR_STATUS_RSIE (1 << 23)
>   #define CR_ESTATUS   (CR_BASE + 1)

It would be preferable to use hw/registerfields.h:

FIELD(CR_STATUS, IL, 4, 6)
FIELD(CR_STATUS, CRS, 10, 6)
FIELD(CR_STATUS, PRS, 16, 6)

> +static inline uint32_t cpu_get_crs(const CPUNios2State *env)
> +{
> +    return (env->regs[CR_STATUS] & CR_STATUS_CRS)
> +                    >> CR_STATUS_CRS_OFFSET;
> +}

This becomes

     return FIELD_EX32(env->regs[CR_STATUS], CR_STATUS, CRS);

> +    env->regs[CR_STATUS] = (env->regs[CR_STATUS] & (~CR_STATUS_PRS))
> +                       | ((prev_set << CR_STATUS_PRS_OFFSET) & CR_STATUS_PRS);

This becomes

     env->regs[CR_STATUS] = FIELD_DP32(env->regs[CR_STATUS],
                                       CR_STATUS, PRS, prev_set);

etc.


r~


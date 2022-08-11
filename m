Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891E59061F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:57:23 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCQs-0001tp-Do
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCNN-0003bS-J4
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:53:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCNL-0006T3-Pd
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:53:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5829140pjl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uXsmILYWWCujC2FYPWyfVVar+tVdo3bcysHpdD+gV+I=;
 b=CSxHs7uvcWB44LUe7IYg0TDkwbqghwhPCPB4ikwN2VqR+DyNVGw3EIyvPagKMj/5aT
 BagT3T8b4sytzuBG6Ny6+Ko1DtYzYu9VFvAasp9mBnxlHThrVg9rYsc+v9e9axz3lXjH
 D3/gB6jxesNFHTCctRBnxOL//XF7ZSKyKtkG2Kwsg0WpzvpXbFjFcFZC46i8LUbq9MVG
 npr6WU46b7OjeHuhrMMOMjZdG1k1wzHYpJNeHjydu0FHquDBJYeX1914OAZzB8EAcJ2a
 PDDbji9dn/Od34xfOF4mBsp81qYPUP8gwSxrdP+W1XBzp/Z667Cz0hRM2wVkamGNoTs6
 kmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uXsmILYWWCujC2FYPWyfVVar+tVdo3bcysHpdD+gV+I=;
 b=jEAMTzG6iyb83Dy7WVjblNApLiCBPi2JjM3vljD+DxjHyTi71dPTe/GDWEYFkwen2N
 9zsnv2k45+f0YNe6i54tqmmNAEL8kID+zL3/Z6jFPlb68iJQL5fa/Sv3uFHapFHyJG89
 jfVmePO9jpfBhmUTAHwNLP/wA1B1KRtyLjB8F4WxJT9isXfzEIEPWGZW8hNXFx0gP+d6
 0spN64vjkomC1KuZmQ2l1f3DCiEExU9J+B7VCzZLnBxEE9LkzKDpF+uQ2ZOT8V94vERs
 nJRTZc82omUdzpPIRWBpTwTKT5kcmVzU2lnxYkS/i6OMFNLxQAf2fJC6dsvl4mrhnjfP
 BFcw==
X-Gm-Message-State: ACgBeo1J5iQlpUR3PbQQrb7ZZm10YoyiZ/uu8hhh1GURQg+FeDT9+xgJ
 mTw6arX7Y3GH1wsv8DCNQRCp9g==
X-Google-Smtp-Source: AA6agR5Vb+lYzCR0l500Dq8CycbZGOd7tpSU9CVN82+1YTUvVtKDCU/SDL3lbOCnS/A+iY/uvgKd8w==
X-Received: by 2002:a17:90b:1c0d:b0:1f5:7bda:1447 with SMTP id
 oc13-20020a17090b1c0d00b001f57bda1447mr187920pjb.88.1660240421721; 
 Thu, 11 Aug 2022 10:53:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b0016be368fb30sm14958044pll.212.2022.08.11.10.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:53:41 -0700 (PDT)
Message-ID: <c971fef6-57c3-f498-1552-3cacad037783@linaro.org>
Date: Thu, 11 Aug 2022 10:53:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/10] target/arm: Rename pmu_8_n feature test functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/11/22 10:16, Peter Maydell wrote:
> Our feature test functions that check the PMU version are named
> isar_feature_{aa32,aa64,any}_pmu_8_{1,4}.  This doesn't match the
> current Arm ARM official feature names, which are FEAT_PMUv3p1 and
> FEAT_PMUv3p4.  Rename these functions to _pmuv3p1 and _pmuv3p4.
> 
> This commit was created with:
>    sed -i -e 's/pmu_8_/pmuv3p/g' target/arm/*.[ch]
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 16 ++++++++--------
>   target/arm/helper.c | 18 +++++++++---------
>   2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


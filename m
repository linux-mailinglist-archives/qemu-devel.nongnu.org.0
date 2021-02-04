Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6430EAA2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:07:07 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uz4-0000Xy-TJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Uaa-00026C-68
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:41:48 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UaY-0003nv-4B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:41:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id g3so966487plp.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jFkVGPk5e9YbzpLbTem41QoSkYwfYqtuuJfHpYxvOJ4=;
 b=g5y72mreTXjdFKKM6uI3HmpHL/hTJtmIgcMVhEnRnrugIGV8AY+59taINXaE6tHODc
 CM8Sc5JCu2zlg9oAutiDZnEAU6Eq6GABvTjgwEMIMEbn4WhgyF68NA5laz0n+JBTGOu4
 bul9+YlrclTk990omUgt51aNkanONcMdQCi+8y/2h7OYAcHrft1sIEpx7lGRShFMJBzv
 5sEfXVw3+Nxt3M3purwn88eyVotK6WT8SuF1I7yxH+ionq+Q/tmNDzg24wy3RINra0tf
 K9H7MLCOiFdUe3kMXcC05AdZ58IdlFTxEujYr2zzLO4Gn1xgSEYDcxALE7jbUYvpCReF
 SS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jFkVGPk5e9YbzpLbTem41QoSkYwfYqtuuJfHpYxvOJ4=;
 b=M6fW+EAbVqLU8fazglc2QBWkgxiL7lexO0/wGVXKaHs80XMtiDd9pA5I5ris7oIdUQ
 tEbrdjhaONvPYQK8pAE0gTSUPIW1eOVx7/NONoOflScpQIjkk1hWC2Sm+et3qSScENz4
 zAuCW7ZWMqb0ARfpBWiR7Te5/Vu10mnxlBlVqCsfQY12cHlrXJBHK00OA1n5RHNSL4i4
 29SkCqhJGoS2Yj9DyaFedqIV3T/aLbyq58B+wXwp0DpfBick6oABRzaIYmOnwdyLLwoC
 7fAzZeqw0lgrPWqHq7LV/hO5ue7G+iw1kMGALvt+Yzj5ViIYwQE1gDoBHePzPmxq1LTO
 dK2w==
X-Gm-Message-State: AOAM530ykjADwgzCz+Hq9P98u2ROGjxysJ+4RG9Y0J3zQC9zH0cRBYUk
 O+ayL/lTZvbf+9WC2W4jRiRlmw==
X-Google-Smtp-Source: ABdhPJxG09twy0pxlFW1Ma5PBzw5+iu/43h96d+VGvsxj2OyC28ZQw/kN7CvA/juy1l+aA3PbR0I1g==
X-Received: by 2002:a17:90a:634b:: with SMTP id
 v11mr5957563pjs.147.1612406503676; 
 Wed, 03 Feb 2021 18:41:43 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id g22sm3549636pfu.200.2021.02.03.18.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:41:43 -0800 (PST)
Subject: Re: [PATCH 2/5] target/sh4: Replace magic value by MMUAccessType
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127232151.3523581-1-f4bug@amsat.org>
 <20210127232151.3523581-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfcad6dc-40b1-a63e-9e37-98fd25d1a89b@linaro.org>
Date: Wed, 3 Feb 2021 16:41:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127232151.3523581-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Joe Komlodi <komlodi@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:21 PM, Philippe Mathieu-Daudé wrote:
> Replace the 0/1/2 magic values by the corresponding MMUAccessType.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



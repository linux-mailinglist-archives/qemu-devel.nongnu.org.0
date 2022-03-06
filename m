Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7C4CE8C7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 05:44:51 +0100 (CET)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQilG-0003E7-68
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 23:44:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQikR-0002YN-Aq
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 23:43:59 -0500
Received: from [2607:f8b0:4864:20::530] (port=43612
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQikP-00072l-QB
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 23:43:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id 27so10830946pgk.10
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 20:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z+x1zm8IxxwWEFGdoENeCf/W8APp8IT8x+BDYI4Ed2Q=;
 b=SM0kWfDzmILk9kSjZDXMSDcvMEzx2IWQkzx5rKM46suc3CKqqR/IMeHoRCFsNubsIV
 EZRe3BHzI28j+vsj+//1diCXQDBz/k60ppUksNSVrJpCupWWPhAdeqmTP8PCl6ZMhu0V
 yCcS3eDrzAsjQGn/le2oUQn2UeX1t8Qk8GeREHsIDX9o72/pqgf4hugzKUNfvOnd7Iwk
 75clJWk9fX7y3t5NqTAAkO+6IIUGVkBwX1e+eYykxJKi7ZEBK68irJj5f58o/J1y4OMl
 S4APf9Mr5JfHguNog/+WRS0cukdz0xqK6STVRGvI63NvpAe6IgbfA2j8XLb3Uucna4Ym
 NIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z+x1zm8IxxwWEFGdoENeCf/W8APp8IT8x+BDYI4Ed2Q=;
 b=VvFyfao3W0AGhsxLWjg6A9DBBt4xbCSZcx1k5ecFTVMcDU4mb9LRI2q9f3RZ8i6gZg
 upNcZhiPzGRL+0m2rVJv7WhDocHHDHofyjUzh5IFpr0uoP8W5UBsuoa8d6nSgg3lklu6
 5ClG/L++7oRk3OX8R0MLE5Jh/qefeoV6YkD7M+JqpS+lH+R1DLhGxYwdVNYr3SueOKwx
 xNNBSUKqahqivjsRQ0PdER7hwvnzpJJfqtl32BCioqqPyeZ8ZrOqGZebmmAoZe7d4wjO
 4vAy7jHYTepkqzU0yEBdpz9ztdqRwJbMV9DEib7WuD1+OyIunajutF4Iy8CJS54AHyQD
 mtyQ==
X-Gm-Message-State: AOAM531URK5Ld/UH2mTWbyfqIQR2o9cZ6NtnScV2u8QsuQ/rud3a7SUn
 Zsea2ururwTDbCgkANgWcJ51Wg==
X-Google-Smtp-Source: ABdhPJyBuaKqspq1rXMe0MYVr8gn8k5FvszNecXPQ27AlXTvbrq/aosJJj33Wg4j8I+7TCnHcqpI4w==
X-Received: by 2002:a63:9143:0:b0:37c:ed47:3d28 with SMTP id
 l64-20020a639143000000b0037ced473d28mr5040487pge.193.1646541815341; 
 Sat, 05 Mar 2022 20:43:35 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090aa09300b001bc5fb5886asm14576305pjp.5.2022.03.05.20.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 20:43:34 -0800 (PST)
Message-ID: <0a36ff60-2e8c-c07d-bdd4-cde247b6c9d5@linaro.org>
Date: Sat, 5 Mar 2022 18:43:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] accel|target: Remove pointless CPUArchState casts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220305233415.64627-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/22 13:34, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Now than we can use the abstract CPUArchState, let's clean up.
> 
> Based-on:<20220214183144.27402-1-f4bug@amsat.org>
> target: Use ArchCPU & CPUArchState as abstract interface to target CPU
> 
> Philippe Mathieu-Daudé (2):
>    accel/tcg: Remove pointless CPUArchState casts
>    target/i386: Remove pointless CPUArchState casts

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


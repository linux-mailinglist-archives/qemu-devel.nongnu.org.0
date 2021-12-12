Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426D2471E26
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:03:45 +0100 (CET)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwWwZ-0008LB-SO
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:03:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwWvP-0007Ty-3h
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:02:31 -0500
Received: from [2607:f8b0:4864:20::632] (port=46776
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwWvN-00089c-8G
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:02:30 -0500
Received: by mail-pl1-x632.google.com with SMTP id p18so9853743plf.13
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UfhySzGVBKObKOvgjT6ScTbETw8pUEy9aZghfMHtJP0=;
 b=zVl3G9rO/3WqT7VmFiWswwlAc2HglxzSJ2/Ju1QNPKWJkC6od2cH5Zkn8OhLjZwPid
 ryWYmSh5G4rbEdRCL+ciTMlalWG9ZgDg6pVFmGbj9a1UzJXW/CECtX4RXsJfL16pFi9w
 ZEZmQgtU/BCQxtgQ0mzRSeoYAUvM+ScJYbRqoQBiuuGnNSZlYxSlc2ls7mOsO9tm4B3z
 SR99EnPKfRAhQdTZTtq0tPoQSAGiEcRTPbbpEcaClK/QRn3WvYqB3LvQcGrjPLWFc1tk
 TVcEVgg46ZCkrBKwEdQxBNr58CaxYfYcWcDK7h3TCUXeM4VGazKeGdcf5BOt+zz3OSb/
 t9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UfhySzGVBKObKOvgjT6ScTbETw8pUEy9aZghfMHtJP0=;
 b=jNd4SVUJAsKZZSjzru+kzGdhwi94j0V8KY7omec8h6wk+pXlVMWB1EzfqWMSyJF52y
 fA3KP8Ln4G8Ov4ARIey1ISgCj68tBZwkLHOUaP/P0eOm/EvpFbjQnHyaKYJ5UnMh0wMO
 GbQKdyQ1RNXUKbAip+dWbvSjIwI5bOKz/kOcs885CWBq/D1Mp6EssM3q3rY1xYOyxsrT
 Gr2VPqs/VXnBxCbLzoQ6tBYfvnd0kNoiY96D4e9XXRcJ7uU6nymNu4Ro0VH/9AfPff2r
 Ve1G+KRz3WnEgICGkjcX9eokJpTUe+9Ur9NN76x9ErmHC/99EDO6mlvvOENiNmrzP65C
 HQbA==
X-Gm-Message-State: AOAM532YO7AEugjg23laahM0HIk3pJh8Aswt20CUeuF6htBDjbLCKE7+
 C4Bldt7+DKCpRbSPftnYTqBCjQ==
X-Google-Smtp-Source: ABdhPJwQhZonygITq9dTrEBJv1vSigMaqhFzQPpl3Jic/CJYf16AFehX6K+JGeGvdX0etV3orDRYaw==
X-Received: by 2002:a17:903:2306:b0:142:123a:24ec with SMTP id
 d6-20020a170903230600b00142123a24ecmr91522351plh.21.1639346547805; 
 Sun, 12 Dec 2021 14:02:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id u22sm10672444pfk.148.2021.12.12.14.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:02:27 -0800 (PST)
Subject: Re: [PATCH 21/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fcc450a-3c47-d1cd-6c53-4219f5582982@linaro.org>
Date: Sun, 12 Dec 2021 14:02:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_its_cmd() to consistently return CMD_STALL for
> memory errors and CMD_CONTINUE for parameter errors, as
> we claim in the comments that we do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


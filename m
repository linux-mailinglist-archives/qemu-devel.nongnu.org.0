Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6138F1E0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:59:16 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDv9-0007Ow-Ib
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDZd-0007LS-J8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:37:01 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDZZ-0002ql-UD
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:37:01 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x18so16955191pfi.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uNuQXjOZ34Ga21JSHpx/ovGuTkcgjItUCRLZQ7OO4Cs=;
 b=mumWcpVavGzYztpEEAidsbw3DJ8T1wi978t942bnkTyeIWbokvgxW0QLYK9/WiztE5
 DxiXfjJLyTXS5oqF+NunnzQAJ2j54aM48e78VFK0k+9kU8A1FxjjoiBTol13rgEi/POn
 h9vd5xLl2Ri/xLlM97aYceNQxYkxZeENmrt8huH1nwFDkKATcIa+J4EHwczVggVHzIJW
 EDJ8hfM9BHlDMhgZeUb37aeNTTGSZPugMYZlD4TQ8t43vFs3WIOerevH6av2pH4PUqhu
 y+ShTpWMDGHZgnHwBBzUWBNJkTlYdc1c0IqehvJvRFSmHCLka6ds7TGn+ry2rusea+Fr
 pNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uNuQXjOZ34Ga21JSHpx/ovGuTkcgjItUCRLZQ7OO4Cs=;
 b=WegJtKsjeKAWh37CZieurfcMZ02tC2VVIpshmER39qqUQtjuldUhKZ1ww6IcWR7CkZ
 Li5W+t6ccdXF9eu5ojuolk8JIgA1hfcmPxdZ6PdveXvsJu//4E03Z5MrXnxVR+F6NrXF
 eeHBW3vindriZwP5VaBd8q+ZcDaiZBw+dgCaxH9IwlUM3p/0S2LeV1hErHs1EOfBa4Kk
 Pnu/LxXfoo2RIunfSAq55ENuaU30/hTc6o6XXNavccUEehoCzkWMvCIokGn3BYm+azc5
 jV8ENjIbWf9wNGZ2wDYqlQtnx0B5DM9DI480wjGSjRDF0BQHYI7h3vMOXNgAqwzQsKKe
 GtIw==
X-Gm-Message-State: AOAM531e0XMQQFIHsbQLQ8wtF2zq6gjcWYBMW11TMVqiS8iqVnkD3Y4I
 41JuyTYTKGwJPa12D1UnfpCXuaqpgAoUbA==
X-Google-Smtp-Source: ABdhPJywp9I28bn+QsHEn/jXLzz5wYjqGqrRzVbrmamqLkUfBuD430jMBTD3DpDEJqCzs/cWJBPTWA==
X-Received: by 2002:a65:5a08:: with SMTP id y8mr9973555pgs.199.1621874216502; 
 Mon, 24 May 2021 09:36:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p16sm5969759pgl.60.2021.05.24.09.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:36:55 -0700 (PDT)
Subject: Re: [PATCH 5/9] target/arm: Fix return values in fp_sysreg_checks()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a685d6-2ec7-d7a7-b722-8a0c5b8f177c@linaro.org>
Date: Mon, 24 May 2021 09:36:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:28 AM, Peter Maydell wrote:
> The fp_sysreg_checks() function is supposed to be returning an
> FPSysRegCheckResult, which is an enum with three possible values.
> However, three places in the function "return false" (a hangover from
> a previous iteration of the design where the function just returned a
> bool).  Make these return FPSysRegCheckFailed instead (for no
> functional change, since both false and FPSysRegCheckFailed are
> zero).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


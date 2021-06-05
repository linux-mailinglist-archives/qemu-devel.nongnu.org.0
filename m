Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FA39CB58
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 23:56:19 +0200 (CEST)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpeHB-0005GY-W7
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 17:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeGR-0004NG-2z
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:55:31 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeGP-0002k4-HV
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:55:30 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso4588365pjb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nhXsm8jFV57ph7GSv0aYxnm6vZTRxaH1TSpl97usJSk=;
 b=Zc0twz5wGhkmD+YX3/xZ8vFW/5sy8niqkyJ6DWSM2Tburm0w5jipsjxwmIyufOrTXU
 idN55i/LRehvjShIV3tbgzWGddSuanPqttAPupPFlSz8wT0a+7OCPOmblettSHN8ahMI
 GzqAe9I3oPcAxn6rTpMYHuVQme6nIoysaXbUEguZPBFMuXKFXfrSSxh8J6jw/v3A1I3u
 zQFr59KV8pn+vyv98NAvZXEw2P+l8gzVRqGGRhBjjsRTU8h8OfdNTEzLE3/NPfsIwWJC
 xGS3OiYhSr9cyQ5pevSCfUQelgL1qs7mmW2mZp3bgJexeEYqSTfNbKZAvCo8WlRLwJlJ
 7K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nhXsm8jFV57ph7GSv0aYxnm6vZTRxaH1TSpl97usJSk=;
 b=UCG6WKexhjZGEHdcx08s2Gyd24j+UoO2CPJLyOZ4RgHvAJFKiHFTQa2bV9MJc9tJkg
 Z6BFSHD6qI0wJAzHTyg1KV1jGPMtb/unvc6V86a4uMAZXBd5zsATNSHgIP38maBK6OaT
 66qsk64CZunpcebf5+0Im2gYVm6wJRnK9PT23XEKEAjtK5XWNhINoa4u1e4M5G8hRU3g
 WYcNNMKWSUcCasP+SOvFqLTgC8RYlFJ/2zdbbacEYnmYlkQENKBSC3L4IE9GxWxtvYX1
 PFNCLinOYmH/A0qfRlKF4Lq7Khc8XSXDPtXdaGrKWwnH9Ijr3iKqQ8bGIaQLt2sRcITx
 +q3A==
X-Gm-Message-State: AOAM531lTBM1EUDUN4PA/iqaUx+Ce1I+l+U6FLtDX+pntUe6H8NU4/C9
 nb6RKlXK4y/j+uqm7N7ACT9j7Q==
X-Google-Smtp-Source: ABdhPJzonp94EeN92ccWA4yx5OAhWeymUABO8CuWA+e+AWZi3mIarE73Im2NIXsNBOG6XUWJAZwKIw==
X-Received: by 2002:a17:90b:3796:: with SMTP id
 mz22mr12044018pjb.16.1622930127635; 
 Sat, 05 Jun 2021 14:55:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 76sm4622688pfy.82.2021.06.05.14.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 14:55:27 -0700 (PDT)
Subject: Re: [PATCH v16 84/99] target/arm: cpu-common: wrap a64-only check
 with is_a64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-85-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bb406c5-f51a-01de-8b61-368b7f96eb93@linaro.org>
Date: Sat, 5 Jun 2021 14:55:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-85-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> now that is_a64() is just always false when !TARGET_AARCH64,
> we can just use that instead of introducing a new ifdef.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Ok, I guess.
Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


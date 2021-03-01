Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F673275FB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 03:04:22 +0100 (CET)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGXv2-0006ZN-OG
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 21:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGXtw-00062u-UD
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:03:12 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGXtu-00012z-8y
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:03:12 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a24so8903190plm.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 18:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hexTB5OR+wTXUXUIChdvVYmX7gCa6GzrwLbfLjCWreA=;
 b=fhiVsCLNVd8tYux1GrWpOFFOadgOM4lFbChp5hjf2jH1ZbGuja9o7H+ZLG2FwzB+bF
 oHw5JcyaCBTzLnm3UXCuPZFgmom4JgnnVx+ssrNk/fitnZEoecqQ1Nnz5TNhnj/FcUkp
 v8M15shDAiDRI5tIpKoAZ132NUgjwNrd4KAJFxDWSyt2g4pHcxr/oZDE0VNO3FJOSAmx
 8zAFi1PCzEUJ0BF1n4S7rvE7HGtqLpKXJ/SnJqqx62hpARrwYgALo5q5OkwG8FTQS3Un
 0WTEpOav3s3jNWEFQvbnO9BUj5CYTs4p5iFHvf3o9j/VaOXRY6Av8rCf/JLVwI+5xfBd
 8zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hexTB5OR+wTXUXUIChdvVYmX7gCa6GzrwLbfLjCWreA=;
 b=Jq6qT8X628yAHxShFu7v2qQ2LfO36C9HBePR421a8NPcYy53aFUJOLHFx0NFvQnD/s
 FXw8DHf1Eug9UcgieoZpIvNL46wAHYkYpfhk2oSANH/JokZmJMFKggHPviuPnaz1CHxi
 z+VAMgPHX98HdJl+yU187UMeXmMlhjhlRYVSyuLs3N7BawILtRTUzuud8p5h6DJSxEi7
 tIpAaaSoZlkEO0Ilho+2Je4q2TlfBUj+miznLn+NP5iNDRE2bkhdC6u00/vsWn4yNjW7
 UCKtVdyTu2iIr4blwws7jMMHXz6KUAR1YUG1Gyf49np4S1dp3MbN41FMSP2PxsRVmE1m
 59Zg==
X-Gm-Message-State: AOAM531buglcmcSOGc5cDqG+i2yek6T9aflNm/V4YzeT+bji0J079/0P
 Mo3jrxK3+PlWozyZN4fsglFnjw==
X-Google-Smtp-Source: ABdhPJxKafP+y0vmVZ1DrZewwj8/a8xAXKUgZ/sV65VxdFr6RGGXYd9IXCC4yNePfmhc154ltuJygw==
X-Received: by 2002:a17:90a:8c08:: with SMTP id
 a8mr14252744pjo.136.1614564188439; 
 Sun, 28 Feb 2021 18:03:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id m10sm14793449pjn.33.2021.02.28.18.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:03:08 -0800 (PST)
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210220212903.20944-1-richard.henderson@linaro.org>
Message-ID: <d9ff1133-b275-9194-3fb1-7fa48e4f2938@linaro.org>
Date: Sun, 28 Feb 2021 18:03:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 2/20/21 1:29 PM, Richard Henderson wrote:
> I guess it has been a while since I've run aa32 risu on aa64 host.
> 
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
> 
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    tcg/aarch64: Fix I3617_CMLE0
>    tcg/aarch64: Fix generation of "scalar" vector operations
> 
>   tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++-----
>   1 file changed, 182 insertions(+), 31 deletions(-)
> 



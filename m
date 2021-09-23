Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C214171DD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:29:10 +0200 (CEST)
Received: from localhost ([::1]:40116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkKD-0003mv-8d
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsT-0006xa-MG
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:29 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsL-0003BG-Jw
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:29 -0400
Received: by mail-qt1-x833.google.com with SMTP id t2so2610062qtx.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kcneXf1onSCp+xsbQUt9aHlUp6q+5bU2ekPyr9arAu0=;
 b=JAfYGyZuPHDHXuJ5OQLukRxTKib0xrYzvJvD+e5/EBZWmqonsnFN2f+2wZM0VGw3HG
 wnxgjrudFD3kFz2y3Pz7QcLPLZzektvZhHfsZmVZbaM69IowRmaK9nYchUY9TW8Czl+R
 aLW4DPPIfL+7QuoSZ49JXQo1qKTe+oE1QYKxeB26hCjmFg8/K5qD6jAey4bSKptl+tb6
 6wf3xTRD01Ksj2kk5VGbun144PAp1SqvY7ZVLQKWX3Z5RM9ZhpjJvsi5qgaT57euaefG
 zqI+mqI2LI2pEENs/+B4LTjiCDgjc5RrDidWhAymKtknmOWEIlhOpPn5hB3PJAnqaJTH
 y8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kcneXf1onSCp+xsbQUt9aHlUp6q+5bU2ekPyr9arAu0=;
 b=tobrl568T8Tepi+J8BxN9UA1WP2xSM8fNiGIkP0H5MQqwG+fP62pJHoliJBzvYnzzX
 oro/z+3kNC8ov6MEPlJ5sTdQxP7i67zS5pqI/w/+qjjajU3i3nqj3qoAP49wJPCvvbBF
 UXzHkIe3/CSEK4d9OcMZ0vbjiLl9FrtRgGZ8RC08Dak6CbLvLPrhYriMS7z2Vp43cTte
 UisIBD7D5eoOC079zmckGbacs9jjlIHTd29U/KhpZMNyORPjNA6gHCmgS7IxBEmLc5mo
 bqSvuwJ9vnWev4HmbTE2upha+OVDC/bfngCsw/p0RaTlYCF3ZMzNbkbdrO0b+x8MhHdA
 6gSg==
X-Gm-Message-State: AOAM530B6GizFtsP80SYJ7tcf9zokpFiwx873ps3xDlwTSkmn+KMJUZ0
 txamuuvCWBTOyp34Oj+D9XEnVA==
X-Google-Smtp-Source: ABdhPJwCBKYWHOBKPWqCOE64WDi+vwjPinuK5VEKivFDzCGwvw5J5kmXd7Lbp1TrMCMXmR37PHSamQ==
X-Received: by 2002:a05:622a:4d1:: with SMTP id
 q17mr3587533qtx.64.1632484820640; 
 Fri, 24 Sep 2021 05:00:20 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id az6sm6196772qkb.70.2021.09.24.05.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:19 -0700 (PDT)
Subject: Re: [PATCH 07/14] bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP
 and reorder
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f45cad51-3a40-ca45-a611-183a8d273933@linaro.org>
Date: Thu, 23 Sep 2021 11:01:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> All architectures have a ELF_HWCAP, so remove the fallback ifdef.
> Place ELF_HWCAP in the same order as on native FreeBSD.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_elf.h | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


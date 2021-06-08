Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FB3A065C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 23:44:59 +0200 (CEST)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjWt-0002GC-2Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 17:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjVR-0008Vr-JP
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:43:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjVO-0005OQ-NK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:43:29 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x73so16772119pfc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mKdpvDDDh7/f/2lUu+Ih0bHWPmxVoxiRmcXaKviEDVQ=;
 b=dqLReeTikT4MqdPzXxuFLWNcdsyae0uHfrxCVLmoPUD66R6d+nzlOchoThBR77QGt3
 gcOXgXqdRbc8Q9VQnOEctq7tSpLNBIKIofnHZGYhO/3WrMl9FPjsljU/W0yhjvlu0Csx
 sFQiEYLxOPqO0au21dGJb179vWORlm6rxqD8hkI5QhUhH78nMsD/Idv4YtujbjrlhMpj
 P9O0a7m3wl/crSolMZMamZ5aMlYsfha3R6cTYAuwPUjhqtxQRMe8qCiEJQe/KHUDS3+k
 xqK+t79luZtYeMkVXeaDniUh2PtVF8ehXoXWXA2zXc2svlyqzadq+WoX8sqybGM98EBa
 /DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mKdpvDDDh7/f/2lUu+Ih0bHWPmxVoxiRmcXaKviEDVQ=;
 b=kwowUz200f7zAiyRMqDNqEn6GW1ozeyE33m+U4lEdcL2FzktOow5Tw9CfYTp6z3eAb
 2EkGJfyCh/PoquuhjwMut1JpfyMgK38ejfk4pb5LhzZN3hu5pIA55Zo152nejezMX5Sf
 cfcGYNvBHur0bxCpChhN08BOPnUm0xd0D8/6zhPVD8T9nKWwMs/xCLucRO+Cxr+/Xon1
 C+F7mzRMl7u8fAP+9M78gZVOdowwCKQJ79qdRw7vwKEH+OOIoVq8kILVmKcqzrTIbU7Q
 kLHbbcq7SwkBUu+iMqWwgO7lJaVEzmQ8zXvvIiMqHLY6/FmlbVXB1tEHQq7dly54wQY6
 bCJA==
X-Gm-Message-State: AOAM533LUfVwgzQ+/U4L68xlRFGpddDuDuWfOMbkrqjiiqK5qHnSqLQ/
 5Id8ycvj3YtqIw0LC4XPjQtu1BUduft0Vw==
X-Google-Smtp-Source: ABdhPJzdDlTVldaOub47beeoRG3m8vOf9Q/o0Q89csMOHgmUs/CgxAT7JMyCCxhCgdgG0iQVj4QfbQ==
X-Received: by 2002:aa7:9a97:0:b029:2e9:e1fb:2f0d with SMTP id
 w23-20020aa79a970000b02902e9e1fb2f0dmr1945979pfi.45.1623188604883; 
 Tue, 08 Jun 2021 14:43:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ei23sm3219385pjb.57.2021.06.08.14.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:43:24 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Message-ID: <d0b29c94-f143-ca81-82a7-ccbfc2c37281@linaro.org>
Date: Tue, 8 Jun 2021 14:43:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 6/8/21 2:33 PM, Richard Henderson wrote:
> 
>> +static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
>> +{
>> +    MVEGenLdStFn *ldfns[] = {
> 
> static MVEGenLdStFn * const ldfns
> 
>> +    MVEGenLdStFn *stfns[] = {
> 
> Likewise, though...
> 
>> +    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);
> 
> ... just put em together into a two-dimensional array, with a->l as the second 
> index?

... or separate VLDR from VSTR.

r~


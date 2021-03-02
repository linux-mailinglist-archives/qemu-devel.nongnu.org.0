Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496903295E7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 05:36:57 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGwmF-0001eP-P3
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 23:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwl9-00018n-4S
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:35:47 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGwl7-0003AN-GX
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 23:35:46 -0500
Received: by mail-pf1-x435.google.com with SMTP id d12so10469724pfo.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 20:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gIZKtE6lA/9EEQDxhXgJua9HhuL8qZI6HbwQCAuv454=;
 b=yIjS2yBiLLo3WqUKUVSTZ01+S3AIeybh1FeKjiumWQoODcOLZL5bP90LcCyysKVTAV
 6WxmLNfQ4pyvKc5Wl0hha2R6VDLHMxto5MYOx2ZZZJ+Yu/ec8bAze49SA9hvwLfwLU8W
 EYSORSnEh/Hee7NCl1eJIZVuMzWZ+Q8YeAjwdSqzqwvcCaLSHLfoKW/MHDHgSSZqtA5D
 r8WpxuZfY+oZjOjtnPyWAZH4p2o4C1ghZsmefaUyk4qyUrnfhp7ACD4dbjVpSzu5S/Fx
 dLzzEwh5iVqddXA9MO4KbbkRwNIG5coZHnxcJ7ZU2mIdO5DKJYdN2FJgJntrnpEIRyr2
 gsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gIZKtE6lA/9EEQDxhXgJua9HhuL8qZI6HbwQCAuv454=;
 b=NiYtFceLZkAIfjLMf1pKWzi8FscBNNPZdQ4nmMRqM71Fx1KrePoAYW/7bb14t409EB
 tTf7u0uGsAzndPOkn2gs99Lk/ZS3pHgj60xqv4ROYDsp2DPK7VLS306DslsMfZhxMngF
 AZP5fkqmTh5QML/D/gif0uHjDXPFiImwMWhsFGIChS3Pk9ZYuGp0MZ0Bq0/HScr4irVq
 6jcOEttaehK3g/Gs4TD30HCIT87OPleqcstZ6ZQoFHIOD22XcMtoL0LbHYIj01FIS74k
 yj7fNoRBYqxZvxFsujHza9xtPjsEZyYVYZT84aFI9Dlnw3B78oKn72Af6LDTgzEnLujx
 jMwg==
X-Gm-Message-State: AOAM5316B9y6iYGAzD/GxAhrwzv8bm8orPMVgTXrYoc8IB5uIoJendOs
 t2XLOG5dfhqKxrx+FAXtVQoxVaCBvsEgwg==
X-Google-Smtp-Source: ABdhPJz8sBWQXM/fkwSbr7+4AaSpOEsqtbPYZ90jtHOsnAuxm7BgkFpLph7um7c4j8md6e+YDFceIQ==
X-Received: by 2002:a63:d506:: with SMTP id c6mr16543245pgg.77.1614659743613; 
 Mon, 01 Mar 2021 20:35:43 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id t23sm14633382pgv.34.2021.03.01.20.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 20:35:43 -0800 (PST)
Subject: Re: [RFC v2 15/24] target/arm: move arm_mmu_idx* to get-phys-addr
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-16-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad1c16c6-131b-dad9-fe1a-0343e59757fb@linaro.org>
Date: Mon, 1 Mar 2021 20:35:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-16-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/get-phys-addr.c | 95 ++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c    | 95 --------------------------------------
>   2 files changed, 95 insertions(+), 95 deletions(-)

So... get-phys-addr.c is now gaining stuff not related to get_phys_addr? 
What's your end goal?

Is there a better a better name, like mmu_helper.c?  Should these in fact go 
into a second file, leaving get-phys-addr to itself?


r~


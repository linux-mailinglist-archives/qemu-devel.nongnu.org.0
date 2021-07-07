Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE73BF0BE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 22:30:41 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1EBq-0000tM-Kx
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 16:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EAB-0007op-LS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:28:55 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EAA-000742-5g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:28:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id w15so3504048pgk.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 13:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5LYkdijv+QyxkM60YJWJmSHgjCbIiP0NJGovely9ldE=;
 b=RL39mimK1b8RR1GskKhyF0KjHk12m24NUN8G6a5nPwcBe+KpA8Wjpzw/N0cNFcO3AJ
 gf7drz4NFGpALfrz4c2BvJNkXOkvzEWufhX1bPa30bBXRjxTdQ95PV9XHOOH1JLAmO/+
 qeYOEHCWKyqOJhqZqiyuEC20jvWLmSFavD7+kAIQ6WAgZi7n1PZCprOwkLkddw0S2X+B
 j6wuQHhUrW2KHAqmqQ03h/+yr3NNeg2ESmmAqeIDDTvAROKKt759RAvpphwrCXw+dm1E
 dLrRwf1sQIxbJoBQkz6cBV2EH98S9OBKVgPuRPPoC7O4gbY87cwBLX1T/gjANifZmyho
 eBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LYkdijv+QyxkM60YJWJmSHgjCbIiP0NJGovely9ldE=;
 b=gvu8NKedhBpVQdWvPdVl1mLTprASzFl8OzYpCSlcCBy8QEFIufecIh1iOjsNVkHUqA
 5O/zxoh7K+WBnlzmfC6ATgSk0iVU58p3Iz5hkPtOCwK7rDyHMT/vKE4u4vbUab2TqNkl
 L/+ygHBqsuQMXCQOB5A9DgNvk6gigfcYQ5UEwtsBtV8rvuasGCsBMVXolgELiilc2WNC
 VDavD876qd4Cq+G3Xl8LPUq9XYBTEotFlMlK094qGMJsKtKXtvwdm7hJpgQxMeWgbgnl
 3Co+TCo1DmS4AIjms1EqN0C4GfujiGu9WL3NdOQO+dsWrgne8WlbWzXYejtevSOfPjiH
 iMCw==
X-Gm-Message-State: AOAM530ozf6cklE0T36AEpqOBCOT0H7PPzYN3Ju81rqw5ZGBwyxg01oK
 x0eOHDrnpRMJW46dSqb4HjovuA==
X-Google-Smtp-Source: ABdhPJztjkPJi//Yz2PmevvAAJdtOmiKbA/mWgX7ViKmJYhb/UpmepvWk8o5JYqPYU0u/6rllvS4dw==
X-Received: by 2002:a65:57cc:: with SMTP id q12mr2358244pgr.417.1625689731976; 
 Wed, 07 Jul 2021 13:28:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w194sm60143pfc.126.2021.07.07.13.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 13:28:51 -0700 (PDT)
Subject: Re: [PATCH v2 22/36] linux-user/i386: Add vdso and use it for
 sigreturn
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-23-richard.henderson@linaro.org>
Message-ID: <10667812-6041-c3ca-59bc-7752fa6ce3b7@linaro.org>
Date: Wed, 7 Jul 2021 13:28:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 4:49 PM, Richard Henderson wrote:
> +	.cfi_startproc
> +__vdso_clock_gettime:
> +	mov	$__NR_clock_gettime, %eax
> +	int	$0x80
> +	ret

Bah.  Have to load the parameters from the stack for these functions.
Not sure why this doesn't fail on ubuntu host, but it does on fedora.


r~


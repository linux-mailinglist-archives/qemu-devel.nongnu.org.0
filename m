Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE12367F424
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLbL2-0000dx-UE; Fri, 27 Jan 2023 21:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbL0-0000dN-U0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:53:06 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbKy-0001XM-Er
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:53:06 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k13so6824677plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NU4EVJCvTXWkS0yFA+wP1qGKZg+BOpVVc/MEE3lEEuM=;
 b=nti0+XlU6K5vcxk6uutZZbe0PhiLCSjYxGvNGQNtrUa3FsHjICGxr7PR7YBsh348E9
 H7JVbHVLZ/hQDUHcnw/PVy7uCtSyMGZ+Q5UjfxP011bwH7ohGQDXnOiv3VVnnZIsg9oZ
 kboUFACbg4+sD30RmrrGbFXlDk9b9NjA1ACOzQFNj1BhDF5mzWssvAsxoJuPSTLZG8Yu
 eQJ2lNXi7o2MqZ/Mgkm5cCH2DMKVxo5ZI7colaApxwPX/8UA0N8IV+wzJ5DbTbGMlaLH
 pk5Nzu8gYtRnAKadbfQU73p3ykt6wwDo6lFum8Idx1XkduNJUkJcSxnZPAph/MGRDSfY
 aexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NU4EVJCvTXWkS0yFA+wP1qGKZg+BOpVVc/MEE3lEEuM=;
 b=YPTznufjM1LDGMmUGvimqAKX8Rtf8DhjmpSrXi3+JuTp7MNAD+qaSzUR/s6jjmdrQn
 EZT9lE7xpX+FtZHRHpssSaH2oKao2r11NYgFymw2NlL4J6n1OxkoOFaZg7OiT95Z3jIO
 mcWIbCt/tMFZfHmx0SbH5GskxMmizZv+AcEPxZDUQtroF9a+i07KpP0Ou4bE4oF/nMLj
 dtckc5x0P7pZxv6Z4FVcwX4qL/9RNvCI6jTUehI2LZGMMrtmBpmdx+r7qPlkNFQnDR+Y
 b8lqIMbpA7kcLOSSMKSXUs9mRrDP34W3xVhMjEUEa1eosN/CNExkOlMmo1eIxRJdANS7
 1CBA==
X-Gm-Message-State: AO0yUKUnu3+XnaMMqz4KbfBwPW6jD1IrLRz6aWtO+jcYihQ3DWYN/XjH
 4IFxM3pvKQU948IKsLr77kjzV5pn5Ga1MeYm
X-Google-Smtp-Source: AK7set9cTzoUAORHzm46xaWuhSq/gPPDOpTEe4fEsL9+EFLSemyvRmbO32qxmR0MN8lwid0DcdgIbQ==
X-Received: by 2002:a17:90b:1e4e:b0:22b:f834:3fac with SMTP id
 pi14-20020a17090b1e4e00b0022bf8343facmr15230433pjb.11.1674874382881; 
 Fri, 27 Jan 2023 18:53:02 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 p10-20020a17090a2d8a00b0022bf0b0e1b7sm5745466pjd.10.2023.01.27.18.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:53:02 -0800 (PST)
Message-ID: <eb1e8de9-f5a8-7c0b-c7a4-3f76823287c3@linaro.org>
Date: Fri, 27 Jan 2023 16:52:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 14/23] target/arm: Mark up sysregs for HDFGRTR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitons for the registers trapped
> by HDFGRTR/HDFGWTR bits 0..11. These cover various debug
> related registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       | 12 ++++++++++++
>   target/arm/debug_helper.c | 11 +++++++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


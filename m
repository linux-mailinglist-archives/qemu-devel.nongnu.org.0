Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02181471D01
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:44:59 +0100 (CET)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwViM-0006Ys-4Z
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVgz-0005dx-Sl
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:43:36 -0500
Received: from [2607:f8b0:4864:20::1035] (port=36570
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVgx-0006eR-N6
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:43:33 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so13244134pja.1
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=24U4qXKInjYeICxUXdhiQPFvo1gapp+rEvu4ctBipvI=;
 b=ONeEV83zNfuDVxFFAy36IJDxRkvLY+zEO33skCmw9XC8ISxrjnr7A8hxWPWzH5xOsg
 zt0PJCalKjZY/DIO6yGge6D/RFJhXAPXnu+HEpCOPhJN6HlTbMuN2hZ0kDXvIno1Kc5b
 c4LpVhxAL2NbFUsW2tZLGAFKuQNZ1sBKiT+8PlcQwnVSYMgMoRbHx3GYDAW0WThIPzyO
 iplYsSCZG7ZfrUrPzypIYrgiyQhHdwh7WPAOKGnLj0qc8qktkk/nLOgCj8HxcQYKS88M
 3OyetDJgo4+RcFUgmFRDFOkpj0smuAaZVZuO3kOdxhF0LtXvps6D2ue8HrniOeaprdjr
 qrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=24U4qXKInjYeICxUXdhiQPFvo1gapp+rEvu4ctBipvI=;
 b=KYhZThjMKC+HSaGcFSex1bbzh62+cbTxIEPOc19BIWXlYPoe4dGjS1kaLhR9N9eo/N
 Pbg2odB6q195SAzgAkamSl4lJugxjBquzrjhzFWD/V2xbXeNTg5yQJuym1fmDkeHjg3h
 6wR34mxiWv/GcBi7wYZuvjkUwZHUULMgTzjqGa9BOXMh7Tk9Wv+bZl+OVYSWQhwxTEYd
 a3XHGwLFK61CztY+nXzg903tJhexXRJmRq7UR8AEUadUjH5UhpzXC7oCv9x0ecchxJMb
 yHxwk2JvpP5PW3JcMRdbtODmesUqe8GwRppCe9tpWiMloaSnTD8FHAfy+6x+UmUI/F+x
 nvJQ==
X-Gm-Message-State: AOAM5325Fnx7zbc2u6m6PFE43i/tmU5n24NyqGloEsaoAXjHBbGKSbQ5
 6VbLBn7+CMJFbOTYVqyG7Ixxuw==
X-Google-Smtp-Source: ABdhPJy0MxAynF+cJG1FTpEn/M7Pd1uF7SzceFtcKTL0gjmMwMlPd6ZVC6iLfBE7pxMcZ6vnVBn7mA==
X-Received: by 2002:a17:902:a584:b0:143:c2e3:c4 with SMTP id
 az4-20020a170902a58400b00143c2e300c4mr90125108plb.69.1639341810494; 
 Sun, 12 Dec 2021 12:43:30 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z8sm8080585pgc.53.2021.12.12.12.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:43:30 -0800 (PST)
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
Date: Sun, 12 Dec 2021 12:43:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
>   
>       if (dte_valid) {
> -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);

Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one 
bug by not changing the comparisions, but changing this computation.  E.g.

   max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;

so that the value becomes UINT32_MAX for SIZE=31.



r~


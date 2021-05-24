Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AA38E7DC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llApT-0005TI-Em
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAoc-0004n5-MG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:40:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAoa-0005dB-3T
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:40:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso11178819pji.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=17i4ZrPDp60WiAzLgLEgzJ4YzjjRwZjqOkYL9Wcgf9w=;
 b=k33N3h6zMMOG4FEj0MjzS+mnLOcqSI0shMEnpSuJgoVaiZTmOsK/tMrmpnD4l5iMVE
 zLw+ziOgU8HFKLNi3HYomMVzrQ+TY/ltFrVigenZT2FvuuZJc2snSlXySA7UpnaGwAZm
 hyJu1HYb2nNu3tLhj9GqB2uSinh+4ZYZNfYSO2Gq6acu4HEkqaq6+/avt2ogfcOaLzmH
 uTIXsZMHB9KpGtXeiNUDrYVfjxvcHg8FaSSEQWVcPfC5LvwnGSF6NNtOyEMynnlCHPyz
 fOL6exuguh4CXZmdUyAK/cZGfnXX3QourxbFzA006g2oWTaLgDlx3UGk4N9aZkeDObt0
 2yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=17i4ZrPDp60WiAzLgLEgzJ4YzjjRwZjqOkYL9Wcgf9w=;
 b=UW6O3gi9VqyCpKIg6xwcQMzigANe2C5MeVZRANqTDRiKKPqNeSyL6STfLq0/jRJvOT
 /ilsVxyZqPddSAXBurhJ8G2vtvlDpb33ZoKVH1hi+z/2faQCbGNnp4cMFaEohvaj8UCv
 msAxvtxC2z9eSxMxVCEhpC6Tz1VOiX/uYdWWwAyOG1spEBzdPM6vpbZ/rBMtNW3PvQ93
 TzrcU3aoLbWxRCw6dx1T5Jq+C6bFNcXdfO2Qiji/Zjzc6ZS+f+y2cqgUlsiA0x7EPdUy
 Fx/wLrixBqyWCp+huSIoNArpO4odCf/UxRwqm/+UDKwMQEFvPj3gq26MILov30DJDIiH
 ecDg==
X-Gm-Message-State: AOAM533GTlBBL4iy46v+UZNi5sUFS2rUwngwL90DxhquXOxm1aFq5iPd
 xpPdVhEqw/lASMZlGZVWz0803cH2EVDalMVp
X-Google-Smtp-Source: ABdhPJyj0uVdhony+Yl2D4gFypA9B1CecxsCNhLwPB31WV1oQxybmlTBM4hdvdQKks9xN+6PgOGQCA==
X-Received: by 2002:a17:90a:887:: with SMTP id
 v7mr24430975pjc.76.1621863614025; 
 Mon, 24 May 2021 06:40:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h1sm10993779pfh.72.2021.05.24.06.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:40:13 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Use correct SP in M-profile exception return
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520130905.2049-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f9ac2a7-3a69-5a91-007a-72a38373daf9@linaro.org>
Date: Mon, 24 May 2021 06:40:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520130905.2049-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 5/20/21 6:09 AM, Peter Maydell wrote:
> When an M-profile CPU is restoring registers from the stack on
> exception return, the stack pointer to use is determined based on
> bits in the magic exception return type value.  We were not getting
> this logic entirely correct.
> 
> Whether we use one of the Secure stack pointers or one of the
> Non-Secure stack pointers depends on the EXCRET.S bit.  However,
> whether we use the MSP or the PSP then depends on the SPSEL bit in
> either the CONTROL_S or CONTROL_NS register.  We were incorrectly
> selecting MSP vs PSP based on the EXCRET.SPSEL bit.
> 
> (In the pseudocode this is in the PopStack() function, which calls
> LookUpSp_with_security_mode() which in turn looks at the relevant
> CONTROL.SPSEL bit.)
> 
> The buggy behaviour wasn't noticeable in most cases, because we write
> EXCRET.SPSEL to the CONTROL.SPSEL bit for the S/NS register selected
> by EXCRET.ES, so we only do the wrong thing when EXCRET.S and
> EXCRET.ES are different.  This will happen when secure code takes a
> secure exception, which then tail-chains to a non-secure exception
> which finally returns to the original secure code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This was noticed by the Arm TF-M folks, who have a pending change
> to their code which will run into the situation we mishandle.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


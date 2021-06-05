Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCCD39CB1B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 23:00:12 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpdOt-0004uP-EH
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 17:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdO2-0003Z0-Cm
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:59:18 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdO0-00089z-SE
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:59:18 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s14so9200405pfd.9
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/8zyniDS8Fte2L4G45XLny30uhcnZm07GDsWx6TuVZA=;
 b=FYdr1KirP3dPDAYKzxvYmSAhOzdfx+TRclgAHFZFlTGaK8uffCGL6wRdFLs8Z64vBz
 dw4x81wNsB56l/RrEKKS17ulIPpUUFmiv7iHpTB7w7Qy3MQkIPtApLCQo/dTo5tsATXm
 CXRZNO5anFatI+hRkXqrLOBnV33FyZXNo+tYkt1xNDpmmvyYksHeOfpRNAEqOB6kedf3
 Nc70rXARCmYoY7Nl4xtQ2xL+w/UagWVP0YSB6sOpNAEizd5wonAjUjQmaeSVNEuYt1hp
 u2xz/Sb4XriWBzOh+84SH0pgcezbPEeqQHoDRQcBo2UQ9aQTgByVA+jRlf50qOGGl5X7
 sKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8zyniDS8Fte2L4G45XLny30uhcnZm07GDsWx6TuVZA=;
 b=jrVo1aGSR+v3Zh+gbLrgpKo9TC7A5w4maPv5w3AglmKzNOOKP+1BH9GIV8VpUnAGi8
 e9g7f9LFlSfz6Mez3dJcIA2v34bo0wzzpktgCY43HNHb6DzAngpapCAXuv24RzTMS1Ip
 pPfOPp4ZYZfyShY1zQNVNbnfcQI+9HJJ5bQjZSvMCg+3HBdlhpFmpH9J3NZM/ilkYpnU
 nNas9f46OHw1GZkJ9QgqJh5aUGYIm8J1EZrs5S8vXZpfpdzRcq4eTLsgfIp9smDXI7W8
 TSZ4YSLyigEA8ygiIsWPBnTPpSpOqSG00Z+r07/qWyDR+dTkIAe92Z6Wd/QvpHrU+Ukq
 etKg==
X-Gm-Message-State: AOAM532p17WKvqsirngXYKqzjZpwWXWDNLH2NF1Cq2ZNe9qPBfqrtqi8
 uS4yzI/+0yRm2nMBN3mGvmVCaA==
X-Google-Smtp-Source: ABdhPJztcnWc28SOECgepOlA9ho6pepYVrzQE8jfpXXMWuoO/65GxFUb0Vq4t8LqfnmsPHmwc+sn8w==
X-Received: by 2002:a05:6a00:1630:b029:2c0:a1eb:d77 with SMTP id
 e16-20020a056a001630b02902c0a1eb0d77mr10532297pfc.81.1622926755516; 
 Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 br14sm7468846pjb.41.2021.06.05.13.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:59:15 -0700 (PDT)
Subject: Re: [PATCH v16 79/99] target/arm: tcg: restrict ZCR cpregs to
 TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-80-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1dd8e73-654c-3e50-5443-a216ead17ce7@linaro.org>
Date: Sat, 5 Jun 2021 13:59:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-80-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
> restrict zcr_el1, zcr_el2, zcr_no_el2, zcr_el3 reginfo,
> and the related SVE functions to TARGET_AARCH64.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/cpregs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
> index 8422da4335..56d56f7f81 100644
> --- a/target/arm/tcg/cpregs.c
> +++ b/target/arm/tcg/cpregs.c
> @@ -5791,6 +5791,8 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
>       REGINFO_SENTINEL
>   };
>   
> +#ifdef TARGET_AARCH64
> +
>   static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>   {
> @@ -5843,6 +5845,8 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
>       .writefn = zcr_write, .raw_writefn = raw_write
>   };
>   
> +#endif /* TARGET_AARCH64 */
> +

Given that tcg/cpregs.c is > 7k lines, I wouldn't mind splitting the file on 
that principal.  But just sprinking ifdefs is not on.


r~


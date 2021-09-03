Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323A40054A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:48:06 +0200 (CEST)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEEP-0003uU-H1
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEBZ-0002EV-Cs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:45:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEBX-00077d-Vn
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:45:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so160950wme.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QqyGEOjpS2yvzbpizUa4Nh8HGB4jFsQ6dENzWQ0NCPE=;
 b=h1CxKbH7ZWfu0fOOx2zbVhHT1cqFmuw7nXYWDM0GTbUi0LlO8/LdZRUMPoVHZHQ1y1
 KAD/wsX0JvKYTPF1CaH2wBSKPq/T4I8sUsPShagMgfdF0XFC/7zgx/qhTndi0bnFgZcr
 dZizTNQq8ix336QypV7AbbhZoWNsX0jsx9Q9lCnHv8R9GMdT5ubnI1uvdG8yooug8ESd
 OpBD2xu2CroUEuqeqERCgyBzLP4HVGiX45VKTGuYY63pzd6Dy5/g4AYKF3F7oGvPjBBL
 i89YsvVIxvYQ9mSfvG4sUZ39h5wuo8a7x2hrGlTcLErG5NvT9YpeM7m9h/GrbxaiZZPq
 Eudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QqyGEOjpS2yvzbpizUa4Nh8HGB4jFsQ6dENzWQ0NCPE=;
 b=LbUCTZgx21Hod+Z5Bj1x1BDYf79GbNkz5jY37TDyUXRi19B0wvBdVdwFpv2lGO+cAt
 0GqqB8DigDdnqYbcbONZhSS4QMqKFdyPwNH4aGwR4kmLiUmf0JIFRg8R8kBT0uQdFk/q
 qZhQ9aM1WueiX7FYji+xcTnYOwGqn3t2Vo/65W/9pv2Uw43qc9cn/ShUeMvrfyNBKGyO
 EOGyMsrE4bGS3odOnLYhlOwzzH2IQfpkoY10tj4OWJyRJdcmmTbh5Btr35no8LC3KS2I
 RxpFGtNbBdRtCvECf9/g8cVSC/mqx7/cwsb4sPV8R0atugaXl3xDx4Esugr36y7EZlpC
 l3WA==
X-Gm-Message-State: AOAM532QX/OOCVwPl/tjmDP1Oa5rT8Ln50b9tiDua1UtQXlBpIyPcqR1
 t07COUw6+pXbDT72OOXjhLku4Q==
X-Google-Smtp-Source: ABdhPJw6gzpPXK22Mt9sQTQEwZWF7fGtdAN4VHS2SLkDyOkS4be2ck+d7LHo/uINg52AMSHnDUP0sg==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr202598wml.121.1630694704962; 
 Fri, 03 Sep 2021 11:45:04 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u27sm62416wru.2.2021.09.03.11.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:45:04 -0700 (PDT)
Subject: Re: [PATCH v9 03/14] target/riscv: slli.uw is only a valid encoding
 if shamt first in 64 bits
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
 <20210903170100.2529121-4-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2970e9a3-f210-8d30-b875-4c8bc15ca3c1@linaro.org>
Date: Fri, 3 Sep 2021 20:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903170100.2529121-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 7:00 PM, Philipp Tomsich wrote:
> @@ -652,5 +652,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>   {
>       REQUIRE_64BIT(ctx);
>       REQUIRE_ZBA(ctx);
> +
> +    /*
> +     * The shamt field is only 6 bits for RV64 (with the 7th bit
> +     * remaining reserved for RV128).  If the reserved bit is set
> +     * on RV64, the encoding is illegal.
> +     */
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
>       return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);

As previously stated, drop this patch.
It is done correctly inside gen_shift_imm_fn.


r~


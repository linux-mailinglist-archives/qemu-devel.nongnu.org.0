Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046C7442F13
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:24:47 +0100 (CET)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtmP-0005pw-Lc
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtk3-0004Bv-EZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:22:19 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhtk1-0002dR-9m
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:22:18 -0400
Received: by mail-qt1-x835.google.com with SMTP id t40so18781773qtc.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eo5v+BIsAjC8jSVN84A9i9wzrY/Ha2IeJdDUKB4peZA=;
 b=B/An2eu9E4RgaR4NsyvouAxjWNE3BpgWjnGTvUYpwavOoKPvkhAd1DfO70v4KsOctX
 Wcs/Her7Un9TFcUp5hkwUBgaEVauSnu4KDk1AkBiKwvwqFC/OUjJhbm8YwkXvBsrDnR+
 isW5465/NYV/7j8mZukYMa3IZiXpfwWcc/0GEY5J7M/u3KULu78pA9o8AD+ZPZgqzgdI
 V4HrqNkhOxC80Ave3CyF1cvoq5nCI0NjffcU8XVGqG4n2mRUTM4czmfIkjGcgMPPzlEY
 4h5j11iCOOvop3xGO0X/L7yYY3m4mJON02dJlHK84T45bxybGVhipxv+XVQsGOpyLuf+
 VkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eo5v+BIsAjC8jSVN84A9i9wzrY/Ha2IeJdDUKB4peZA=;
 b=xFT3iepT8et7MTzjCl+7waz/KUf5ClRjmi0Gl3S26VfIbJAYQGPD6XGw3x2lv9hEYp
 eSM6LVoKe91y8nzhVVRY2KsGq/koXd9hMZyqP0EtDprjtCbb7H1k+m1CZ7ERDNvPulQj
 JAVwVgHQoUcDzU9k20qktRTneKpQZU7nUM5mE6y86yPdspwc78OkVTONU96wF/mGzQFZ
 G4ZOHq3oTXFMMJbG2eYtgSDNuRkpgZ3daOSLkOvZQr8WNLOEd7+ozJ7AcIZ/UrsRbu8i
 DRrk4aWgrSECGpEaluiEv8C20xktCQEsDoD6nmJxkoNXy+wwoUCqcAir20sNiupBkTcH
 lQTw==
X-Gm-Message-State: AOAM530cvpcI1C17FBr/vUz9fTQbqV6TAwRuWanVHF43bHGaFm5HDUFk
 fiCDY+zE+ueJ81PbOe2kyjFfkg==
X-Google-Smtp-Source: ABdhPJw47jgLUFQJVxHkEHJDqIFBQABfomZNepc2u3ATzQtrtLihy9x0fFLsmqM2U+gs0Gp331Fc5w==
X-Received: by 2002:ac8:5f0c:: with SMTP id x12mr38673732qta.309.1635859336294; 
 Tue, 02 Nov 2021 06:22:16 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z13sm1828058qtj.92.2021.11.02.06.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:22:15 -0700 (PDT)
Subject: Re: [PATCH v4 17/17] target/riscv: actual functions to realize crs
 128-bit insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-18-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3089f9fd-a108-1a32-db0d-4a5ec633ca4e@linaro.org>
Date: Tue, 2 Nov 2021 09:22:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-18-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 8:28 AM, Frédéric Pétrot wrote:
> +typedef RISCVException (*riscv_csr_op128_fn)(CPURISCVState *env, int csrno,
> +                                             Int128 *ret_value,
> +                                             Int128 new_value,
> +                                             Int128 write_mask);
> +
>  typedef struct {
>      const char *name;
>      riscv_csr_predicate_fn predicate;
>      riscv_csr_read_fn read;
>      riscv_csr_write_fn write;
>      riscv_csr_op_fn op;
> +    riscv_csr_read128_fn read128;
> +    riscv_csr_write128_fn write128;
> +    riscv_csr_op128_fn op128;

I think you should drop op128 until there is a need for it.

> +static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
> +                                        Int128 *val)
> +{
> +    *val = int128_make128(env->mstatus, add_status_sd(riscv_cpu_mxl(env), 0));
> +    return RISCV_EXCP_NONE;
> +}

Well, you don't need to read mxl here, as you cannot arrive to this function without it 
being MXL_RV128.

I think you need a similar read_sstatus_i128 function.

> -    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
> +    /* check privileges and return -1 if check fails */

Bad rebase change; the return type is RISCVException.

> +    /* write value if writable and write mask set, otherwise drop writes */
> +    if (int128_nz(write_mask)) {
> +        new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
> +                              int128_and(new_value, write_mask));
> +        if (csr_ops[csrno].write128) {
> +            ret = csr_ops[csrno].write128(env, csrno, new_value);
> +            if (ret != RISCV_EXCP_NONE) {
> +                return ret;
> +            }
> +        }
> +    }

This is wrong; you certainly don't want to drop writes; you want to forward writes to the 
64-bit version.  At least...

> +    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
> +                                               read_mstatus_i128                   },
> +    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa, NULL,
> +                                               read_misa_i128                      },

... that is certainly the case for these CSRs.  Alternately, you've got to implement these 
write functions.


r~


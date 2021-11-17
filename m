Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4154F4542A8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:30:03 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGKQ-0000xV-D1
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGJP-0007vd-Ka
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:28:59 -0500
Received: from [2a00:1450:4864:20::433] (port=44753
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGJN-0002E3-Vp
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:28:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id n29so2977756wra.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9c9fcgEjGZPM1gCSr0uEHgRGcjHy23nQSnoSx0/4T0A=;
 b=e/lJtS1kM6XyY3lA+A5SBzVyRq+dGIdRTnTZReXUkle1QTTEBKNi97fJtevft2L11Y
 RdWhpGwcIz9Fbr7ivJC2B+0c8nR0lSCG4jx12slNaUAcQdgM1+ck3AtoQF4DFcv7Ygii
 Gwz8gSchFNSgInRavyWyYkhAe5RQmbH7HdWfFVKO8LMoj2A90j27SM2mzr9kBAXwScIQ
 TrFsRFm4wRvmZnL+SqVCxIms2zmbRn46kJP7OAt9LEjm5IidWiQDhs2zYOQ1WFwfVAB2
 JPVDqvpQIWaQWnx75aF5TOJp50SrIvziBwdxK0mJBJpHum++p6Pdz6/YlT+rkfnh32XI
 Sp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9c9fcgEjGZPM1gCSr0uEHgRGcjHy23nQSnoSx0/4T0A=;
 b=O+XPz3oAgFpwbVL+6CHKJ6pY3Z54RHy9wzV1GtoIffxxwsc0AK1ccv1cETtRdUrHvZ
 4QKtklmHet6yYKA4mPZCce+P/7hQTIyMa3N3TTEnTpIRmQTHvLW5yf7Tkxlfhz7ENoSG
 4AQAGurcOeEXbMGnvLlX7TO04GB4+csg6j0YTgLMuxuyYE41FgXFrMAf/5PGiJ0/Ou99
 DwJDpq4Tsx9OOM0TXFj4hpFKPvzVaO8AbikxTFf7qSt4pOOYDgr7mhZX9kYI1w2lg2kE
 /HVzLGmf8YDwzSnLCrW5fZS22130rWB3H+zKJldjeZeNxf4LLCpoc2inUje359K9BzzO
 7wog==
X-Gm-Message-State: AOAM5339mN+m0obUEsvjadKL3zEbmGsOkyWh9hSU/yZccok3SBMrCDwr
 89TufaSGDV2t0OvuR1A7gYMhtg==
X-Google-Smtp-Source: ABdhPJxiQ1G8cpU5xCcwqWm0NpMPOME9JFQehMPkWGTMEGhUfMOwmpDvzLwhPbsayUpRVQrs30z0sQ==
X-Received: by 2002:adf:d852:: with SMTP id k18mr16666125wrl.391.1637137736371; 
 Wed, 17 Nov 2021 00:28:56 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id h15sm5598394wmq.32.2021.11.17.00.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:28:55 -0800 (PST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: gaosong <gaosong@loongson.cn>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
 <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
 <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
 <6e225d21-c2e4-69d0-c4f9-d2018096ec70@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e26b8243-2797-cde9-3833-a7c4cd3b6a65@linaro.org>
Date: Wed, 17 Nov 2021 09:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6e225d21-c2e4-69d0-c4f9-d2018096ec70@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 8:57 AM, gaosong wrote:
> I see that  insns.decode format is not very consistent with other architectures, such 
> ARM/RISCV

No.  I don't like how riscv has done it, though they have quite a few split fields, so 
perhaps they thought it looked weird.


> #
> # Argument sets
> #
> &r_i          rd imm
> &rrr          rd rj rk
> &rr_i         rd rj imm
> &rrr_sa     rd rj rk sa
> 
> #
> # Formats
> #
> @fmt_rrr             .... ........ ..... rk:5 rj:5 rd:5 &rrr
> @fmt_r_i20                        .... ... imm:s20 rd:5 &r_i
> @fmt_rr_i12               .... ...... imm:s12 rj:5 rd:5 &rr_i
> @fmt_rr_ui12               .... ...... imm:12 rj:5 rd:5 &rr_i
> @fmt_rr_i16                   .... .. imm:s16 rj:5 rd:5 &rr_i
> @fmt_rrr_sa2p1      .... ........ ... .. rk:5 rj:5 rd:5 &rrr_sa  sa=%sa2p1
> 
> #
> # Fixed point arithmetic operation instruction
> #
> add_w            0000 00000001 00000 ..... ..... .....    @fmt_rrr
> add_d            0000 00000001 00001 ..... ..... .....    @fmt_rrr
> sub_w            0000 00000001 00010 ..... ..... .....    @fmt_rrr
> sub_d            0000 00000001 00011 ..... ..... .....    @fmt_rrr
> slt              0000 00000001 00100 ..... ..... ..... @fmt_rrr
> sltu             0000 00000001 00101 ..... ..... ..... @fmt_rrr
> slti             0000 001000 ............ ..... .....               @fmt_rr_i12
> 
> 
> and trans_xxx.c.inc
> 
> static bool gen_rrr(DisasContext *ctx, arg_rrr *a, ...) {}
> static bool gen_rr_i12(DisasContext *ctx, arg_rr_i *a, ) {}

gen_rr_i ?

> static bool gen_rrr_sa2p1(DisasContext *ctx, arg_rrr_sa *a, ...) {}

gen_rrr_sa ?

> Richard, is that OK?

Other than those two nits, this looks very clean.  Thanks,


r~


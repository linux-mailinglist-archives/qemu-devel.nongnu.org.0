Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC76819FC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:11:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZYT-00018k-Np; Mon, 30 Jan 2023 14:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZYR-000185-Jr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:10:59 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZYQ-0003Zj-54
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:10:59 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 36so8352318pgp.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfHhhU3bFDCetWKtYvyRha2axzIIOzKm5h+ejV8e/SA=;
 b=lQ46ZiBmgH1cOvm7meD8SxY0ojfRrfN0XBslN4Jv9Rd88vSBqD/2AQQRPsUiOoxIBU
 8zrEG1IBFdjlPjgClm5RgDMaFmeng7c1i1dK7DAxS5/ItST5WJpZQGzcxBMC2W1rTl4V
 w5gNETLFXYdZGhuzWlWo5weOlGMHka+OZrs91woA+Ky/92d5753QMpCxyrR7M+xzrEmg
 M8kPr2WmgAyX34OLNRah1l8BSrAl0IddTxPuAsgE2vZf/J0m1aSbVflES1bNVls6ZBl0
 pTSgY/7yvJ6XvNeFQdgIEOWo5v312nPLIAim8BWAQSKiEZAgRdIrZ50C8vSXp4ZEax/+
 rF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfHhhU3bFDCetWKtYvyRha2axzIIOzKm5h+ejV8e/SA=;
 b=RuWUceiTIsVHGuNv0Jr0DYtZ+z46bDM7u0palOijpbXfWZ08MbLUjIqc3IiRgAx/xl
 jYnqalJWkxC22dMcV86TUUX/0HNMvTnGVENwdKmYxEAodvZyHOKugzoOQzGBmv6FGb04
 NG/RH3711OfsBWhWBI/VsZL5SRlqKqbsmgTTT4Q+AknrmZc0S8dT870y0xAzRFjmYw4h
 PHJhxEgjCpC9Z3EGFMy0eqM0R97spJaZllt/5SPWTDmaWyVqHutg8bWGy7KD6vCKfFZ5
 1tDWgH+ztF00KAL4LF/+7S0hkoRtc56hwwOFKLPav329DABQjrFQ/w1MZJv5v2wT0hNm
 bCtg==
X-Gm-Message-State: AO0yUKWBtjljNlrMFUGTWZh6J3we9ZFXaCHiznuI0lTyOVoVyKRpxrpN
 3DdmDmzwuQWjDY1aRtBpKstZKZFs93KgCc5b
X-Google-Smtp-Source: AK7set9StGeCUtzUW+NpMV7IQ/xLQUzO1DjErClR9wqToaF+L6j6HibHZaW4WmAsOIxs99H6BKJdXw==
X-Received: by 2002:a62:174d:0:b0:590:5d87:e947 with SMTP id
 74-20020a62174d000000b005905d87e947mr9232365pfx.23.1675105856602; 
 Mon, 30 Jan 2023 11:10:56 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y5-20020aa79e05000000b00593b72f6680sm2885314pfq.86.2023.01.30.11.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:10:56 -0800 (PST)
Message-ID: <22ab5f33-5ab7-7260-391f-375cd98a68ae@linaro.org>
Date: Mon, 30 Jan 2023 09:10:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
References: <20230130100757.721372-1-geomatsi@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230130100757.721372-1-geomatsi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 00:07, Sergey Matyukevich wrote:
> From: Sergey Matyukevich<sergey.matyukevich@syntacore.com>
> 
> According to priviledged spec, if [sm]tval is written with a nonzero
> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
> 
> Signed-off-by: Sergey Matyukevich<sergey.matyukevich@syntacore.com>
> ---
>   target/riscv/cpu_helper.c | 3 +++
>   target/riscv/debug.c      | 1 +
>   2 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


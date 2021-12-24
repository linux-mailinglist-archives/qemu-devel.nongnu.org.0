Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8B47F154
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 23:33:00 +0100 (CET)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0t7T-0006cm-Bw
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 17:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t5Z-0005kQ-Oa
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:31:03 -0500
Received: from [2607:f8b0:4864:20::52d] (port=42790
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t5Y-0001SX-Cq
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:31:01 -0500
Received: by mail-pg1-x52d.google.com with SMTP id g2so8506650pgo.9
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 14:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=moWdjVgGY3vzSeh/TLJKxkMOZ1Fs3a0/yzv+tBQApts=;
 b=ysAIgYmhq1NUWXNYHNYan1K6Jxi5btSaqWhvlB1JuFoMZLpbnL1pdrbJVW5GA+7b/l
 8VwwTcJR9D9e8DyFfyW8icjiH7Z4dokkQLmv/hDiz3H3UkLZR33MhQZI8y8nRwwrnRSM
 8yE4gk2hosz6tfYFty3T4B2uhlxBmB1O+OmdOOPHziqYWNGtzsSJYUEsafWaksgdIHbj
 6WImsW1zlZFhs/DmlOzr4PLLVMeDZhNvFLrMM+yu25Di1zFSW/ABzhJWRmnDloSdZn97
 mzh9GTTZhTpIsl66wBB9L0ZIF0hGSvJk5SAA4if6zuMtMajaQr2Pqo2uYBkgM4P8Wgj2
 d9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=moWdjVgGY3vzSeh/TLJKxkMOZ1Fs3a0/yzv+tBQApts=;
 b=ARnHnPOD5KgGKpcBhvMQNFVwBf8ZCLJgSp83nQ5Ppd82NXZnC0iaBthX5Rpa0jrd7j
 OIMFIHTbMGmtWZBjkLHtu1AiGll5nRZVc0yETB5J9k55efxZIPSsvw+eDM+uiNzX5lZJ
 jG0rJfk5ccDBTMtC5maUBIBcRLRNDfwV8VH9Lw+DHphc5dfgqUPJdyoyvBFTGmHF4Md/
 ADWg7anxsi3FRs43NNMUiZfvuqCWNC2NWI9FXVL9Ow7W2PHxwoe/KeTy/ijL3q6zrGry
 MHNHYcV97ggZe7FeHH7Bh3y93BP1fWMT43UGjW489rQQw/BGHdUxax4pUh42X2laYmz8
 CeDw==
X-Gm-Message-State: AOAM533WYk4nfRSv/Io8CrxThA5qM91iXzoEsU8bs63gkPebVSS1tOou
 qnGVbEu6spD78/TfVJRoRvvvXA==
X-Google-Smtp-Source: ABdhPJyBXOP68BE5K2aQrbsgPsrJVWuf9hqji4ratH1mzZRUTYY7P+p/1GDTOBMALbEbbuoNSyflRg==
X-Received: by 2002:a63:af1c:: with SMTP id w28mr2741249pge.372.1640385059277; 
 Fri, 24 Dec 2021 14:30:59 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id e20sm10147148pfv.219.2021.12.24.14.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 14:30:58 -0800 (PST)
Subject: Re: [PATCH 4/6] target/riscv: add support for zdinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39665e5f-f672-45d6-d3f1-39136a5c1c08@linaro.org>
Date: Fri, 24 Dec 2021 14:30:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 7:49 PM, liweiwei wrote:
>   static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
>   {
> +    REQUIRE_FPU;
> +    REQUIRE_ZDINX_OR_D(ctx);
> +
> +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
> +    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
> +    TCGv_i64 src2 = get_fpr_d(ctx, a->rs2);
> +
>       if (a->rs1 == a->rs2) { /* FMOV */

Applies to the F version as well, but we should not assemble src2 when we don't need it.

> -        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
> +        tcg_gen_mov_i64(dest, src1);


I think this can just be dest = get_fpr_d(ctx, a->src1), leaving the final "move" to 
gen_set_fpr_d.


r~


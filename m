Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B367A435
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:46:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQ9m-0002MM-Ap; Tue, 24 Jan 2023 15:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQ9k-0002M7-S9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:44:36 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQ9j-0001Iq-BG
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:44:36 -0500
Received: by mail-pf1-x430.google.com with SMTP id i1so12078308pfk.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VAYOki1uaj12loXH/2FrXicsk+HnZHDlpAPzgpMrWrM=;
 b=w0bId2wLOtNmMeKygTO4/L0x1W3b3PgpOIYNNwF6PJpqWGH0L5uC6898HeBHZME43z
 RO6PNDOduquES7+4Z6haNIoG2JfxlPq1MOyY6utlgKBFe+JJCQhaSkX7MC+zLtgz1FSP
 PNrRJMd54eeEj43g1xzzFJ4I1rVXcixQRMLIwVVNcpjy2u+Oby1eixFbvXPrT0Vm5Jji
 UT/gqqkBw8dRvMZxkoe1qgu0BPzLJumWn57foy204UK9UEg4dfu8P6GUFM6+SI/xItfz
 SN5Cdjxplg2GYxxPlPnzZiwkh1IqQpx7TX+BUuRKd8kgK3OrOGcW111SZ4SNBEkDnNmj
 moOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VAYOki1uaj12loXH/2FrXicsk+HnZHDlpAPzgpMrWrM=;
 b=VsRaq2UhIeVOdiQXoZcRzEKOqpC9xbuJP8Y4UxeHG0tfqnETnnrN91Q0ywS48HvItO
 6W5py/bahxAm1iiyrGmQ0jPQ2PBdMR9FRJ0BnX13JQKfJ/gPjTJnOfh3VXbxEXsL3KHt
 6bG+WS2agQXcWe6VUQ2Zh/sJuYJav52cSDKrssGDx/GMWhObdx3Ewb6LIvl/zRIIfuWJ
 xPGSp+RmI8fLlSjOkm3KhQPNgYkLg3FVxOmoJDNSH+AD2tAs6TYstXJA1JicEL2iqj+b
 J2JVS+JfFH8edSzR9t2aBfZDgkhz3bKt2UfB7KMJJD26lXu0C9C3nv39uwPhSjMQA5lt
 0Cqw==
X-Gm-Message-State: AFqh2kqScgD53AHdMAYN0xC5Nmm5nRvfzlZPa5HyHWWaiZAr9CofA6Qi
 tLD3rUlOK7a4NB7LThpHZoRkRQ==
X-Google-Smtp-Source: AMrXdXt4vqxiR3B+SvvxxUX6kwjPlCvUIvIJsTSBFB7uBYHdUg2CMJWtYZ4W8xEGtki74qnoH95eFQ==
X-Received: by 2002:a05:6a00:1887:b0:58c:b0a:e504 with SMTP id
 x7-20020a056a00188700b0058c0b0ae504mr39647679pfh.18.1674593073494; 
 Tue, 24 Jan 2023 12:44:33 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q9-20020aa79609000000b005882b189a44sm2027619pfg.104.2023.01.24.12.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 12:44:32 -0800 (PST)
Message-ID: <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
Date: Tue, 24 Jan 2023 10:44:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124195945.181842-9-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/24/23 09:59, Christoph Muellner wrote:
> +static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
> +                            int shamt)
> +{
> +    TCGv rd1 = dest_gpr(ctx, a->rd1);
> +    TCGv rd2 = dest_gpr(ctx, a->rd2);
> +    TCGv addr1 = tcg_temp_new();
> +    TCGv addr2 = tcg_temp_new();
> +
> +    addr1 = get_address(ctx, a->rs, a->sh2 << shamt);
> +    if ((memop & MO_SIZE) == MO_64) {
> +        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> +    } else {
> +        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> +    }
> +
> +    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
> +    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
> +    gen_set_gpr(ctx, a->rd1, rd1);
> +    gen_set_gpr(ctx, a->rd2, rd2);

Since dest_gpr may return cpu_gpr[n], this may update the rd1 before recognizing the 
exception that the second load may generate.  Is that correct?

The manual says that rd1, rd2, and rs1 must not be the same, but you do not check this.


r~


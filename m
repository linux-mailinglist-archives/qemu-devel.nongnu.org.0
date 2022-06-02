Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8453BB65
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:10:09 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmSe-0003uo-OL
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmQB-00026x-0V
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:07:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmQ8-00008k-Os
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:07:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5080537pjq.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AD/rV5KAqeNSG0PM7axYrvg1GrRQCVEPdnq7DcTsxMo=;
 b=KsQ3lWqMy7CZqxJcF+s6qGuuehpBb9rBeaDAzzz4EKm5xrA4InOPXnC3NysI5/pKru
 Wqr3YPryLhbCx4qEGfFXayj7G6sd3Y5M3zYF0xJf0OcqL4bplIGL8pxhHIqIm/nyekwL
 6lARjoFuaSdW1gQGXlt2yfX0W7O5586sK34k5GKhi1FrKUPlDTPlizAHYxv/UDIXzBad
 XtoYbuyvLrDCBnTtZHzrVEtH2JO2IdudkJ2J3tYGQNggJ53AdDYd7Wdjtj5ELHRcDFsK
 yuolDYp/YWL+AqV3UEsvoupkB2oniAogkS8QG5tCtrV2mqP8BzM3nEQiywEPUDH8FO00
 P/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AD/rV5KAqeNSG0PM7axYrvg1GrRQCVEPdnq7DcTsxMo=;
 b=HfxTh7saanAmBsyNJqAkxEJYYVhO191vWH6Ve8EbeWE41kRvxFl4Icc5prpzRiWZnl
 NnScy56ZQMHK+2APYfPAFfj/QO+X1+lH1AF43+WvxgVevdsUUlNHujqZr/W8DnXQP2bj
 3m1fXfsRm1FiplGRrBl/tDPCvBID6xo60LvQfgVYEMVQk6P7vGGHYVljH0JLUFByj3lh
 g8ID3cx8szy25tL8YurmhhWuQiEONojQkO4PIxHvYlf+74pt+6H+Os+4Y2qRi9PlTlRm
 2JzUrDG9ItfrLcbT0ugYHQyvSuulIgXNtkaQ1GLTgNTnOAocJM/PrAju4bKIoTfpNCWX
 ZqXA==
X-Gm-Message-State: AOAM531EWisnp8AE7D0qqzJg7SYIl+Pk4UNNfl1tSpmKevtv1Dpht4qg
 R+tQHu5iDzlUajucRRqJFKHtTQ==
X-Google-Smtp-Source: ABdhPJxzjDr1YmEfsKWs/fLGhZrbw3CcuMPe8KztQFxbL1YE252Mq1HCSkyt3rsRO999y056byDf6A==
X-Received: by 2002:a17:902:a502:b0:15e:c251:b769 with SMTP id
 s2-20020a170902a50200b0015ec251b769mr5205138plq.115.1654182450389; 
 Thu, 02 Jun 2022 08:07:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a1709029f9800b0015e8d4eb242sm3653593plq.140.2022.06.02.08.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:07:29 -0700 (PDT)
Message-ID: <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
Date: Thu, 2 Jun 2022 08:07:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
Content-Language: en-US
To: Christoph Muellner <cmuellner@gcc.gnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/22 06:40, Christoph Muellner wrote:
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..38b71d0085
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc

Typo in the filename -- s/rvz/rz/.

> +#define REQUIRE_ZAWRS(ctx) do {         \
> +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> +        return false;                   \
> +    }                                   \
> +} while (0)
> +
> +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> +{
> +    REQUIRE_ZAWRS(ctx);

No point in the macro for what will only ever be a single user.

Otherwise, the implementation looks correct.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


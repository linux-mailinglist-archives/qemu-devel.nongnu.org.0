Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B585FA124
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:31:08 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohukF-0005oa-Am
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuZK-0007gc-5J
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:19:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuZI-00055J-2r
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:19:49 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fw14so10092238pjb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oE8lQoLgZANJtmSgd8Re7nf2K3qQjTvbOlEvVyqW944=;
 b=oBPOcfL7KkQllnSu8Wuc3wpuNLL6ZuccGEzJeuJCNbMTshpZexUiVuodla0qaNsaDO
 qH7Fjf1UpFfHlwv7fgV/VDNGlZVg25bDnCnkGcanrLt/OKr04LW2V4TgAEIxkOMlJgP6
 TrPVELoI8EvutZq6v5svzSkDd9/K+iDR2xbz/yMwoQu5b6TloKvfiHiIwNLcdO4JSOj6
 SD7ABRl7N9f4t2BD7I2fCOuIpNAj3yrlwE/Q6jQbaupuwRRXHs+RzpJzCgEJkjEDw/pI
 XSeTbjWYlQD0zlNY3IT8hsrrmBkyeKszPuewrvPmLd+SDXgKh/4BX/cUNNV1qoskgvSb
 GtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oE8lQoLgZANJtmSgd8Re7nf2K3qQjTvbOlEvVyqW944=;
 b=wiByGgzft2bK+SyvAGC9+cZvabiMADV15bh+4h8AufmrV+nkBCrGQkSt1VJIfPLWYC
 QMBzKEoFayNMn1gD00T5gLqQX7Y06svoFCjS8JNjdEqSANsedfQH8/35K8SoJS7wzt0Z
 Lo/lQJhsvUpCyV7bRZtJo/AluiFtL6t8g2BHONNTvaQwI5wBdYUkB3LHd12GnxaM59oa
 FdrNZYnpWzSJxFbvWJQ0mS3QKwEOZX+zjKZYXCL6NQMiRvNdTvquUbMkgpaCGz8gdztN
 wt5GPO53kvyQnjp1ZqrC19nk7TzdtNpbVWis46KYUTPPkxKOcb4Bm6hf0IcS4Vb078WA
 2W5g==
X-Gm-Message-State: ACrzQf2novd5zr3pio2u4s9Xki+S0znR5dySZjGPfnjYSqfg70svQE0Q
 c1hJ9e701MwaTCkS7jAjlL+1sQ==
X-Google-Smtp-Source: AMsMyM5aOX4/dwYlJPQTLeWumgrAvA5Y564pUSFaL4veQ3UAQOJv4+GBY5zTYnW534AzZSXGR5304Q==
X-Received: by 2002:a17:90b:1808:b0:20d:4e7f:5f53 with SMTP id
 lw8-20020a17090b180800b0020d4e7f5f53mr3735430pjb.170.1665415185384; 
 Mon, 10 Oct 2022 08:19:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902e54e00b001782580ce9csm6792382plf.249.2022.10.10.08.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:19:23 -0700 (PDT)
Message-ID: <91b2f7fc-df8b-bd76-88c0-93094fc6633c@linaro.org>
Date: Mon, 10 Oct 2022 08:19:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RISU PATCH 3/5] loongarch: Implement risugen module
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917074317.1410274-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 00:43, Song Gao wrote:
> +sub write_mov_positive_ri($$)
> +{
> +    # Use lu12i.w and ori instruction
> +    my ($rd, $imm) = @_;
> +    my $high_20 = ($imm >> 12) & 0xfffff;
> +
> +    if ($high_20) {
> +        # lu12i.w rd, si20
> +        insn32(0x14000000 | $high_20 << 5 | $rd);

This isn't necessarily positive -- lu12i.w sign-extends from 32-bits.

> +        # ori rd, rd, ui12
> +        insn32(0x03800000 | ($imm & 0xfff) << 10 | $rd << 5 | $rd);
> +    } else {
> +        # ori rd, 0, ui12
> +        insn32(0x03800000 | ($imm & 0xfff) << 10 | 0 << 5 | $rd);
> +    }
> +}
> +
> +sub write_mov_ri($$)
> +{
> +    my ($rd, $imm) = @_;
> +
> +    if ($imm < 0) {
> +        my $tmp = 0 - $imm ;
> +        write_mov_positive_ri($rd, $tmp);
> +        write_sub_rrr($rd, 0, $rd);
> +    } else {
> +        write_mov_positive_ri($rd, $imm);
> +    }
> +}

OTOH, I'm not sure why you'd need to split out write_mov_positive_ri and negate.  I don't 
*think* we need to handle completely arbitrary constants.  From the aarch64 code we 
certainly don't.

I might write

	if ($imm >= -0x1000 && $imm <= 0xfff) {
             addi.w
         } elsif ($imm >= -0x80000000 && $imm <= 0x7fffffff) {
             lu12i.w
             ori
         } else {
             die "unhandled immediate load";
         }


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


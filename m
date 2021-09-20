Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93059411850
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:33:57 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLIq-00080W-Ld
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKx1-00086E-GB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:11:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKwy-00015N-D5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:11:23 -0400
Received: by mail-pg1-x52b.google.com with SMTP id n18so17638600pgm.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=F8EVm/Azb9JvXfWN366L4nDmJcTgdqtl9wEPcRz6qcM=;
 b=qFtF+sGqIKvl+oChxtU8SUgZVcdSl/wTpUXRVx05ivP2NRLGh95QbCTaYO+ByonZ4b
 HAmqjYn1d+X9dQzKv9MwEaFO8FYDV0PjVxPFHHTqBEXu/ESoIQt9W/XXGwcdIS0sftbp
 o+mr/+cxS/+fFKit9zcUF50r/BAuDjyV1TPk4lHmygJIRpqZcQWEC2U4FoMvu2XoUq1Q
 rjbADtDbsdtjccB/9tBwvIDnqQexoavTTmXJNNKVF1ANd4UlzmBJwWx5C0J6nuI62Fq0
 G6bJ3QDvBV4gnPFgz/GqwveW2XbglkEBuwS78VGizF3Qifqljt3LwAm/wDEkIvOgdExz
 RfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8EVm/Azb9JvXfWN366L4nDmJcTgdqtl9wEPcRz6qcM=;
 b=AEKyPAkLhyNXH7rEI6DkyeAL3v5ELWp3NTYk7uVnheLSFvwLkAj1FPcNuCnbn/dWwP
 gUlnwEN2TIo1226Fl01SkJW6D9CsizPREyAqI5s7N+Wh4r/hKjDRi0Mk4NuKeq4bV1z8
 lbXnGbXxC2kco+kvLbDlq5f0vzopH8afFkifYKqucbgYL31CaavB3r6Xr9oU31whApIZ
 jSTQw66jNPwoPKE6WG59aQwYt4bDOaLj7xeXdkbY3VYKO+2HwRVCTk+vzhRRXruGHrZl
 P+B4jJd1r5CXKb+YM3+VCbbcc7CC7WtmiN39ujZgIK7UcsIluSvOlPHFPdRzjsoVgHWZ
 cOYQ==
X-Gm-Message-State: AOAM533YdLhgWYzHM5VGj+9/LqF60uO/tsRTSAVR1vj4Gs7kHGFbw1DL
 ociEi8lYWRqcyf8FC+ia5DGt8FcLmWFwNQ==
X-Google-Smtp-Source: ABdhPJwteQbAgnpp8KF8C6EJOGN0wAlIqYlbQ3g5sxMyzrBMk6ci4CpExkeHRPBAEYD2N6XXl63DBg==
X-Received: by 2002:a63:f913:: with SMTP id h19mr24105132pgi.351.1632150677286; 
 Mon, 20 Sep 2021 08:11:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g140sm14150449pfb.100.2021.09.20.08.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 08:11:16 -0700 (PDT)
Subject: Re: [PATCH 14/30] tcg/loongarch: Implement bswap32_i32/bswap64_i64
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-15-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e8ae810-fd12-a62e-2039-3b1cc4c824cb@linaro.org>
Date: Mon, 20 Sep 2021 08:11:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-15-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +    case INDEX_op_bswap32_i32:
> +        tcg_out_opc_revb_2h(s, a0, a1);
> +        tcg_out_opc_rotri_w(s, a0, a0, 16);
> +        break;
> +    case INDEX_op_bswap64_i64:
> +        tcg_out_opc_revb_d(s, a0, a1);
> +        break;

You're missing INDEX_op_bswap32_i64, which in addition has a third argument consisting of 
TCG_BSWAP_* bits.

I would have expected revb_2w to be the preferred implementation of bswap32.  I would 
expect something like


     case INDEX_op_bswap32_i32:
         /* All 32-bit values are computed sign-extended in the register. */
         a2 = TCG_BSWAP_OS;
         /* fall through */
     case INDEX_op_bswap32_i64:
         tcg_out_opc_revb_2w(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             tcg_out_ext32s(s, a0, a0);
         } else if (a2 & TCG_BSWAP_OZ) {
             tcg_out_ext32u(s, a0, a0);
         }
         break;


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC0655AF0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p99Ig-0004RD-6i; Sat, 24 Dec 2022 13:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99Ib-0004Qr-TA
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:31:09 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p99IY-0002Cc-Nk
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:31:09 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 19so649423plo.12
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0lhopRTW3yiD35KL0U39O1BUBrJ7aC7rSoXX78wuiyU=;
 b=aEVy/KKbFt6vsBOKXU6CrTxdHKl2QGhnFWluL00EBC+HtBlBX+TrStj3qiNY5ZrrEQ
 eemb9sPGx0b2el8QfCZBJjm4YQXDP/2hZtV5e2xVI5g/JoxHXIHJJYincqOnXrF3LrSi
 TIFjuVh/Mo0jVrPjQqff+60zOQogb7gZcoL7nqICX09XUE+MoQg5WaPq0PZX9PODDzDP
 EYTzctvvS03bmfpErGchqf1G/nanPBlKjZK8rGnV8RaqY4RB90cYlMcOkzRpxqCjh+y1
 VO7gepxmJvdx0wr1xC4b9yfJbgrDU7cYY8VLMOlRDRAv0gObM/GkL2D9feTZrnVzTErg
 +ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0lhopRTW3yiD35KL0U39O1BUBrJ7aC7rSoXX78wuiyU=;
 b=CiJkySjy9keZGM0A3OMBs1Jpt/bTZ3sQo6UdSin4Pcr6XWFRW0u0HFT1UcXKO5ooeI
 JaGgS/Qocbnh9latc42oX7vFw/4xNmUqc0nizuJ6SbN+5JWpTZ17s313EPMw/pADyR5/
 LzA1ZKmNh3GhyuI/cf8MJO1eTl3cwlzaxrTcPbGX36tZe+r63s7kWRXZwBqbTR+UuLyQ
 kmdB8l3+zh5PQMU29xx5JALHSsW9dSpwBLSTdKpzA/DwiDxh1LC69PeujEOrADxT1W2p
 yAvWEr2m1VlYvSpNOkSr4sAEQx6eMDKrb3UNy4faoQYKnjeb8YrcSmpcJLnFLtGtQ+g4
 6iGg==
X-Gm-Message-State: AFqh2ko2AAfWQcDqR/Mtrat6H+9fzKfRQv/ZlAtbNWdjBsE0x0W2GKfr
 szub9ElOyGqi2TIa9qam97pXOA==
X-Google-Smtp-Source: AMrXdXukYC+0DU35v8wKhHflc2Hk6Dr1BamrDTvsougJOQmQP9xsKU8/MJz98CPbgGUyJpIPpzxCmA==
X-Received: by 2002:a17:90a:578b:b0:219:20b4:9a0e with SMTP id
 g11-20020a17090a578b00b0021920b49a0emr30025370pji.24.1671906664687; 
 Sat, 24 Dec 2022 10:31:04 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a2b8300b00219b04cf66asm6345214pjd.36.2022.12.24.10.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:31:04 -0800 (PST)
Message-ID: <c49ab02d-ff0c-c17d-0215-f5e083fe3ce2@linaro.org>
Date: Sat, 24 Dec 2022 10:31:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 21/43] target/loongarch: Implement
 vmskltz/vmskgez/vmsknz
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-22-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-22-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +static void do_vmskltz(vec_t *Vd, vec_t *Vj, int bit, int n)
> +{
> +    switch (bit) {
> +    case 8:
> +        Vd->H[0] |= ((0x80 & Vj->B[n]) == 0) << n;
> +        break;
> +    case 16:
> +        Vd->H[0] |= ((0x8000 & Vj->H[n]) == 0) << n;
> +        break;
> +    case 32:
> +        Vd->H[0] |= ((0x80000000 & Vj->W[n]) == 0) << n;
> +        break;
> +    case 64:
> +        Vd->H[0] |= ((0x8000000000000000 & Vj->D[n]) == 0) << n;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void do_vmskgez(vec_t *Vd, vec_t *Vj, int bit, int n)
> +{
> +    Vd->H[0] |= !((0x80 & Vj->B[n]) == 0) << n;
> +}
> +
> +static void do_vmsknz(vec_t *Vd, vec_t *Vj, int bit, int n)
> +{
> +    Vd->H[0] |=  (Vj->B[n] == 0) << n;
> +}
The bit collection and compaction can be done with a set of integer shifts.
E.g. helper_cmpbe0 in target/alpha/int_helper.c.


r~


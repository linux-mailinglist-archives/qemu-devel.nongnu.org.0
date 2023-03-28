Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE86CCB7A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:29:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFvQ-0006Bn-Ie; Tue, 28 Mar 2023 16:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFvP-0006Be-3A
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:28:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFvN-0005k7-Ed
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:28:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so13899269pjt.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680035288;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GE33piJ1njovmXQCB0ERQm+9cv/n7YO0FcJPpEUCuKI=;
 b=HE0EdQYQxQ6co+Or9YFL6uoKSheDoc/04t0YUWy75+DqW13Xdsc0TLS1yH186r/bec
 W7ofquyuS9AUAB2uPK0M7Mw5lTBRiwiuDmCDm81w+mCicjRPZWOd2r7Rl0VM31W1xwKe
 pXjAu4edKS6bvBOsL/2T7YK+nQTeotTwsMyO+ln+PiIjBNDmMgPSVKwzeyfDWvVUjpXb
 lu8eoJH45Br6s+XzRkZRpzEOGmIwQHPgqW3dfrKLdHw0Oyds0R2WVH633nGfVzGq4/hK
 G4khA4ob2M3DIzn6ILeKfRsEs6CBIYrTdCNO2Tg8m85gd4Qf3I5PX0pGrzoYNo3XPaMp
 Clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680035288;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GE33piJ1njovmXQCB0ERQm+9cv/n7YO0FcJPpEUCuKI=;
 b=ufZZxrlQQv6w9h/5Mo1+YAgtH8OM6efoYrmeaKa0tf5n9/+Lv29eBGjkNaxxJzXZjT
 sxo9Ur3NM1fCEMZUBORVSkNEVDDrNOCAJtzknOWLcCyEuLdnOscd2gjBlD+VpjgvXfyn
 f+XjCjxW/oXMFKwPdB2xerx3NNz+QLnrUNKsMhZ2GkK7mr1JvcfyBrIVdnQoM8rgtZHs
 jQPVIu5a2IXIDSJT1DfzCdqA7gbgkSnUdUcr+vYV45ejzy+jKjhEePI2G+3ayr60phX2
 wFt6s1CyasHA/+OU0qaz3Ir1Ggf+gJLoIpWAFlVV41RKTWsrEGQT84i6IjzGoekFDojj
 9sSg==
X-Gm-Message-State: AAQBX9cUXW6mk4HQQfDEi2JrDyJSf/dYkevPjSm5pA9vpE7lAj2w+U1t
 DkY2Bhv++4uZahTLH9FEeLnGdeLizilHsRPIqmE=
X-Google-Smtp-Source: AKy350aPOMoTm2vTa8bWY1jC8sWlrEMD1W2wPAEgy0o4YGtLADAO9nPr+mNV4ZV8rcPA9N/szWpvHA==
X-Received: by 2002:a17:90b:4b8b:b0:23f:c096:7129 with SMTP id
 lr11-20020a17090b4b8b00b0023fc0967129mr18695356pjb.26.1680035287956; 
 Tue, 28 Mar 2023 13:28:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090a348d00b002311ae14a01sm6565143pjb.11.2023.03.28.13.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:28:07 -0700 (PDT)
Message-ID: <c4912c34-5941-cb51-f021-c0b9dbd4aead@linaro.org>
Date: Tue, 28 Mar 2023 13:28:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 10/44] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-11-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-11-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 20:05, Song Gao wrote:
> +static void gen_vaddwev_w_h(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i32 t1, t2;
> +
> +    t1 = tcg_temp_new_i32();
> +    t2 = tcg_temp_new_i32();
> +    tcg_gen_shli_i32(t1, a, 16);
> +    tcg_gen_sari_i32(t1, t1, 16);
> +    tcg_gen_shli_i32(t2, b, 16);
> +    tcg_gen_sari_i32(t2, t2, 16);
> +    tcg_gen_add_i32(t, t1, t2);
> +}
> +
> +static void gen_vaddwev_d_w(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
> +{
> +    TCGv_i64 t1, t2;
> +
> +    t1 = tcg_temp_new_i64();
> +    t2 = tcg_temp_new_i64();
> +    tcg_gen_shli_i64(t1, a, 32);
> +    tcg_gen_sari_i64(t1, t1, 32);
> +    tcg_gen_shli_i64(t2, b, 32);
> +    tcg_gen_sari_i64(t2, t2, 32);
> +    tcg_gen_add_i64(t, t1, t2);
> +}

For integer code like this, use tcg_gen_ext16s_i32/tcg_gen_ext32s_i64.

> +static void gen_vaddwev_u(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec t1, t2;
> +
> +    int halfbits = 4 << vece;
> +
> +    t1 = tcg_temp_new_vec_matching(a);
> +    t2 = tcg_temp_new_vec_matching(b);
> +
> +    /* Zero-extend the even elements from a */
> +    tcg_gen_shli_vec(vece, t1, a, halfbits);
> +    tcg_gen_shri_vec(vece, t1, t1, halfbits);
> +
> +    /* Zero-extend the even elements from b */
> +    tcg_gen_shli_vec(vece, t2, b, halfbits);
> +    tcg_gen_shri_vec(vece, t2, t2, halfbits);
> +
> +    tcg_gen_add_vec(vece, t, t1, t2);
> +}

uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
tcg_gen_andi_vec(vece, t1, a, mask);

> +static void gen_vaddwev_w_hu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i32 t1, t2;
> +
> +    t1 = tcg_temp_new_i32();
> +    t2 = tcg_temp_new_i32();
> +    tcg_gen_shli_i32(t1, a, 16);
> +    tcg_gen_shri_i32(t1, t1, 16);
> +    tcg_gen_shli_i32(t2, b, 16);
> +    tcg_gen_shri_i32(t2, t2, 16);
> +    tcg_gen_add_i32(t, t1, t2);
> +}

tcg_gen_ext16u_i32.


r~


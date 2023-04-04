Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7086D5626
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:32:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVWk-0005je-F0; Mon, 03 Apr 2023 21:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVWi-0005jJ-MB
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:32:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVWg-0001Ra-KC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:31:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id c18so29832083ple.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680571917;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MB9P0N4tiOjSWNMHH8/1nCjbTDiNrW+e88SJNWXe6uI=;
 b=a/T/mv/6JfbO/mngAfWXXXLpN1bHNqTNqKh0rfrGS6qvezeb5xBEpZplHdw3t1E65V
 fBKYdJ815bd7cmqi4OGjFwiASUDXkz5V2b8zUUsF9+pnVo10U2AGkl7dNWiCBZqTGIWc
 xg+UPV4ZMewyW4dKNDEygKGKGvAyCxCl0y1YS6Zgrkhupn6glLi2mBuu7ot+DZdtl0sw
 oElM6Y0251iIy3NpoGLkj3UiEhZUhF0e6LIrQNzfp4/4T/N5LIpFc8RSlps+SqwOH4J7
 PaMD4Od62ZgagXHRMf9TP60Ywi3+NBcwllEzGM4IwP8I2zvotzMEe/eWZeGMRop1qSNF
 CGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571917;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MB9P0N4tiOjSWNMHH8/1nCjbTDiNrW+e88SJNWXe6uI=;
 b=iEgHdQwVbiF7ThFeu/pRQgQD0l/Y6lGyqtDHx2t/hiT3BIX8VQVyJClQJ660VsVBWV
 0eyJ49IC/HPsu9rrDyw7Z6EQ1zs/UaSAlY6ovzqmJJeB7ZlDgBm5wFTHfDOhZUxSc0G2
 STNq0OSOlhv8BXYbFX6D+fPNXA5P8jaR9VqgdjGx6zCxouS+CNvoZtSjj29+FMgNvDDz
 YdsfHkQRs2s7c+dyrGg1/XccsEHCGy04sRDkGIT9Ab/C8lPVrePSJbCSk+2GHtRk0x+5
 +2gukateNeR9rlU+bp7K2pJ4l6lVV6CJPWvkA2c+2GUvXbuTmhbNSBTYe56fxC7HTAwr
 pv/g==
X-Gm-Message-State: AAQBX9esB2+AfCkldjMTDMmsxq13Fp0SfLgPNZPZ8UXchWrsLUM0kI+x
 yqcVfa1MY0+Qvi0IBNkOlcPqaw==
X-Google-Smtp-Source: AKy350agzZuD4ZQGoRp3iv+3xa3HqcvW408BwFlQ/EpOqJYWwS3NfagY5v9Ernvz9suMoq94bb8iQg==
X-Received: by 2002:a17:90b:4c49:b0:23f:5c60:67b with SMTP id
 np9-20020a17090b4c4900b0023f5c60067bmr1028625pjb.5.1680571916875; 
 Mon, 03 Apr 2023 18:31:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0019e30e3068bsm7318296ple.168.2023.04.03.18.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 18:31:56 -0700 (PDT)
Message-ID: <dc6abc63-1d0e-ba30-bd6f-faefb9a71d3e@linaro.org>
Date: Mon, 3 Apr 2023 18:31:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 41/44] target/loongarch: Implement vilvl vilvh
 vextrins vshuf
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-42-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-42-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 3/27/23 20:06, Song Gao wrote:
> +void HELPER(vshuf_b)(CPULoongArchState *env,
> +                     uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va)
> +{
> +    int i, m, k;
> +    VReg temp;
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    VReg *Vj = &(env->fpr[vj].vreg);
> +    VReg *Vk = &(env->fpr[vk].vreg);
> +    VReg *Va = &(env->fpr[va].vreg);
> +
> +    m = LSX_LEN/8;
> +    for (i = 0; i < m ; i++) {
> +        k = (Va->B(i)& 0x3f) % (2 * m);

Eh?  Double masking?

> +        temp.B(i) = (Va->B(i) & 0xc0) ? 0 : k < m ? Vk->B(k) : Vj->B(k - m);

Triple masking?

I would have expected something like

     k = Va->B(i) % N;
     temp.B(i) = (k < m ? Vj : k < 2 * m ? Vk : 0);

> +#define VSHUF(NAME, BIT, E)                                                  \
> +void HELPER(NAME)(CPULoongArchState *env,                                    \
> +                  uint32_t vd, uint32_t vj, uint32_t vk)                     \
> +{                                                                            \
> +    int i, m, k;                                                             \
> +    VReg temp;                                                               \
> +    VReg *Vd = &(env->fpr[vd].vreg);                                         \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                         \
> +    VReg *Vk = &(env->fpr[vk].vreg);                                         \
> +                                                                             \
> +    m = LSX_LEN/BIT;                                                         \
> +    for (i = 0; i < m; i++) {                                                \
> +        k  = (Vd->E(i) & 0x3f) % (2 * m);                                    \
> +        temp.E(i) = (Vd->E(i) & 0xc0) ? 0 : k < m ? Vk->E(k) : Vj->E(k - m); \
> +    }                                                                        \
> +    Vd->D(0) = temp.D(0);                                                    \
> +    Vd->D(1) = temp.D(1);                                                    \
> +}

Likewise.

> +#define SHF_POS(i, imm) (((i) & 0xfc) + (((imm) >> (2 * ((i) & 0x03))) & 0x03))
> +
> +#define VSHUF4I(NAME, BIT, E)                             \
> +void HELPER(NAME)(CPULoongArchState *env,                 \
> +                  uint32_t vd, uint32_t vj, uint32_t imm) \
> +{                                                         \
> +    int i;                                                \
> +    VReg temp;                                            \
> +    VReg *Vd = &(env->fpr[vd].vreg);                      \
> +    VReg *Vj = &(env->fpr[vj].vreg);                      \
> +                                                          \
> +    for (i = 0; i < LSX_LEN/BIT; i++) {                   \
> +         temp.E(i) = Vj->E(SHF_POS(i, imm));              \
> +    }                                                     \
> +    Vd->D[0] = temp.D[0];                                 \
> +    Vd->D[1] = temp.D[1];                                 \
> +}

Merge SHF_POS unless you expect it to be used again?

> +void HELPER(vshuf4i_d)(CPULoongArchState *env,
> +                       uint32_t vd, uint32_t vj, uint32_t imm)
> +{
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    VReg *Vj = &(env->fpr[vj].vreg);
> +
> +    VReg temp;
> +    temp.D(0) = ((imm & 0x03) == 0x00) ? Vd->D(0):
> +                ((imm & 0x03) == 0x01) ? Vd->D(1):
> +                ((imm & 0x03) == 0x02) ? Vj->D(0): Vj->D(1);
> +
> +    temp.D(1) = ((imm & 0x0c) == 0x00) ? Vd->D(0):
> +                ((imm & 0x0c) == 0x04) ? Vd->D(1):
> +                ((imm & 0x0c) == 0x08) ? Vj->D(0): Vj->D(1);
> +
> +    Vd->D[0] = temp.D[0];
> +    Vd->D[1] = temp.D[1];
> +}

Perhaps

     temp.D(0) = (imm & 2 ? Vj : Vd)->D(imm & 1);
     temp.D(1) = (imm & 8 ? Vj : Vd)->D((imm >> 2) & 1);


r~


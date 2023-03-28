Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4136CCBA4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:51:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGH6-0005Md-4w; Tue, 28 Mar 2023 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGH3-0005MT-9a
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:50:33 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGH0-000193-7B
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:50:32 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso13945019pjb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680036628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYNezUWbt2EHxAR3dIKm61haZVC89pUjkUhnmZBrcJw=;
 b=NIspezkrsvcKwLNo70huvi8vI0Bf96BUHyf2Z4y5YtSlhjiOQROuosbxO5hwv799/J
 KjpjpLJ0WjkZlm3zQG8tuWpE0Ha1cI4BOcMb91pcaJhg7CF5wVin0B778h6i03YzhYJJ
 MghGiGtqZ4+nzmu4ENYWfQK0s9SEnASn78GuZRf95WBk9ixBr02ddIIphanXOvyuBvjB
 NRuaRfMWIaWr/U5tBqFteYsgfquj5oZfTnopx7/XZBI1nWc/Pq8qMD3isHa9mm4AHP4N
 u2qkKUT4M/Y1NVHZXwTtEjGdI79XgZolNF7AR8kcn2Io+w/IyVaYJGPBmTJGDm6krSOl
 MyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680036628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYNezUWbt2EHxAR3dIKm61haZVC89pUjkUhnmZBrcJw=;
 b=48hRwp6jZ2vxxIbt06x+Ge5Rj2R7XTwlf52zdlmrQ5P5FjPOdCS1c0xdX8AI5Gqqyh
 7BpRB8G6XWWOxOTmJqLe8uYafpW7QQ0cPR68VM5l5qLHlazBMakGx/vajChHEUcQH+1N
 vS1sS13NwTBuZoZkF6Lp58HYFROCRzGzWgo8OpmsgURjQ5HwcQ3qfz3rjf/leI/9u+Cq
 fYxTZdURJutdTU3ADb53gOA45UBa+GKHb8ybeMaGHCyLxlLaA2oSs0yywOuoeYk/dhck
 Yd7o1bNkLm4BVwm01JmwjWMDbB46Zeg9PYpcAa9h+BFW+Lwmtjose798pkWlMIdK4mCr
 s4vg==
X-Gm-Message-State: AAQBX9eGh7u9HU6qZsWU/7Dt5rCmZZYx0gbF7lCN+5HpnZ1ByfJ3tx7w
 AeLlcjHi1mE8DA3tWm9xfcuABQ==
X-Google-Smtp-Source: AKy350aBRuJRQ3oZYHFw5AI5LSHySWeFcsrBuBbBB7TVB8iNkC0/zEj38ODs+iM3rXL8iYqbZFFGDw==
X-Received: by 2002:a05:6a20:a89a:b0:d5:58df:fb7a with SMTP id
 ca26-20020a056a20a89a00b000d558dffb7amr22838pzb.3.1680036628158; 
 Tue, 28 Mar 2023 13:50:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b00571cdbd0771sm21437961pfo.102.2023.03.28.13.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:50:27 -0700 (PDT)
Message-ID: <ced40fed-c3cd-e7d2-caa9-3b1bfdb60ae3@linaro.org>
Date: Tue, 28 Mar 2023 13:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 16/44] target/loongarch: Implement
 vmadd/vmsub/vmaddw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-17-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-17-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> +static void gen_vmadd(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec t1;
> +
> +    t1 = tcg_temp_new_vec_matching(t);
> +    tcg_gen_mul_vec(vece, t1, a, b);
> +    tcg_gen_add_vec(vece, t, t, t1);
> +}
> +
> +static void do_vmadd(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                     uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_mul_vec, INDEX_op_add_vec, 0
> +        };
> +    static const GVecGen3 op[4] = {
> +        {
> +            .fniv = gen_vmadd,
> +            .fno = gen_helper_vmadd_b,
> +            .load_dest = true,
> +            .opt_opc = vecop_list,
> +            .vece = MO_8
> +        },
> +        {
> +            .fniv = gen_vmadd,
> +            .fno = gen_helper_vmadd_h,
> +            .load_dest = true,
> +            .opt_opc = vecop_list,
> +            .vece = MO_16
> +        },
> +        {
> +            .fniv = gen_vmadd,
> +            .fno = gen_helper_vmadd_w,
> +            .load_dest = true,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },
> +        {
> +            .fniv = gen_vmadd,
> +            .fno = gen_helper_vmadd_d,
> +            .load_dest = true,
> +            .opt_opc = vecop_list,
> +            .vece = MO_64
> +        },
> +    };
> +
> +    tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
> +}

Integer expansion?  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


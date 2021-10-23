Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FD84381A3
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:09:24 +0200 (CEST)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me8LR-0000Gv-Ot
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8JX-0006lc-Rq
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:07:23 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8JW-0006Fb-0V
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:07:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id r28so783520pga.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KEiqoNyBVcv6rXZAHn2MRsPyoaumqrQEAZ91TwmZuyU=;
 b=mAcv0C3OLQ3UrEHqbM0t8mf2qWmqhFCNPhXWxvqaStWhkHlGqmevjtlMZD2RBuFVzr
 4/lq5jMUvriiAJxCBSVAaI+uTXwytQuwBZ38hiiJP1SSMKWA7St3HwaoWt8wj8i4YKMZ
 fvLcQ9ocVvl4FPvoQj6jxw89bYnesfMsBg8YpNRvyvAZraIOiydTONhto9lk22ebmnXK
 UwaK0aMBF69tsRkJI9Xe1wJJ+ppaVv/zo6C2W+tx7YmdAlvfbA/29hK3B0fVUZ0hQItl
 469TraNfrth+Pk66NuiyFxW8hhx7gQWAq3HZ5iRBMJhWpJlykZwTyI8CEbbKIp7DQ+47
 9o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KEiqoNyBVcv6rXZAHn2MRsPyoaumqrQEAZ91TwmZuyU=;
 b=yvSgjqflhOHu3oLbEgA7DMoOH5+fNIaB9nfSrebvewi8UqOf3FusP0DuODiGU8a/12
 LE2XjqsAI4ha4DJeh7coHHVLRZSgGq3LMzdtw40mBY3U11z5TkZ7GI8St+Cvd7wdaku1
 IEbvhVWNN9ddgoe7ka3CJ/YRBf7WIhSeDLoiSJ5lMpsEkAl/M/K89rRA+zxvxo6UGnvZ
 21DRApRm+sLc/wELRipAyAwEfQ9W0QHO0URBVo5S/31AisSsPMSThNqg/f+Ojybfdsnh
 4moWMd2QnsZgrNrzANe82F+pBQcrZcmHUho7kyUC5Ten7RAgiVvKFHxvC2uzP/qf2ynm
 wxVg==
X-Gm-Message-State: AOAM531juv1++9QlAOyj2QnGcOsc11qRBSrqT+RwsZijC2VhgA4HVZfd
 wFqfVIqJRSicpYdVo/XuicAVA73OJ16pLg==
X-Google-Smtp-Source: ABdhPJwSAAfhBcpFFMnpEfakgLFJg9eXa/EDsn52Svpfpadb5hgEfswJ3cz5FrmwxaQ9YL4pOmH39A==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr2909683pgl.376.1634962040024; 
 Fri, 22 Oct 2021 21:07:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d138sm11173667pfd.74.2021.10.22.21.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:07:19 -0700 (PDT)
Subject: Re: [PATCH 14/33] target/ppc: Implement vsldbi/vsrdbi instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-15-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c6bc968-414f-a75c-0d9e-3135344e73a8@linaro.org>
Date: Fri, 22 Oct 2021 21:07:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-15-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +    if (a->sh != 0) {
> +        t2 = tcg_temp_new_i64();
> +
> +        /* vrt.l = (vrb.l >> sh) | (vrb.h << (64 - sh)) */
> +        tcg_gen_shri_i64(t0, t0, a->sh);
> +        tcg_gen_shli_i64(t2, t1, 64 - a->sh);
> +        tcg_gen_or_i64(t0, t0, t2);

tcg_gen_extract2_i64(t0, t1, t0, 64 - a->sh);

> +
> +        /* vrt.h = (vrb.h >> sh) | (vra.l << (64 - sh)) */
> +        get_avr64(t2, a->vra, false);
> +        tcg_gen_shri_i64(t1, t1, a->sh);
> +        tcg_gen_shli_i64(t2, t2, 64 - a->sh);
> +        tcg_gen_or_i64(t1, t1, t2);

Similarly.


r~


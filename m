Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72D411AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:49:45 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMUC-0004Yc-DL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMCM-0003W4-B3
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:31:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMCK-0002CR-Cw
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:31:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id h3so17913201pgb.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9oe2sEQBe3O9oQsGpihHqJ937/9hJtVwLWq8R2fMMi8=;
 b=p25Uas5CFh/Ls/chz61ba2y3S8prLIuPJqkeRt7JDJRIOQiOIkuy1hTfJjTUuX0OUJ
 B8LOXVYXpuhrhM1Jf6DvobS+VK2rXORjtRAXV0E7d5xR5/Nt2Vn26jM71i+9VlOyOQI2
 husfP68jx32I3k8RJ3fejzjr4wvx8OP1+fhrTsfEeqZeR1RdZSUWesUBT8o/99DehyjE
 WjlAMDc7L4++8M5Pkb9golaBNYfm1dx+A5aXRafB9R0Zt8KYgISJWEgn4ZseAuhVinZy
 ss6y9O6xiVItPo0rkf5szjp8CffcskT/kq7QURqj2BW5dHIUIg+a2J+TkgHYQdEgP/q5
 GSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9oe2sEQBe3O9oQsGpihHqJ937/9hJtVwLWq8R2fMMi8=;
 b=6NRQ6sjs6Qy8W4i2deR4KCum/DO7haUuzyi/+pfzHfO7WuZ78afNDmxLqbqKYoQOA8
 K0//wFpuC0zZalI4eviCNxT1hqyz1QHZikstudA6L5b/DyzPilOPQymPxgJYHJL/Z806
 uW3F5VNcZem9K7mesF+hRFml8+EV1JTqOFFfKlljpcjBHAD48rvFuwijfFXLsuTmiRhk
 nFsDTvefhkmVMp/YmqFezCxynzpP4eHM+5ypNqSsu7wt1GlH80rC3q3wkzFzg8v7D7iD
 0C4JEnzjpxTmyb8TOvSw+xLQhltWNqx8mkl4PUR7MMsmmPZUrjO7bUO+PBoTKgDQj7p6
 tZ0A==
X-Gm-Message-State: AOAM530h95UU2oSShY4hX4REoRG3+FqPslogg0rmQlmjdvvVg249VT72
 8HAWUA1A9OCHEewbVj9PFwk9GYkL5sUKYQ==
X-Google-Smtp-Source: ABdhPJxnZf1uJVlQZA+oFGZ94NY9Rwkx1kiKcJMx7mABJr0Gpq4mxaFfhklOrKFQbBnPpOON1D5/Hg==
X-Received: by 2002:a05:6a00:bdf:b0:444:94ef:5aac with SMTP id
 x31-20020a056a000bdf00b0044494ef5aacmr19361524pfu.24.1632155474411; 
 Mon, 20 Sep 2021 09:31:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e13sm14238988pfc.137.2021.09.20.09.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:31:14 -0700 (PDT)
Subject: Re: [PATCH 21/30] tcg/loongarch: Implement tcg_out_call
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-22-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0176e1cb-faaf-ca08-a35d-879811c18670@linaro.org>
Date: Mon, 20 Sep 2021 09:31:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-22-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
> +    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
> +        /* long jump: +/- 2GiB */
> +        tcg_out_opc_pcaddu12i(s, TCG_REG_TMP0, 0);
> +        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, 0);
> +        ret = reloc_call(s->code_ptr - 2, arg);
> +        tcg_debug_assert(ret == true);

Just inline reloc_call here, so that you can provide the correct offsets to the pcadd and 
jirl instructions directly.  The assert will vanish, because you've already done the range 
check with "offset == (int32_t)offset".


r~


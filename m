Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C6438BFB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:02:43 +0200 (CEST)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekde-00024Z-1c
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekcL-0001Id-OZ
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:01:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekcJ-0005Hn-MM
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:01:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso3340496pjc.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NEr3igYh1t0ymQd6Euikwr8tKT5VISXft8ORAokFe0s=;
 b=u56nIcX5wiS7QpCY/XFIslQ8VcYTqppyk1P3g/zeHboidMXzuOMOYuAyUH/7lmbnz+
 dvlnEnJ0oSIxDFkMbgMHhgT16bHUS9ONpjUBxXpZxzSVxQxcGcYoBxlcRdoQn298rFoz
 085dqudmXP0R/s0j2j8/+ad3WV7IZDnme0h7q8/5qTZbE6cj8sAFGFapl+fCczwbP5pN
 OwwFir/EeXYRrvKZlaUFhzt/5TfpD37vSCANQOCx/g4fwEDo25MvHOeqIOcQ5o9CPxDA
 bkJRMkjG+8U3fy167NCJH8787KUL8hnw0KT3N+w4zsdI4XwTV2OBKgqnJQEMGnNizb98
 HOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEr3igYh1t0ymQd6Euikwr8tKT5VISXft8ORAokFe0s=;
 b=DcoQH0oKVegIAM58iCJsquVbpLIhve8yuimQLum6IpdB6WWifawS+5J7oNWsEtctbr
 CRhPuHDqFUhd14dpUEptOuvtmqnYp7sM+IMMO/Kj7QEmLu/grWWiwsqwQYHoe6IUH396
 mB/etC85hvVX0FVblSFKXriaeipemLqm7nqdIl82edQw5cjQxQCjuLTV+hAKNl5DatfS
 b1A0hcDJz1mLJwR6mwHFVUNYatdqxgc0277h/tOZagNn6FRU1wy6ZlQluHfHG5FcVL+E
 EpltX18qdeVmgf5tBt97KpjKD+yfwSrEND/doiLFXCS/9CXWezCUrKUBXb7tFqN8M4fa
 eiNA==
X-Gm-Message-State: AOAM531qSGX/NE2vSY65udPs+vdykAlpVrour5O4fExIaMLAlUmDNYVd
 Q9rRyoq2f9heFlzjemEk3HSLwg==
X-Google-Smtp-Source: ABdhPJzm//NLCsIo1IxBW7Zy3XAS/GRVUauUz98wmD26EE/Rg19/8I1EQQM5tGJ5K5om8FQeGOMpvQ==
X-Received: by 2002:a17:903:244d:b0:140:4b4d:bf80 with SMTP id
 l13-20020a170903244d00b001404b4dbf80mr3975901pls.85.1635109278184; 
 Sun, 24 Oct 2021 14:01:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k20sm1466223pfc.83.2021.10.24.14.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:01:17 -0700 (PDT)
Subject: Re: [PATCH 27/33] target/mips: Convert MSA COPY_U opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-28-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f4b1c6d-1ca4-d337-a907-41414569ca71@linaro.org>
Date: Sun, 24 Oct 2021 14:01:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-28-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +#define TRANS_DF_W64(NAME, trans_func, gen_func) \
> +        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
> +                    DF_HALF, DF_WORD, \
> +                    gen_func##_b, gen_func##_h, gen_func##_w, NULL)

Again with the table.

> +static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm *a,
> +                              enum CPUMIPSMSADataFormat df_max32,
> +                              enum CPUMIPSMSADataFormat df_max64,

I think you should just arrange for the entries in the table to be null when the element 
variant is not defined.

> +    twd = tcg_const_i32(a->wd);
> +    tws = tcg_const_i32(a->ws);

tcg_constant_i32.


r~


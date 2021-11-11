Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14EA44D53B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:44:59 +0100 (CET)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7Zi-0001qY-St
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7Yb-0000Jt-NU
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:43:49 -0500
Received: from [2a00:1450:4864:20::435] (port=38450
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7Ya-0006er-0d
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:43:49 -0500
Received: by mail-wr1-x435.google.com with SMTP id u18so9033506wrg.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xSP5Clxei3EP6615FPW+Br9pOH/QPmlz1n0e0Smw+ko=;
 b=Z778VlDcBdzm5dQjU81GkH2+1rpvobXgOlc0XbQpZ4YhFn76g0bQ10uWwgvrOPQ+Sp
 iCrHVaesIDjWMMEDHox2k1080sXtSKLqj2lZTQz62HBbhUJv88eZbLkd/1i5lz4+1gai
 LlxVN4+aw4W4tZhiXKaIuWI7NscURLBY+feLRNbKhcQbhuG2hVg2LRBnh3llX7y+jvdI
 NgVRtnAweJtz11XrjGuc+aH16z+/Lb0jHyZ4vHQl5lDpHYn8Mto+5NuucfgYmw1le7B/
 6xyNJvNjhQOaig6Bxp6lO2+7J2GsR6HFIv0nyt+yTVN/gKy0iRAKyn/m+Ag1592NSlxf
 tb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xSP5Clxei3EP6615FPW+Br9pOH/QPmlz1n0e0Smw+ko=;
 b=RSsZzHP1/sjFjM3NyJYo6lNwJh6fhhoj90ZcfO3xm3LnPoYhq5qt2si9bYO3XWC1nl
 0Ko1F61RrieRM6tA8FspLCGFjq2/uKpda9Y1rvk3NWpFzpdDLK+f5tcORC3igUvhjnHg
 WsXur6Mf7hOrd5DosNkRdnU81Ord+xUS73wU9c/NJINyaV8CzQVAWOqHD2WorNAx7Rsb
 UCi2osaQdmNRt2xr4aw84+2LPdbfAVke9STQR6eTJ9We+4/687XzE1zM5D0W8M4HlQIB
 KoXDJXqCjMPg21PF3RmiUoNvx9RafBTAhxCpBioiOZiG9lE3afLov0DLhapcnb6VBZZg
 lD+Q==
X-Gm-Message-State: AOAM531ONaxAqBJ+zp/x2VBcPpVgkkR9ZclcxrrG/AqhJ0kLahT6SJLc
 zxrFrfAY1cO89MDnVH7FJ4vsuQ==
X-Google-Smtp-Source: ABdhPJyF19u6/YWP37nAJxeZIKq02tZAWnsiirJwLdxCEhvnQLq7vI8I5/byaMKGVZ6OxnNKeP9zzg==
X-Received: by 2002:adf:e387:: with SMTP id e7mr7698577wrm.412.1636627424847; 
 Thu, 11 Nov 2021 02:43:44 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id o4sm3147190wry.80.2021.11.11.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 02:43:44 -0800 (PST)
Subject: Re: [PATCH 3/3] target/ppc: Implement Vector Mask Move insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211110185613.550946-1-matheus.ferst@eldorado.org.br>
 <20211110185613.550946-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <534888de-119a-fa38-11aa-db8ff05caa43@linaro.org>
Date: Thu, 11 Nov 2021 11:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110185613.550946-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 7:56 PM, matheus.ferst@eldorado.org.br wrote:
> +static bool do_mtvsrm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
> +{
> +    const uint64_t elem_length = 8 << vece, highest_bit = 15 >> vece;
> +    int i;
> +    TCGv_i64 t0, t1, zero, ones;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    t0 = tcg_const_i64(0);
> +    t1 = tcg_temp_new_i64();
> +    zero = tcg_constant_i64(0);
> +    ones = tcg_constant_i64(MAKE_64BIT_MASK(0, elem_length));
> +
> +    for (i = 1 << highest_bit; i > 1 << (highest_bit / 2); i >>= 1) {
> +        tcg_gen_shli_i64(t0, t0, elem_length);
> +        tcg_gen_ext_tl_i64(t1, cpu_gpr[a->vrb]);
> +        tcg_gen_andi_i64(t1, t1, i);
> +        tcg_gen_movcond_i64(TCG_COND_NE, t1, t1, zero, ones, zero);
> +        tcg_gen_or_i64(t0, t0, t1);
> +    }

We can do better than that.

     tcg_gen_extu_tl_i64(t0, gpr);
     tcg_gen_extract_i64(t1, t0, elem_count_half, elem_count_half);
     tcg_gen_extract_i64(t0, t0, 0, elem_count_half);

     /*
      * Spread the bits into their respective elements.
      * E.g. for bytes:
      * 00000000000000000000000000000000000000000000000000000000abcdefgh
      *   << 32-4
      * 0000000000000000000000000000abcdefgh0000000000000000000000000000
      *   |
      * 0000000000000000000000000000abcdefgh00000000000000000000abcdefgh
      *   << 16-2
      * 00000000000000abcdefgh00000000000000000000abcdefgh00000000000000
      *   |
      * 00000000000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh
      *   << 8-1
      * 0000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh0000000
      *   |
      * 0000000abcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgh
      *   & dup(1)
      * 0000000a0000000b0000000c0000000d0000000e0000000f0000000g0000000h
      *   * 0xff
      * aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffffgggggggghhhhhhhh
      */

     for (i = elem_count_half, j = 32; i > 0; i >>= 1, j >>= 1) {
         tcg_gen_shli_i64(s0, t0, j - i);
         tcg_gen_shli_i64(s1, t1, j - i);
         tcg_gen_or_i64(t0, t0, s0);
         tcg_gen_or_i64(t1, t1, s1);
     }

     c = dup_const(vece, 1);
     tcg_gen_andi_i64(t0, t0, c);
     tcg_gen_andi_i64(t1, t1, c);

     c = MAKE_64BIT_MASK(0, elem_length);
     tcg_gen_muli_i64(t0, t0, c);
     tcg_gen_muli_i64(t1, t1, c);

     set_avr64(a->vrt, t0, false);
     set_avr64(a->vrt, t1, true);



r~


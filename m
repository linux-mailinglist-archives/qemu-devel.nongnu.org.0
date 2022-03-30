Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EF4ECEBD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:26:28 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfpj-0005Ds-0p
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:26:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZfnS-0003Js-4T
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:24:06 -0400
Received: from [2607:f8b0:4864:20::235] (port=36713
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZfnQ-0001CX-NH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:24:05 -0400
Received: by mail-oi1-x235.google.com with SMTP id z8so23389336oix.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GNbzr0vBzLwXh45RjT3WIBDT1T9k18Cm6cSvn0Bscw8=;
 b=f/FE7dAvqdm8GAxs86B4q45vXeId+aTH6OxY5kdXYtx+apIbBi52hfYgzrPyubeoWW
 9K/t/qQ5VdeJp8S4rr3peQG87kroV00MVbVwKjZ3ZCwhRge78n4+Y/Ky3W+nirCCtvpZ
 w5EWDt8hdXtTuL22PV8ouA9jsVdDoI1ntltCXiFyHpvPQx0WM9oWwPvv2mRpYM2qzZz7
 urKWjjZRqhopyKcUVpj2mJQfHWYtLOx2fRWbHkmzdYYieByoGpL1ei62joy0tA+tX8Ui
 p1AZN1wk2IyRz8D3HggyIWoffWPXGi5WOQW/QHDaO31A/XoQ2SAm+RExAla8TS1ZIVrh
 7gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GNbzr0vBzLwXh45RjT3WIBDT1T9k18Cm6cSvn0Bscw8=;
 b=WaSPLPsb4KsY1vGhMgGe4Ay1h+lzWT/jbLpN/6ZmD8XnMyMze+MUVfX4MKbJE238uI
 A1Y2OY51iEEGcRANjDZdyTKpI9bAJKzXM+G0LEqW5A5OLqZMu5YVd33FiDjzoq4Pw7Tw
 1vnuYKIKHWtKrOn9xy2sD3dUAnWt2eSRS78EfFFqVnlH5KZqODAC5HmZKwlumdJI4VNp
 c8IIYgicpoBFXjYOsdFxLbzqLCNZPKA6M/HXnW4qO+0wAr/nuVP0XoXANgR0P4oCaBJC
 DVgT3HJjAMW8GA7wdCI70ju7mnTKAWl45Izael/9k+OMT0XGja2wE1WFMY1sYUSlbXiS
 BaqQ==
X-Gm-Message-State: AOAM533nZGqk+JLpMEE5mCEhsoJnErvjdoxA7Bd3WHv18AGnBYYyuRD6
 +ZU6pZaAs5zf6MCeT8s4IRBnHQ==
X-Google-Smtp-Source: ABdhPJyNwBed/cpugoBaIee5jO8DtWTJiEwGX0WM8rF1/bYqKVzeHLRTufXKXMHhhol1KsBcqKuZHQ==
X-Received: by 2002:a05:6808:23c8:b0:2ec:cf83:612a with SMTP id
 bq8-20020a05680823c800b002eccf83612amr1041342oib.255.1648675443346; 
 Wed, 30 Mar 2022 14:24:03 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 q6-20020a9d6646000000b005cd9d37df92sm11115892otm.5.2022.03.30.14.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:24:02 -0700 (PDT)
Message-ID: <501beed6-a5f4-0873-4820-66748332f2e8@linaro.org>
Date: Wed, 30 Mar 2022 15:24:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/10] target/ppc: Implemented vector divide extended word
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
 <20220330202515.66554-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330202515.66554-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 14:25, Lucas Mateus Castro(alqotel) wrote:
> +static void do_vx_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i64 res, val1, val2;
> +    TCGv_i64 zero = tcg_constant_i64(0);
> +    TCGv_i64 one =  tcg_constant_i64(1);
> +
> +    res = tcg_temp_new_i64();
> +    val1 = tcg_temp_new_i64();
> +    val2 = tcg_temp_new_i64();
> +
> +    tcg_gen_ext_i32_i64(val1, a);
> +    tcg_gen_ext_i32_i64(val2, b);
> +
> +    /* return 0 if b = 0, so make b = 1 so the result doesn't fit in 32 bits*/
> +    tcg_gen_movcond_i64(TCG_COND_EQ, val2, val2, zero, one, val2);

Need int_min / -1 check.

> +    /* (a << 32)/b */
> +    tcg_gen_shli_i64(val1, val1, 32);
> +    tcg_gen_div_i64(res, val1, val2);
> +
> +    tcg_gen_ext32s_i64(val1, res);
> +    /* if result is undefined (quotient doesn't fit in 32 bits) return 0 */
> +    tcg_gen_movcond_i64(TCG_COND_EQ, res, res, val1, res, zero);

Again, I don't see the point in producing 0 for undefined.

> +    tcg_gen_ext_i32_i64(val1, a);
> +    tcg_gen_extu_i32_i64(val2, b);

Better with extu for val1, just because a is logically unsigned.


r~


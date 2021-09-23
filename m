Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910A417195
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:14:33 +0200 (CEST)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk64-0002lR-AZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrg-00061S-Ml
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:40 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrf-0002NO-92
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:40 -0400
Received: by mail-qt1-x832.google.com with SMTP id l13so9158460qtv.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zk8sOsnXycSwV1999FPTje2dE3dn9y4dC4I4MBdrqPg=;
 b=z8jwK0u90k1vkDcukitAsivbqkriAT/XXWF4CHYme4yAyK1GXjO9FIo7/gDBjVBOxv
 D6nQ24QEaTLT4DeE+jv08ow2HhXk9hxWdbnbW7Dh2A0X3wOSiQWS5lEwENm0qAgHO3u8
 CaSiOspn/Ihs0P9XHg/Kqu2RJVLM0/W/VrfpWRKZRE2ha4qXZZycp+sqgbcBcF3dca9X
 98esxbZYAHBuXoZamrzO+spYRuXcKhC5ItWSotrA4xUdgXav2z/2ShvZdnjTIl6YyxrL
 9g0gNEzrypxYKsx2CkxNrzEC4A/QNtHno7SgJvufjWxLV4HpnyL0CQKWIzLRX2B+/Fr/
 hGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zk8sOsnXycSwV1999FPTje2dE3dn9y4dC4I4MBdrqPg=;
 b=jIuGuSq7nyUe31AKADfklDuF/Yximx3+JEreDb/uoJwzI+dXXw6byGuUaaHpql1PI8
 6dcT+1ZLvFK4eEv6ULT8LUEwCV0NLOPHAhKkw/zs/x1ic4DWxi12YDkAeYLPeONrYRlQ
 8uFOXKrH9mjrWFcoNLCd9u/pyurzctx5qyP1pGRqqJcX25MXiFKBrNNYMSQ3TFi4tVco
 F6T8mzHHor0TD0+63i8AwE4pxH7dPcgK58lhpWOtIZzoVHf9M2lfWm5MSsFi08Q65vrd
 OEUUIumVi00ZYqhhNktXbQdieAvhN1zV4K7jIACuj34F4ebeE0uyJ5j1UfF6CW56t/bp
 8C1w==
X-Gm-Message-State: AOAM532Ear6FYBuNBqOIISfV84uEHBtomGtW+VRT82C7AwUVmjslCFGt
 NIiTsiJLBzWv2zSnAgGc5jazNw==
X-Google-Smtp-Source: ABdhPJzqT+OQ0bLTO4XyDXkVYvd4lE8QG7amnMhiTj8GGI6+O+Ysn/9pVtsksoo+eEg/Xw8g+1jkzA==
X-Received: by 2002:ac8:13c5:: with SMTP id i5mr3616491qtj.68.1632484778378;
 Fri, 24 Sep 2021 04:59:38 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id f10sm6391262qkp.50.2021.09.24.04.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-24-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <224c5fc6-0229-1451-2b37-318917603849@linaro.org>
Date: Thu, 23 Sep 2021 10:25:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-24-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +        /* fallthrough */
> +    default:
> +        tcg_out_mov(s, size == MO_64, l->datalo_reg, TCG_REG_A0);
> +        break;

Here in tcg_out_qemu_ld_slow_path, "size == MO_64" is "type".

> +    /* TLB Hit - translate address using addend.  */
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
> +        addrl = TCG_REG_TMP0;
> +    }
> +    tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);

Note for future optimization: Unlike RISC-V, LoongArch has indexed addressing, and we 
should make use of it to eliminate this final add ...

> +    if (USE_GUEST_BASE) {
> +        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);

... as well as these adds.

Compare tcg/ppc/ or tcg/sparc/, both of which always use indexed addressing (and indeed, 
their reverse-endian memory ops do not have an offset form):

     tcg_out_ldst_rr(s, data, addr,
                     (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0),
                     qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);

(It is not useful to compare tcg/aarch64/, which cannot represent "zero" with indexed 
addressing, and so has to swap between offset and indexed addressing, depending on the 
size of the guest address space and guest_base == 0.)

Oops, I've just noticed that the !CONFIG_SOFTMMU case is not zero-extending the guest 
address for TARGET_LONG_BITS == 32.


r~


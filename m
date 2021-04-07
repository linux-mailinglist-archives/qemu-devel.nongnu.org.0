Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470643560C5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 03:26:49 +0200 (CEST)
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTwxz-0000GH-Qd
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 21:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTwwQ-0008CH-7J
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 21:25:10 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTwwO-0003u5-MO
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 21:25:09 -0400
Received: by mail-pg1-x531.google.com with SMTP id l76so11754739pga.6
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 18:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mv7Dn7oK37cuoJGyv5zyHnEoTysH1d7ZsbYbLl3FjFw=;
 b=UpCulVkHKKR29ZyEDm0lI8qU4JEnqCQBPlExvYWbAhFI7K3FzUfS7CVqeoxa7OjV8R
 nyTVvAWkA6MdOROZy0lJAQqBygjUnhV/ANRVOL5n7JgqgjdLNY5Q2UcISkdV+mmWFk1b
 OW51G1LLzvF6NSlj+D0pmGvBUo4tlAwdpEQQl+Dv7ZMDRcq33M8EGnxhQ2yRL7vpCRIW
 1lxQIHFJA/3uAmxNE2hP3Sccv2M9lMxDppImW9eb3tvPKyK/RxdP7S+5h2pkQ7/bKJAK
 11nPA8VR6Eyf/AcUHgkwwWDfsFu86wKMix+nBhhyBAGlvCmRz1WUTLWiBR1tqjj4bMvm
 TrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mv7Dn7oK37cuoJGyv5zyHnEoTysH1d7ZsbYbLl3FjFw=;
 b=WWXcTghmYKsGpiKDTXvAgBZG1at/9tPh1BOEywwh9qGmIIZ8o0thHs5HDAQe3a6Qex
 2CVOn8/tz8gZWqLa3gC7NXWpht4XRH5o8hBIgnZ40JBTdDj7WKSuz55uSF9mz39T8eTq
 HJ1WbersSrlIkuwxJx0a+HViLsrV+oQzPkKGx0PNkCH2eo0ENqEOgcf/sPjMcKV0mCvL
 mkM23T5hn9F+g+vn45vvkcKMBdGvOOrAgqA0I4ucIQGi0SM49pac9OAB9QUExrGP2alg
 p/SBBOtNW8uREK3KaLzDm7vvxuQoz9//dZdw/KUMQKHBf9W2FHEFFLgxMHCDFBGe5onq
 GZxg==
X-Gm-Message-State: AOAM530ZsRxWOh/rFJoXzDD+BLOc0ZTTEWRfh3NTI0RfXixFgcKOMEKD
 1kTDtgYSVqcvzvgpazGVJQHZXw==
X-Google-Smtp-Source: ABdhPJwsPqDlFMTF0ABDGUdmqZ8fqSj5N37QopR4nIwe5FxOyMXuUjZbFf4gBBXi7l7Z+M6kOjdSDA==
X-Received: by 2002:aa7:8187:0:b029:213:d43b:4782 with SMTP id
 g7-20020aa781870000b0290213d43b4782mr761213pfi.26.1617758706992; 
 Tue, 06 Apr 2021 18:25:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j1sm3001239pjn.26.2021.04.06.18.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 18:25:06 -0700 (PDT)
Subject: Re: [PATCH 02/27] arc: Decoder code
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-3-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44722d06-8fe2-0d9b-9b42-1442c5625aa0@linaro.org>
Date: Tue, 6 Apr 2021 18:25:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-3-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +static long long int
> +extract_uimm6_20(unsigned long long insn ATTRIBUTE_UNUSED,

global replace long long int with int64_t,
and unsigned long long int with uint64_t.


> +{
> +  unsigned value = 0;
> +
> +  value |= ((insn >> 6) & 0x003f) << 0;
> +
> +  return value;
> +}

return extract64(insn, 6, 6);

and so forth.  Please minimize the by-hand bit manipulation.

> +static const struct arc_opcode *find_format(insn_t *pinsn,
> +                                            uint64_t insn,
> +                                            uint8_t insn_len,
> +                                            uint32_t isa_mask)
> +{
> +    uint32_t i = 0;
> +    const struct arc_opcode *opcode = NULL;
> +    const uint8_t *opidx;
> +    const uint8_t *flgidx;
> +    bool has_limm = false;
> +
> +    do {
> +        bool invalid = false;
> +        uint32_t noperands = 0;
> +
> +        opcode = &arc_opcodes[i++];
> +        memset(pinsn, 0, sizeof(*pinsn));
> +
> +        if (!(opcode->cpu & isa_mask)) {
> +            continue;
> +        }
> +
> +        if (arc_opcode_len(opcode) != (int) insn_len) {
> +            continue;
> +        }
> +
> +        if ((insn & opcode->mask) != opcode->opcode) {
> +            continue;
> +        }

A linear search through the entire opcode table, really?
You can do better.

Before you re-invent the wheel, please first have a look at 
docs/devel/decodetree.rst.  I see no reason why you can't take those tables 
that you import your tables from binutils, as you're doing now, and then have a 
small program that converts to decodetree at build-time.


r~


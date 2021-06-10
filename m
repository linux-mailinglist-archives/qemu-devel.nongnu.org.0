Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E673A3625
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 23:43:03 +0200 (CEST)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrSS6-0002pF-GE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 17:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrSQg-0000UI-F2
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 17:41:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrSQe-00057w-NO
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 17:41:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so4577517pjs.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M6kg1h8b7yGHPxVnz0CTa5BtpFsKRDaCDunhKoydVVM=;
 b=r4f9AN4Zcgyk44dU4CcsB4jSkYzg3lFUHHAZ+I8XECj2napo4YS/826nUAaHN1TQlo
 5yIePOqpgXgsTjwe5HXGAtwpQMDqx7nAOCuT3PFhZOgn/cUa98Hu9f3K7Btqqo2/5DjH
 SYcQf2MoTrGahW4kSW6H/aq3RTj46iNny1gY5UNV7sFykzISdEWznNoyl/KBdmxvRTOQ
 aYrDOgDC7Yphix9vDQmTt5V53Si/tVeQ0SUmWWewJ2SUhZeFXfzyXxDI7xiDbu8CMPM1
 366XZjBGFF+EnldqMsBPZYjk+3mKvy14SywW9boDlrLtXv58fXF0OaMdPGfrIPnXpQZQ
 HPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M6kg1h8b7yGHPxVnz0CTa5BtpFsKRDaCDunhKoydVVM=;
 b=f1ohLcHjcH2fd5pLY1ay/QVI5aw1IaHao6AfTFDS9LhmiTg+PlR7jsGefv6sysNrdv
 VS2JsRzNPZnHBPEJBJe6x33mkFv5076EH0DN0g/w25Qt94mdjV7P41ljVN9yxzyd10jM
 UUbJjZH0KlGaCMw8QPs+Raz0DCqdVSN+n/swV7fRXX5qjaGbji7lHonX4nVBRbj57uWH
 Ga/3C7wTFeeUN/o97ahxKklNU/A89/PMl3eqV8WJXr0bPCsnEkqvForQSfgQ20FKDZvf
 1+9Rl02WvDRw03gJm53SLlHaEFd1pmGIHhdIkteUDtQ9KDeBG0IswOVwVwiSXmFmUFx2
 yXuw==
X-Gm-Message-State: AOAM531c5nz9+jLQ7w6cS8hSi+eSupwWl0MUofKE8rV99vYLPCTExAJR
 gP68YGBixYk1y9Z5SrPaGN0f7Q==
X-Google-Smtp-Source: ABdhPJxt18QsdfMoo7KDb5qC2qFbgiSfLmxUd8NBGY5TxWYX4SmhMt1FIv00dcG8Y3lvXqZkOEDUsA==
X-Received: by 2002:a17:90b:19cd:: with SMTP id
 nm13mr5630067pjb.226.1623361290660; 
 Thu, 10 Jun 2021 14:41:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o16sm3143764pjw.10.2021.06.10.14.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 14:41:30 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/2] cputlb: implement load_helper_unaligned() for
 unaligned loads
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210609141010.1066750-1-f4bug@amsat.org>
 <20210609141010.1066750-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <543252e5-0b30-8424-d833-4103ddee3919@linaro.org>
Date: Thu, 10 Jun 2021 14:41:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609141010.1066750-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:10 AM, Philippe Mathieu-Daudé wrote:
> +    oi = make_memop_idx(MO_UB, mmu_idx);
> +    if (memop_big_endian(op)) {
> +        for (i = 0; i < size; ++i) {
> +            /* Big-endian load.  */
> +            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
> +            val |= val8 << (((size - 1) * 8) - (i * 8));
> +        }
> +    } else {
> +        for (i = 0; i < size; ++i) {
> +            /* Little-endian load.  */
> +            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
> +            val |= val8 << (i * 8);
> +        }
> +    }

This doesn't quite work.  You can't just call helper_ret_ldub_mmu, as the other 
option is full_ldub_code.  So, at present you've broken unaligned code loads.

We also need noinline markup for clang, like we do for helper_ret_stb_mmu. 
I've no proof of that, but it certainly makes sense to record how we expect the 
inline loop to be resolved.

Finally, you have to use uint64_t for val8, otherwise the shift fails for size 
== 8.

I'll fix these up and see how things go.


r~


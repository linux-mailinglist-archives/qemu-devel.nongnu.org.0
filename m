Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592D4634B8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:43:32 +0100 (CET)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2Tr-00008p-AB
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms2Kp-0005qi-5Z
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:34:11 -0500
Received: from [2a00:1450:4864:20::333] (port=55024
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms2Kn-0008Vt-JE
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:34:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id i12so17310800wmq.4
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 04:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vO3xPDR65R6x6kIivbXPFF3P4OPh3bgRlcJDnY1SeFQ=;
 b=VyzoCY278IbjdmtBu2wK1Bj5cOMkWwIqCFGdjUKbwBIRRgH9AnXNe9yCGEUC1GxFlo
 +NrRAtYmVyVQy4Ge5NnjX9iZWjvM9Lw2XIxs5/M2SZwhC/uRP8HqquFfdrm0frig3ag+
 Y7mJBkHuT+Rnh2ZWejt2bmf4MfKLbr42LtZFzshOILfwkupiaE7wlIAWIsM0/9oX94pY
 l7nZORQN1ibG92Wreel/afHnKA0mSa7xlfqEJJZejM637sMAhdj8+vDvlIPIwlcBSUX9
 00w/ToIjjMPf96RFw+CduC6cBfn0YJENrHpnhQn5W83JsySR6m6lwlf2Y1fV24ROpbwL
 mDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vO3xPDR65R6x6kIivbXPFF3P4OPh3bgRlcJDnY1SeFQ=;
 b=IkGyTME/ufWkWWKSqJy0VpEHfXC9XFvJ/P2yEJhfwdRZCXYOdpWv2T5wwbHVvARpTw
 wONR1GT7Cdrz0bo+XNGEGLtLobz5TiK98zB9YsI/VSkU3Rp8hpikkNwsXCRLqxaL3yKm
 DCe/FOry5Atr0kHt019s8Hc7l9+7htp0Rz1BVRR2OTihtN6kR+FEWKX1xoar9uBQkZe9
 odxgKPqNx2gapk3VWeX1KyjWllHzgB4pG1g3v/kd6fb1odMZZUc7zwvSzdh4ywHh4tnn
 0e3lXWeVf5ngyhKTprt6Qnp3IkqomDUohvK8fDVE22PF4hge5h9SxQMs7wHMVtHG/DVV
 OBpw==
X-Gm-Message-State: AOAM530TxuX38CE5TUm70Ypr2WK8+NCKyQ0M9ELTBUg+bNx1cHbzK3FK
 zN5TtKChoH9/9U4J2zO9QWGC4t5wnOPNulcv0D4=
X-Google-Smtp-Source: ABdhPJy2YXQq2f2mql2jZdN+JIClckXD8XJrLoVGE/21OFABsvnZF3jBeT6xlIqq24i4lXDckAf/Uw==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr4688772wmq.111.1638275648002; 
 Tue, 30 Nov 2021 04:34:08 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d9sm16253556wre.52.2021.11.30.04.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 04:34:07 -0800 (PST)
Subject: Re: [PATCH 2/3] target/m68k: Implement TRAPcc
To: Laurent Vivier <laurent@vivier.eu>
References: <20211130103752.72099-1-richard.henderson@linaro.org>
 <20211130103752.72099-3-richard.henderson@linaro.org>
 <0c97b116-4f8a-de89-e656-1630470046ac@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c1495bf-83f8-c64c-4ae6-ab2e7830b5b2@linaro.org>
Date: Tue, 30 Nov 2021 13:34:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0c97b116-4f8a-de89-e656-1630470046ac@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 12:57 PM, Laurent Vivier wrote:
>> +DISAS_INSN(trapcc)
>> +{
>> +    /* Consume and discard the immediate operand. */
>> +    switch (extract32(insn, 0, 3)) {
>> +    case 2: /* trapcc.w */
>> +        (void)read_im16(env, s);
>> +        break;
>> +    case 3: /* trapcc.l */
>> +        (void)read_im32(env, s);
>> +        break;
> 
> Do we need to actually read the memory to trigger a fault if needed or can we only 
> increase the PC?

Yes, and to pass the entire instruction to plugins.

>> +    case 4: /* trapcc (no operand) */
>> +        break;
>> +    default:
>> +        /* Illegal insn */
>> +        disas_undef(env, s, insn);
>> +        return;
>> +    }
>> +    do_trapcc(s, extract32(insn, 8, 4));
>> +}
> 
> Do we need to change something in m68k_interrupt_all()?

Yes, and cpu_loop.  Thanks,


r~


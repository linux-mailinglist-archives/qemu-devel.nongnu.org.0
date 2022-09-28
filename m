Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4955EE86A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:38:21 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odel1-0008TN-IW
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeFL-0006rk-2e
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:05:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeFJ-0004Ln-9i
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:05:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 r8-20020a17090a560800b00205eaaba073so2711678pjf.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UzknKNaY4+u4EffJT+BeEJVrGzTWvFx11+ZnHFcRXUY=;
 b=tP4Cx/HGmr6hCkAh8KhjCia3JklHCd3dp20+eBmZR42rMM05CR2hAOhjBs7H7SZKeb
 aYL+YqTArK59EAt/MHnLpgMN3E1iq9P44N7X1cZ4QnG+5WNFiyYfwsYcBH3W1l1sFhxO
 VhgnZbrBIpteCKOQG0u68aymmL0/8K3k1VA34Yd0wFgAmeIOvRAHojp3oP9SpSFCtQy5
 FCPI1FTjSBW0lhLrRme/WJtDqvc4IG72yqihn5dutdzOV3A720A5UoQyu31QesFlJtjs
 9ZXHsPTPGgYC4kKwUYNRjSgah15fzBQhOyqdL9YcU/oxgA+E9ttFBxU/xy+K5MnhzB9C
 gYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UzknKNaY4+u4EffJT+BeEJVrGzTWvFx11+ZnHFcRXUY=;
 b=OfCYQ0MebxJ8CzzJDyIWnmlYXzcDcy1O9SPVKxrfc2XJS+L6EQ9eTB65lI6wHpF9aB
 CYvQ64zHkw4PpPOlwA/xPmmaKM2aQLoOTHnPYX1nmJSryGOVVdif1B9iFMSS/RDPA/Bm
 kvpGuIF7KBaAue7wzkW+XC8WQ/FGK/QoLHKGUhT7T1RsJtarTGscA8VCyt/3LFcOqMkt
 ShuTLhOf/e3VKfEy0xZg17zLMNCkqNaTLKd1T5BcBZYUbyJ/Ul2+Ar2+ZBc4hVse5DBl
 ebr7fPD4gg5H8TI18xWBrfmzvX5DBM8DJrmWGcNNIz7/nDklk0+1HETZYCt4ACRE5ivs
 y7Kg==
X-Gm-Message-State: ACrzQf13oPBPuEVr1PZqrvSy0Ka80QthvHOspKtKLGOzR3mBjH5OpwHN
 2d/b3hLjmRpt8jf76KiDiyp6oQ==
X-Google-Smtp-Source: AMsMyM4aKMgc0/XoMM+5W0RgI9i9L4UGnJjTqobfO45MZVmsNF9snnVqMDE9gAql2TQws4PrTmqr0Q==
X-Received: by 2002:a17:902:e292:b0:17a:9cb:a767 with SMTP id
 o18-20020a170902e29200b0017a09cba767mr1570803plc.149.1664399130698; 
 Wed, 28 Sep 2022 14:05:30 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170902680300b00177fb862a87sm4252077plk.20.2022.09.28.14.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 14:05:30 -0700 (PDT)
Message-ID: <b85b7fce-2f58-632f-d198-2b01eb069152@linaro.org>
Date: Wed, 28 Sep 2022 14:05:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/hppa: Generate illegal instruction exception
 for 64-bit instructions
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <YzSXKYBpJ2XeO+1C@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YzSXKYBpJ2XeO+1C@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 11:49, Helge Deller wrote:
> Qemu currently emulates a 32-bit CPU only, and crashes with this error
> when it faces a 64-bit load (e.g.  "ldd 0(r26),r0") or a 64-bit store
> (e.g. "std r26,0(r26)") instruction in the guest:
> 
> ERROR:../qemu/tcg/tcg-op.c:2822:tcg_canonicalize_memop: code should not be reached
> 
> Add checks for 64-bit sizes and generate an illegal instruction
> exception if necessary.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> v2: Move checks to trans_ld() and trans_st() as suggested by Richard


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


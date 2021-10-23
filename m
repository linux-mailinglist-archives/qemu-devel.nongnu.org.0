Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4104380F4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 02:27:51 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me4t3-0002ty-Ks
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 20:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4rY-00024O-Tr
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:26:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4rX-0004gM-0C
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:26:16 -0400
Received: by mail-pl1-x632.google.com with SMTP id i1so3822893plr.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pmzwQXieE2IwqusCu+4orxUCJV1yEeYA5lZ2ANDmzRE=;
 b=SN5yvoWlxlo3DA4sIWclnAAUM4wSN/pWz/lmEj19VyB7tbjQnXNew+3AordeZTHTr7
 V7ljYtCEwQwS+2+BmMfSUwEIpC2BFIuGejtkWYI3DH24ZJhlS0Q/DFkc/NsIs8ZxK4SU
 wGChmhXB3aef9QFpE2czzPQMps+IRUVw8tIxKnYb27czr9sUJybDH2/XZb7rooUo1KBO
 QfmtADJkcUDgg2RvBNk2mxEIcf3RKnGEowcMfdAQfLeK9sFDNg8thTvRwvFKu5NcY4RE
 n865Pxg1GvkVJmD/AU3JPxAF5bm/JLvPcwgUyDKEqtvRLvT9OJaG2fRyLztua/un50QV
 eWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmzwQXieE2IwqusCu+4orxUCJV1yEeYA5lZ2ANDmzRE=;
 b=77GoYtJ9YdJkZy4yG6Nop6+A6zN054JykV8jknbm4nZo9by9OQzIJxgV4h8Sdm95Ts
 GwyX2CK9YeK0JNr9vE8S16DffA6sne2Cj6M3erEhAWykPycAzH89exn8bq2w4CIMJ2UA
 I6tWBqWClR3vdiKPIqX9jICsQNbhhyfRwtRkH8LnUJ0ciq51kz/P1Y4vmmQrkGH8gTIA
 06f9PyTtiB40szhWAp1FVV6La9eGubu1PowWLi8WlE7MSEggoxxhrCdrQRlOIjiT9NSa
 Kem3D7iWe6DcnFG3H36t6a5l7KvCkPYqlyU2vpijf9aNTBopoCOEMzREmP8uDf6pj6QE
 MoAw==
X-Gm-Message-State: AOAM531JQH7PmL8E59ld8wCEgCL9pj4eAIszL/e1GDl563K7R9yl1ftI
 i+HTDSj4jxGF3zEqkYOczMUF1Q==
X-Google-Smtp-Source: ABdhPJyvCZ8YpCurh2Lo7L/2L1/CEw5j8FoPRxq8UX7qM5sRCSHhnrAio6wJeGbbNjPbaHswreWLRQ==
X-Received: by 2002:a17:90b:2247:: with SMTP id
 hk7mr3445248pjb.72.1634948773310; 
 Fri, 22 Oct 2021 17:26:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k13sm7856723pfu.177.2021.10.22.17.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:26:12 -0700 (PDT)
Subject: Re: [PATCH 10/33] target/ppc: Implement pextd instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-11-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ffb8b04-8534-4085-8b00-2c6b727a7fb6@linaro.org>
Date: Fri, 22 Oct 2021 17:26:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-11-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                        |  1 +
>   target/ppc/insn32.decode                   |  1 +
>   target/ppc/int_helper.c                    | 18 ++++++++++++++++++
>   target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
>   4 files changed, 32 insertions(+)

Same comments re ifdefs and target_long, but otherwise

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


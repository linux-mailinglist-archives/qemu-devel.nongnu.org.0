Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BAB35F8EB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:31:17 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiQ8-0005h5-NI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWi6P-0007Vj-Gq
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:10:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWi6K-0006Hu-I6
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:10:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p12so14745467pgj.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IKLrWVT7PEJyXsV7qdBcOwZs0ruyemvpY9bf8FEMlqc=;
 b=Z5JZT1DeticHYZG/kW7l7yUpgJF0QUdCBRlwnciDHSePM75O5RSe2a5+BM7lKkt6gF
 OkIg4RLlkjiL/z2iCmSnMrQ8SRQEro1JINg2s5KQReqTgeOM5lq/dJ1h41QfVAPIkwRV
 ionE/NJdQEnRyPAsO2Lvr9OC9Hu9MDqpAhyTDHEZ5Q9fSSULqwz053rX5PMIyzbXKuD0
 egrz50MZgyYJN3GaYQICWQ4DjL20pY0hDpkJgV9QqoJQHvELmzdCLmZw+iCH0PqI92VK
 gsd+uh4zmD29W/ZyUdJBXpdvhxTbUwgvCoyBNX3Ni+my7OfYdoRGsEAAvH7s4JVG/Sj4
 GFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKLrWVT7PEJyXsV7qdBcOwZs0ruyemvpY9bf8FEMlqc=;
 b=RFjnhsOJUUgkvw9Bb2xSFfAyGruu4IbE0NYYmS+XIJUV5/E4ZFQZB3xbnZi9+WixTv
 f6r057DGnPkV4Y67uINhI4qbVA47Y15sEu9as+3B1DL+o/bdKJKwEQ0aSu7A8ztmcsKJ
 V1SoSB1TzxwiGh+8IGuuYcL0kgpUKuO8t9vUSmCXajrhgAXZlgEzzAkRp5iG0SWs2pQ9
 fHd9a9K8kPJ5MnCaHHCoc/gW8i6FmDTDq/X19XMnxxM+V1weDy1lSK2YGnAfTbM/odIQ
 irUIUBAgfyXOyEpxuVGN9Vw1nOWC2Fry5tVL9lciE1NEg/ID1B1EZyYfVG8xnUz8w0AH
 h+Og==
X-Gm-Message-State: AOAM531StvWUiIYvrO3+Gdvwin9izryMAn829d1LGf8+Q8lqyUonv7zk
 Oi0M4oymu32lK3JwUzzK1gSrpA==
X-Google-Smtp-Source: ABdhPJzPVJBA0y9LO9oSHKAKjT//KG99KaGmDwSQKRxXITTtCV+D1Xpwms9aaVMreKzCjZ/MBfrIjw==
X-Received: by 2002:a63:181c:: with SMTP id y28mr39669041pgl.175.1618416647097; 
 Wed, 14 Apr 2021 09:10:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z195sm14650047pfc.146.2021.04.14.09.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 09:10:46 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/ppc: Base changes to allow 32/64-bit insns
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51611162-268b-453f-cd59-397906c22242@linaro.org>
Date: Wed, 14 Apr 2021 09:10:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:11 PM, Luis Pires wrote:
> +static inline int is_insn_prefix(uint32_t insn)
> +{
> +    return (opc1(insn) == 0x01);
> +}

Oh.  This should probably return false when prefixed instruction are not supported.


r~


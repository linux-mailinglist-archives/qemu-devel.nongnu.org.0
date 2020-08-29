Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819A256A14
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 22:24:54 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC7PB-0001gE-JT
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 16:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Ni-0000OQ-3g
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:23:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Ng-000820-AT
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:23:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id c15so1227897plq.4
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VPBRWOBAu4JXZEra3gUwoSL59KGeKfxNTtudadYRL4o=;
 b=A89BZyvGgjdleWJ5pbhco3kB1FpOTg3Ay9guDZ4FX9/yaKUFjNic3hOHhj2pZza3xI
 /CH9abgIaBGGjJDGsvSTdi3b5sr8w1d2dPJZM1eyTM1KYjGpz7reOIdRS2FTI/5xQihQ
 RbkbYgy6MgQt7KU8fpgj9PU5aXMQj+HQeLrEI+Eju2J2xqbfyDkkKlPUpQA8UMzJ1QGd
 FvN0ptRDT/5kP0GdjT7fryGskKihrkE6TnbIDbLuy0gT7eHtbtfyRBIx5gnYZL/jRQh0
 yir+5+HaEqwIR9FeHeHJM9OCPOIbbCxf5b21oKw+t3FOESdH7GmryZswD10fvBJqtBCs
 SvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VPBRWOBAu4JXZEra3gUwoSL59KGeKfxNTtudadYRL4o=;
 b=uBFXMLdICQWKsvasbtykzqRzUBc2/EQWWvc0CYe+4DzS9FxAGipUpROpiCYVg0WH5N
 MM56WlreUFGrxSPJaLpRn8Va1xne+LZjf8B/lkK4lJTPTw+i4833EYM16XHeMZ3jxDTi
 KW3j325kA0GIvLXBnDqT4ybfZihfQjHdZ/I6tMqIARFgDsdKp7O/2aqCvUdsyywaFjk2
 SvBise2p0Cp3mrVfP+C2QfrjKLgpYrfha2Dn6UB00y3M4Pv7V+ny6kShJmyYvMQBkSIr
 /SVUCbsX/xJn8q/H0N0i1Sm0A0ngEr4Luqra9UjiYWXgzC+rffUAyNId6hcaNj2GExsj
 9+KA==
X-Gm-Message-State: AOAM53282vT0fw8w7fC2LGCtaZtWfAdWx654V2F7ENzcxRBxNpKSfs7/
 tKqrQji0Xc/dWwHTb9I6YAHP3XeQI3BAzw==
X-Google-Smtp-Source: ABdhPJyrDeVIPEjgzlciiXinzSgObukrxX+DYOWaduemd8I5SlbdHN8SwdU/BVkIq4bcMckJgUWxtg==
X-Received: by 2002:a17:90a:f2c1:: with SMTP id
 gt1mr4387688pjb.70.1598732596278; 
 Sat, 29 Aug 2020 13:23:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w14sm3499590pfi.211.2020.08.29.13.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:23:15 -0700 (PDT)
Subject: Re: [RFC v4 47/70] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-48-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <626d19ce-0651-76d1-ccd4-ca6c30cae41a@linaro.org>
Date: Sat, 29 Aug 2020 13:23:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-48-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Sign-extend vsaddu.vi immediate value.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6037048C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 02:51:48 +0200 (CEST)
Received: from localhost ([::1]:48272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcdrH-0007PQ-52
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 20:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdpw-0006tv-41
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:50:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdpu-00072f-8k
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:50:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2615287pjd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+imxRDE/p9EIMNhfXVur6p9E3o6fF+1Jw3XJUXJO3UE=;
 b=KyGmUdOsmAHeDZzyS/UmaUQ8nVhP/Wk/c9JeR+jRI1kycvYTrV1WHz8V2AgpO1PVw5
 gzs1XeXOwMysyHAlxiFU5YND4U1XZrrTN8TNzznheced9AgRl7JO56aJZRL/Uff6g5Fg
 ID30QPsXDskTWsKSx+iXwU4rsi7yXKOnJPuzN1Sh47Ql+uqbuH8rZXy6YYZXeeuGU+Rn
 +OUkoD8j/ynO3sXXDPm5i6Qa5lApzWKgT6EPlMLYt/KBf1NTTSW2ftW9rtuITFBo5jNr
 TSeqIu4z3+kMiKjxwdGyhgiNSDZcrOYCLffffcoTdNDdvusdvUnJOu/kOSU51wyZveWN
 5p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+imxRDE/p9EIMNhfXVur6p9E3o6fF+1Jw3XJUXJO3UE=;
 b=MqLC8/JauUT2ftikpPAskhbAv8TBnsexDfpAp5toCoEBtdmkLA5AdLwai+X9xOvYvi
 9TxefdN0HzkWjGIOqZm9kXfy3UjUJdeQgpgeLEzU+XDWzhUnX8A2prPTseEJaYyQDKfK
 Pv0u/GvVNKTcEJ0dXK5KI566sjGwT25s2/MTGIQaJdva+4WhgnFhPXiMSp11l21lFwMq
 MjjFyfhHqcQ0pB8oRkXAtmknS1D96cE/YVDLkYQU5ihr1AZvZW/kkVFuDD+afWfIY1pI
 MSPLZBh5FOeOhWZn6r2U8q/u1euOqyPlsABP3MwCD9m5h+4QmSZwmfmNZa5hd6UrsUlu
 uyZw==
X-Gm-Message-State: AOAM532XV4dn0ZCAXf5wzuovfLCRGsD+W3e8V1Ai+3/tT8z67c+q0i0x
 8LkjqfHYJaRVDvXDPke1hT0pZg==
X-Google-Smtp-Source: ABdhPJw/OK9nFkq269b5dcfRRAIvASADKtEVVOODuLIn/RJclENOiPj3oR+hPdK8uRu4QfLl0Dkfxw==
X-Received: by 2002:a17:902:c651:b029:ee:9ce7:2d74 with SMTP id
 s17-20020a170902c651b02900ee9ce72d74mr6276446pls.84.1619830220661; 
 Fri, 30 Apr 2021 17:50:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n18sm11546375pjo.19.2021.04.30.17.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 17:50:20 -0700 (PDT)
Subject: Re: [PATCH v3 27/30] target/ppc: Move D/DS/X-form integer loads to
 decodetree
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-28-richard.henderson@linaro.org>
 <a954c823-55e6-d5e1-f694-3f5b06da6d80@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f3766df-15c1-1ae7-eb40-a9fed6a89165@linaro.org>
Date: Fri, 30 Apr 2021 17:50:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a954c823-55e6-d5e1-f694-3f5b06da6d80@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 4:54 PM, Matheus K. Ferst wrote:
> The only difference between those two is tcg_gen_addi_tl/tcg_gen_movi_tl and 
> tcg_gen_add_tl/tcg_gen_mov_tl. We could do this in a single method if we 
> tcg_const_tl(a->si) in do_ldst_D. I'm not sure about the costs involved, and 
> we'd need to tcg_temp_free it. If you want to give it a look, I did some tests 
> on https://github.com/ppc64/qemu/tree/ferst-tcg-decodetree64 .

I guess it works, but it feels ugly with the comparison vs cpu_gpr[0].  Maybe 
pass in rt and ra as integers, and only pass in rb/si as TCGv addend?

The upper-case argument names clash with docs/devel/style.rst.

You can use tcg_constant_tl() to grab a hashed constant that need not be freed.

BTW, I thought I had a comment about PLS being used for both MLS and 8LS.  I 
guess that must have gotten lost at some point.  If you go with your renaming 
to MLS, you'll want a different comment about PLD et al.


r~


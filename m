Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36853D076
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:07:09 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxBhU-0000kn-Ir
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBf9-0008CL-Tm
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:04:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBf7-0000X2-6f
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:04:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z17so7711448pff.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SiMyww/B94iu8teFTaA3Oo9UtYyEtx3FDjRdLfa2GqM=;
 b=dpR7b42mPPzGMlkeixBYSLSoj49oTqpr7gnlE6FxlT2e6VwAT1ZLK0cIGJv+WQgf6n
 zhd/3qbkMfJ3tDYqvwxRd8HYWR93Ukn8+sSEtWy54SXB1jizgNRx7lw/Rc6TGOSUmcCp
 C5nAWKiYy8D8me4XCzBxp2NYXl+4vsI0do6GqmwdZoJLCj7woPYYrmn5IuOFpb7Apq7P
 z2gnHsWX/nso4HOY/hFazYildSt08DAJHB3xeM9WU+1gJxWef7j8tCHUGF3DmfGWJhUI
 mcfnmZIo3eXW3QiDDThOLVQEo56x3cAJN1F0mACkTQhMRXA/u2nFujC0MimJUEnA+FvR
 RL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SiMyww/B94iu8teFTaA3Oo9UtYyEtx3FDjRdLfa2GqM=;
 b=UDp9YD6BpunpFie1j2bTNi2VTW9T0DQMx0/oPO94LfoTNgVsyC+djbZQn5ufmmX/Qb
 uqFcLHX8tIrlhDc6M9jdE9xbGyyB26zcd0tWC8qVw2lKAa6t00CAPdZSsxN/6Xld4Z31
 6r7fTz//c/Oc6dwYA+gbE7BoLNpFGofKpXSH+CUS1eYpcY1SwP4NNvsYFl+Je+zCMMbX
 rIfn6jTv3hMi3JptT0URgnsVKfyvnCZr9RyAOEinZILv6cLv0bbodBTYSOn/uViv34wU
 dkXPLiV6uq58/L256aL+5JnBs9e5uCKlD+bwBXtVn5Ru4/AJWBBoR6aXcmsIhmrR3+Tx
 Fpgg==
X-Gm-Message-State: AOAM533EPAumRWoMYvHpwuAoXxG0TXAJgYp2FXlAp9X7aT3U/E9TSsFC
 km4R/3cNqNPUqDUpBtBEPKewPg==
X-Google-Smtp-Source: ABdhPJxDyHvlZKYAxNn9D/vtEm2YIxJ4IdqUjTVTlSYxT70k3JB/XT+3A9tqoot3tlg/tzSQUOYHdw==
X-Received: by 2002:a63:5e45:0:b0:3fc:71ce:778e with SMTP id
 s66-20020a635e45000000b003fc71ce778emr9724853pgb.411.1654279479520; 
 Fri, 03 Jun 2022 11:04:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170902d5c200b0015e8d4eb2cdsm1418023plh.279.2022.06.03.11.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 11:04:39 -0700 (PDT)
Message-ID: <e6f843b3-497f-a4de-6e50-a2bf76c6b3b4@linaro.org>
Date: Fri, 3 Jun 2022 11:04:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v3 1/8] target/ppc: Implemented vector divide
 instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
 <20220525134954.85056-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525134954.85056-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/25/22 06:49, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivsw: Vector Divide Signed Word
> vdivuw: Vector Divide Unsigned Word
> vdivsd: Vector Divide Signed Doubleword
> vdivud: Vector Divide Unsigned Doubleword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  7 +++
>   target/ppc/translate/vmx-impl.c.inc | 85 +++++++++++++++++++++++++++++
>   2 files changed, 92 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


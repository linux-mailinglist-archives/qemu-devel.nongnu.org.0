Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44CA438033
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:26:41 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2zo-0003nx-Rz
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2xe-00030t-GT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:24:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2xc-0006PQ-PL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:24:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so6744132pji.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHEmzKeY8yyHCbEtx/RRdRetyRBpFpKTPNcP4W4zryc=;
 b=aMCTG/gz1t+inbfVJKwenWneadIPdQAg6J9XoVGV9bmUkQzCUaib2e5v0YlXMTZZHv
 pbycvs/G/EQW9pjPn8O8zaQHbQJrmuRcwEMiRUn/xXlMY+tPPiuJpHI7qsg2E8PC+33I
 otDlazqsNrwO5rLiOquhsUfdK/57osG197OJdQ1bR2pVH0CFKukFV80euSHw7j9BDuTw
 nwSPibUdCuwOvMmga66f1+OJkqIOOKTTspHm1i+thK7clFxPmy2MkDl344hRxqAjWi5I
 +t8or0L/ExmlKhZM+INT8G86GNcwBwKKgnr2Hn36zr0TqaIE1geKol5FKveIHRpZE+Vx
 0D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHEmzKeY8yyHCbEtx/RRdRetyRBpFpKTPNcP4W4zryc=;
 b=oSO2aGt1kNHVzz4rxviLxr6plxcNySOLn3WU48KDWNb10VNZqPInFTzYitAjzkP5RL
 cHS0twtKTuNDKnu8ol1k/QVJzzVd3I/1sy5ps51ub66SqTfH3+Y33n4Ef1i5TTIe5aHl
 dn1lJLzzurTXtEilgBrh9fQ+eSNVipDbLzwVw6N7deunoMe2AkOxkiM2N+8mrud4SPW2
 lKMlP4uw3t89BNkWZJfD30zlvCKb/rBYNtz4W9xLB/3HScrNtTV/2/Rn85O4yH9a903d
 bGxub/o+grCLpDQp6nYfXY+ntFF6dFeaPwpmjeIlROnuN7dOBb8AjKNeQ0GCZTtaKyQj
 eM6Q==
X-Gm-Message-State: AOAM530o0Cw0tzMKe7VtXYzSBrQ4cPJJnIOin+8C2r1L2JlrY+P2+17U
 dRtlsHh+WZmYS0BLI4YRAgmtRg==
X-Google-Smtp-Source: ABdhPJyiF3bVW1LXxOjnvAlBIUvv0JqriTVfg9DbBgRPVxKK3RDUAfxCCimjvFNsLb79XvSJG0ZYAA==
X-Received: by 2002:a17:90a:245:: with SMTP id
 t5mr2799549pje.133.1634941463125; 
 Fri, 22 Oct 2021 15:24:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e20sm11741349pfv.27.2021.10.22.15.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 15:24:22 -0700 (PDT)
Subject: Re: [PATCH 04/33] target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD
 instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65d3b8e0-e726-c58b-e15e-930c0e12775f@linaro.org>
Date: Fri, 22 Oct 2021 15:24:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: pherde <phervalle@gmail.com>, lucas.castro@eldorado.org.br, groug@kaod.org,
 luis.pires@eldorado.org.br,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: pherde<phervalle@gmail.com>
> 
> Signed-off-by: Fernando Eckhardt Valle<fernando.valle@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode           | 11 +++++++++++
>   target/ppc/translate/fp-impl.c.inc | 14 ++++++++++++++
>   2 files changed, 25 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


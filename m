Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7B54377E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:34:46 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxhk-0004Ci-LU
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxfx-0003Lv-FE
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:32:53 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxfv-0004E2-Tp
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:32:53 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f9so7485229plg.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=7CZJWvqggkk2uqqiZuFG+w6RRIhJtfgtWWi36sDt+Vc=;
 b=BT46hp4Y54bKpndAjQBFnNgAyFQSG/ke+MlY1dGhwJcqfH+3VA4KM1J7ulE9+wbct4
 WwsHFLu2xHbEm3Qxe/Hhzhy5S/Q7u9/A8EP3wANzmlRPeoAPeqLqH8ysYUK/h5OndSVM
 n4qvXOb3025f7tChNP/4NCfKP0Q89HqHL+V6evmlsjltcNe5iv5Rj8JxTvGtEx+HEhgI
 YEj4YY9uK8yAPjvwL9teptA7FVuzndGnY/AwEESWRVwAxBumO+UPeX++EJaWcKJXSc2F
 3V4qlqIgrP2AILgQrAFFXl1fB9g85cvOgCAoavJFpVVfdgvL5GLI8u7P2grliGJAx74G
 WCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=7CZJWvqggkk2uqqiZuFG+w6RRIhJtfgtWWi36sDt+Vc=;
 b=EkdKguc1GMuQ58/d+1dLrxNrAbqtX0rIsGywHSZdMiYxxnlZQaHhxSJF0xoLtRC4s4
 zc9mg1UW/OR++oPdZZ4Hl2Tu2KRfkQnBjjSgn2oGCgjhnCBeVwLSlRTRRlJBdLhuzHf5
 EHcNQcQdqRrtjBdFfyhoIv+8WkXnNjYZedcbaF8OBPaULxJGnE/hDmSk2PvZumSCE62n
 x0MW5XHe9Nx/O95ZNsmtzSu2C9lyNIO+Ft7DmgIN0xG+buScga2hCgdlimG6TfVqR/6F
 bF2WW6nGLE8o9mOFTtrulDI557CVttSCmvuiNC7IWVLW25ZgQUEINkL9lImxX3Mlud6J
 it5g==
X-Gm-Message-State: AOAM530XJdR7BMeVcmjPfsFajm1RA3MRTU0y7Air6xBW1ALtHE6xhH//
 Q68k2NZqC8pBk18rd3BR0/iAIMitVKWblg==
X-Google-Smtp-Source: ABdhPJwM4Q7uuXlE7u4j1SMpHLS8NBgESgZkLaBTu8IDakCyJ4HjuDcPH6ehKyerVeCLUZgX6jyxyA==
X-Received: by 2002:a17:902:cf0f:b0:15a:24e0:d9b0 with SMTP id
 i15-20020a170902cf0f00b0015a24e0d9b0mr34002854plg.42.1654702369651; 
 Wed, 08 Jun 2022 08:32:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 bi17-20020a056a00311100b0051c31cc3ca7sm4375367pfb.4.2022.06.08.08.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:32:49 -0700 (PDT)
Message-ID: <243be739-c6b7-8baa-af72-cd667b09e302@linaro.org>
Date: Wed, 8 Jun 2022 08:32:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/3] target/riscv: Fix issue 1060
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, apatel@ventanamicro.com
References: <20220604231004.49990-1-richard.henderson@linaro.org>
In-Reply-To: <20220604231004.49990-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I just realized I failed add the proper cc's for this patch set.

r~


On 6/4/22 16:10, Richard Henderson wrote:
> This issue concerns the value of mtval for illegal
> instruction exceptions, and came with a great test case.
> The fix is just two lines, in the first patch, but
> I noticed some cleanups on the way.
> 
> 
> r~
> 
> 
> Richard Henderson (3):
>    target/riscv: Set env->bins in gen_exception_illegal
>    target/riscv: Remove generate_exception_mtval
>    target/riscv: Minimize the calls to decode_save_opc
> 
>   target/riscv/translate.c                      | 31 +++++------
>   .../riscv/insn_trans/trans_privileged.c.inc   |  4 ++
>   target/riscv/insn_trans/trans_rvh.c.inc       |  2 +
>   target/riscv/insn_trans/trans_rvi.c.inc       |  2 +
>   tests/tcg/riscv64/Makefile.softmmu-target     | 21 ++++++++
>   tests/tcg/riscv64/issue1060.S                 | 53 +++++++++++++++++++
>   tests/tcg/riscv64/semihost.ld                 | 21 ++++++++
>   7 files changed, 116 insertions(+), 18 deletions(-)
>   create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/riscv64/issue1060.S
>   create mode 100644 tests/tcg/riscv64/semihost.ld
> 



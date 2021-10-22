Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F59438014
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:03:04 +0200 (CEST)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2cx-0000p9-RU
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2bt-0008OM-JQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:01:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2bs-0007nK-4a
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:01:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m26so4832432pff.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=smpcGyHABf1Thyq1K8OF0xFWxa80ceoU+WjPOUiofys=;
 b=yZ3hct+CMVez4pWfNcXR92mRlJwYAbJCIxDO5hj/DZCnGQCT2buZizTYHMi/KWtEbk
 XojrMH/4kh0oHEQaJY6lQf6G0RlVKo9MOhKC3PbC9YKaCunRw2hE26axVpze6NaT0t49
 Hh14jxpaXTDxIFAFac2MewPaxYukA695Xgm7uf3h9Ep1mTImUGOV2yvYoT3flVPC7//V
 T0c5vTJ+s0GFs16gnGNk6h81H8zgv0uju89VKXFadWw5s4YX9pYFvX3D2zi7NH8JtVaY
 5YEwKcqEJzUO0Na+xPtPr5IqXYQrHOH14J8xXkw8DW5m/018G+3QnROlfsKsy+CrKxQU
 x7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=smpcGyHABf1Thyq1K8OF0xFWxa80ceoU+WjPOUiofys=;
 b=ZVJxHTIXGyiYjoKQ6yLMNZOoOSbAsj4K+k4MBMotMTzBdhTO8ylaDaMXQHXKa9ClxT
 pms08BPFa8eUUbMohZVAcSjSCtqCjWaEM/Tg4UDeHQVe/pOwQK9/aC5VNvrihX9F06tB
 FMnTdvN1jUPqTvb1z5Sd4jZA7p7Xy8WkDrkFSivF01GJaA0eLvgdKnJTsJ95OEIScQH4
 PjJmQeN0hUyB1mPBCZ03rcmGHRaVPD4jWwNa5ojnLqbpUYy4IprM7V+Rqjij9qSo3ow4
 q+UVLx16ktH8B+PiFMGawFimVuEj4cnFSHfq93CakN86zlWJmdmDDdDkOczyffTJlggx
 Ha7g==
X-Gm-Message-State: AOAM533S2BoByAZJUtZsZoy8Tk7Tulc1R+6gR0AY8aL83HRe5KS6FAt8
 j82MLN6uL7RXivmwgPIREr/5/Q==
X-Google-Smtp-Source: ABdhPJxUa1au/PmLcR0aLc5ol9XclVXLs52/iOqw8Hesy+C8QcYBa9vj4dUT6kkdcA8q8klJpLL3NA==
X-Received: by 2002:a05:6a00:26dd:b0:44d:2531:9f46 with SMTP id
 p29-20020a056a0026dd00b0044d25319f46mr2290912pfw.46.1634940114524; 
 Fri, 22 Oct 2021 15:01:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c21sm12278945pfv.145.2021.10.22.15.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 15:01:54 -0700 (PDT)
Subject: Re: [PATCH 02/33] target/ppc: move resolve_PLS_D to translate.c
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61a8528b-d51d-4016-6b1c-82690a3022b2@linaro.org>
Date: Fri, 22 Oct 2021 15:01:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br,
 pherde <phervalle@gmail.com>, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: pherde<phervalle@gmail.com>
> 
> Move resolve_PLS_D from fixedpoint-impl.c.inc to translate.c
> because this way the function can be used not only by fixed
> point instructions.
> 
> Signed-off-by: Fernando Eckhardt Valle (pherde)<phervalle@gmail.com>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate.c                     | 19 +++++++++++++++++++
>   target/ppc/translate/fixedpoint-impl.c.inc | 19 -------------------
>   2 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


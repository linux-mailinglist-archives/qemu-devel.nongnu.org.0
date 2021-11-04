Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD94458DF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:45:02 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mignH-00062C-Um
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migii-00038f-2p
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:40:12 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migif-0004CI-LP
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:40:11 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h16so4902407qtk.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsZZJ7MUBLl8ne8R69/2aJP2WK0TxCsLp695Q6wmdcA=;
 b=y60/4TwFPncbsoYxj0Je1sOSMk/pdjgK1X/xbvBS9i+RVZrwixbuBtED2EoCoOD83Y
 tWX7Ahp+xPHWSRM0pDlAcnftdTWbDDIw9ecnpdBIwwdr5/nbYn/fXLKMzCPhRfl/PuCN
 F4jbJrETWyuN0YYAZlqJXsiUGnqDe1jpkn2ixk3Gim8iCGbvuFffo40OB1VXkHUDVF+s
 YN9Bk9PIUcLS98X1R0iel+iLTC6SxI3AIz6vHvEpOpeuUVf9KEywAt8mKMLWAFdBIDCd
 fL3g91QKR6NE0fYLC1+Z7Yky7F9MJ/Y6hYlyoXtStmX9c6q2y/kUjJQjm8VX925f42w6
 mwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsZZJ7MUBLl8ne8R69/2aJP2WK0TxCsLp695Q6wmdcA=;
 b=JkFeZpE1fwZ2hpRRaQNFQE2cUCkdwlStsBjah2u5honRb8wMnlFBxHWLfdtU/drL6v
 Yw5eGYYL62xGiG2iuKHKTvfs76b3oTXpZ9IQamAQVaX5qbFB63k/kJ2gPGXFsDoNgLYx
 s2BgahBmC3C8jzcGvzPZMx5Tf8mCAmbVycUpKarMQeB5HgUFWE+OovzSSRhY6fOUkoPw
 a4l2469DuqnFOV69n8u5b0o7reyeqGvCULYmun1puBpD5lqBFhxh5iOYGzrkoQPKif+F
 6Zb5xYH5Bb+kNrhqM05pMeFjJhDiTXYgPgsW+eH2RGNrpatWYvu+o/bk6AFGS4Vk0ERj
 L6Sg==
X-Gm-Message-State: AOAM530JGljr4PP7yUc36sq34YB37RipGz4V7t2kQtD5Iqioj+zY87E6
 e2EDVGqF89zqvFSuUFdVfk8wrw==
X-Google-Smtp-Source: ABdhPJwE2IMyoOsJev07APW0rsBznWFGEk6mJfg2Oyrk3Mf17ZUPnoBQtczERFe7FNCJZO8EYbPWKg==
X-Received: by 2002:a05:622a:1392:: with SMTP id
 o18mr18795289qtk.403.1636047607457; 
 Thu, 04 Nov 2021 10:40:07 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f802:6e0c:4407:203:e794:8e1f?
 ([2607:fb90:f802:6e0c:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id j13sm4195242qkp.111.2021.11.04.10.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:40:07 -0700 (PDT)
Subject: Re: [PATCH v3 05/25] target/ppc: Implement Vector Insert from GPR
 using GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
 <20211104123719.323713-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c84b20e-c8d6-cb82-0afd-570e3cb96d82@linaro.org>
Date: Thu, 4 Nov 2021 13:40:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104123719.323713-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 8:36 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements the following PowerISA v3.1 instructions:
> vinsblx: Vector Insert Byte from GPR using GPR-specified Left-Index
> vinshlx: Vector Insert Halfword from GPR using GPR-specified Left-Index
> vinswlx: Vector Insert Word from GPR using GPR-specified Left-Index
> vinsdlx: Vector Insert Doubleword from GPR using GPR-specified
>           Left-Index
> vinsbrx: Vector Insert Byte from GPR using GPR-specified Right-Index
> vinshrx: Vector Insert Halfword from GPR using GPR-specified
>           Right-Index
> vinswrx: Vector Insert Word from GPR using GPR-specified Right-Index
> vinsdrx: Vector Insert Doubleword from GPR using GPR-specified
>           Right-Index
> 
> The helpers and do_vinsx receive i64 to allow code sharing with the
> future implementation of Vector Insert from VSR using GPR Index.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v3:
> - Fixed helper endianness issue
> ---
>   target/ppc/helper.h                 |  4 +++
>   target/ppc/insn32.decode            |  9 ++++++
>   target/ppc/int_helper.c             | 30 +++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc | 50 +++++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE82440C28
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 00:32:52 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgwuB-000624-Nc
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 18:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwsf-0004Qt-1z
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:31:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwsd-0004o8-3B
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:31:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id g184so13479344pgc.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ROHzv5FYrhvk6ujjV/2+uXInEu89okt4/B45DhyZD+Q=;
 b=BHSluY1QQy+D8y2OvA89UJkUrNQYhkUG3Kajte4F08tpwiON/Obict+8v1vVTJtxA0
 m4s+K5qB2wN1AEt2grKlHsZ+9hdffwTZL0DnWKV3uBatcR/14kvV+ZrescobyrLmkkGs
 CtXJYu8a23ZVc5fwFcUPSESs76ZL5NfYUilbZL8d1ooX/x5Wt/WuywuC1wCpCH95Mu+3
 Bg/LomqcyianTC9hw+S9ly+Kwa9iXwdxE7+8V2n2AS4jGpmRbu1igEM2b53uHVavcprx
 G5/KtrnNQFHWLhLXcKYrMRmqYIdqkOXkpTp4U7+4d/dpk9oaAUgbU4Ydd+fMVRli62y1
 jlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ROHzv5FYrhvk6ujjV/2+uXInEu89okt4/B45DhyZD+Q=;
 b=Hn8iLGLzYkwnzIcFFRCt4Vx8iwIrM3Np4f5CtQU7GlpVRKMeEpmmC5db8sVYnliFbT
 /iObrqHIIUcCNMiHBjAKu0tGASGhUKEwdnmD8jnWptGnBKktsflJXkV25YdGNOeYOyb1
 jHlF9Xe99vF3+HAbTWxODv53T9BST/LiVPJYQSFuEtaey11VrbphjGcva1Lmelu7390Y
 eiScJNOx4+QQOeHQwveDifcTUhrF8RYw0n+34coJZLs6n1ovdfT2CVStlnRgpTaOxqZ/
 EW7+9ZuqU8tF3kqXBdbhTb0CL5suVJqAUY2gy1DsJb6IG2kx1zFyoQvKNoKc0Mpfl5yp
 0Tzw==
X-Gm-Message-State: AOAM533emSs1tPOeRmulaYl2h0a6t9YJ1+lAOu30pPQ28tws4tTNUcSK
 cQUuO7JdYM9vLM2qVNeU4SNMYw==
X-Google-Smtp-Source: ABdhPJwmoEVvDdR8qQRdV04HOFngocUMKJO1eCA5/JG9568jPZwHlfaQhyHCIPM6FHWK/LDN6YfNbQ==
X-Received: by 2002:a65:530d:: with SMTP id m13mr14654496pgq.128.1635633073650; 
 Sat, 30 Oct 2021 15:31:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11587714pfu.147.2021.10.30.15.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 15:31:13 -0700 (PDT)
Subject: Re: [PATCH v2 21/34] target/ppc: receive high/low as argument in
 get/set_cpu_vsr
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-22-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70f549e5-380a-2e12-2020-b92fd165d3ab@linaro.org>
Date: Sat, 30 Oct 2021 15:31:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-22-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Changes get_cpu_vsr to receive a new argument indicating whether the
> high or low part of the register is being accessed. This change improves
> consistency between the interfaces used to access Vector and VSX
> registers and helps to handle endianness in some cases.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> New in v2. Will be used in the next patch to address the problems in the
> v1 implementation of stxv/lxv.
> ---
>   target/ppc/translate/vsx-impl.c.inc | 317 +++++++++++++---------------
>   1 file changed, 146 insertions(+), 171 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


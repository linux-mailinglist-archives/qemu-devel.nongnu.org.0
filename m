Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B928A43E531
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:32:36 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7ON-0006wV-Kn
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Li-0005JM-Qm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:29:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Lf-0002P1-Mz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:29:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5021548pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EvlqDW9p2ZxLPiuy/99YP1Q+zRzG2xMO9G2FMIdjc2I=;
 b=avU+msRTMcNP9n26HEq7vtkMxCpqIdYEEfxc1SK51f8m1HmLE8QLBQ3vsBZGBLcNj2
 lA4xR6XbfKuSPbmp6ZpKetwyCNYjwxnsfdz4WcO+AZZKZEoxh1wczT92fnOuOdQ4o0nU
 Ae8bjpfYHlmm8yRqe2q3FJaVvXP7ACWVtheHZuYreBqiVM3hO9fArqNSoHltnecsCETE
 DSmQ867l7XzryGCBDRgZuHoKtcvIcr89C5DbUPsDwtwmRKmh3eK+4lSLVKscJlLTmYVS
 hO8NOF/28YvtP9+2l9CqyBmFEhmqSWoR2ZPynDz62ToSaYlyyBfejD0f0w7njNBAX3pK
 J6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EvlqDW9p2ZxLPiuy/99YP1Q+zRzG2xMO9G2FMIdjc2I=;
 b=F+CsZm11mvacC3JMXC+nZjJ3lzwzNHskZ4OgnEXSy25jEtHCebfJW9pg06+F3Y1Z8s
 UdG5KFyoevuNV7Hyz+9LSog8vv015IhRKwpFdpGEFKm5x06rGWjBg2S2bjXXGiQNHRx0
 i4lJ3RvuFMoF4mMxWwyEe19OZEvQSDHYiukRn0JQWzpPbkfmtltqW1NuFEvvTRS5H+Rk
 5qV+S9TIsyC9oFVQUl+ridTktlzpLopHsSyB/rCNqWz8uqVkT/RIk0My9YNyG/hp+gaL
 JDxK5lrU93pRk/1p/VTA62bYOYy91Plxul5ZKC9J90aNin11uKaj0bhrTo0V63J9Z+2U
 Z+4g==
X-Gm-Message-State: AOAM532nQnRRsmBnJLok6By6iZHq2qyjtadtTeD6+9FskHqD9zM3vsM4
 cktahmysl+VULA+AuCsMAJi6OA==
X-Google-Smtp-Source: ABdhPJxa4fSheL/N7gPAdHARY7BKOH9iZlpoWNv7SuDBNDovH5Rlnn025nhmJpHtXvmTsUT6ngorMQ==
X-Received: by 2002:a17:902:8549:b0:141:6804:5fb7 with SMTP id
 d9-20020a170902854900b0014168045fb7mr4591765plo.39.1635434985516; 
 Thu, 28 Oct 2021 08:29:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm3112869pga.65.2021.10.28.08.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:29:44 -0700 (PDT)
Subject: Re: [PATCH 08/24] bsd-user/arm/target_arch_cpu.h: Implement data
 abort exceptions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1b16626-1b3f-0867-43ee-ee085a881c21@linaro.org>
Date: Thu, 28 Oct 2021 08:29:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Olivier Houchard <cognet@ci0.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
> exceptions cause a SIGSEGV.
> 
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Olivier Houchard<cognet@ci0.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Short-term:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I hope to have the patches that make this obsolete go in this week.


r~


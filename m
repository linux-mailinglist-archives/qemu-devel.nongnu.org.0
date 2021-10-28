Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3D543E79C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:59:06 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9g9-0004mi-7E
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9eP-0002jk-Ri
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:57:18 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9eL-0003Mz-6m
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:57:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id l203so6732032pfd.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DaNu3bX4bE0t3vBLSD6sgEgQIXEaqDei4TVhavXzD88=;
 b=kDem403eNo4fhmUHMNj0axXHUi/Pr40UMEHpjcKKY8AHWYIgAeXcc1JL3jD9gbSCAm
 az9mmyzQY++bz0G+rOowm5Bg11gKlyFdl85eRPJOz5PPdlnHR9gYBecTlJfsmpTIR8ay
 DbzuDSINXSetgvgmxPEAbneuXfr5YO7mAQp+5cC3THuIedIm5XrrmdRQ/+JAJ8J7SGI7
 IgR0QXFuXzDJoSLVbJ09+a+asGfx/uD1m9HfCl9gqSvOrh0b6GWE6Y5uEOZSHa1CeFUr
 +vK1brt5fRmzLuoDI6zETJmSQzt7y37n3v8aylE9hJxP2ULkvMJMJO50HGG69pC856oY
 BdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DaNu3bX4bE0t3vBLSD6sgEgQIXEaqDei4TVhavXzD88=;
 b=nJOw01ERnqODPRGYQzSfl626KBY17saQesCx/u4hhRc/BGee9KCo6yvTVWT8pJiFP7
 8Fa8vUJ5Ed7+9MvGoD44WXjydZQNWuu1TN1RPyCllVhspsQ+KxUpnA/Yaiq885I0CAU0
 cipnrkc9b5TPDx1TO/WjqjUyGbVDGqi23VXaO1q3ICXvi79yi/mPbtvykepW+NKznYYX
 U6ekOWzRRWiAbyXHWrxFInulxuqjZknd4QTgPd+Bq+GMdseLelKOEL33hVwaK5qKPCJd
 HOcYtKXk7+m5Sj3x6zlNRD4rc6amQF4nO2N7wriorQwg6+2WtAfn4bd5wnSo/nNnH19O
 TaLw==
X-Gm-Message-State: AOAM533dBCuhxAZxFEQnLxNUe1tqygRMW2evdC6gi6bkBs3BCWrxiAJC
 SLSkgah0cWHpUJOSkXlIMGDKp6XeQ2ZK5w==
X-Google-Smtp-Source: ABdhPJxo6Qc2Kim1+/lao16ZOoKIJTQA8u8ao2nT5kf5pOMN6rZg4wUUJDGhc/Vk+ZfclaqaeNq3ZQ==
X-Received: by 2002:a05:6a00:148c:b0:47c:1776:3599 with SMTP id
 v12-20020a056a00148c00b0047c17763599mr5817527pfu.32.1635443831132; 
 Thu, 28 Oct 2021 10:57:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f203sm4110741pfa.112.2021.10.28.10.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:57:10 -0700 (PDT)
Subject: Re: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c25d8f0-3cf9-4449-4244-72bc3a90529c@linaro.org>
Date: Thu, 28 Oct 2021 10:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> +    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);

The kernel's set_mcontext validates CPSR_{M,I,F}.


r~


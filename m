Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B883E8750
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:42:14 +0200 (CEST)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDcJx-00085s-Ud
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcJA-0006uN-Ec
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:41:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcJ8-0006qm-Gg
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:41:24 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k2so358851plk.13
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cFt9Gyn+7aOapf2/zXHVSD4ofp3DgYKTRE2Qpes9Y+A=;
 b=fxouc87ViG9d+TcxIzh83aMdC4WIvA2bXAFm8aUm3FQ7r7uOgC3heZwD1q4Ohrlf2Y
 lcgU5VXJM8EA2fJjm23SGhbXEp8gRVoUMgwkbbHpsKRTNvVT3lTcwGdeFH+67yN2t/JL
 iu5SKUw47rlrzIb1BnX/pGgSxxcM3Sq2v8EZOpwnQg7WiKRxka01gaIWufqg23sOduUI
 mDOlOf2oSbzo/rWSlyeLrn4j/9OMjG0qwZVUKF6mQvtDf0W9R2xMpdyIUCE7L+f/ogjV
 3YqG3HgFIGeCEhIP1E6x3JY8hHHPdbd+n117W8+nV6vlRkl+68dIt3lMheHL+Tu1Hcxp
 xZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFt9Gyn+7aOapf2/zXHVSD4ofp3DgYKTRE2Qpes9Y+A=;
 b=sTGsGfpmtfBVXwlx/iOO61T3eAPnM9VMEfMHPUuvg7Ke/FlxH8ZQtq8U4VCZ1eulDg
 H28mawebbVMf4y6PgrY8RuJoPLZL0ACX4izattv0mLp7IsByq616FuatlWbOk9W3xnf4
 YOxQqoeqK+fNr2F4x5aw6+DECXr7o3UNHtmKhMA0JNtHKbscBl2MpoZPWJIw/ADZhPWU
 cch/l6A7n7IDfdKqwDcNPPskyf+6fttlXImDjLKdt6vszGTqI2hVf9nJwjpJPpNMaHvh
 AJWkBinRqVuBIOqS2UxagRVelhIyjDt89sTkQWnlA0A24dNmfy0OdqXsdvp16IN63kSp
 8dvw==
X-Gm-Message-State: AOAM530but5LWXhOShJF58mrccCH/JXNhRT4K38J+H8OjkoMVODtHwI8
 QHm22P7T/aDsj+29HA8hVZzQEA==
X-Google-Smtp-Source: ABdhPJyHMBOYT+m42SmhS5I5KEhiJyCDFTCF3dmYEEnYIgaWL6Gs/4nF/rdwpv/fLCnA02JBNysTog==
X-Received: by 2002:a65:4486:: with SMTP id l6mr237895pgq.145.1628642481007;
 Tue, 10 Aug 2021 17:41:21 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id v20sm18148pgi.39.2021.08.10.17.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:41:19 -0700 (PDT)
Subject: Re: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-10-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba7f8b4e-4e81-76c8-f222-ff12dd97b6d6@linaro.org>
Date: Tue, 10 Aug 2021 14:41:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131057.1694145-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:10 AM, Daniel Henrique Barboza wrote:
> +    TCGv target = tcg_temp_new();
> +    TCGv bescr = tcg_temp_new();
> +
> +    gen_load_spr(target, SPR_EBBRR);
> +    tcg_gen_mov_tl(cpu_nip, target);

You don't need a temporary for target here; just load into cpu_nip directly.

> +    ctx->base.is_jmp = DISAS_EXIT;

You ought to be able to use DISAS_CHAIN.


r~


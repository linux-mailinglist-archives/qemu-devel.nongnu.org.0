Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACA3F6ED5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:33:32 +0200 (CEST)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlXS-0006Jz-Kz
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIlWe-0005Th-Jm; Wed, 25 Aug 2021 01:32:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIlWd-0008L4-5D; Wed, 25 Aug 2021 01:32:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id x12so34473342wrr.11;
 Tue, 24 Aug 2021 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FIWErO73SBX5UngylpabmQRUGJ/nVtLLF8715oc/p5Q=;
 b=LR2lmPocc9Rc1VrhcHDpNij8kRsaThUmpujGPXNG5YARD5WABFeYUc/z3vkOGJtmtB
 ysq16D0BGoL/b9qnBb+nUmLeToBGQTJzc5G2u+GePg6aCnXKxgQkCkamrdDoqcRrRmUz
 27Df+uHuxYTig7ouWUDfqq9wMqgCMfOamSSvSWGiu/qniTPISLv9tQO77UfgnSC4h/po
 +ZlCaMV02mKrklKo6hyHlPMy/qKwdI9D+WWcaGyITLQK6Hj8vBxrTmvEpz8E2gqR2sFP
 tZKnOTs5sE/vmyy+EwjAr+iHwQxTBH8SOB3mTEMsaGEt3pn0au6UASDxlJY6I0zhUHLj
 +bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FIWErO73SBX5UngylpabmQRUGJ/nVtLLF8715oc/p5Q=;
 b=EZ/F2lSEG7GQMQDZaPF2/DzkotHZfZAwN+qWbFFwHW0APP2T35soLsXau1hcblr4Wu
 9giGIY5EwgRd2YpXRg1XDiK0kTpAPgAhFmHus9zDVj3h1Xge2swxMC4tOc3l88yXSs/a
 vxCp/Am0ODFScb+KbjtptYLMY2kVj++bwb4rbeVP1ejJ0nJCD0m70Az0hTCyv557lNpw
 Wgw9X/snz+j5edYkZz1e8g+owwD0fT/ZDJfNiluH/DXhle4M73c5oh6UtcyCLbw35ekH
 BoH2EBaEbwbf3hZI+hLbpk4Btiwo0cPIWGjrpHeZwm4CVk0tacA2qhLH4s8l4nknc3/a
 AITQ==
X-Gm-Message-State: AOAM533zMWh0fDmLHR/GkSvJajsUF3cnx6sp3lE07YhIqKCM4ry4uZHt
 9F0Uy/Qb6lOw3m+PGcmZ1uY=
X-Google-Smtp-Source: ABdhPJyd9R+itaili6yB30WL04zJWs9jDt6LIuMF4u4nO0sgMIQt9Y9RM3oAlhlH3lSBF/dMvgcgUQ==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr21117656wrh.356.1629869553124; 
 Tue, 24 Aug 2021 22:32:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f23sm4150677wmc.3.2021.08.24.22.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 22:32:32 -0700 (PDT)
Subject: Re: [PATCH 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7e3fdc6-ba94-ddf9-3973-598728d62d5d@amsat.org>
Date: Wed, 25 Aug 2021 07:32:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 10:11 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The definition of struct Int128 is currently independent of the host
> endianness, causing different results when using the member s128 of
> union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
> !CONFIG_INT128.
> 
> The only PPC instructions that seem to be affected by this issue are the
> "Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
> Left/Right-Index." Even on builds with Int128 support, however, their
> helpers give the wrong result on big-endian hosts.
> 
> The first patch in this series changes the definition of struct Int128
> to allow its use in the ppc_vsr_t union. The second patch fixes the
> helper definition.
> 
> Matheus Ferst (2):
>   include/qemu/int128.h: define struct Int128 according to the host
>     endianness
>   target/ppc: fix vextu[bhw][lr]x helpers
> 
>  include/qemu/int128.h   | 19 ++++++++++++-------
>  target/ppc/int_helper.c | 38 ++++++++++----------------------------
>  2 files changed, 22 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>




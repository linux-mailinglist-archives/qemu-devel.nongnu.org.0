Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F099E35EB95
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:58:50 +0200 (CEST)
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWfx-0002lF-IK
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWf9-0002HN-UI
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:57:59 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWf8-000718-Bw
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 23:57:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id a85so12405837pfa.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ugiE2Nh67QOiXWh1pCCFebSOuTzES9n+8WoJMh8COk=;
 b=gHTHl24tYnaCciCNUc2fqHG3hhL00vlF7+29gnquRA+GSJXxxGNEvcb140p3yRxaWy
 ypcXPRNsMrdO321bggWmIihJpQ7wOXa1HiUnhJB/rEUvGD2r6iBTmE62Avo/skl5BLPi
 M0MFPCwqQBsRdYuV4AcLIulXURBJzpEuF03j5dKASXxjeVV92Y7E/gvsuaQleEiyxVLx
 GT/4qbkQno4lMYZyR0/0w8OfGUzoatkr0dgKJDsmuZSg+GvO6jDVR9POJOZDhhxJ2BJS
 qFEZitf09AL8G5ddIJ4GyZ71YP3tsC2TjQO/BvoeSjOzhtdQ8u5fni/TdkiOMMSgHxVX
 GVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ugiE2Nh67QOiXWh1pCCFebSOuTzES9n+8WoJMh8COk=;
 b=OuyBi2A/cEZ9lKUznTeGg8wE9/r24SqFgf1tOZNa6A+RnurDVg28cCPrm5za9/8Cn0
 2XBbUuPm4QfXLhpjUwE2rK/G42PoVs+qbbEKMrnYok+PSuo6CV64n337tglIVGFIrQwL
 zXyNdQpk5dKgbMFUOVax6E65x9Q/KyIi0TKO5wb91xfg5tBOCh99GCC95NWLSgjwYXXq
 rmm7lEwdlJyEhdtsZjE8plRy7rimMznSvgWHNKoO2qxPR3MXJRsBzmlaHL8cI6gc6tz8
 a85IgLaQLFI0Sb//SD4+PPNV4GaLtEimzvmZE8M7XjcTgdUjU7wHvawhBAgZFcBG2A/m
 jEKA==
X-Gm-Message-State: AOAM530f9oo5VETurJqLY/uuCNjSIl03y7pszgJPsvp+K7hc8VG66UlQ
 pqxPzOdPAa9sjEhjmlA2LwCYMQ==
X-Google-Smtp-Source: ABdhPJzY+PDWR7oGe1YXHrsYOXxDdeI8Y0N6Uysv+XmGBzQWLvskndtrXC0/IJAeH5B0LC6rb5Rg5Q==
X-Received: by 2002:a65:4cc5:: with SMTP id n5mr35027864pgt.80.1618372676655; 
 Tue, 13 Apr 2021 20:57:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id l22sm1160520pjc.13.2021.04.13.20.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:57:56 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] target/riscv: Consolidate RV32/64 16-bit
 instructions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <c2672cba3d0cdb9f803b28ce684fe2a41bb05aeb.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8193dd2d-c039-8669-b639-60247b51ca19@linaro.org>
Date: Tue, 13 Apr 2021 20:57:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c2672cba3d0cdb9f803b28ce684fe2a41bb05aeb.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 4:34 PM, Alistair Francis wrote:
> This patch removes the insn16-32.decode and insn16-64.decode decode
> files and consolidates the instructions into the general RISC-V
> insn16.decode decode tree.
> 
> This means that all of the instructions are avaliable in both the 32-bit
> and 64-bit builds. This also means that we run a check to ensure we are
> running a 64-bit softmmu before we execute the 64-bit only instructions.
> This allows us to include the 32-bit instructions in the 64-bit build,
> while also ensuring that 32-bit only software can not execute the
> instructions.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


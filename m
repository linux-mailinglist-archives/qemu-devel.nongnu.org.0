Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8F415049
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:58:46 +0200 (CEST)
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7S9-0007H0-1S
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT7A1-00009h-Gu
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:40:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT79z-0006RU-V7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:40:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id 5so2379301plo.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vQ18/EwAgZAbcCcygBHk3guZupwnnVl194o5hba5np8=;
 b=eI8Mk52UFeiVnMZghKQI40qtQVWc1EzOqUplVPc36YLV01HXaw9mqfvMJCGhA4vore
 J06rkorPMukwQxrXaNVFczBs2GWe/HjmWteVNpCMuK73R4AM6K3ZHUEUIkf7TeDe7soZ
 U6a4UWetYtRBf316OcSldrmZv/BN14n/jz5JhXtR08ZoMDiTPHI/dpLZ6EvodFiJwe5j
 omgPW1MQFpP611mWa9kgV/NX2VsWdP4L2rw6L8l2sN7J4rqHDib00RcATgc4HhtrZV+8
 k0FwahuntHSwHZGWg2xbx8BDjhq5KrOYx5ZuF4+az4rEPhMwFwZZq2jhJenGM3Cadr5I
 MBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vQ18/EwAgZAbcCcygBHk3guZupwnnVl194o5hba5np8=;
 b=GMfi1KFRkT7EjLOQVqioLozacCUJILI8+iVNf0x/MS0WNxOVnicK4Jve7l0uIIZGdV
 3jITCJcrq1Kktg0uTcIZ3Ay0lxWRMbFm/4Lex9KB+ExUK+0ub23X3slX30NyiY4q5Syj
 5wVjz05HebjWU0X0csaof2vD8wVhKRrodTLsK2Nm2cLkMYD8e6PgyzmJWlxVWwMURnrl
 osSD/KFdvPKZsbPvNCwQSWELDrwE5VPYOlBOzP/7WBeicBx4a6l2TZRNucU9ausZgplO
 YLFcUDpRgP2lxm3O61NjKe1a54TouJjZnntEzOAZifFPKxqCTbLcbI9zxlr3kDDBwDb2
 THMw==
X-Gm-Message-State: AOAM531iQBweXgfVPAnwedNDowhpwKPipUwQD4LR4k6qmLSEwHzbOKYm
 LewcljI1TWLXb7MTxcCNeuBwSw==
X-Google-Smtp-Source: ABdhPJx+90hie7OXvHAEpW/EXOTH2UjFu/q27HWvNc1xjgl6O9+pULdrqOKIV54Xtl0hkfnRzXNOcg==
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr505584pjb.203.1632335998187; 
 Wed, 22 Sep 2021 11:39:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j3sm2997371pgn.12.2021.09.22.11.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:39:57 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e63bd14-8957-65a3-0eef-65a533a9e55d@linaro.org>
Date: Wed, 22 Sep 2021 11:39:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:09 AM, WANG Xuerui wrote:
> +    if (pc_offset == (int32_t)pc_offset) {
> +        tcg_target_long lo = sextreg(pc_offset, 0, 12);
> +        tcg_target_long hi = pc_offset - lo;
> +        tcg_out_opc_pcaddu12i(s, rd, hi >> 12);
> +        tcg_out_opc_addi_d(s, rd, rd, lo);

pc_offset = 0x7ffff800 will fail:

lo = 0xfffffffffffff800
hi = 0x0000000080000000

but hi will be interpreted as negative by pcaddu12i.

This is the same problem I pointed out with tcg_out_call, but with different constants.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D52DC44B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:31:05 +0100 (CET)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZhg-0006SO-Ac
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZai-0006w9-OP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:23:52 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZag-000749-Pb
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:23:52 -0500
Received: by mail-pl1-x633.google.com with SMTP id s2so13203098plr.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lC8nQqfu8dQGPkjZW5dYaCUo0QW0XatYBEpQzH44NM4=;
 b=tcys7Xwueozl9V2FI4q67+3lrj0AZqYvLMYZwJYeoj/sfnXZ5kKYs+/8NV0dVH9/H3
 3GOzoO2vRMf1576HDfO9bBEP24+S6bzt5cLtwerzX/8izlI8Y/viPT5LipqheNeunyM6
 N7XPd0zPh6uQ76kvD/9JnOPILmEvkvJamp0cLHz2VGE770OkmFKspofZYYXJ/AkWoZIg
 ddvfr0J0t/EiXaA8H6i8Fp2kbR2lRSlMi7MoJiQq/byt8xD/mSvNZYAvEwmIImNeP/BC
 3yR8zTAnY1ZdfqTNqle58ukwzYnq1F0kxdZBZLa1j8TT+1ObbSRY/vfzonglWgF+QOOW
 TI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lC8nQqfu8dQGPkjZW5dYaCUo0QW0XatYBEpQzH44NM4=;
 b=mO6juis4iSNdQUp4nOYyvCIpfB1RdE+vpmbZLJDYM+W7jvl0F692bxbqI09P9vQUo6
 SoiTgDs0WMQ+/Nf6K6Ma3siYNyTEKwkroBvcqUL02B+wptWbgkU+H2CDiTLx75a+r8yF
 N5cle75uiGCy4SfpkqLCB/NfCVe0Jui9J7NQyUupWJnYuzI+Dy1FqM5VOwikmudFViFf
 GuNRYawAEYHFZ60pWw0J0FnrNpZwKhjHkL1Nao1PXONEEnUy0zdtcl3gZsborCaQalgf
 TTxD4y2hi+dLULxz/QJWoY0g8K6gkrwhbTXtwSCCoI9wsghq1zq1V9cmD4b1g4dwOaPD
 Uc2g==
X-Gm-Message-State: AOAM533fe0lEAS2lMmNrm0/Sd6GbK7fQp0vYpgUURp7w1pZ/WBy2RGhT
 TE7f+sRH6/XwvDArCrYGfdnPdQ==
X-Google-Smtp-Source: ABdhPJyIeelRAEYq8BQg1d5TQ9IJN7y3/aYJB1J+gN9q/5jLHcFqLdM2EmFo+qKmvs7ZPQK5lfSVsw==
X-Received: by 2002:a17:90a:3d4e:: with SMTP id
 o14mr3665953pjf.44.1608135829351; 
 Wed, 16 Dec 2020 08:23:49 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id z11sm3045078pfj.191.2020.12.16.08.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:23:48 -0800 (PST)
Subject: Re: [RFC v2 06/15] target/riscv: rvb: min/max instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <627060be-b9ab-0d9d-285a-10fe87b359bc@linaro.org>
Date: Wed, 16 Dec 2020 10:23:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


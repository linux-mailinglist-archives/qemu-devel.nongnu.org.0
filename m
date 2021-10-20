Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C443559A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 23:54:37 +0200 (CEST)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJXg-0002Pe-P9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 17:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJWm-0001bx-9A
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 17:53:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJWk-0006iS-No
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 17:53:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso3429509pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BOEuu+eiF9kicbUIz/AfhoyawPtDvbLp0qnj02a8xYU=;
 b=IT39u5toFDWI9/ZcjU3kZ4k/VzyUNHQeY93TppmBi9e8wqEPcTj7O87w7/pJ2w98gz
 m6nYcGPJ3OlmwBAY2fL5QpB+AL+lL30rbnOGG+HKzU605mEu95s0tE+3tHqNnptlfOYb
 MIaBxtUgfLTxuAU4JarwvxFAphIDIshP3hDyj99buMIq7vyWcq+VK25fahdlhBLbsmqZ
 TuM6MmUBp1MHk1j8IfEM7MU+/W65E/8pcVT5yauYqLY79iAhpHjzY7vBdffuMASEhpru
 hZTA1+5V/H/FCN1V6R7+YQ5GlHU0+J0wlgCPcVRN3IIB8Z+vJmiaVrWJtvxQaLEA/xG3
 WYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BOEuu+eiF9kicbUIz/AfhoyawPtDvbLp0qnj02a8xYU=;
 b=zsPYexmCyGlXzO6gD20o/60nZypVa694IOTQJhpV0vhOQyA401/eO2/x5j2efkgJ8h
 OtuE3UpaQ7Ywa4egfQnVCTZZGToxwZCU83PGTTwtykRmT4tLkOY9t1ahmi2w+v9T0oTf
 RxzpfPgIZQ0XTm6Ma586KXpVC7iiFDc0cE2vHqjnMJufFaIygjIMNf9CsD+xb5ocDvoe
 QbPVzvdxtr9xA1//2hpWGvU6qZj0+IXG3/D2EUKS7YJlNvGdjVu1tEsCXhVFtPCZq6LS
 YC2AA4nXnFodZcpS2TJUztWMMDFAGuQvqVKO2w3IkbwH6myAtvFt/BoE0qKuxbA1Z7fP
 O/ug==
X-Gm-Message-State: AOAM5303tv+mz4qhKqfvWexDIpA+yqi0XMC6xau9P6ihZR2BoIqWuJoN
 oYRUR0CXVpj4sxCL2ztJX+Pi7Q==
X-Google-Smtp-Source: ABdhPJyYxx9LlJDsUXxyWtb21pTlg2uak1Q1mmpuYpOykWckUCKAJjXml9KpYCnJ/w3qHU6BNyCSgw==
X-Received: by 2002:a17:90a:ee87:: with SMTP id
 i7mr1820878pjz.194.1634766817159; 
 Wed, 20 Oct 2021 14:53:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c205sm3437367pfc.43.2021.10.20.14.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:53:36 -0700 (PDT)
Subject: Re: [PATCH v3 18/21] target/riscv: modification of the trans_csrxx
 for 128-bit support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-19-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2bfacfd-ae4c-0922-a4fa-228613708be6@linaro.org>
Date: Wed, 20 Oct 2021 14:53:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-19-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> As opposed to the gen_arith and gen_shift generation helpers, the csr insns
> do not have a common prototype, so the choice to generate 32/64 or 128-bit
> helper calls is done in the trans_csrxx functions.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 201 ++++++++++++++++++------
>   1 file changed, 156 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


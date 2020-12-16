Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221062DC6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:52:55 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbuv-0001uw-UA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbtW-0001D5-6c
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:51:26 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbtU-0004sT-Ga
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:51:25 -0500
Received: by mail-ot1-x32a.google.com with SMTP id a109so24035062otc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CFdJtTdIJY9D1RVwC+Zv+uF0ekcdFvsxzfdCzea0u0I=;
 b=MM8LZ5ikbYNec+0jSoAQZwGwIxQr4BX9vP3xz67FWlD82YR3cBZpouRoz14KcnWku+
 uTGkJHetwx0HA9Z0yTJK+RN9HnvsfOi6h0YPItxR29Piy3N7Zxky7vkBn/pBU2qIyJvN
 Mzmivh52dzDv40IYNyKfycQrV+52NXeIz3JLFI9xXpSHK9b8LBCZPRk1L+/777kIh70c
 vv+1IZhTFrWxUQGJYiybLJzLnI52p1SLvuagAH4r8RnzF/0o1CuMFIbTGHL7L+MIsMdB
 ss/xf7N6r8i8h80K5HkHZ5lXKOrDyANbIyjw/1gwmDX1/h6h2yCJ84nul++AD8GH2zHS
 OO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFdJtTdIJY9D1RVwC+Zv+uF0ekcdFvsxzfdCzea0u0I=;
 b=SNDD8N8PTwkIHqL0QJuGuewsvy1xTu3DjRi2UzSX8hA9kckNfT6fCJB76VOmcvwX0/
 iHi24G3gswRkyjnwRFgMAiQ1Lb65j8w4jCpBrLF5YaHEihopL2nHUNrljKomA8Y1TQ5h
 Cl6Go/s0hGNQtElpjvz1K/U+rN6lYzGNzAuPlal2Cc7hBhCk3fkHKP3uTJlRP8nereOr
 jWpCQwu0KGGE63EjJqCjbu1x/16lFRQVpCmhBCMHj85KnvSRRB88lDY6Q15ZFkfK0dH/
 GPxxBYaOmXXksz5h5f9n9SblW0mPjkRU2XZFz61UzSLmO1NtKFK/W6k87KcDiEIGtuby
 Pgpg==
X-Gm-Message-State: AOAM532/zHfVma7LH3qwJg4NRQgvrIzorcvpk69dnVpLg013nAVDNUAs
 OnvP8551bpJEcLfX5Ac04K/OAg==
X-Google-Smtp-Source: ABdhPJxlPPXEEcL9sioEfnMnrUt8jLkJzEBRofxgtR0R95nn8HJsJQfQQhzJw/dY1cc20wUb8tR+rA==
X-Received: by 2002:a9d:590c:: with SMTP id t12mr26637779oth.308.1608144683349; 
 Wed, 16 Dec 2020 10:51:23 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm622227otj.67.2020.12.16.10.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:51:22 -0800 (PST)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8bf1977-18aa-d08e-a2ad-efbeef4af3dd@linaro.org>
Date: Wed, 16 Dec 2020 12:51:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 12:23 PM, Alistair Francis wrote:
> Instead of using string compares to determine if a RISC-V machine is
> using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
> us having to maintain a list of CPU names to compare against.
> 
> This commit also fixes the name of the function to match the
> riscv_cpu_is_32bit() function.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  8 +++++---
>  hw/riscv/boot.c         | 31 ++++++++++---------------------
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  9 +++++----
>  5 files changed, 29 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


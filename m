Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C3229CFF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 18:21:08 +0200 (CEST)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyHUR-0007Wx-AF
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 12:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHSe-0005VQ-S8
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 12:19:16 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHSd-0004Am-9j
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 12:19:16 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 1so1535830pfn.9
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1Vt0n3Xj7aKrd0m0W0pivNkeO1i6Pu+6tItym+hE28=;
 b=O8b0tiIgmyzrH40uU5m4gW8hWfvGr2gHWPmVaiwQM041CSnQ1I9Fabvvu7v9Zq9G2r
 cKzL7mMfbYBl5w7mt5zd/8jpJMcNx2y/lywOYDQuJTDo4Ssv2+9GIJT3BGLFVVmwIDEr
 6EEdN8HpK1d6Dc2oipC6CCKf6QTJYlV1ViAKSEbIp5wbz7chpdteAHKGt4SmbedCSrMP
 cy8TWFkOThuByFY0bwitjOaTUyt6zBZYM0XMaMcinDYm9n6R156HcrYn2cLJqFOZZ+UX
 xsCnUAfzqqrLPADwl6el9ufoPVh3Wqib7iTE4/nx65a6UE1jyYmmpMamsVuTPAQoJMkk
 1/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1Vt0n3Xj7aKrd0m0W0pivNkeO1i6Pu+6tItym+hE28=;
 b=jLh/r2fRNDE89spzyPGPMEvllDyiLQS2R09sdwdSudQBv6vDP65z1tJmB+9rQUptOQ
 Oo8Ml/PbY1ps9ffmnMWJ3gv9fFtYDgSbvEhEqUJ3UB2R2izAxDA4tJMjBNc79NQSh1h+
 mhk8UJUSc6dbEL7Oy04lkXJ6Y1moW4L0hsecil+BvqZUMuYakfwHpFEUgZ6Rz09uy6K+
 IlSgnWznRdtpPvTgvsjFQuXC2cYH3JQXDjvPGlZ1dFUUl+M23Eq5tux5e7gmR2aikAP7
 vhwBE248pGw/GsBb5+aR+2YiLovh3pa2U6QjUxDHBM29+Vgrg2Zu4dINMYfhGZM8KnuR
 lnKg==
X-Gm-Message-State: AOAM530ULJbaH1yweXAV6sXrir0fUmNBZbAe8XW6GsPGkAW9kRlInyCF
 3N5oB5/+IzfKP9mmKt6iSZ7+WQ==
X-Google-Smtp-Source: ABdhPJwqhHle0TasW2iBLdjl+yaKxt6YJ8qgO+afGZNc3XUfY8uQpojrqJUMrXlQ4etdNobUiHVyRQ==
X-Received: by 2002:a63:525a:: with SMTP id s26mr505177pgl.155.1595434753797; 
 Wed, 22 Jul 2020 09:19:13 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 b14sm77733pfo.28.2020.07.22.09.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:19:13 -0700 (PDT)
Subject: Re: [RFC v2 07/76] target/riscv: Use FIELD_EX32() to extract wd field
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba5ce958-8b01-7b97-f8e2-09a2ceb9ea8f@linaro.org>
Date: Wed, 22 Jul 2020 09:19:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



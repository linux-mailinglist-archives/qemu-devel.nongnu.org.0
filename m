Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065B6EB523
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:45:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzUe-00055k-NT; Fri, 21 Apr 2023 18:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzUd-00055Q-4X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:44:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzUa-0001fs-AX
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:44:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f193ca053eso7675635e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682117074; x=1684709074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwEIh4Q55I928V/XPvZHdjRigrQchh6XDQxCBo/eye8=;
 b=kWGg1M/SwbPftBuJmLMsfKv5t1tQRqvTG//eex/A/QwFb9hDQQviO6gKRFyam3gR4M
 FdoJxjw80Yh32I9X/5psJpPZayF+o7rMMAYHT6KUdx9L6CVMn8b4P5xX8hpAXQWd/Bec
 evDWYwXesW/P44FpiHEVFe6J6a/zotQiUArpmTiiVjpB5eblikP1wJCxzqGF3w7uuCA3
 2oCF2va5Uv7hZhBzS8LdWaVRjvyo9pMOGzLIdXZponVWtiYQDZzsZsLXnY/XR4DaRcPJ
 cgcgrTRNXKMkcKF8puPYfEWXyROLfJg7SKby/NoIB5meUQgXug8XRMvDBw/D4NqmeUPx
 l2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117074; x=1684709074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwEIh4Q55I928V/XPvZHdjRigrQchh6XDQxCBo/eye8=;
 b=erFP0PgaKJ7qKPsyEjW7Jqr2x5jdq6tLpEdeFRUtpWlmvzKo1eXcjkIXVYJextN5Qx
 7nDDPpXutoUb0aSZBICwEC9KRg6icZ3hxAgqG8WNNJaV3djiCifeE23WsuAuYUNHksN1
 pjvDyjrdFSN4EcgSjm+lPIGgb4vKePL38G7e73IZlZ+jgii5tvF5PmZISbnrtsU9OHIG
 Tx9/13zEq+vQ7vCGFvhQagG3CcRX5mJOC3n9sA8jDOGjqt2+5xU1YIhp9dY07NiOUggO
 9wrR/UZ1VBBow7ibAOZwVD59KjNg1aX0czt+8bRrKMg9xhlntq/d/GOCgdXV2iL+fLPr
 fP3Q==
X-Gm-Message-State: AAQBX9ecGHjUOolMrCmpT9FGA9mKHJ7TmD17K/lgcHvjv+X1opgIpEIk
 yiLLNuGtSPPZBXAKsvF8AC+2Vw==
X-Google-Smtp-Source: AKy350bDhDb9mmAE9HuxUjlf/b0UKprczwzApjW5gLGyhGbyHLoezt/tZ/vSOyoSjTWwqVGwXZlhWA==
X-Received: by 2002:a7b:cd09:0:b0:3f1:78a7:6bd2 with SMTP id
 f9-20020a7bcd09000000b003f178a76bd2mr2953809wmj.27.1682117074426; 
 Fri, 21 Apr 2023 15:44:34 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f199662956sm206432wmc.47.2023.04.21.15.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:44:34 -0700 (PDT)
Message-ID: <46ad56b7-a16f-1290-b5a1-780b094653d5@linaro.org>
Date: Sat, 22 Apr 2023 00:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 09/54] tcg: Split out tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for type extension with sign.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 4 ++++
>   tcg/aarch64/tcg-target.c.inc     | 9 ++++++---
>   tcg/arm/tcg-target.c.inc         | 5 +++++
>   tcg/i386/tcg-target.c.inc        | 9 ++++++---
>   tcg/loongarch64/tcg-target.c.inc | 7 ++++++-
>   tcg/mips/tcg-target.c.inc        | 7 ++++++-
>   tcg/ppc/tcg-target.c.inc         | 9 ++++++---
>   tcg/riscv/tcg-target.c.inc       | 7 ++++++-
>   tcg/s390x/tcg-target.c.inc       | 9 ++++++---
>   tcg/sparc64/tcg-target.c.inc     | 9 ++++++---
>   tcg/tci/tcg-target.c.inc         | 7 ++++++-
>   11 files changed, 63 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



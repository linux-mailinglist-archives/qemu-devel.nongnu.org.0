Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923392DB61C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 22:54:48 +0100 (CET)
Received: from localhost ([::1]:52528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpIHP-0005Dq-9E
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 16:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIGA-0004DY-AW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:53:30 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIG8-0003Dm-Hv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:53:29 -0500
Received: by mail-oi1-x241.google.com with SMTP id x13so16035863oic.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/yFxPiSM6GCFfzUAxqJN+y0mpvMWm6NgB9vP+R0K//4=;
 b=FBv/iKG0FmqsO/o8akgboY7dkQ2cT5qWreho/vI6ClruxKaDlN3N5pAgWThXbYktBo
 4mc9vRCAxSqLoH9km3nsTnGXBYweSK2PXtgfyOtfThDQHK8COl7aEb2JJ2rUpnLgL5LN
 lWm1B34fEVpHkNSsoqLQilu+XuxazBlu9k/ulo4u1TlCj1pJigy4P7NqRlMitJBlcYcl
 GINCUs/43m09mKW2YjSofU2OD6i07KqGzEeCLSULmWCs+nNNpXKyl6QQ6OH2E5kSPXK4
 V6dM6gw6ooc3ee5FHunocRizdPQM8/pD3sxeFbvDNJ7sLw5y30exHUveXLh7+QDJ/QQJ
 PPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yFxPiSM6GCFfzUAxqJN+y0mpvMWm6NgB9vP+R0K//4=;
 b=DKgPUJ+xCLVMgbmXaJZLP8Wg1hz2Cwp/S/1hxslIqnUtxxhVhQcoDp7bNGTsmkEhn8
 lNDoNl7N50z6e6MDNr4Mib+xwJP9XrUvn4oMSTHBAh6zSDGgSu7ZnOQLKI8Ppil7XOit
 KIkEQB0O5BDfBJAVC4bUcSBIotomU4LkCF2q4NQj9nB2dxuR7GPDGPz0qJ6raJlFDgjt
 cU0OhbBZXhwe+09WeSjwlCn7qklqfPtJutfaESI94gk0hi2x0ppvbot+SVz6bWTu0hBi
 wd5ZYD5rsk7oB3VszEcLTfO9tUXlzKn4r0v2BEIxFudw71hu6AaZA+3sw4ovx3xSbc/F
 06BQ==
X-Gm-Message-State: AOAM5301B2RLa8sQ0rhLkkojK1orEuGCjsh7rNYdz15jUM6m6+c8HQd0
 vtyk/P6NUP7WzcQ9N4HA+yAWmA==
X-Google-Smtp-Source: ABdhPJwQxdKn3QfQXn7BMLlZWzlS8Ll8fKhbTwDKW5Fip0kpwSfo06CYkSnIaqeFcDjxj6yLruq0uQ==
X-Received: by 2002:aca:4c1:: with SMTP id 184mr541495oie.157.1608069207354;
 Tue, 15 Dec 2020 13:53:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f10sm40861oti.11.2020.12.15.13.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 13:53:26 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f35d417-753e-5949-aedb-bea3b68b66a9@linaro.org>
Date: Tue, 15 Dec 2020 15:53:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214202329.26765-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 2:23 PM, Rebecca Cran wrote:
> +++ b/target/arm/cpu64.c
> @@ -620,6 +620,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
> +        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
>          t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);

When the value is not 1, we have generally added a comment to clarify exactly
which extensions this covers.  Though it's slightly annoying that F.c has
renamed all of the extensions.

With that added,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


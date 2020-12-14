Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31442DA30E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:14:03 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kow6U-0008B1-Na
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow5k-0007kR-Lx
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:13:16 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow5j-0004X8-AA
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:13:16 -0500
Received: by mail-wr1-x443.google.com with SMTP id r7so17947728wrc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LdJ7PB4Olm1N0Nwof5g4FFaosxc4Eh6eKNGNXE0AwWQ=;
 b=l9kH4/XqbNkwz0wXFcaTrmFsfc2tf9PiE1+XgsIJNs9nboDngfcsCJoXDccMVxHdl/
 5bGVhoVHOcNfzrkzlH0TV4P8s3X2yxpjzKzyevh5geCrkX2nh3yhCsYFasUe9tgwLNbb
 6RULeYpMQnJhYfWwgTedJ2L7Z7WvRueKcEPw5DyJAP9LuuJb7wBpi5qwiVvfdKBs8JT9
 2zwk9FhqZdSP8qrNBgOFGQuLz4neLbfMvuoquWPxwbiSXYWa/YVhmG00TuNRqrKg4Egb
 L808w05UjnuVJwGUx6Uh+B4KjNuRd1zxHdsM0+jQtJ3SLuaKBl0bI7SKoEFcxlf2CuJ8
 d+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LdJ7PB4Olm1N0Nwof5g4FFaosxc4Eh6eKNGNXE0AwWQ=;
 b=oNeUcORv+GuhjpercyqwsBYUpin4y0wbOnzxQj51JWPiSwZL81qrzwaeEKm+1tug04
 qqYNbq+NI6HuKa8I5AKyvliRLJYf1otvpHzT2QOZr3h9GedlNWtq5GLN8gAgmn4agEjf
 DqFblhimy9B+FSS1aCwXW6roZa+XrmW1IIuQMPq8WD6sGcOIhgPDOJ9Rip8reR6Xu3/a
 jhIqn4RbPDvakBc46ljJnUEEgaSw8+iDq4wPnji8HqA3VivfaN3yM0tmek38ypvtDH5E
 qQGgm2smwpDaOhRZ1TOYtjgPtGpdBwAEg3G4lqxqRNslpg6fm9/4EipRxSJWk1dP0YJp
 7hLw==
X-Gm-Message-State: AOAM530EN0u1NtAuduAUfYEOOGobq6hv4KFvE0uROem7bNTUq3VkNMF2
 16EBf3x3y4iPfj7Q6/d+iQocdxEQ3zo=
X-Google-Smtp-Source: ABdhPJzoHpS/DieNwwUt62950NZjAvlRGu0qr9UfWpzFi2ndvadMhYga33NQcNhhRELcWncce8sJdg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr31171528wru.174.1607983993204; 
 Mon, 14 Dec 2020 14:13:13 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a65sm31746766wmc.35.2020.12.14.14.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:13:12 -0800 (PST)
Subject: Re: [PATCH v4 24/43] disas: Push const down through host disasassembly
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d25334c5-1c2e-2c7f-1f97-7487ed1215f7@amsat.org>
Date: Mon, 14 Dec 2020 23:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo "disassembly" in subject?

On 12/14/20 3:02 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/disas/dis-asm.h | 4 ++--
>  disas.c                 | 4 +---
>  disas/capstone.c        | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


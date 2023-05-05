Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6716F804A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:45:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pus02-00077w-CZ; Fri, 05 May 2023 05:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzt-00075o-I4
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:45:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purzq-0005qu-78
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:45:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bd87539c2so2441483a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=DOcqxeSu/bMOczf66pZ+OHLAFH+Jr8gZCsoI4/VYVy26cgWL8Dr9oq4rP+V+kzUbjk
 4cxNXbe9shiWhZ/RNXObm3F/PDx5dnxSG/dntcqoqMu35n5smjFdbuyj+diqnOzUUQiX
 E7soXGucW4NBPrSGd722qqTHtQBjpmUzEIoNwlz90Jof/sZbqL3MhwgFqlxAlkDcBbqL
 Dn/O5LfeyGVcUIX0xaf0hvHzQMvDlb9GOR4BcsR3NMKXQSu+/PkIkgF+ulhG6JLGWZ8q
 RpVwd0a0dE1xchV3CNih/YfKCToRAx1+1ivVDEwCMT4L8kP/BxUjAOehljCT0R/e/1u0
 hNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279899; x=1685871899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1WD+C4dJ1IAEdT7Vk/hZTN1+IxIvCygCU4Mv4ZPKpI=;
 b=C3txDAsQzbF38VsuNZQYqGlKoTkX76svbpWobvb/QmTvopWfYl6w90Oe3I+elIE9kv
 zp40rmaVAQs7Uvmza3ptBqrxSumTUz4TdVTTznrEZngTiwJWB+V9E2Vb1QgYRMHwG8E0
 Rh+e9qeKtLD66rWu6gw3zpWmp0JqtUq/+uAJT7ZdrddU0i2Ts765VcV6YZWwuX2y8bTV
 iecl4ie9RUbhxTvZP8k7+1jX05L6aNP/K74ul19XXT7ls9esxajjluI5XTTPGXfFQ+Td
 OMmjrT4Sk0U7LPJPJlYrx1co0SlQ5Wip9szbXz9E2yeB0U9aVkJIqRCo8Os8OIONNL1a
 fHvg==
X-Gm-Message-State: AC+VfDxBpj1C5fzWrfW1qQ3eTe7Io0RbHrryAF/v7Fb3o+/UHvMspyzo
 48LhMNHUq3aNn2if3+/Jahv8UuJvw2PRCgtaHSpoFQ==
X-Google-Smtp-Source: ACHHUZ5tbAQWCyDQJ4Oe/IHo0oWJ52M4qDlwSfUPnepNPkViLGJK0WPn5L3Hjin7OL5noyLAD/DZll5BCaNRvb+iNAI=
X-Received: by 2002:aa7:ca57:0:b0:4fe:ddf:8d8c with SMTP id
 j23-20020aa7ca57000000b004fe0ddf8d8cmr915781edt.13.1683279899509; Fri, 05 May
 2023 02:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-12-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:44:48 +0100
Message-ID: <CAFEAcA8gc7xkrkATWkrb2=vktB6zpA2TS4s4bZvHQxvdArQB+A@mail.gmail.com>
Subject: Re: [PATCH v4 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can now fold these two pieces of code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


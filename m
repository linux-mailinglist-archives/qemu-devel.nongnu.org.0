Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE38A701CAA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 11:40:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1py8C6-0000gf-Ln; Sun, 14 May 2023 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8Bx-0000cW-7K
 for qemu-devel@nongnu.org; Sun, 14 May 2023 05:39:04 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8Bt-0006Tl-F5
 for qemu-devel@nongnu.org; Sun, 14 May 2023 05:39:00 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6438d95f447so8072253b3a.3
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684057136; x=1686649136;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2g5PXOwr40p6HO+Bm2Oq9nKiLzZ2rVVlujSultU7uI=;
 b=c++rcWCk+f9T3ZAUNdgPXGVcTQ1lCM1tBR1/w0Iz8uPzQDVfL6CTMWWoIeihHnu75v
 0tUlPVUtllGvVkWyJzDo7PPgKZ9xZEZfohnveFSIOpAowLRNyqW7OxbjlMkntFZn4GEZ
 y8IN85Ry99oRKMiGdN0hA7x+r7wrvD0PzZeAyiL91WFoVOohH8Kw1NpTBlVPhlXut5MY
 2eNPofycSeudTpXSKnvwhPk9WlIkrG1CsjcuCCEN9CsezImmfXEUAjfYuc2h8X6SfXoA
 rGcVe1f/sV5GwBtLJwWJieMng8UXEzdO/JNKJ2uP65i0JvnKPk+EJcqJu0xloOkwpI5O
 IKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684057136; x=1686649136;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2g5PXOwr40p6HO+Bm2Oq9nKiLzZ2rVVlujSultU7uI=;
 b=ghjL4fKCne06z320qFJEJFmyGh6wqcxB3akviceoo9A/lSjz7viZKVZRXmEW3ft/J7
 sS4zdfQ3cEr5zjmnlFP1NzWzWf3lIQHOD6xYrcY5HOD2c8NWunPngkTbm5onkCR/ooPo
 Y0UPHXFxEhXMUwqnuFzISSpx15EOJw2y1qDNOTBz27wWemGSyTNUyPwmHlEmL+oBa0Gr
 qbVNLOxOq57HPsLOMNsgpxswmsV43L6DSOKIhBun31WupE4qS1yJMNw1kt9KbTo3+Psw
 pKYNS/an6zYjLn8gNgBleSA9kiiAXmsygmL3ot+vpMKkODhJUkkDuy5aq+gF/vT9csP7
 ogNg==
X-Gm-Message-State: AC+VfDw2zj/VDHPsYxMpwoao3gd4y/8yM6zSIREMIvPCovgDDxTH5mbo
 XcivLxPIlLlRCoB0bntxxhd+iA==
X-Google-Smtp-Source: ACHHUZ6n6BHjZezFo4bGcE8K3hXc9l0owzwXJQtPzEmKJsdbnNW+HRvZwfBByTRuSywUdjDyg/arwg==
X-Received: by 2002:a05:6a20:158a:b0:105:66d3:8538 with SMTP id
 h10-20020a056a20158a00b0010566d38538mr3397502pzj.8.1684057135889; 
 Sun, 14 May 2023 02:38:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:1836:b4ca:fe24:b474?
 ([2602:ae:1598:4c01:1836:b4ca:fe24:b474])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a62ed11000000b00649ac17779csm5618870pfh.160.2023.05.14.02.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 02:38:55 -0700 (PDT)
Message-ID: <45ca2fa9-3d72-e0c4-aecb-10849c5c90d2@linaro.org>
Date: Sun, 14 May 2023 02:38:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of
 'flashalias'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
 <20230512170223.3801643-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512170223.3801643-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/23 10:02, Peter Maydell wrote:
> In the vexpress board code, we allocate a new MemoryRegion at the top
> of vexpress_common_init() but only set it up and use it inside the
> "if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
> This isn't a very interesting leak as it's a tiny amount of memory
> once at startup, but it's easy to fix.
> 
> We could silence Coverity simply by moving the g_new() into the
> if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
> when this board model was originally written; we wouldn't do that
> if we wrote it today. The MemoryRegions are conceptually a part of
> the board and must not go away until the whole board is done with
> (at the end of the simulation), so they belong in its state struct.
> 
> This machine already has a VexpressMachineState struct that extends
> MachineState, so statically put the MemoryRegions in there instead of
> dynamically allocating them separately at runtime.
> 
> Spotted by Coverity (CID 1509083).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


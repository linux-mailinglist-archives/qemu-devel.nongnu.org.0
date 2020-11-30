Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2672C8182
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:57:09 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfvg-0006y7-UH
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjftn-0005xL-Ma
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:55:13 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjftm-0001RD-8G
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:55:11 -0500
Received: by mail-wm1-x344.google.com with SMTP id u10so4595275wmm.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+9gDuzNedXqMd/oZNuFtUpdvDfCOYh0ltUe7lOaRTFQ=;
 b=uVOP/W+ogRogRBY4MshK5Rps4Kip3Qnedm9e0Tf3ilwhnUVeq9I1Sr5+JUtVvN03n0
 +M0apAKxmMu7YJtTZF41yL0rGRa3Vt6TKEXObcYyWhIKmfzEIkq4WvOzWMENUCVQvOVF
 nRoCGm9/9piQXn3VaT1EA+DEmPphNWJkhwakxcejPtRJRetzCwq4q2c4209ps1Vnxs60
 2n70gS/kr3YGXfO1gspFpHkbs6im4lPjPQFYt0IfHLd57jR29xJRyAcBWXL2OopinzEX
 S6TvH1vhBmaJMr3yJ2cGOZ0g9b9g9pW7aHx0hEPkvY3me8eBJc9iNc5Eol69K1A0Gsq1
 G4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9gDuzNedXqMd/oZNuFtUpdvDfCOYh0ltUe7lOaRTFQ=;
 b=ewyv35BG373OpJeI32JaQa1g5qqcaMrVhpY1Y6y8LMkJBgKb4Yh5NOEchciKxTSKQe
 Lut2jgHqAwhd4Tq3L1CZ8zRToNDrD+7Mlh4AwkbOTZ6MMedFf7zeaj2WUTgbZQLG2MKD
 jTLMDRMrEziyumYAmLaW5uinFA45YCy6IrK2flJnYW/qQN/+cGLnTqpyWU3s0KoEUmFk
 RND6BKNBhpscfFILhx0Ah6iecX2TvbtsaMdny53wT9qTzx2h6EQv1MP+nM0jC3MvbGgW
 snwDEk55D8ZwaXrJFWsn3zwljjk4K/3vkBcU6TjLx83lJ5kbQKUTy3BBmaku48JMKch6
 sW/Q==
X-Gm-Message-State: AOAM530bNbjmAcgrtE+2yzoXlTXo6mVLbzZvcNgNyGgJ7yFtNZ6il0hZ
 QQYwCnOPCA0Tb3WK1qufNT0=
X-Google-Smtp-Source: ABdhPJzvi4iQfTLfOAA+RPsGvQ7vEo0GwZIHZXnLO576IgLUf/OiZ0DtIKqxlEu5ON7RGYzUrYtv1g==
X-Received: by 2002:a1c:2502:: with SMTP id l2mr15758882wml.40.1606730108875; 
 Mon, 30 Nov 2020 01:55:08 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o203sm17849124wmb.0.2020.11.30.01.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:55:08 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/nios2: Use deposit32() to update ipending
 register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <449fb85b-6c0c-1570-b9a8-3f88f03b55ce@amsat.org>
Date: Mon, 30 Nov 2020 10:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201129174022.26530-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 6:40 PM, Peter Maydell wrote:
> In nios2_cpu_set_irq(), use deposit32() rather than raw shift-and-mask
> operations to set the appropriate bit in the ipending register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> In patch 1 I left the code for this identical to the old
> code from nios2_iic.c for clarity of that refactoring,
> but deposit32() is a clearer way to write it.
> ---
>  target/nios2/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


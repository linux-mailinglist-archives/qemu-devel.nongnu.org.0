Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288C4AC9B3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:37:52 +0100 (CET)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9pc-0001BC-7E
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9jG-0006lj-TE
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:31:15 -0500
Received: from [2a00:1450:4864:20::42f] (port=39858
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9j7-000273-4j
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:31:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u23so2897193wru.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ms30aRtLybppVnl+LsnaCt+oMOOUCgGJAClMaVt2msc=;
 b=D+sdEMnqMgP+4PPXtgc00wWS6Uc04XKv1MW6XMXHW1cjVrR2Aa4vn/hm3+ErY7dD+H
 5cvuDa6NFbraS1svAdsARotIx3BFgMu3UvUlYCRY7YJeFoJCkAKjCZmODUDG8W5rsmy1
 xSbvEAMUJtw5jba+FTJlpPWmLf/YYK/8su1+XNEYUcPQzbyUGWn+49bhnG1eQblPq8Gs
 89p9cXjxmbKxu+7IrwznMiJmdTC72gvOqQjum7d7IWPVET74WczpEjTjirck/48NFy1Q
 IeXEJpfbrOFkaJ/p1gcWV+bqu1hUKgZcp1F3y14/82OcIe5E7mG5AbEaYxGZKkaX6sk8
 1tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ms30aRtLybppVnl+LsnaCt+oMOOUCgGJAClMaVt2msc=;
 b=xyBBAD7CLeX1fVRFbymsBOR+LSf4KolVDepOipRBOI3UAhnvfHYoOC6ofKybk2AnEH
 FaoLJrKajBRE8Ex3Ysus7g/sfZIO51CLM/+/9SS5Jh9RIcQU3eHtpYwr8rsWMhsbtOCz
 czJDHp32zMsuIgYb2dbSLCULCaX4/VSVRNL32k4Jxf+slJdcNdQQ5p1bCyt48SqTpGvE
 Y8zVMsOFKnhgDTp5qP5vldZOKfcM8nCdUKQ154U3EjiIDzcDAu7PilqAdFxL+SeAh4/B
 HkquU9Xdnz+kKtVjfht47PPZTKQ3GVvaIH7c1r5T53ZehcVhYVQ6rQSXRDIfU56SzWbP
 e42w==
X-Gm-Message-State: AOAM530bVvVHspqPfnHUcaSrFxuGJE22mKg8ZTSnLk64oVrdhRqlJTtu
 j5uF47yLWrAoa1miL20RyMIn4OtkinxHn7R6CkYcHas0QWk=
X-Google-Smtp-Source: ABdhPJwjFKszvrrup9KXTZYjGxiCPYyo71blGFYXoaSLTicRotnAkfTFrDzFm8olzA2TbocTzRGpdQ0pcA3byDTtPHw=
X-Received: by 2002:adf:a51b:: with SMTP id i27mr796332wrb.172.1644262263594; 
 Mon, 07 Feb 2022 11:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127205405.23499-6-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 19:30:52 +0000
Message-ID: <CAFEAcA9zWgAcNFOvPg3+qBRY0KFcan-_jY3tkDPWN2rmF=NPBg@mail.gmail.com>
Subject: Re: [PATCH 05/11] mos6522: remove update_irq() and set_sr_int()
 methods from MOS6522DeviceClass
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the mos6522 IRQs are managed using standard qdev gpios these methods
> are no longer required.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


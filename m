Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB26A0D68
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyg-00017d-HX; Thu, 23 Feb 2023 10:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDyc-0000uC-RP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:48 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDyb-0004qn-FH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:46 -0500
Received: by mail-pg1-x536.google.com with SMTP id h31so5935996pgl.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oh5p9J3BuZ1/9RppLhkTsllNcPKrX3GbfinbJi8Me1k=;
 b=fJ+WS/Nn1Enef24s4guueD1gsn/MreWymZ1DcACdQTRziUc1ltgHhWKURpDmq0Rl0X
 JYEU9ZMcLCfHI/3rkLQ2AjucT+hkCzNoChVOKZisetTAzC2OY38pCzWI4CaeaWYKK5JS
 fkCOkzWlLgQgDofzTbm9PSyDe/6Owpynxx0SF45eb3b4Aw6jPqtNez9RXIrgab6K2igh
 H8/X7Kot41+91HTKvnshoxg4PctbLJA9p8CamkDlwPUNgqqMitIjxRh2+Zaap0gl6xPb
 /+jCO4ddtu6bTO9G9OJZVeJ6Zoix5AWX+fTVU28dmHHuvGs2RYHgfYS+DPBkRPQ0FRwZ
 4xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oh5p9J3BuZ1/9RppLhkTsllNcPKrX3GbfinbJi8Me1k=;
 b=7Z7AtzjLA13K/qX1DGXL5jzA4+65gAz+c7Xd+jRAGij0gTht83bu0beViigKvzRY7W
 H3tE2FdhUZHRX3BEQIHy9Hjmb+6T7puya9eCAkOjDVRIYDuA8N5Ayucy0gRRbz3wGFbY
 W0g2FxtMms/e49Pg/1RFNYXZRDoC0tYDilM6QvtOVSQav673Igj+FBCtJ83IrC1WDsqY
 iEYiqvTxgF0jsn2O8K1CN+x17C4iAQWxO5K5Klq27a6HUjUTm0wAe7K2VHktze3mP7BS
 2VWXqNEuMEARIeZbyHbiZ8vIxWS10cSZ97GvJlSxTRZGiqzNGYoDxIw7iD27bOjmjr50
 z6oQ==
X-Gm-Message-State: AO0yUKXINCRZMBSeQVh+ErLkpOQvaPGpPxQkKPZIBdfL2rJVnbHfHojc
 d2gs2niTxTSdoHWKlB6RhMxX8uuEQ3nNV94RqcMIfw==
X-Google-Smtp-Source: AK7set+YesuMxudQoj12Qq3xMDaBHj8Od4ll1PJzgb0eSOS+E+H/WWTM+cuhHXpuQHONXq8LKxun6fuKgYBlOh+i8wc=
X-Received: by 2002:a62:e401:0:b0:592:453c:320a with SMTP id
 r1-20020a62e401000000b00592453c320amr1812827pfh.5.1677167863519; Thu, 23 Feb
 2023 07:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-10-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:57:32 +0000
Message-ID: <CAFEAcA_aQbPH_Siho35_R7EKDe1BJvfM=qRyzsPf5-Gdx+e21w@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] target/arm: Load/store integer pair with one tcg
 operation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is required for LSE2, where the pair must be treated
> atomically if it does not cross a 16-byte boundary.  But
> it simplifies the code to do this always, just use the
> unpaired atomicity without LSE2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F8331437C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:07:53 +0100 (CET)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FdI-0005de-D4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DVc-0002ec-GK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:51:48 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DVa-0008AG-U1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:51:48 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w1so27464776ejf.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgTEN+B9ZwLp+Lig0S4dLDfaov2wQ3hjarTY0Pv1JVw=;
 b=W7raWzJpZAFDUeiokfmo6KHOg2o5poPIEybJ2v3Ip87DZQE1KXOdHY1+UiVSkvG10D
 zG7KVWRGrEXXToiN+BvFszfdJWJOMQX8pbrIotW7DjdQ6UkWiL5NxmJvaaa06J9JXXHp
 sR2ifrFY7fgvRqL9qw8SOaxxgms/m/4+o3kWSaUIG64Xfq+Qkw5ZvECk2swkyE3J8y+R
 bdX17Lo8wyXvm944y8SpTlZEBLezaE8V8o2yx8SCtPX/Qdvj1dxRGsmqaKGdmyF3tpWs
 YNgciL1Xf1EE/S0Tzt4FecNV+XEHESTVXoWbutF7E1oDV2FcF6LV1GT5MqL9NhcSZFET
 mQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgTEN+B9ZwLp+Lig0S4dLDfaov2wQ3hjarTY0Pv1JVw=;
 b=atnNicyjLgo224XiT40dWjoLsr1v2jJF+gxUGPvk7zIp/uirgGHNjNaXrAOpAo/Iw0
 jkMzU6EJP33Civl+1B+0nzJEBtH++GOPIV18GqWOkdAzyTb6yB5whg7blX4oz8UqzSJ4
 gt7dsn91Xfz8jzSfELBES9NU8PcxHjDpDiNGgB+zc+YoeBR+hEmjlB9lDQ6sp4Evfwns
 LjFBoUGZVfVMTGsUbtcMXYvi2rCjmV9M3bqeI1JqC1q6NTC68coCR2DIG1kFs7B7iW3p
 2+ZJQb8k85LWoRGUXOpDlPp2HHdDyrVqWrUJ0jLNkhHB17TQAYoOEWraGfEGEFjrCqr0
 W2Sg==
X-Gm-Message-State: AOAM531SCijEvgg8kGgEg67eSCJ82wHXBezBgANQmB26ABxqWPCXl083
 QMdDZ7flLSCrAGCV+1qyqvkubFkSI99baVhhGXivNS/wMko=
X-Google-Smtp-Source: ABdhPJwnWNDQZ20GGE3vY4YWh9oVEn83tqR6Zs4Sr3rKe4v8EEpr3jkfhFh7XMvMT9yK7m2VZOdlzVmAIj+7laM8IZQ=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr19010792ejc.482.1612817505471; 
 Mon, 08 Feb 2021 12:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-15-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:51:34 +0000
Message-ID: <CAFEAcA_vbYYs+XK0SQAVnf-b9H0Fg0-q6+=nyHXq3Nk+=6bJWg@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] tcg/arm: Implement TCG_TARGET_HAS_roti_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement via expansion, so don't actually set TCG_TARGET_HAS_roti_vec.
> For NEON, this is shift-right followed by shift-left-and-insert.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target-con-set.h |  1 +
>  tcg/arm/tcg-target.opc.h     |  1 +
>  tcg/arm/tcg-target.c.inc     | 15 +++++++++++++++
>  3 files changed, 17 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


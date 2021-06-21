Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB393AEC04
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:08:44 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLXX-0008Nt-OQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLUf-0005QK-CO
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:05:45 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLUc-0007lO-ID
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:05:45 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r7so19371816edv.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1piw/0eZY0uuufiRGOyQAkqOYgr+qqNMkRRSYDsrM/g=;
 b=M5JBYby5FLBcjioUm7Fro9S7gOFxmju1gWzTx8QB9ZkGLfZC75FGtU0v6NYlYE2MAP
 n7fjsH+Q+QxO/9xFy2y1TLQdkYtN8+plkvhFbMXmdqaIBiAxoGJiyBYAXx3dzOEErdFt
 8dyjRCmoxnL8W6WW1KbVcPFIrVfHX4AzMLvvwILLNGZ1tkUyQOFpB3pwkDaNKkzs/hgu
 IPRYnG1r976T+A3vmjxC5ORk4rtFNHrrKCjkktTc7J0Uyr1JpL9LkZTT+2VFPLE/5Oyw
 VTvm2ylt+n25s0Yb259C9ofbrAv5eL/drqqkUE98cX925voT+Ltl/Jcw9NL7j5u76hG1
 tz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1piw/0eZY0uuufiRGOyQAkqOYgr+qqNMkRRSYDsrM/g=;
 b=JhdsG6jC9VnqJt1hWNpDLtKTlBoV0Ui5oFNKpk78OkVxp7DnUh34VF340Uz6KfwfWR
 alM37z4b0ZhN1JUTyjigNn32ZnBzmGc45vdXD1cnPkTzGWVbUhILahGISnTVorB3FnZL
 9SpCKb9Bv+DSbHZumtmeIzWRlAIp6OmLJW836fGP51PGOEuYuo/lkLzkr6hPyUFd1jHr
 qQRzggrr1fCY7ZYwOqQlWgcPpISolOahPUBaPqdp8n9BZYqZWaOTu3oirR+nHN1zWvIL
 38MzcFMFXikgioPcMYthq5Vi6OGzVZaqZCR4p+PlSN0XAq1UgHvo3ji9gynmvrLerDjF
 zB6Q==
X-Gm-Message-State: AOAM533HJEtDof/yEtbYdHvqdgMD4c4PUmLTAOLQOzyR6PazYDx5ONsz
 KSXFm5OJsu0WM4+8RTXmamSAyXc1cs0vyewg4Z4Ab62AnI+olQ==
X-Google-Smtp-Source: ABdhPJx6tyWtUriklW2iHYslb34XUyXCpIgyB2Uyxv/mohH0mHczr4K/fqHsHNO1BNukqIz1RRSWvlCwT6W6U7tPImY=
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr10079748edd.52.1624287941165; 
 Mon, 21 Jun 2021 08:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-20-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:05:05 +0100
Message-ID: <CAFEAcA9G5qFmhuKToWLUtY3Er8B6TCiofJXm=2kns3701HUeVQ@mail.gmail.com>
Subject: Re: [PATCH 19/28] tcg: Make use of bswap flags in tcg_gen_qemu_st_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Mon, 14 Jun 2021 at 09:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> By removing TCG_BSWAP_IZ we indicate that the input is
> not zero-extended, and thus can remove an explicit extend.
> By removing TCG_BSWAP_OZ, we allow the implementation to
> leave high bits set, which will be ignored by the store.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


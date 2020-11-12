Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB92B08F8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:52:59 +0100 (CET)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEuA-0006vx-GX
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEt6-0006RU-9D
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:51:53 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEt2-0005Db-CR
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:51:51 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so6802276edq.11
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynnK0t0MQfhcqCygiEDVAqMqWrPMQXfHoCLslPY2Bs4=;
 b=sSicsUMCGSdcsiAjs4jimpOcQyUq3nV0eostsAL9bunwa1UAkOaNUE2cNKqJpKRjOh
 q9HaUN5gCm1OsqphAqls2GULCBW8GVt6PHGWDipsBcKcG3jLNHYmBHk3aoLa6Y2HYsXQ
 dfSSPc2xl5lIJCY4lAklXCJCWOlZEWs38cSgg1hZj2aQrRU4KiZ+dNlIdE/1TrezXxBQ
 lbyjrIpOHHHodKfgJSeJ6q5qm7mwmasp6w6Nri7QYgCR5bagB1oW9LDV7SmLJcXPbdBI
 1nnE9kZa30dxe0w0mb/raFvU9W7mgKFtHYmP10WtDjFULhei35Ti9bzYAyYB8pDmL+B8
 47Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynnK0t0MQfhcqCygiEDVAqMqWrPMQXfHoCLslPY2Bs4=;
 b=Ch6Q/KHlw4REFpI8BKa/J1/kGPYQXIjljeFd01RjHsbQD0l+fkQqnnYVd8ItTyGk3v
 qku+CEaDhAjhiOPkUfO+yrRZbfKFNoVz1vYvLxTuVObgiInyCisehs2jURkNvHxh9+Za
 /wc/Ipb+NdLegGAmw6SurozXdZJT/pzREiOkSsN6pmUredpqq0jF5tizmUEblH7rw6Ek
 FNkImmU4IEKstU5yzzkFfthjvNUFu4QscYTJHqmsDGGRh+WQ2++BlOVp5GjO+PmgKxCv
 fC255GZMKDsiJ5SUJSg45+ewUHFFtOdfKYGbkFd8oTTtuABbGSGLNCfRkv3H3Jdr5IAl
 WW4w==
X-Gm-Message-State: AOAM532nKgsNbr8mGNaR4ghXUL+u9FPC3D9SMK+sSlnNgeFgq+L27Nqr
 klRd5ZBFeNLUWg8Q46JmeCyUhGXfxwMsjmToxw1oNQ==
X-Google-Smtp-Source: ABdhPJyPWra8GOcHHXCWkOUfXu2R2lfIhO60aB80LCYl0TQve8HLn2r/o1dlNsPr1yW3dUWzAczLlIWeeE4xJFD0kZM=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr426405edb.100.1605196306682; 
 Thu, 12 Nov 2020 07:51:46 -0800 (PST)
MIME-Version: 1.0
References: <2d8747944b70d105c7ce320be0151c4c4ec78d24.1601653938.git.alistair.francis@wdc.com>
In-Reply-To: <2d8747944b70d105c7ce320be0151c4c4ec78d24.1601653938.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:51:35 +0000
Message-ID: <CAFEAcA90cD8+NY-dGKzk9-yDKVRCR1d74OW+hNUHrZWXTgWqXA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] register: Remove unnecessary NULL check
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Oct 2020 at 17:04, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> This patch fixes CID 1432800 by removing an unnecessary check.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/core/register.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 31038bd7cc..3600ef5bde 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -258,10 +258,6 @@ static RegisterInfoArray *register_init_block(DeviceState *owner,
>          int index = rae[i].addr / data_size;
>          RegisterInfo *r = &ri[index];
>
> -        if (data + data_size * index == 0 || !&rae[i]) {
> -            continue;
> -        }
> -
>          /* Init the register, this will zero it. */
>          object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);
>
> --
> 2.28.0

Applied to target-arm.next, thanks.

-- PMM


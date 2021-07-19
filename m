Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E93CD070
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:18:27 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PPu-00015w-4y
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PNV-0006gl-2B
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:15:57 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PNT-0000ZF-IM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:15:56 -0400
Received: by mail-ej1-x631.google.com with SMTP id dp20so25592188ejc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wikUbnu9wR1NygqIEPfR8sYeeT4D/PRA0H0pNSKX204=;
 b=xz7v9mtAufcV1jaCvtf3N3KpsTRLH5xOUGIrPQiaULTiISQjjJtrrsEB+GScV11aKS
 wKPWn8HrojxTgddmz0Ph7wN3Xd/5glthSULt5J2MxSTRQj7Uur8Qih1yQ0zlMt4RamT1
 YFbrJiDS66WHtrVVA6nlabCtha1lXaKhnNaoyLKxP2EE2G8QbvukZ3tr+6JSbyLo5YHM
 AQcFK618aF7YKRM30T5T7V0tbif/peA6jkZHwSFCu3EqNZVdah+ppwqMNIChsYcIdQWd
 51Jrm/R7MsuiFHqCKfFGsBJ0g0+4e9PFGkTtG9u8TlPpzh2aJUcUNY0xs1qtP/2fT1Oy
 ZBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wikUbnu9wR1NygqIEPfR8sYeeT4D/PRA0H0pNSKX204=;
 b=Ege+CPh0Sg66cbJjdlFmyeY8VYia1XRdyX1Ib027k0ma7hA8mozGsONKEShBUuSkX7
 JO+JrsBCtKZ7Z07HTJdl/qTpY22eU/Qfx6CbHFwoX3ziFFlgD4fqidt5WKrZ0dq2v3Dn
 8ExZGV+Bbdz5lW+FaJMMp2cQ2TF9KRPvw+3YFORFHN4DBMZLEXvCjKTtbVFlMZs54oph
 +ZBZDSkFaMFWcPbWC84/Szb9m/MuBpK2lKiuXilYBj3d6vYLmP1fFRJVtvZsRwC9LR6K
 5qVjAqzBSoguSwZ+1W4LoWzcGWIX2zTBUwED5IjcPyae+7hT/gYMBTxgfnOQD8NMyfdy
 8cNw==
X-Gm-Message-State: AOAM530j7nZ4+bcJ6PR57HOxB8n5sg2y7e4m82asPTa5eou8PMEMod1F
 G7B3+K7X8pWCHz1eCdH4t/xO8dCj99o+TUYsk3XnXA==
X-Google-Smtp-Source: ABdhPJyeq1tv1ypvAj2AWh+9D3mZ00PCOL9JGBAI7JS9ppDDm9Wa+Ep5RP01FbiVs0+lLu5OTyHaphtE9cshRQEfrpI=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr26659728ejc.56.1626686154083; 
 Mon, 19 Jul 2021 02:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-4-its@irrelevant.dk>
In-Reply-To: <20210714060125.994882-4-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 10:15:13 +0100
Message-ID: <CAFEAcA9Hqr-piQGs4yObva3Wvr=F63OweWqqGjZBDHTkypTybg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/nvme: fix out-of-bounds reads
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 07:01, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Peter noticed that mmio access may read into the NvmeParams member in
> the NvmeCtrl struct.
>
> Fix the bounds check.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


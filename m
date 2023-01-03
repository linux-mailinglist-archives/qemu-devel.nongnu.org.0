Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B265C543
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClK0-00061z-9L; Tue, 03 Jan 2023 12:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClJy-00061i-9k
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:43:30 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClJw-0007oH-NV
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:43:30 -0500
Received: by mail-pj1-x1032.google.com with SMTP id n12so20711543pjp.1
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GBvs8LllcPrT9bJ3hcstLCA0o83D66Uw+2DFsfyiWog=;
 b=ZJEJ6rWDIVeYqrEymYvMjgVJVPlaPX0cxgQAWJCuxO9MgryT/Se9Xhy8VqYqFn1N6X
 5tn8++0pQPXmp2dZRKUbZa0EeXFAAeKGYrZn3hqtwS3XdinOdBeOE62KvI7hRdhm2SRY
 7+OjwCbxIf9OXyDaG7x7XXtycxTYuY/maPA3KY74L5F3CSedv0z8slMh42Xlk+WXyXxi
 AuZK0X2D0lYQfc3hs3Uh0FRyiGvzw2duRwwy3Z8bRqqKmNaCmuygHe/voCJ3EuyehLbO
 /Byj2POJKsAVGbcloihm1IZAzG4edV7+dKtVzCdvCN1/KrMiBXk9gl2RfxA3Rkh1ukXO
 2JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBvs8LllcPrT9bJ3hcstLCA0o83D66Uw+2DFsfyiWog=;
 b=G7I6twzJSiRqheKfcjxm4er+kHsrYLyZAeZ9pTIQqMWL5GLRiOUuwwEH0as57scM0D
 U+WFKs0QD52AA58VNYJfkXt3xcEEsCogpKO5QpMtFKiO76W8eqIFeRCQGT2pRADaZ0AG
 rSx4urH3otbBSfVeeLyKbdHh4D834RNsDj3a4d6NEsVmIeTR2bZ/mv/OUA10VzRHMiFV
 ttq4VKhUAcPBPBb52a81QfpwToqZzULFx80FUGPKNdunJuE2HFWFq8LCZliACCRDnofE
 6wfelqQxV82eGTM696ng8nAAulxThAPuk1xiyCanbi5ROzTgsnysk0LXfF2c3K3k+1rP
 9U5w==
X-Gm-Message-State: AFqh2koi4qqUU3oMwZ7tYa/LrT4Fva09B+lWretZvfET+dE16RHPvw/x
 4tiJIDaHyZtgxAVoUYjqyTLGkZPM5Tg8ZC4RYBPIxw==
X-Google-Smtp-Source: AMrXdXvdqORIF0hdFkyXjXZtGa/y6vhnfZeozM8yb89MBktab2YUHrcsbyJuDXqCR/n9NzyB3Xz4JGy+OZ6I/wfFiXQ=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr2973385plb.168.1672767807348; Tue, 03
 Jan 2023 09:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20221222215549.86872-1-philmd@linaro.org>
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:43:16 +0000
Message-ID: <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 22 Dec 2022 at 21:55, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> ARM CPUs fetch instructions in little-endian.
>
> smpboot[] encoded instructions are written in little-endian.
>
> We call tswap32() on the array. tswap32 function swap a 32-bit
> value if the target endianness doesn't match the host one.
> Otherwise it is a NOP.
>
> * On a little-endian host, the array is stored as it. tswap32()
>   is a NOP, and the vCPU fetches the instructions as it, in
>   little-endian.
>
> * On a big-endian host, the array is stored as it. tswap32()
>   swap the instructions to little-endian, and the vCPU fetches
>   the instructions as it, in little-endian.
>
> Using tswap() on system emulation is a bit odd: while the target
> particularities might change the system emulation, the host ones
> (such its endianness) shouldn't interfere.
>
> We can simplify by using const_le32() to always store the
> instructions in the array in little-endian, removing the need
> for the dubious tswap().

The tswap() in boot.c is not dubious at all. We start
with a 32-bit value in host order (i.e. a C constant),
and we want a value in guest order so we can write it
into memory as a byte array. The correct function for that
task is tswap()...

-- PMM


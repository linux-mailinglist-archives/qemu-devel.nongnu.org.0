Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5330BE28
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:29:22 +0100 (CET)
Received: from localhost ([::1]:33470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uo4-00031W-38
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6uky-0008RS-87
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:26:09 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6uks-0007rW-8n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:26:06 -0500
Received: by mail-ej1-x62e.google.com with SMTP id r12so29644950ejb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c+G3TuuZdddZdLSCiu835Rng3C9zacytq1wS/2XqQGs=;
 b=WD0UkueDxddiNwGrR4Li13eT6HazdV+08hsBCGr7OWeKjM88OcpAKDVzK2EKu50Wqz
 DOVPj6xUY2WFgDoYNd5xp3FPzuMKc7OBItoY8J+oJQiPxQDoO8HRzNzNqVKeOxS205TZ
 Ng69ptkB25NDbWyWYBDkOpUhzCS1pTlAt2RoSknB1IJKKfcJGsYQfsvlUpBidFCGBNBO
 5oAX8usOrJWRUe5xTEeLqg5buxCwXYjj64CyjkdgWMsFQJR0Y2LZ1vZ9k56f8DxOnWo5
 WHsMPbe6R01O0Eg1tR243HL7Tip4H0v9NLQ50TvAvEHpAtVS75jDNUDuxvjtomPtI7/0
 SabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+G3TuuZdddZdLSCiu835Rng3C9zacytq1wS/2XqQGs=;
 b=GUK0vb21TodNRKf4ZHaPxc/qzMmeIM/0/4VFUdemJW17uJSUwkCxGW6No885h7MR7r
 IOLsTWxIJoTCAXM7n5meQxeMgV4kfV6Hbgd0c5q/v9raxFKH9IqN/QMSSAxp2Hxzm2RW
 8FjnEKksMVkq+ciY+SoToyX2yaeRYb2YwTSOo1GBrLMq0hwEna7uViCO/dnvZtgLTkSw
 ejZ7ZmEQ7NnrmJd2XZ1ya0RIoWVEZdUaCMt6q6vB+qU0An9jnxKr5FxPkzG6qQGTHm6D
 D85P3yuXF+RpVHu2lcbxLURSGRig8lngibKJDBqgeVkHbJCC444Hv3tWFaooOae4Cihn
 hNzQ==
X-Gm-Message-State: AOAM530lbv7f+8HWHLI0tlQGGmXRr2SxVPQKDX15+4dopzAXRkWPF6aT
 KX+4wMBw5fk1LmqTb4ntAA6xes7nC/645MiZXbw0jQ==
X-Google-Smtp-Source: ABdhPJz/F9P4dymntHAHNyzhoex0P0d7gQnrLmzEzULTZN3oyItL4iR/4l6ytYhCldnOQsJdthEgsMeAs7mBbjZf9lw=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr22242179ejc.482.1612268760281; 
 Tue, 02 Feb 2021 04:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
In-Reply-To: <20210131151410.318649-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:25:49 +0000
Message-ID: <CAFEAcA9WEmiePw_SipgUZwGFNcMPi4ejoXDT5v3mhYQhxX_rcg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 15:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Peter mentioned [*] KVM only support ARMv8 targets. Restrict the
> non-ARMv8 machines to TCG.
>
> While this is still not enough to boot a raspi3 image using KVM:
>
>   $ qemu-system-aarch64 -M raspi3b -enable-kvm ...
>   qemu-system-aarch64: ../../softmmu/physmem.c:745: cpu_address_space_ini=
t: A=3D
> ssertion `asidx =3D3D=3D3D 0 || !kvm_enabled()' failed.
>   Aborted (core dumped)

Side note: this assertion isn't specific to the raspi3b -- it's
caused because we don't correctly screen out "tried to use KVM
on a CPU type with EL3 enabled", which should cause an error
but instead gets far enough through CPU init to hit this assertion.

thanks
-- PMM


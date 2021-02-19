Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58C31F8B2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:57:33 +0100 (CET)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Pc-0007CR-Pw
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4OK-0006dT-82
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:56:12 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4OH-0007Ip-7G
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:56:12 -0500
Received: by mail-ej1-x634.google.com with SMTP id d8so12580699ejc.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RCReoUqVm5VrIgFdBYFHKJpOABQVppR771o1a5NHp3Q=;
 b=kHxpJna0WvF58KRzQ5LVezQqDSSRhYFCs3R6UJBRT/lnCHOijMmxgTr+ixjrGlUkll
 szoQSEibrREs9z3uKY1Cs6Bqmvgmh3wezUHb855L6UUMcWQaGbO3nIX+nuPUMWutzoue
 ldW+OYxruT3+nGWoHMbpZxPnJqt4i0sMnhARPUwsHutuXB/JJrDxUOc4ILfCXOWS2whN
 tX2sD61BzJ3GXUCXE8jaG/3v3H6V/4KSz0qUIMlM6nmjMWWGK2Ytrrn7zaTS0QHNGoSw
 FuGMcs1P/7o2ne313C3mHEfx5Cmuz4Y6GUV95tW3a5/OvYlRvrcSwu0dXYmeR0oCJXmC
 RT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RCReoUqVm5VrIgFdBYFHKJpOABQVppR771o1a5NHp3Q=;
 b=DJRUsCwCFwoPOikJIE4CC2JhvMavsxy3frREPiKLxxEqZk+2ujwhxQyuHMaGJrcJaB
 F8eO+GK2e52ZylByWUUXzXB4Sj9MM+BI1tUKIrDwWGBjBKVJVHl4VL43m/kQUsiaA0ZR
 NEUs2Y8hcq4aTD4No1Vv1JQyv0+Ea6ZmdCWttv9HACFv8mvoLEUKM98HfjmHlhyLY9Aw
 Zk+wDojamQ9AHpihrgiUNqHBDVjrCZwcozERMcNCHjjqT0iuR1PboPPYZh+gKyAeBvv0
 /e+9OC7sNcGizUY2HValGwMC/C7UPoHcT4qjTNI7fWFwijeFqYB6x5ShWuHnPK+xmiWC
 EX9Q==
X-Gm-Message-State: AOAM531ZKeYVhdgaCNJu31MuS8A6PD+NMHKB++3qpeRZdJLdAmuKYZrl
 akYlQ4VfnCqQp2OwZkCGJkw3SqvKm8GZk1lGRcMq5Q==
X-Google-Smtp-Source: ABdhPJyY7rOmAS8HlYaPJjFtH0dM7qx91u1P7MknXc550biwIHD9TpOrNw/CC9jk0EUM4klLZM05EvK6bDkG2owGsMI=
X-Received: by 2002:a17:906:5357:: with SMTP id
 j23mr8276999ejo.407.1613735767468; 
 Fri, 19 Feb 2021 03:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20210219114428.1936109-1-philmd@redhat.com>
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 11:55:56 +0000
Message-ID: <CAFEAcA_66DuWfrftpaodqBZwBhS-VOD9uH=KwvGYC_VcksVFAA@mail.gmail.com>
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Radoslaw Biernacki <rad@semihalf.com>, kvm-devel <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> This series aims to improve user experience by providing
> a better error message when the user tries to enable KVM
> on machines not supporting it.

Thanks for having a look at this; fixing the ugly assertion
failure if you try to enable KVM for the raspi boards has
been vaguely on my todo list but never made it up to the top...

> Philippe Mathieu-Daud=C3=A9 (7):
>   accel/kvm: Check MachineClass kvm_type() return value
>   hw/boards: Introduce 'kvm_supported' field to MachineClass
>   hw/arm: Set kvm_supported for KVM-compatible machines
>   hw/mips: Set kvm_supported for KVM-compatible machines
>   hw/ppc: Set kvm_supported for KVM-compatible machines
>   hw/s390x: Set kvm_supported to s390-ccw-virtio machines
>   accel/kvm: Exit gracefully when KVM is not supported

Don't we also need to set kvm_supported for the relevant
machine types in hw/i386 ?

thanks
-- PMM


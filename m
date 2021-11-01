Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B84421B7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:34:27 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhe0h-0005aw-2O
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhd6I-0002Xg-9h
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:36:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhd6D-00076Y-N6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:36:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id b12so25196877wrh.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeObSFrB191MMGQ/4Bqf8HT+IdURvfP1SjpxxMo/YsU=;
 b=ptx9m/w+MKElRC0xHo8URGEv37J1SxS3sFH3AKQPsNr5BCIrGEaMl8WCWLJzz9z+Ba
 FpEFRdsNp/Zwa8i6DrnKxwTeDokQvmV42msElm0WNRb0htooC5mceqGaFkhGBnSz17Br
 NE7fN4AtzMdETA87xRTFLZKZ5mGWP2Vz6gJ52NlccD6dpVv5eIvOMy21zO8PvPU9Rm/3
 1n2Uj9TDmhos0CrQf6c0iO3jyQouhckj5nl25hrD6flw/edzMrRx5RZNR64+WE0xduAB
 NUOsn/DwGYtflS3NFYMA5QhETxhg75LKtEfUo2LQ2izAmQtiDB+JzFbOP83JaDH+ppC3
 zoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeObSFrB191MMGQ/4Bqf8HT+IdURvfP1SjpxxMo/YsU=;
 b=blJ5lg+ZKGHmUHS27BSAnY5mM9YFsiNVcu2XfiARDWQ3lfSzvqoVIIztqz44cd0apv
 Mqoz+1aEgRTauJWaJjPglSrrOvaUqQ8yYmowq0yczynFO9dBZpuF9BXD2SIzHiGaCJ9D
 kSw58gdR5l+Vxl8pURmRrKz8V3VmK1bNwBmpW2Q/KUWM+Iygz+YoMZ/olVxJucnh6CMc
 eQL1jKNDHc8OuA9DCESLncu8Qwwxs69/DtWd2Lm+RkcXIKgLumG1E+6u3gSCK68cvdTq
 z93vFrYLDjjqmY470nM90foCDg7i7vAvEVvyh6WkfcPi7WkuZRXbhueVh86R6v4ZxeSZ
 R7pQ==
X-Gm-Message-State: AOAM5334aK/BYjf+zsgr+Msm7UXwmtATHPro7U17fBfc+nMJWm+/vHU4
 Os550NB8efe2PUWcX9DiWK2JlHk3zNLnOXsYl7DlOQ==
X-Google-Smtp-Source: ABdhPJx/L1rLqb+Gnu0MiiCWK9GL7etnwzBTrt0li3Aus+W+pA3Ljw2sjbnNLv4d+zChPPDo9AW5Wd+fL0AsNgpluro=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr40557560wri.376.1635795363907; 
 Mon, 01 Nov 2021 12:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211026071241.74889-1-agraf@csgraf.de>
 <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
In-Reply-To: <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 19:35:52 +0000
Message-ID: <CAFEAcA_wBCL++KREtW2COtDC8nHAD3DRsDbWBxPr0k7i8EWRnw@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Nov 2021 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/26/21 3:12 AM, Alexander Graf wrote:
> > Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> > into user space. For MMIO however, these have no meaning: There is no
> > cache attached to them.
> >
> > So let's just treat cache data exits as nops.
> >
> > This fixes OpenBSD booting as guest.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Reported-by: AJ Barris <AwlsomeAlex@github.com>
> > Reference: https://github.com/utmapp/UTM/issues/3197
> > ---
> >   target/arm/hvf/hvf.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
>
> Thanks, applied to target-arm.next

...did you see my email saying I think we also need
to test S1PTW ?

-- PMM


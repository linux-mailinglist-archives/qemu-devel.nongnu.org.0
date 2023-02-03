Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DF6895F7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtFE-0007Sr-Iz; Fri, 03 Feb 2023 05:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtEz-0007SV-M5
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:24:22 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtEx-0004l9-SD
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:24:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id d2so911508pjd.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tv83yX2eplewFaDEN0t5Lcnf6leqr/CQibQNna6eXW0=;
 b=LTWFovYmMBVkw8OHyM6hwgMS+WwbVRxGCtv119iFj7xyi0k9NEhddQZakrp1KS8WW6
 EV9JKT7wFuw0doPxGGoNKXR3kUxXNPSHBEGoDMFWvCbn/855sNaycRt34OCLqK53gjA3
 fEjynwx+Y0P6f0KemtH6q30svZsDBtjzMB3SmpyIZgiFg7/PSvIRazuCxGGKubU6/qsE
 pK/HHcvs5HeRx0vhyt2txoS5ZaKA8CeYnSKKpiRdku35S1oEeGQT41XRHbtElR/EIERR
 6yZnz3q8+m4YkcucP9YRUH4kTVND5gXlXUwrnVAUrkNDwop3fMXyHukAHlO9Qpg8UtTH
 gFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tv83yX2eplewFaDEN0t5Lcnf6leqr/CQibQNna6eXW0=;
 b=Nt+SA3M8tYJ1BbyZpzECMiTStrdkGAys5CNiFpqGCQGHQuWAkNZAJszWel0rEenJlS
 BCFu5JwEjJo0xsPRa8pWI9qns96VIIlwbtoQUhypbrk0hlI5KZwpGbZ58227LeaGA7zf
 Pgg1TgE7Koa4LEw5EJoVp+rXRO9hgACCXRNZZHrwxGJGZ9EPVGHzkDcypK5xx9ZbzIfT
 fAx5sI2+5LC1Y9ISabZZ/l5bKH0OPR8fEuf3z6HfvKoDbN/HY5l/NevQ4LKViZkcKSJS
 vReyH+DD5ehUfF6hYbYA3P9F05dVwnQc4CIEHpgTgn7WF1Ov2YCwI5KE9+y2VPwsg/pN
 oPgw==
X-Gm-Message-State: AO0yUKXexd423HK959Hl2z6SSqACJSFOFzRbcNVtxhwDr0Nf4RtURP5y
 +nYBQl1Jw6fjhsfHLdBG5xHAd5sMoOdWaeoCQOn2gw==
X-Google-Smtp-Source: AK7set9wVSifa7Nnl8Q1XfeDhALesdEAEyg6v8XX5J0NBXS/APl0plj8HDHOsbagmLSSSt7smhmDqofKTiLBdQkp3Lg=
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr16200pjp.89.1675419857807; Fri, 03 Feb
 2023 02:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
 <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
 <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
In-Reply-To: <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 10:24:06 +0000
Message-ID: <CAFEAcA_nxgdj99=+q_X5mKDaEisbWrC9BgqzcK3uciGWGpjF2Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Fri, 3 Feb 2023 at 07:07, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 2/2/23 18:57, Peter Maydell wrote:
> > On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> The finalize_gic_version() function tries to determine which GIC versi=
on
> >> the current accelerator / host combination supports. During the initia=
l
> >> HVF porting efforts, I didn't realize that I also had to touch this
> >> function. Then Zenghui brought up this function as reply to my HVF GIC=
v3
> >> enablement patch - and boy it is a mess.
> >>
> >> This patch set cleans up all of the GIC finalization so that we can
> >> easily plug HVF in and also hopefully will have a better time extendin=
g
> >> it in the future. As second step, it explicitly adds HVF support and
> >> fails loudly for any unsupported accelerators.

> > Applied to target-arm.next, thanks.
>
> Did you squash the changes mentioned here?
> https://lore.kernel.org/qemu-devel/3278ab81-ccdc-9ccc-e504-dca757db5658@l=
inaro.org/

Yes, I found those when I noticed the patch didn't pass 'make check' :-)

-- PMM


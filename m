Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330605BEC1B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:36:13 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahAJ-0006nJ-Vn
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oae4E-0007LJ-0T
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:17:55 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oae4B-0004MA-RP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:17:41 -0400
Received: by mail-vs1-f47.google.com with SMTP id m66so3216519vsm.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=524MgnG9GmwMNLgCnKLXytBMcaqP2b5WrrC9zHh/R3o=;
 b=If+PE1YexIh7Gal5ye1j8kt1Tz1rE+vf3/kNQ/TvqKHES06baFmghE5a2sSJjyTFPh
 m6XI0pZdGGZIT2L+t3dfC56WqiTTSgnN1Y8Q2NLuHFU3fJT10OszQl3iz/qVRyHygBMU
 J/rKZD8j3MyhSIEr/tDJxCB/wc+foig7tEqV/VueareaMNDsh6mtO6DX3XT+lAZE1tox
 EiacpSsOckjYjWtAG45e2hhEN1734JmCYosnThiv7DwMVzprgF39Fr/nSieJ2cYASgCm
 aClSVFaXLIkDstG4yVpoMhlf45sB0LOdJ4DByVlFdXlQjY5VzumWxhrU6uBz+g7VcJ2f
 QJlg==
X-Gm-Message-State: ACrzQf3oqt+0ZDsP1ae8EOQvpamBk1ZPeXURGyaLCVpm/GaPt1YlB2G1
 BJQ6yZhHBq80s2cx8U21qvLSuguaChWBbx0l5aA=
X-Google-Smtp-Source: AMsMyM7pMTA22z61iUK4657uhLK0EFfxIhympXIk0x1qHVETqDHokp5dMjESY6Bn5yoKBpQ8qpAjA23UpCa42YJCBNI=
X-Received: by 2002:a05:6102:3118:b0:398:904a:32f7 with SMTP id
 e24-20020a056102311800b00398904a32f7mr8004116vsh.14.1663683456339; Tue, 20
 Sep 2022 07:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220826113900.794046-1-berrange@redhat.com>
In-Reply-To: <20220826113900.794046-1-berrange@redhat.com>
Date: Tue, 20 Sep 2022 16:17:24 +0200
Message-ID: <CAAdtpL6VZoVfzuGaQ90iUxSxehFNugPS1nfTROh_Moi1C_4Vqw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Helge Deller <deller@gmx.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Typo "default" in subject line.

On Fri, Aug 26, 2022 at 1:46 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> possible. Historically this hasn't been an issue since it was rare for
> OS distros to build with a higher mandatory CPU baseline.
>
> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> baseline:
>
>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterpri=
se-linux-9-for-the-x86-64-v2-microarchitecture-level
>
> It is likely that other distros may take similar steps in the not too
> distant future. For example, it has been suggested for Fedora on a
> number of occassions.

Typo "occasions".

> This new baseline is not compatible with the qemu64 CPU model though.
> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> usage of QEMU doesn't always allow for this. For example, the args
> are typically controlled via binfmt rules that the user has no ability
> to change. This impacts users who are trying to use podman on aarch64
> platforms, to run containers with x86_64 content. There's no arg to
> podman that can be used to change the qemu-x86_64 args, and a non-root
> user of podman can not change binfmt rules without elevating privileges:
>
>   https://github.com/containers/podman/issues/15456#issuecomment-12282109=
73
>
> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> compatibility with binaries it is likely to encounter in the wild,
> and not likely to have a significant downside for existing usage.
>
> Most other architectures already use an 'any' CPU model, which is
> often mapped to 'max' (or similar) already, rather than the oldest
> possible CPU model.
>
> For the sake of consistency the 'i386' architecture is also changed
> from using 'qemu32' to 'max'.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  linux-user/i386/target_elf.h   | 2 +-
>  linux-user/x86_64/target_elf.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


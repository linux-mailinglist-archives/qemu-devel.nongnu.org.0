Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E72D1F9E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:54:03 +0100 (CET)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRGU-00083h-Gh
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR2x-0005SN-Oe
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:40:03 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR2w-00022b-47
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:40:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id s75so14554815oih.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZU97K43zH8wKph27lvxide//f/pdlo67LflrXUbD6qc=;
 b=DfEjdlvzm4Qv24OI7GnG30etkUX3uucvtt6C/kN8fBM3fdZIpFZKdufJOlOZxOiGVZ
 MqGC/vZy/ZlxGfiCIv7kwZCHc6/bTgRXemNRl1i/TtknQXfVhnWzsFrwNquGK9t4yAgY
 5y/xe11TYLf+puW8TzDB55e/ggyhA8oNoMSIG4xju+ZqALmyxaXnRnCOtLmM+1+Wd3zC
 BMxpqOYtjp4AL8sYyuQAHe2pCv9kdMb532D0MnfQepQ32JiuQ+EZChxWh14ve84clLwa
 HWyyHCfMXwCihuoMIlOwdXSwknkTybnCHBhDYuSlkUBARnvcV43A+/8Isvie6qCbSbmP
 21Sg==
X-Gm-Message-State: AOAM530RB/NayZKn+f5cX9LQP5RVFXJ90VOr6VwnaAVP5xWiFD5j55ue
 gWS6aPWP5F0wn2pALPsrO0J5/R8V/Tzuz31cfqGewZYN
X-Google-Smtp-Source: ABdhPJwxMbRNLHPWrqhtnT+KlPLf5OQKn376srQQ4W9M2lNVi9btamGPT5Tkk2mvb/ryHjn8e6Z4rhgWZR6I7ozDsHE=
X-Received: by 2002:aca:ea46:: with SMTP id i67mr991531oih.175.1607388000708; 
 Mon, 07 Dec 2020 16:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20201208003702.4088927-1-f4bug@amsat.org>
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 8 Dec 2020 01:39:49 +0100
Message-ID: <CAAdtpL69-8DEYb2832fcZosNjMogPGt1a9HNT7NdLVvnbKZBFQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] target/mips: Convert MSA ASE to decodetree
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.195;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f195.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm <kvm@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 1:37 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Finally, we use decodetree with the MIPS target.
>
> Starting easy with the MSA ASE. 2700+ lines extracted
> from helper.h and translate.c, now built as an new
> object: mod-msa_translate.o.
>
> While the diff stat is positive by 86 lines, we actually
> (re)moved code, but added (C) notices.
>
> The most interesting patches are the 2 last ones.
>
> Please review,

I forgot to mention, only 4/17 patches miss review!
- 11, 14, 16, 17

>
> Phil.


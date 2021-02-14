Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C831B0E9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 16:19:01 +0100 (CET)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBJAp-0004NO-TO
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 10:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBJ9X-0003u8-4U
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:17:39 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:44228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBJ9V-0000mu-JR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 10:17:38 -0500
Received: by mail-oi1-f182.google.com with SMTP id r75so5236478oie.11
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 07:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b2Q2eK99u6mOKlAHpOq83Ss3p8q452IKHmvPKX9FG3A=;
 b=t2L7ZHhBGL0T0h8yRjVtuN0dJ6zo66XCk140TjGEYuZMFTyja29SpD417bzYfLy+dt
 U72Lg/Lq98KpRebkl0YqFUbOgHvwcyOwbt9NqGEsc7H6MFKJyA59uNLmykwN9M2tjP7k
 hklQGosXrR15XjQDDYNMnLhnQOTWqXcXZYRCwFiVPJnz5HzAxj4f9ifGCbfdJYkMX6JT
 ZGfpArGmZar1wRPwYUmQopHagWijZQIZMpHCROM3tHAb8IqDFnu0uJ/e/u5FnNAsdfQc
 H05NgrQPioj1SKFmYOdcXp9HtJx5kcJTIDYjjaMoiccsetDG3rIHxJGOqfp136pT0CG0
 +FPA==
X-Gm-Message-State: AOAM533XPbDLwsOoWsxnmu62Fp9jwW7/Hnw6B8CrYi6vRY75a80bcpoF
 43CQ751xtoqVtrNfu9YWEBxRgN8ZNy/PFeqnIE0=
X-Google-Smtp-Source: ABdhPJzqypR3L14rfAOvZhVI8aHGLqb+LCWGf2siIfz9ANR1ayVFCHBdoSIbgInx9JWrkVfJYvu+RFeSyB9LqVcpIrM=
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr5849345oia.46.1613315855795; 
 Sun, 14 Feb 2021 07:17:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541701393.git.noring@nocrew.org>
 <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
In-Reply-To: <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 14 Feb 2021 16:17:24 +0100
Message-ID: <CAAdtpL4B-19ZrtkLcfY0PY7RUMrEVWsH310jZ6CGHB-K+nKCQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux-user/mips: Support the n32 ABI for the R5900
To: Fredrik Noring <noring@nocrew.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
 "Maciej W. Rozycki" <macro@linux-mips.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 8, 2018 at 7:45 PM Fredrik Noring <noring@nocrew.org> wrote:
>
> Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
> supporting the n32 ABI.
>
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> ---
>  linux-user/mips64/target_elf.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


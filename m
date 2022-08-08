Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91F58CFA3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:29:15 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAJF-0007Oj-Qg
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLACO-0002cB-LE
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:22:12 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAC9-0008AB-1i
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:22:03 -0400
Received: by mail-vs1-f48.google.com with SMTP id o123so10130557vsc.3
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=77YCPs9eIsXkKf1cZO9JDXvsExRZWYXtxNrzJIgxx1w=;
 b=7D45W55DDxnBVEk2FiZRgDLiydWsrI/ADA4wPBaVvdZYEOqgbnoGJlNiOyMhMZTgPw
 SoFD1qsX/C2iHadBt5ifte+58LcOEPkfyce/P6MkKRF7yd36QeBuosIyxU84qXh9GJj5
 7LWZpjRckelFYPqMC8Ej9AcA8waBb8uNr+eb8jJxFofHh3z31znHrI4AZWEOsEi2/sxA
 pIy/yrveWYwxXT7KemZ51e3sFBlZvViIYyI7P4i7mG4gctVf+/yzJKV1t3lNashXWxc6
 cKO/cN8bJPgjjwo4aV5tD4qOZ3jtDTWn1bXGL4DXT8+yyEDbRZ5596vSher8GbDokuL1
 M2Sg==
X-Gm-Message-State: ACgBeo3Ny4qpm4UkIPXlpAWZMF534jo6WeaE0snaGFTb0v9T3tPyrEo5
 CTQ1CHqJqUPDjVF+you7VVmhaPdOLHgAfu0AXWo=
X-Google-Smtp-Source: AA6agR76aFKD6dACPSZaLACrizlozx6EqFXLkdCT/Q+EJx/XlvyAg2VrUtv7Kxa2AfJa57/HhKRdMYSBABZgcC/dj4Y=
X-Received: by 2002:a67:fd82:0:b0:386:9cb3:9b14 with SMTP id
 k2-20020a67fd82000000b003869cb39b14mr7806177vsq.8.1659993710505; Mon, 08 Aug
 2022 14:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220719191737.384744-1-peter.maydell@linaro.org>
In-Reply-To: <20220719191737.384744-1-peter.maydell@linaro.org>
Date: Mon, 8 Aug 2022 23:21:38 +0200
Message-ID: <CAAdtpL7FXXf-gJDuBRyOGbgHWSGNV_GGwZPbyGLwYcNJ9wvaOQ@mail.gmail.com>
Subject: Re: [PATCH] target/mips: Handle lock_user() failure in UHI_plog
 semihosting call
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, Jul 19, 2022 at 9:17 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> Coverity notes that we forgot to check the error return from
> lock_user() in one place in the handling of the UHI_plog semihosting
> call.  Add the missing error handling.
>
> report_fault() is rather brutal in that it will call abort(), but
> this is the same error-handling used in the rest of this file.
>
> Resolves: Coverity CID 1490684
> Fixes: ea4210600db3c5 ("target/mips: Avoid qemu_semihosting_log_out for U=
HI_plog")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: only tested with 'make check' and 'make check-tcg', which
> almost certainly don't actually exercise this codepath.
> ---
>  target/mips/tcg/sysemu/mips-semi.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to mips-fixes, thanks!


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B66C4F07
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04m-0003jQ-93; Wed, 22 Mar 2023 11:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf04T-00033r-3I
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf04R-0007R2-FP
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id d17so8980899wrb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497686;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pATdmcaPo+y6Ggn9jgWERgyPreTWbmW1+JtWgGqCqyQ=;
 b=npygiRoXpFs5qOsFe5jwVnNrp+YU1uL5cZMOMc2nrupySIHdjPc2ET14o1POeafI2K
 69A7bE9fUq8utY1bIE6wD1lCrVg1bWbgzq+jRo4BmlghT63iPFuCLroHI54u748bvCse
 0pA4INGFzOekj2XZeCIpTGGdznwHShVGLTBNjJArZoTRyn7GGgBHjwDfqdS90wvxYlzW
 xXgP7HvflWwEpCc0KfydzQcBZOagxHtpycBZrDrqLj3kPN8PYGVR3D9Bi0PYjbzUaKm1
 KFyeY+lSFVeRekn5gUznTGsRBIRh2i7gn4rnqFPbsXqnPGOnxhbOuBFLIZhaPYA8bXh4
 YAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497686;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pATdmcaPo+y6Ggn9jgWERgyPreTWbmW1+JtWgGqCqyQ=;
 b=N+MTbQrIeh3a9K7w6kvfeR9O7MT6xiDmQm/VIIrY49S9f0YG0ea74ppZTS/QxLVpP/
 LMhIo6odncpseqMrQZV7U1cqv/3y5gQSIwrd/nGQEO8Gi8RdthH8zSUDzpnGLqedHRVH
 6wqPN+c49xSC+hDQd2Z8NJgCSQdXdm3CuSm4JRtvGMV5OncF0xHWJIl/uUu+12ME5z3f
 Eacytxy1ocS7oYTuAnobWzUgVWm26wbmBrbzx+u1Yu6fLQRt09sF8QSdfHF06PlYqK1W
 JBsLDhbGf/uJZXzbHEN4fZetYnv6rQ+l4wYIOnFWquDTm+vuH+XrU6DumkCPqjnjwiGU
 eFFQ==
X-Gm-Message-State: AAQBX9fCrh7Ogd844zL2aa5+s71BYhnPVrOWux/bVqsQg8RZ4e91yhGQ
 8OwEPLYJ3dPJo1Inm3Fni9z/Ww==
X-Google-Smtp-Source: AKy350Zes2kN+Dk5pI1zuK0bwNoD6efN6nQj8q/ESV9OerPUnlMn+ra6GF+eDP+t4b9i7YR9n1A0hQ==
X-Received: by 2002:adf:fe46:0:b0:2d2:d324:e44f with SMTP id
 m6-20020adffe46000000b002d2d324e44fmr131968wrs.16.1679497685993; 
 Wed, 22 Mar 2023 08:08:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm14166012wrd.77.2023.03.22.08.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:08:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 481221FFB7;
 Wed, 22 Mar 2023 15:08:05 +0000 (GMT)
References: <20230322123639.836104-1-berrange@redhat.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>, Thomas Huth
 <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Kyle Evans <kevans@freebsd.org>, Warner Losh
 <imp@bsdimp.com>
Subject: Re: [PATCH 0/2] tests/vm: fix ENOSPC in the openbsd VM image
Date: Wed, 22 Mar 2023 15:08:00 +0000
In-reply-to: <20230322123639.836104-1-berrange@redhat.com>
Message-ID: <87bkkk6cyy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The openbsd VM builds only have 3.5 GB of space available in /home, out
> of the 20 GB disk image. This is insufficient when running iotests in
> parallel with all other tests.
>
> Note, after applying this series:
>
>   rm ~/.cache/qemu-vm/images/openbsd.img
>
> is needed for it to take effect if you've previously used the openbsd
> image.
>
> Daniel P. Berrang=C3=A9 (2):
>   tests/vm: skip X11 in openbsd installation
>   tests/vm: custom openbsd partitioning to increase /home space
>
>  tests/vm/openbsd | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)

Queued to pr/170323-for-8.0-1, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


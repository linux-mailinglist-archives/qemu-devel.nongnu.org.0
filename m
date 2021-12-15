Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304E475A5B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:13:35 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxV2D-00050Q-Pf
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUSI-0008VA-O2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:36:26 -0500
Received: from [2a00:1450:4864:20::32e] (port=42750
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxUSB-0007fg-Jq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:36:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso3073733wme.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EPRwErRmLGlIXg9dNaURh+XfvKs8o+o7Xh6lQ5YpXno=;
 b=CvfJNV4NpSVfPDB/A/BcqI6jcvy6pFq8vdv/yMG+LpPbtGujvFldMnQKQd5PVc2j8K
 Q3CKTPOnrWQyTQFg45gF7mymG8V1nG52qoiBz0SxtDKneF8ObdiYcTjlEQ8paYzH1Axm
 Meboyf7wgi9bfyFJvbs6YtY5fuoP0ghd+e9X10qv9uHM9u2kneXdjbiWi/oCn1IMql8c
 rqdshNta7PrVk1JeDVg5bGedK+/mKBS+fUsFlygKA3XedGxp9Qt5+yFXphovmpPObSip
 dXjO8TjyN7rjeU6ClYPkFQoH5dPqerJnbYiKAXmkY9MlQyotDvJRmBlduabNAlQCykIZ
 P87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EPRwErRmLGlIXg9dNaURh+XfvKs8o+o7Xh6lQ5YpXno=;
 b=aiFb4Ma74tE06ll6SmEL2jajlCOhQLc6Cdh9Y8hyG3mGTskesrf09VAR11m6VhJJ52
 LJpj8QPUnfjwqIn5jPWH4YK7AxwrQ0dCcM+G1+eCE44gMmxmpPlmvxiknyVTvYL3Fmn2
 3PCXfIerfPIzc683aDEnBJMJYv0fK0UKKiIzsNmYg2I05VYNIjo06qDQPiqayYjddNUD
 Ur2tfW3ON5GegtGWWRO+Wd4SWjCzThWpjZpoubkybg2SK6NNkJCvlmUhLkC8q6JchuIU
 evS8q2eFsPXnhfMlMstnt/3TlvE+lP9QgFbvngfhbQQyMKTzirLb9bo7jDqRC2Cov38T
 laLg==
X-Gm-Message-State: AOAM531XxuUtp/2QcJwlW06Wku6x9/dgf0T1uneUVjOJKiZfqBDPfdTr
 OcwLwPY+P9SP3qQ+/VLM/Ow68Lt5q/GbNREJJWNV/A==
X-Google-Smtp-Source: ABdhPJyBNwpWvWLaiOwupqrNTPHD1uhZZxOIjVGnTG1x8JlyeST3A3COxBy3iDaf77o48d0C0FiocB43hsU049UY0Vw=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr4602176wmq.32.1639575378070; 
 Wed, 15 Dec 2021 05:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 13:36:07 +0000
Message-ID: <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-arm@nongnu.org,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Dec 2021 at 12:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.

Given that the DTB is automatically generated for the virt board,
firmware has no way to guarantee that it's the same every time
anyway, surely ?

-- PMM


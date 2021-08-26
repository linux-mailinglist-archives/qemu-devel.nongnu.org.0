Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2E3F891B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:37:43 +0200 (CEST)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFZe-0001xq-4F
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFLl-0000SW-44
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:23:21 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFLi-0000ZK-Vu
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:23:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id e21so6184477ejz.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxGexwbco+d/07qE4oRx9+s3rxnu7r68q1Au53vT/4k=;
 b=qIPjyej5RrZyXMkf1KwZ0roefO5KtJU6JpVyh1T1OL4+ctn0T/3MG2jTmfOt4GkJpz
 +MEt4nGxYCwimkQoMU5saC/fnS4OTsW/J9meAJM2NUjhPd5xY+t77FaciRzHFd5h0XQ0
 Oz5zWsdS7FzLOvt8KZrSkT2KstxJyV+j/hS1/7rwVGYvTuJPtDu7vbeEJXHYy28uN+Fy
 JoxC9r5nnOpTO5QtCg9m9eCxvDoD7Lxcos/bWApereVeqUcCW1l4vpsnstsRZByCS2kZ
 Ck/flCy4YHvpJ4FkTv9OOKh+kpKZrVnVDc4WlKbVdy9Q1wGLFnJuRHWFBl8e3mX9jKQa
 Xu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxGexwbco+d/07qE4oRx9+s3rxnu7r68q1Au53vT/4k=;
 b=TEpT6vhsqNP48vuVi6xwJJ1Oyl1bH7TZyNs6YyYLbpWtMiFGSohJfonLGWnF15iU2c
 DcNQ3PmAZIzchRqn2d8AWAIRqAS8+8aVqmt7OHyHN5kv64Bb5WqFawSfnHbhAL1K5o/K
 mxpEd4Nclxh+PXGO/lM0excSFGs8NR+EVb8hq+S8xB4Az1Bg6JVT40DK2q/gc0wK2Cfd
 quxtE5UhdD6/XbqllhXto8MUsDaieoAiOmsb0ZLlZErpAZP9wzaub4XQKqdEN2ubAjoM
 +v1RRunTS1kEuneaTYq1rQ6hZNJ38o0YRIzmZHjuqhY6K7FVIPQD+cJxHkAxKmjdtQvw
 Zblw==
X-Gm-Message-State: AOAM532zWEmfvHsk2hf0WHhq79aBDEbzLhQTMPXYYktGa19k2DLCrSl2
 tbqUUlo9sXLhQWG+yGlKZPirjmhbG7yGOLosOzM79w==
X-Google-Smtp-Source: ABdhPJzPZPT2ASHaUc2/FWk9j5btImxwRZtgzRWRbbWRTEIlzs91zDQ+d1aZT0kVcaJLQM52RrTwFyOSjQXuF863YgU=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr4331499ejc.4.1629984197255; 
 Thu, 26 Aug 2021 06:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210823160647.34028-1-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:22:29 +0100
Message-ID: <CAFEAcA8XP67bPYXmY3S7SsQzXjjgbxsMCOHmA=PcGNz8iuP10Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 17:06, Andrew Jones <drjones@redhat.com> wrote:
>
> v2:
>  - Completed testing
>  - Removed extra space in an error message
>  - Added Phil's r-b's
>
> While reviewing the new A64FX CPU type it became clear that CPU
> types should be able to specify which SVE vector lengths are
> supported. This series adds a new bitmap member to ARMCPU and
> modifies arm_cpu_sve_finalize() to validate inputs against it.
> So far we only need to set the bitmap for the 'max' CPU type
> though and, since it supports all vector lengths, we just fill
> the whole thing.



Applied to target-arm.next, thanks.

-- PMM


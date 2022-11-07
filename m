Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3461F5B6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:21:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2yO-00048R-Fr; Mon, 07 Nov 2022 09:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os2yL-00047r-Qq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:19:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os2yK-0003n8-CC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:19:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso7248841wmo.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsQXqcGoeac9xRJdLvu41MTbn2497gd4ClQpztiCrWY=;
 b=KYV5VqBpNa1r0lMx7yteW9IA5sj4ZLOK0CYiZfGSHoT9ltrCklDG3QgAFoKd7qzVD5
 Ts5fQDDk6Cuovv3FEYsDsZuoJHhEaopOZe7EFJJfrH9Dw0Y8buCXsNQIPPvfFSiq+RuT
 fuLze9ejrClt2eg0a/YuvrBLlzNiti+mOU1cPYlTo4cxl0pSPmDumGd9SQFUE+lJs79x
 7+IOFtxpzR1VybQ0XiTItPAHIOo1Bc4KI+ASuYi//vNhHXuXYwM9PQiHH9peko+a0F4V
 zghQVvWTja9kX+z9BuQrtND1w32q66WVvwJxEhQngCHvoCgScm6PINkRp16QqqiClgoA
 BXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YsQXqcGoeac9xRJdLvu41MTbn2497gd4ClQpztiCrWY=;
 b=biyJDqtImxkQyMLOzdnS5l4Pd+NrddijZdfm+SrqRWt2aEloq6YEZSG4hbLPacqeba
 JVx083myFUV0kxRlNjGU2JNpY2Ve6LCMlXg0pnMQ+IjeHJAqgo3NuJ5wXVD1aRKh5mb8
 ZjY2eG/TwaUMMKKgitKpSQjeSHnz97TIY0IyTyuNPH81LDuOQKCwov66xwNjxaeS9mDu
 Py9qJwZu6ynYT6XQ42/cEAAXpCVdbMvoIIIyoXSih210o2TcU+ljKOxSZrwz2trfGep1
 L09ffaoLgzeNl9H5vMXYRUGyn9m6RTcNNicBoKwzTyAaaX2eA9t8ECywUcg1l9a149eU
 qrrg==
X-Gm-Message-State: ACrzQf1EoEl/F0Mw7JXUBrHe3koARNSt36ds8EWOvo06MXGCINUfPmbQ
 Tj/bcNJ1xPxKxEiSnhaD5sow6A==
X-Google-Smtp-Source: AMsMyM7VFQi8AKlRK+7GXyM2LBQN7xo/RxnvP8r1RlXb1m9pcH1UmbH5DMd4GkSOy4aRh9qD+f2XGA==
X-Received: by 2002:a7b:c2fa:0:b0:3cf:755c:8830 with SMTP id
 e26-20020a7bc2fa000000b003cf755c8830mr27834311wmk.172.1667830770162; 
 Mon, 07 Nov 2022 06:19:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a5d4577000000b00228cbac7a25sm7524177wrc.64.2022.11.07.06.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:19:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2736E1FFB7;
 Mon,  7 Nov 2022 14:19:29 +0000 (GMT)
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com, Francesco
 Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
Date: Mon, 07 Nov 2022 14:15:21 +0000
In-reply-to: <20221104184101.6923-2-fcagnin@quarkslab.com>
Message-ID: <87a652hmoe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
>  target/arm/internals.h    |  50 +++++++

Moving out of kvm64.c seems fine to me but I wonder if debug_helper.c is
the best location. debug_helpers is currently very focused on just
handling the TCG emulation case where as we are doing this tracking just
for the VMM cases or KVM and now HVF.

We are (slowly) trying to clean up the code in target/arm so we can
support builds like --disable-tcg and to do that we want to avoid too
much ifdef hackery in the individual compilation units.

Peter, what do you think?


>  target/arm/kvm64.c        | 276 --------------------------------------
>  3 files changed, 291 insertions(+), 276 deletions(-)
<snip>

--=20
Alex Benn=C3=A9e


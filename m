Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40658AE03
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:24:33 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK07l-0006Fa-1L
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oK06L-0004iO-4O
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:23:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oK06I-0001c5-CA
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:23:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id c22so1642191wmr.2
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=V/c8JP0m6ueyxSV7ZEGF5pgd9MyDoLXRHUB2miVLSTs=;
 b=aqYzSrGCDTwLC0Qg7UUPxj+UVYcRUQ+YmF9kOTGsLs7koGrhFJmUv8A5PhBxV8sMzC
 ZBn5o0VYH+pX8k60qtuat0ydaqCYrPbA3H+wHC5L9SfFgUiqW/+b9Jtg5VpwTqquIsH9
 izUanz5cetuEItBGq5IbhI2SKxeNt8tTxFfiOcR9pWy7OOAggvTlqZyMIH8cyI06xgTi
 NTowbjPvexSJhsS4U+lIBAnTk3y0lARvdZVYa/f99wDHLwnX9J9gFDKYyMoet3MYCJr3
 pGg5N3YC/9rYA+qcVlL8kFrcRWMh2qllfADlhijmCHi9lsXhX915xTMpXu5DYeD/bC2p
 kV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=V/c8JP0m6ueyxSV7ZEGF5pgd9MyDoLXRHUB2miVLSTs=;
 b=jB9fnh5QHLPUvIVIHTTTCx7XDHa+mb1KA8LsXvdpyuor2174beq6LHv8v3ZQfExAF9
 iGnDkoXv3jXwayIBCnogQZJ+A+khP5D6U90klTE13nCjYQXeI+Wnl2OaDOssXQ/Gmn6E
 w1nXHUfho+WXeEsx5XR6k9pogA8qQuru/8Enjm14cVncUOzEHuYIskztgQVsYf1fWHgk
 Bme8sEcNqc0pwuBd5wYM8sSAeCDgJRXdVd0TRYAppxt2w0jBIQTy0Ig3kBnFZCC5u49j
 6SAVu18yohsRyqVRG+y6yU5G8UVs+oYgOq7KGXIv9qc8FDODufxxoBsDVbKy1iztSr50
 tuAQ==
X-Gm-Message-State: ACgBeo3bXKjgLTPgams7ujTVRPOnJLZ6T1EOm4LMrDzHUFbZPJkJj5ZH
 BoASlrqN1TCYugZYjmf0DqDeMQ==
X-Google-Smtp-Source: AA6agR4/o6tH7IZ5xIPbBIm+7j2LnYJk76nxnJzwgh8xo0VWjZ3wmbywos/MSDGps1eK3J1jmhURyw==
X-Received: by 2002:a1c:44c3:0:b0:3a4:f09b:401a with SMTP id
 r186-20020a1c44c3000000b003a4f09b401amr10342751wma.89.1659716579775; 
 Fri, 05 Aug 2022 09:22:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b0021d7ad6b9fdsm4318573wrt.57.2022.08.05.09.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 09:22:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62A501FFB7;
 Fri,  5 Aug 2022 17:22:58 +0100 (BST)
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
User-agent: mu4e 1.7.27; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: qemu-ppc@nongnu.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Floating-point OE/UE exception bug
Date: Fri, 05 Aug 2022 17:20:08 +0100
In-reply-to: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
Message-ID: <87pmhemzh9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


"Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br> writes:

> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>
> Changes in v2:
>     - Completely reworked the solution:
>         * Created re_bias in FloatFmt, it is 3/4 of the total exponent
>           range of a FP type

I thought this might have an effect on the efficiency of the FloatFmt
extraction/packing but I couldn't see any real difference in fpbench. I
doubt the compiler can dead code it away if not used by a front-end.

Anyway have a:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the series.

>         * Added rebias bools that dictates if the result should have
>           its exponent add/subtract the re_bias value if an
>           overflow/underflow occurs.
>         * ppc_store_fpscr sets/unsets rebias if OE/UE is set/unset
>
> The PowerISA defines that if an overflow exception happen with FPSCR.OE
> set, the exponent of the intermediate result is subtracted 1536 in
> double precision operations and is added 1536 in an underflow exception,
> currently this behavior is not QEMU's behavior, this patch series fixes
> that.
>
> Currently there's no test in this patch series as there's no way to
> disable MSR.FE0 and MSR.FE1 in linux user, so any overflow/underflow
> exception with OE/UE set causes a trapping exception.

Could you do it with a system mode test? Probably overkill for this
though. I suspect tweaking testfloat would be tricky.

>
> Lucas Mateus Castro (alqotel) (2):
>   fpu: Add rebias bool, value and operation
>   target/ppc: Bugfix FP when OE/UE are set
>
>  fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
>  fpu/softfloat.c               |  2 ++
>  include/fpu/softfloat-types.h |  4 ++++
>  target/ppc/cpu.c              |  2 ++
>  target/ppc/fpu_helper.c       |  2 --
>  5 files changed, 27 insertions(+), 4 deletions(-)


--=20
Alex Benn=C3=A9e


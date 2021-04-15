Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EA361185
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:56:09 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6Dp-0007ui-0L
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX5sJ-0001rD-9V
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:33:56 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX5sE-0007L6-Te
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:33:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so38041214ejc.10
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9c4THIKbQU3ZazFebfdyqkhX3AMq6en0zvdsdYG/RGM=;
 b=mt9QyG9v+bEuP/Y9y+S1K3MtS+R/EjxqH7ERZNrCC0eBbeCOdxnwADtW+zVY7ipLNL
 KNmMtsYwaLz7hd/IDy0WOfuexkwSD3qagJ6qo2LrmHh5/2xJhfjErklhNLKePWI0ONHQ
 UGTjVJG/tc7LziR5XQKuvkiV5njL+OmXkytvh/cQm7BMkwLH56UASHzdIi8iGzNMpemO
 0n1fuxMCH6fO4Wvhx5WAoZiIGc85P/RpZboAJ2nM/t6chd7yCn/XgU5nv3QzMNIu7IUt
 YtR7V6/aGY2BCh/LPsKSySO5j2xT8foODPYtkiITT9eRbU10+SnkiGcml3GWnDaVe38T
 TT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9c4THIKbQU3ZazFebfdyqkhX3AMq6en0zvdsdYG/RGM=;
 b=DG3zod45ut/AAxxpTgctzojbZZWbrdHUW3XBB3g5Xo0o9p9nXMwlia+tDSuaERZVVS
 3ngjuITtGUiW8OKZLiUxcx+o5Ys90rOvuCwSY4FpF8/PW6iVbkBOjpG7FyhnYVaUoptc
 vezmx+CF3LVqPnJnxY0OEA5eDb7MCvm7DJ9cAC4Kh/gNSVuRbPJrRhu34Wtijv0LTITE
 qwIoLEh8cmZcLwW1quQMAYwO4Ybm7HMScNsoNmtHbKJVehjZVruOutOeTPS8ayUKuFos
 Um3GmyEieJQlMLwYyK0+D8FQsqv65wjzcJ6kfPHNvdNJg2I3IrZLwD5wU3megtJkycQj
 bLCA==
X-Gm-Message-State: AOAM532lz94ZF7+myM474i8Gw4Ckd+uSiI5Vh4lSiW74qG2vI2mFSR18
 5e0K6ZdVzwGFZLYCQUuYoBe9W6cq1tN0j5VxIO827A==
X-Google-Smtp-Source: ABdhPJzumaVLScqINu4sPmKnhpKkXdE2BN8HtTSprhVDBrKhSZX8PnCeedjfl0xLxAWJ9k18znatXwePpdQ9UoeFzzk=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr4709763ejd.56.1618508028033; 
 Thu, 15 Apr 2021 10:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210415162454.22056-1-alex.bennee@linaro.org>
In-Reply-To: <20210415162454.22056-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 18:33:00 +0100
Message-ID: <CAFEAcA9vizqToQKBkMBfsk2SEKrgDo6F1KqET5vpntWUBY0Yrg@mail.gmail.com>
Subject: Re: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 17:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> By definition a single instruction is capable of being an IO
> instruction. This avoids a problem of triggering a cpu_io_recompile on
> a non-recorded translation which then fails because it expects
> tcg_tb_lookup() to succeed unconditionally. The normal use case
> requires a TB to be able to resolve machine state.
>
> The other users of tcg_tb_lookup() are able to tolerate a missing TB
> if the machine state has been resolved by other means - which in the
> single-shot case is always true because machine state is synced at the
> start of a block.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ba6ab09790..b12d0898d0 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>
>      if (phys_pc =3D=3D -1) {
>          /* Generate a one-shot TB with 1 insn in it */
> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>      }
>
>      max_insns =3D cflags & CF_COUNT_MASK;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


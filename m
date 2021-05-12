Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6737BF67
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:09:40 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpYR-0003uU-By
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpWG-0002NN-3z
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:07:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpWC-0007MX-HM
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:07:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id di13so27240327edb.2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01xqKkUidVTArTF+vs0qLiXiaq3CdrHf18+C/GHJ3Pw=;
 b=PcLwh3IY6+JiUkI+r6xVc8H+wb+Ej5aSEQAgO/awnAU77x2JHIRknqkNoOo8TC3+8o
 6x3Tz5vP1d9cAEEyljdnCoogMEreFR9ldh89xGimA0CY3otOXXWNM8xeFkymaAyWZHXJ
 hyiALhj5tyBRs8bPRBAQaoG/nirnnStQ5hG9qcpJXSUDLYeKF9J3foT/5MLSkFoyvKgI
 AWeFuw4ynA39gMFxGpjOO50JRL4iAfogZKioTJD258Xr6rlWmEr6K1TPjyYa4QqKxqxl
 PvgGzfj2JTMQGcCQXr7gV0w7v8Mw/kgEu5GtDh614tr7Wvmkp1OX8eYD6FNQjvSGOUqQ
 s+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01xqKkUidVTArTF+vs0qLiXiaq3CdrHf18+C/GHJ3Pw=;
 b=W6MbLuEpAQZXB1Pz32Dt9flKVIJataGUsD/54f2VmLDr20BPpbAD0b4zeQ6hkDk6J4
 HL5DNMlDtfvrg0wVL02oBS/pHCjF23wr9Irzd+mJWDZkRNAxS2HgkwPtywFmF2ksNDfr
 udZcnXifZMC9irxPQh3cQqwj7EQM3I8A3h0dS9vDlG6Jyvdeyvqq4d0rIuXl2AZ96P8L
 0Pdgs4WkxhtvDmygrUn39cCh6LrcAy44mC9l6VAjqaTQZQ8H520Ij6bnLvYaBX7Jr/Xo
 nCvtALwaJ4RJh9YyCDRnCiVMJ6X7yXPBMVkFCno26bB0iuF31PGGW7pLpVYTtvRstK5a
 l+iQ==
X-Gm-Message-State: AOAM532ydq6nScrlLC0l1ndPuvGC2FFLQpwr7Qk4l2N83Fz0mjbU3qEi
 u3pege2e9pEvLm8Y88xXKyBRic+ux6g7V18ZrEAgSQ==
X-Google-Smtp-Source: ABdhPJy30v0CkPr85QXB/IVir0PHLgOth/fvm1VRdP4wYGc0WIR1+yhrUmSRU5hhv7Jm8lhH0BeVVxHeUWNUYDPVZWA=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43186646edt.36.1620828437527; 
 Wed, 12 May 2021 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-32-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 15:06:03 +0100
Message-ID: <CAFEAcA96aPjfHG_qD5dVQTOqxBz6aNEi4=EmSB4OuicqMZupSg@mail.gmail.com>
Subject: Re: [PATCH v6 31/82] target/arm: Implement SVE2 WHILERW, WHILEWR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix decodetree typo
> v3: Fix iteration counts (zhiwei).
> v4: Update for PREDDESC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


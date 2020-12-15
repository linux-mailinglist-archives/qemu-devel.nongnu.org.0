Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9072DAC57
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:49:27 +0100 (CET)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8pa-0007Cx-0q
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8lD-00043y-9G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:44:55 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8lB-0008E5-Ho
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:44:54 -0500
Received: by mail-ed1-x543.google.com with SMTP id r5so20637088eda.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YP6/1HwTRQ2ZPcyFAApPBPTifgi3dqT9fzJQcwRfck=;
 b=HhKoqBWYvLhFDjTU12gTKYa/vKf9cEiudwKYuu8YpFI5RYCh2Dmn1MKjQqD5nH9pik
 k0OKR5J7VJAYppyhEAis+zWz8eodhA6448CUnoSyI7CON3DT5sx1o6jdEnnHDSeMElnW
 WPsu0AlreuM6sXoF01EdTQMB3HWVbiVRPkSTLJ89q1qp7PRgtBUDbGG40Lah4bShz6zU
 8WiGroun9OBd2X+rQu+FJEeiXbuhUmNxlTViR4cTaoAe8v5fslwSexpxD5FxKZFgXzAI
 IKjAPHEaaXMtkl8FboDVRdfLVqE4fDtorKU+Hs2s1fqTJqRjU/iH7MVfj4DPLt7FrjIK
 gd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YP6/1HwTRQ2ZPcyFAApPBPTifgi3dqT9fzJQcwRfck=;
 b=fO0vazpIMHjdS9S7dN8abPJIlXc7JWXaAw5c7DBux1yHpv2ECi4PXb8WX3JuBbxLHe
 5Y/2H8KmAHpLvNkmQeE+umo4vGJvgqd3uZXTxxjZGZXIRk6FIG62hz2+e5KWZ3Fukp3n
 PJZYt6GiULOi/OU9NIN8e2QBtaTBTWnrGiGZlgyLbLOfctZWv2XHIQijjw0ct2qJxM4L
 6TkQwVxP4faZ9opzubL+go89fYp6KUdJZ4U1WuZnpaYoryf0aKrrFek5UuppIYYmfzud
 9VSss6jd6c91qIa2CWGinv9w3cwEfhsr9YsqmWubeHePQHPJ9v71QGjyZU9//oweWEVh
 3QKQ==
X-Gm-Message-State: AOAM532EmePkZcyPWkI370HmC/98RkFdclBEet4HMsWKzms7QTHdkxL1
 V21G9HwRG/+b7qxFBXFiU5d91qHaMv0dA+cOLabd3WG3AcM=
X-Google-Smtp-Source: ABdhPJxkSAVroMN045rxaqg5ZEIx6Gvmeqsqqs+YlyLTFBZ+C/mZTG9IyU/aEGLpJMMRZiSTlXRJC+BVCypx/uYqq9g=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr2035354edq.36.1608032690433;
 Tue, 15 Dec 2020 03:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20201214203050.6993-1-peter.maydell@linaro.org>
 <20201214203050.6993-2-peter.maydell@linaro.org>
In-Reply-To: <20201214203050.6993-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 11:44:39 +0000
Message-ID: <CAFEAcA-U_S62AwsLjwOTOpJm+dxJ-k6CB2HN7nMa+npRcHMzLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] util/qemu-timer: Make timer_free() imply timer_del()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 20:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently timer_free() is a simple wrapper for g_free().  This means
> that the timer being freed must not be currently active, as otherwise
> QEMU might crash later when the active list is processed and still
> has a pointer to freed memory on it.  As a result almost all calls to
> timer_free() are preceded by a timer_del() call, as can be seen in
> the output of
>   git grep -B1 '\<timer_free\>'
>
> This is unfortunate API design as it makes it easy to accidentally
> misuse (by forgetting the timer_del()), and the correct use is
> annoyingly verbose.
>
> Make timer_free() imply a timer_del().  We use the same check as
> timer_deinit() ("ts->expire_time == -1") to determine whether the
> timer is already deleted (although this is only saving the effort of
> re-iterating through the active list, as timer_del() on an
> already-deactivated timer is safe).


> +static inline void timer_free(QEMUTimer *ts)
> +{
> +
> +    if (ts->expire_time != -1) {
> +        timer_del(ts);
> +    }
> +    g_free(ts);
> +}

I was thinking about this again this morning, and I'm not sure
this is thread-safe. timer_del() itself is, and the timer code
only updates ts->expire_time with the timer's timer_list's
active_timers_lock held, but here we're reading expire_time
with no lock. So I think the right thing would be just to
drop the attempt at optimisation, and just
  timer_del(ts);
  g_free(ts);

I find it hard to imagine that timer_free() is going to be
in a code path where the slight overhead of checking the
active timer list is going to matter. (If it *did* matter,
the right place to put this "is the expire time -1?" check
would be in timer_del() itself, because that gets called in
a lot more places and it already takes the appropriate lock.)

thanks
-- PMM


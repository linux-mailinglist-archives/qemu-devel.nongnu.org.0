Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425848DF15
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:39:07 +0100 (CET)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86sE-0004Kt-47
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86qh-0002wP-Gx
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:37:31 -0500
Received: from [2a00:1450:4864:20::332] (port=38565
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86qe-0006k9-VG
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:37:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso6129552wmc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7STNeajAmg6NjbpJ6soGf6+XXOcpx8eF48E6adWEr+Q=;
 b=ftfkTJjB19NCDt/Pp+ulH8cW5j8cHJQjOjCQz6UEiT37L9YbZRrSB+K7AZW6h0Hj76
 nyuBNMYxf5qaIlao4E0QTkkXH82YvmZeirUti+mkvHZU+jXLbfTmQKa4veuYg4CpSofJ
 AWblj8sf7omn3hl+EEiHcc8RqQi20i6VmFFM2xqa4B1f0zpENu7sZjeV5MwPcd0cBlYE
 n1H1bB0eegZLiAiFaGaKw+5PF384WIHN1dTuxThJ446Hfa3MfVt6hTX5YvFeJepfB9T7
 T4R3zz6a2k7xEsxuUr7jNDNImnpyBd/6am7Yx99HV5Ue9FS3Ztb2wieNh/sZRH9j9Mko
 9F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7STNeajAmg6NjbpJ6soGf6+XXOcpx8eF48E6adWEr+Q=;
 b=AHynKKJOzOyY3gY/xiWPP0sPzKXG538o14kg8x4B0caRNrCGBsyp5gkslT1WJKNdRE
 3JKt9LDTTBSafdYL/wo0BSEsz228zBT5n2XTR4nLsJvsqDLtVAxOSCzcRuNvbJJw+Jtv
 gBjO6NGsGIriF7XsHmOkY+Vpr11qFtofwR6KyFHfZrl/dS0JvGGMczgzNZvbLRaO1rm2
 AgO9Pb7m0JJhM8xfcAr2VSX0BMyEqiyj5bR+n8iS2QF0/GwFdVSz2nkSJAdTOVGzhBjV
 +N94bidvnfWbrUgwXjK6aYMztRYixjFKLhy2zmuDDxePxlgsHqXkAlYWSrQBlSAzvQTL
 7nKw==
X-Gm-Message-State: AOAM532ISxNpuOz3fQecdicsbN1K9nUcAJxo3dsc9HdndDra/2wcE9nU
 uFR6JtGZc7B6AXP1w+QCnfUWBCpeyDq4i95PFnC9eg==
X-Google-Smtp-Source: ABdhPJwuRRJfBNAM8DqPIvkT220DtQtIH6v3YAYXMElYcvz30mP1K5cgeIpSwmY7inKEIcDB8tLC/LMKoqo/ZQOMn2Q=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr12593167wmq.21.1642106246377; 
 Thu, 13 Jan 2022 12:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-23-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-23-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:37:15 +0000
Message-ID: <CAFEAcA-wf3UDDocabE6Th4ixrVWd4Lsfy3pjvnHGwGfNupzK_w@mail.gmail.com>
Subject: Re: [PATCH 22/30] bsd-user/signal.c: Fill in queue_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:51, Warner Losh <imp@bsdimp.com> wrote:
>
> Fill in queue signal implementation, as well as routines allocate and
> delete elements of the signal queue.

See reply to patch 18 for why you probably don't want to do this.

> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---


> +    /*
> +     * FreeBSD signals are always queued.  Linux only queues real time signals.
> +     * XXX this code is not thread safe.  "What lock protects ts->sigtab?"
> +     */

ts->sigtab shouldn't need a lock, because it is per-thread,
like all of TaskState. (The TaskState structure is pointed
to by the CPUState 'opaque' field. CPUStates are per-thread;
the TaskState for a new thread's new CPUState is allocated
and initialized as part of the emulating of whatever the
"create new thread" syscall is. For Linux this is in
do_fork() for the CLONE_VM case. The TaskState for the
initial thread is allocated in main.c.) We do need to deal
with the fact that ts->sigtab can be updated by a signal
handler (which always runs in the thread corresponding to
that guest CPU): the linux-user process_pending_signals()
has been written with that in mind.

thanks
-- PMM


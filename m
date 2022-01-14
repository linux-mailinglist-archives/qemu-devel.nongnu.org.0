Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09348EA9D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:24:38 +0100 (CET)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8MZJ-0007ca-Mc
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MTr-0003yw-OB
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:19:01 -0500
Received: from [2a00:1450:4864:20::431] (port=43805
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MTq-00027d-09
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:18:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id o3so15541509wrh.10
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sr0GoZNMLgoJ1NKsJsevfQ5Q6X8u/J0pKmrCf1Urvpc=;
 b=jUaXNRBxZKl43yYivFOuiUXZ0rUybOFLdJKS/kmRVcHMOJQoewQU3NRhb4SyDAY8Yk
 uoJYBl095qZIHL73iPl8EqjS04WMMyg3QjT4bFvWYIj94fyDrUjOUV0R4W9cmGOenC5T
 JBhb6WGpI2WPkWS1MbWByWmFjpxfRZEnQmQBFW4y4pcMnV3wDqr90gvXZTzruqra9EwB
 5EgQ+/lkZKBsSVYdPuDDnAJDOKknWf6VCVcgMBICisuA/oZhesB7oOnydz68XsMa2NQd
 x+mydHFD5f5ptgfghvpJSsUm7vNUDVD7xPv573uXQk1Bl8trTbq4gsj1JqNvydGk78c0
 hUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sr0GoZNMLgoJ1NKsJsevfQ5Q6X8u/J0pKmrCf1Urvpc=;
 b=Juh3XI0MvQLeFj219KDa+V1jLuepCbDekFsv5PmqZWiO53wmIst3VmuPb3y0FNA3If
 t7B3WcfZzlJ5WiTTyPp5HbBtO9l6StXvekBd1qn8+ZxLHeej9kfjSlKlPgjng2JkmIH7
 2HjPo753zxtvMRj5WS7cv6kLM2F4yVC9HS+ifvcatYlPmi/B3GJnBJ1DT1o5+1lVMLyu
 WjMLVr2vbLwtIXteKVeg6f051inIZd88ayjdQXtPGe2oJq75jVRttGV4jjkHHl4VZ7jd
 Ug/wUeGBWL7k/Yzhtvr5+FmcU392PPwZ4gK3ETqR6HX7ivKrxzdMM26ev30WoH/CSXAE
 p7jw==
X-Gm-Message-State: AOAM530talmwmzqqQ5S891cyK/7cOcIR32Co1OLEAVP8JCO7CQTx8cmN
 4tKeAQbihXdO3vxlVWexkviqfcdsjMnLbcUL4jnJCQ==
X-Google-Smtp-Source: ABdhPJwY1EWlAo9Q5dh+HOmuywx9fIW1LEWqIyuwKbIB0lGfhOrWCjGgS2U21S1n3SOY1S9jQWnDKO0GC75Xlh6bq38=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr8526055wrn.172.1642166336256; 
 Fri, 14 Jan 2022 05:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-31-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-31-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:18:45 +0000
Message-ID: <CAFEAcA96g9uvq_ukUGG8X6v4vk2ve4QWQepiCp7MEYpb1byt-Q@mail.gmail.com>
Subject: Re: [PATCH 30/30] bsd-user/signal.c: do_sigaltstack
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 9 Jan 2022 at 17:08, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement the meat of the sigaltstack(2) system call with do_sigaltstack.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  1 +
>  bsd-user/signal.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index c643d6ba246..fcdea460ed2 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -226,6 +226,7 @@ int host_to_target_signal(int sig);
>  void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
>  void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
>  long do_sigreturn(CPUArchState *regs, abi_ulong addr);
> +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>  int do_sigaction(int sig, const struct target_sigaction *act,
>                  struct target_sigaction *oact);
>  void QEMU_NORETURN force_sig(int target_sig);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index f055d1db407..e5e5e28c60c 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -528,6 +528,72 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>      cpu_exit(thread_cpu);
>  }
>
> +/* do_sigaltstack() returns target values and errnos. */
> +/* compare to kern/kern_sig.c sys_sigaltstack() and kern_sigaltstack() */
> +abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
> +{
> +    int ret;
> +    target_stack_t oss;
> +
> +    if (uoss_addr) {
> +        /* Save current signal stack params */
> +        oss.ss_sp = tswapl(target_sigaltstack_used.ss_sp);
> +        oss.ss_size = tswapl(target_sigaltstack_used.ss_size);
> +        oss.ss_flags = tswapl(sas_ss_flags(sp));
> +    }

This will need some minor changes to work with the sigaltstack
info being per-thread and in the TaskState struct.

-- PMM


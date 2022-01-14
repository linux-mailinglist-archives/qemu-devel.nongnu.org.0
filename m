Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374448E90A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:20:00 +0100 (CET)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Kch-0007Uy-Cw
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8KX7-0001vo-NV
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:14:13 -0500
Received: from [2a00:1450:4864:20::432] (port=36646
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8KX5-0004ke-HQ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:14:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id r28so15060893wrc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XB2tzPoHF6xwtfWDK+YLssS7FK1RxqYWDkmyjrFU0Ng=;
 b=TTN08nD9/DUMgD34gyCrc5To2d0chqYwmAOyjAMlRU1+A2XN9YsGU5NP14MQrakn/g
 s6NeMEHgZ2tJrb5HDl4NcSQe9OUpQxjRiZlLSdChPV2r6UdYBBAFLuc6sscCjmj03HXO
 x6sVprHAW48sFAgeKpNWDm5JOwRmckKXjR/VqKGtk2Y3WEm3+1B+gwmQUfsk91ERODr1
 UJDUrl5Rodd7oA+j0rOtiwtcNrkQleRuIvYcokbCmUVRC0eN5ogNI16dqSP+CC3ISp71
 AvF7KwSipfa4GANyMra1IDSlDIP3MfMMiJE5mqLgrqWF4EWBjpPdLjZKvaqnenLeu1q0
 jUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XB2tzPoHF6xwtfWDK+YLssS7FK1RxqYWDkmyjrFU0Ng=;
 b=FP5hpoZQ9BLZMcQNzkbMLUgECzSJwDlIE1Bk7ign3dIdwpRTPBR8ctN1tY+rLL93rW
 MxJm/hJYMtfmwfTCNzuz24+08+5MM7fXwi1qqNObZp9GAMPiisycaX/pDm+XHYO+8a6C
 SbK+x1Z+VSX1qaRJkCDUhKGjVL7gWhmseba93aALwvVJuIeqlJcK9P2Zqz9NzzrralXR
 Y0i13d4vMu/B5xDH752qXBRshIsfSCsAlQg4t+XUrX9oqoDAe8sGfbYz9zWzkNoKxIms
 TlSht33rbHjU99zMLNkOpPauOtKfRUlYxoaSOZqxptsw4Q044OCnHMDOLW+SX0WV0SUL
 tkEA==
X-Gm-Message-State: AOAM530LUeqLbfGo40tQ3iD4/T4k+SOMl8MYvgbsE+FuP+aqYmxWKtZv
 YxRSS9Kx/txqkt8yRUvzNXySbKyJYrC9cdn33YHQmodkvpcfIA==
X-Google-Smtp-Source: ABdhPJyziKV6sJ8Z78sM4fyTnlAoB5LPYwKrU0BQf1ZtFI9iOsp1S53pNgwtrYuybxCAXU0W0nabdg2V84eCcmkfUWM=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr7607299wri.295.1642158850064; 
 Fri, 14 Jan 2022 03:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-24-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-24-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 11:13:59 +0000
Message-ID: <CAFEAcA_fc_-qXoY07uZuMpT6kAUT+oT8RD_G=8vGgSQqDmH-WA@mail.gmail.com>
Subject: Re: [PATCH 23/30] bsd-user/signal.c: sigset manipulation routines.
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

On Sun, 9 Jan 2022 at 16:53, Warner Losh <imp@bsdimp.com> wrote:
>
> target_sigemptyset: resets a set to having no bits set
> qemu_sigorset:      computes the or of two sets
> target_sigaddset:   adds a signal to a set
> target_sigismember: returns true when signal is a member
> host_to_target_sigset_internal: convert host sigset to target
> host_to_target_sigset: convert host sigset to target
> target_to_host_sigset_internal: convert target sigset to host
> target_to_host_sigset: convert target sigset to host
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  3 ++
>  bsd-user/signal.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index e12617f5d69..e8c417c7c33 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -223,7 +223,10 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>  int target_to_host_signal(int sig);
>  int host_to_target_signal(int sig);
> +void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
> +void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
>  void QEMU_NORETURN force_sig(int target_sig);
> +int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
>
>  /* mmap.c */
>  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 93c3b3c5033..8dadc9a39a7 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -32,6 +32,9 @@
>
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
> +static void target_to_host_sigset_internal(sigset_t *d,
> +        const target_sigset_t *s);
> +
>
>  int host_to_target_signal(int sig)
>  {
> @@ -43,6 +46,44 @@ int target_to_host_signal(int sig)
>      return sig;
>  }
>
> +static inline void target_sigemptyset(target_sigset_t *set)
> +{
> +    memset(set, 0, sizeof(*set));
> +}
> +
> +#include <signal.h>

Don't include system headers halfway through the file like this,
please : put the #include at the top of the file with the others.

> +
> +int
> +qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right)
> +{
> +    sigset_t work;
> +    int i;
> +
> +    sigemptyset(&work);
> +    for (i = 1; i < NSIG; ++i) {
> +        if (sigismember(left, i) || sigismember(right, i)) {
> +            sigaddset(&work, i);
> +        }
> +    }
> +
> +    *dest = work;
> +    return 0;
> +}

FreeBSD's manpage says it has a native sigorset() --
https://www.freebsd.org/cgi/man.cgi?query=sigemptyset&sektion=3&apropos=0&manpath=freebsd
can you just use that ?

> +
> +static inline void target_sigaddset(target_sigset_t *set, int signum)
> +{
> +    signum--;
> +    uint32_t mask = (uint32_t)1 << (signum % TARGET_NSIG_BPW);
> +    set->__bits[signum / TARGET_NSIG_BPW] |= mask;
> +}
> +
> +static inline int target_sigismember(const target_sigset_t *set, int signum)
> +{
> +    signum--;
> +    abi_ulong mask = (abi_ulong)1 << (signum % TARGET_NSIG_BPW);
> +    return (set->__bits[signum / TARGET_NSIG_BPW] & mask) != 0;
> +}
> +
>  /* Adjust the signal context to rewind out of safe-syscall if we're in it */
>  static inline void rewind_if_in_safe_syscall(void *puc)
>  {
> @@ -55,6 +96,54 @@ static inline void rewind_if_in_safe_syscall(void *puc)
>      }
>  }
>
> +static void host_to_target_sigset_internal(target_sigset_t *d,
> +        const sigset_t *s)
> +{
> +    int i;
> +
> +    target_sigemptyset(d);
> +    for (i = 1; i <= TARGET_NSIG; i++) {

i here is iterating through host signal numbers, not target
numbers, so TARGET_NSIG isn't the right upper bound.
On Linux we iterate from 1 to _NSIG-1; on BSD I think
you may want (i = 0; i < NSIG; i++), but you should check that.

> +        if (sigismember(s, i)) {
> +            target_sigaddset(d, host_to_target_signal(i));
> +        }
> +    }
> +}

These functions are a little odd when you compare them to their
linux-user equivalents, because they're both written
with a sort of abstraction between host and target signal
numbers (they call host_to_target_signal() and
target_to_host_signal()) but also written with baked-in
assumptions that the mapping is basically 1:1 (they don't
have the code that handles the possibility that the
target signal isn't representable as a host signal or
vice-versa). But assuming the BSDs don't change their
signal numbering across architectures, this is fine.

thanks
-- PMM


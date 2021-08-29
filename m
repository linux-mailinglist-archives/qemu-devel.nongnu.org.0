Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E036C3FAEA9
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 23:11:51 +0200 (CEST)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKS5c-000732-EC
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 17:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKS4D-0004km-I3
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:10:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKS49-00006Q-JG
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:10:13 -0400
Received: by mail-ej1-x62e.google.com with SMTP id t19so26788181ejr.8
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6xo55Vod6vaIwz8qUmmfczFV9y54683wfrEVWbU+7E=;
 b=zPKksyZGGaaV93ChMtFuDVrE08R5wIMjs4ooN9Bp8GbOL4ba97Zdyx4m9KXq8nApQc
 IJ7euPn8wvz9XZH2+T2iJlhn9NvaCuDNSqrSQfj1aL1XvgdKSAc+6E7bIa8yhOZ2oydf
 Q/3GPEPElxxY2Ej+KLA4LR3lVgGzzCrZN5rUwe10o8PeS4pbS+WH4NbqsoLJO5hDvWCU
 bEpJHd7Kvh6jo4t/d1vaxDxKcTur3zQqH8ee4yxB1gwndaLd7CSOGs2iKHs45gO4IyZJ
 JCXABGmABrFUCZEHVR0cmYnjrqJk5USruLooqldE/nYFzp5jayDCcRfS2d19mNr+Eayw
 eu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6xo55Vod6vaIwz8qUmmfczFV9y54683wfrEVWbU+7E=;
 b=BwPbnXoM8jJO0M06AylYXu1HlHSE9zqJWOb/ikrTsqUda/1YZnqBKA1R/w3jQ4WcgX
 7tYXRV/fVztXItvrq+yZh1WmXq9mgF3IUTA7iMdFsYr7R7QA+8ffABpiMDEbrstBVU6x
 aQw7gU6xntRNgdmh+hoBP428QIKt0uVHs66+ELPiSZWY15PXRrbmiNgbxgXi+WrpJQtI
 +gApIyk8ZgzWBJ9pIRJccz0CSvnIDEJDB/xlNZZijyFwl1cl7H6XmXDY3GKYAMp5yQyp
 5SQmtgtymq5Nx6c0ZLdTa67tw5EkIU7ZtTG0aM0lIyHI0KzKM3Jcwar8K3PiEbETg8ri
 8ZdQ==
X-Gm-Message-State: AOAM533INPQ048ng+dZohNQxPEmzJPazfN2zHrm/I/ASxqQa/hiKdJim
 maA48vBChDIsVlqu+kRXDqCIMHEkcXwXqSAOY2g/7Q==
X-Google-Smtp-Source: ABdhPJw5nUv6P//AMNHodrAJcara3aOOMw1t550Vm2uVYy3iHzQCCwSKlr7t4k0pUBejPu3ZMNY+UZ/kgKi+oN2BNE4=
X-Received: by 2002:a17:906:abc3:: with SMTP id
 kq3mr2137628ejb.382.1630271407375; 
 Sun, 29 Aug 2021 14:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
In-Reply-To: <20210805193950.514357-1-johannes.stoelp@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 22:09:19 +0100
Message-ID: <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: johannst <johannes.stoelp@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 johannst <johannes.stoelp@gmail.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 at 21:34, johannst <johannes.stoelp@googlemail.com> wrote:
>
> Dear all,
>
> in my opinion the `type` argument in the kvm ioctl wrappers should be of
> type unsigned. Please correct me if I am wrong.

(Ccing Eric as our resident POSIX expert.)

> Due to the same reason as explained in the comment on the
> `irq_set_ioctl` field in `struct KVMState` (accel/kvm/kvm-all.c),
> the kvm ioctl wrapper should take `type` as an unsigned.

The reason in that comment:
    /* The man page (and posix) say ioctl numbers are signed int, but
     * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
     * unsigned, and treating them as signed here can break things */

It would be more helpful to readers to state the reason directly
in the commit message, rather than requiring them to go and look
up a comment in some other file.

(That comment, incidentally, seems to be no longer completely
true: on my system the ioctl manpage says 'unsigned long', though
the glibc info docs say 'int', in contradiction to the ioctl.h
glibc actually ships...)

Of the various KVM_* ioctls we use via these functions, do
any actually have values that would result in invalid sign
extension here ? That is, is this fixing an existing bug, or is
it merely avoiding a potential future bug?

> Signed-off-by: johannst <johannes.stoelp@gmail.com>
> ---
>  accel/kvm/kvm-all.c    | 8 ++++----
>  accel/kvm/trace-events | 8 ++++----
>  include/sysemu/kvm.h   | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0125c17edb..45cd6edce3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2967,7 +2967,7 @@ int kvm_cpu_exec(CPUState *cpu)
>      return ret;
>  }
>
> -int kvm_ioctl(KVMState *s, int type, ...)
> +int kvm_ioctl(KVMState *s, unsigned type, ...)

The underlying ioctl() prototype (at least in my Linux /usr/include/sys/ioctl.h
and as documented in the ioctl(2) manpage) uses "unsigned long" for the
request argument; should we do the same ?

-- PMM


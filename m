Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7133D49C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:10:12 +0100 (CET)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9Sd-0006PF-CO
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9Pm-0004k0-OS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:07:14 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:32878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM9Pk-00061O-Um
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:07:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id jt13so72066296ejb.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3foB02F1ArhbKlkk66lHx3I6/emZkgSCR0+SIvNmEVU=;
 b=kNykPyHYK+T8ve6DvzZKSTmJj4M7dI5GXr4bjnQWBOeioT3S/+0jRe/1t2+aPMRK8N
 Ns/SgRfdWBTrWl3Uy9iPra5RQYBzsT2p6WtjgDmN35mvJHUOrtxjH6eyeT6HIMUhH2Ic
 Ve4kXTKXAfDSjYIsMIOSJUfl9KtDqTdpXnjLT3mo/OEaLcapQHh0nOq6nRUVx1SeZ+Qc
 cYh67csbI1S9PXxtH359T6tuIPWwZVJ6kO1LohfccRP9J8xUsJTiSbRorF3BzPMSpEzM
 CuQ2pkhMfF2LaBdfdZCKZHTzPje1RKUGPT6cfCSeXu/X5/tlesI3R1ajevIH87EZleXd
 4jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3foB02F1ArhbKlkk66lHx3I6/emZkgSCR0+SIvNmEVU=;
 b=ImtyVEomnHFNVmZYspNB8cft8mUPETjIVnciOxS4KRxEAp8km1/iz6EBZNthZzgce2
 3NL4M3a7VBRzzXg5bpNbU7gfpXCyMhrAt40cUp9gj6lmpzPAq2zzSgcG2/W32Pi7mKh7
 7uLg7SO9ZRXwOOT6+jZbZYjnpfqI937INnUBb1SsOEtXmnpY5XaDtMXBHjuoEco2FE3d
 JwBPjeQhkZuwCdhpIIpVEnXBcYH7OJIcX+tALqUklgFvBsnEu1JzZnPTronkPeEY/Usb
 Jzcww+zcq+GGXlEsCYg2X6GBzJKF2+xmB9o0PRvPkbLdTkLTZE5GO2dhEfKHvtQI2wby
 I6dw==
X-Gm-Message-State: AOAM532w8SnZizE/K1DGsNinGTWwYdReDkiobSKx8JGuxCaWV/TbGv6L
 1YnjYLBZp6/bctu0k6SU3ffh4OXzRy2yjo+YFSA1Sw==
X-Google-Smtp-Source: ABdhPJwIuO0cr3kVla6J2sys9n1SLP4f7iiLsZR271+yLk3DfYU7rN9YVrOB8KqVDXAtuv42Elob+MeRlWhdTCIg3NA=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr30011636ejb.56.1615900030726; 
 Tue, 16 Mar 2021 06:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210316125254.461525-1-thuth@redhat.com>
In-Reply-To: <20210316125254.461525-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 13:06:48 +0000
Message-ID: <CAFEAcA8kHg7GEix+FYzmLTy5vU2niFP3iz3FaF3RtVap=Rq=cg@mail.gmail.com>
Subject: Re: [PATCH] include/sysemu: Poison all accelerator CONFIG switches in
 common code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Colin Xu <colin.xu@intel.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, haxm-team@intel.com,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 12:54, Thomas Huth <thuth@redhat.com> wrote:
>
> We are already poisoning CONFIG_KVM since this switch is not working
> in common code. Do the same with the other accelerator switches, too
> (except for CONFIG_TCG, which is special, since it is also defined in
> config-host.h).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/exec/poison.h | 4 ++++
>  include/sysemu/hax.h  | 4 ++++
>  include/sysemu/hvf.h  | 4 ++++
>  include/sysemu/whpx.h | 4 ++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 4cd3f8abb4..3250fc1d52 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -88,8 +88,12 @@
>  #pragma GCC poison CONFIG_SPARC_DIS
>  #pragma GCC poison CONFIG_XTENSA_DIS
>
> +#pragma GCC poison CONFIG_HAX
> +#pragma GCC poison CONFIG_HVF
>  #pragma GCC poison CONFIG_LINUX_USER
>  #pragma GCC poison CONFIG_KVM
>  #pragma GCC poison CONFIG_SOFTMMU
> +#pragma GCC poison CONFIG_WHPX
> +#pragma GCC poison CONFIG_XEN
>
>  #endif
> diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
> index 12fb54f990..247f0661d1 100644
> --- a/include/sysemu/hax.h
> +++ b/include/sysemu/hax.h
> @@ -24,6 +24,8 @@
>
>  int hax_sync_vcpus(void);
>
> +#ifdef NEED_CPU_H
> +
>  #ifdef CONFIG_HAX
>
>  int hax_enabled(void);
> @@ -34,4 +36,6 @@ int hax_enabled(void);
>
>  #endif /* CONFIG_HAX */
>
> +#endif /* NEED_CPU_H */
> +
>  #endif /* QEMU_HAX_H */

Now we only get hax_enabled() if NEED_CPU_H was defined
(which is different behaviour from kvm_enabled()).

I think we should structure all of these accel-specific
headers the same way we do kvm.h:
 * if we're being included from non-target-specific code, or
   if we're in target-specific code and we know KVM is present,
   you get the versions that reference functions/bools/etc
 * if we're being included from target-specific code where we
   know KVM is not present there are macros that evaluate
   to always-false/always-fails
 * there's a stub file that proivdes the functions/bools
   for the KVM-not-actually-present case

My argument here is basically consistency. We know already
that the structure we use in kvm.h works, and it's the most
solidly used/tested of the accelerators. Structuring the
other accelerators differently for no particular reason
is confusing to people trying to read or modify the code.

thanks
-- PMM


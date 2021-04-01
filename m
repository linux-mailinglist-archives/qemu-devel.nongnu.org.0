Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB33514D2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:37:29 +0200 (CEST)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwZk-0004D1-8A
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lRwV7-0002n4-FY
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:32:41 -0400
Received: from 13thmonkey.org ([80.100.255.32]:60833
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lRwV5-0005TL-JF
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:32:41 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id A5FF3C139C5; Thu,  1 Apr 2021 14:32:37 +0200 (CEST)
Date: Thu, 1 Apr 2021 14:32:37 +0200
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 2/4] Add NVMM accelerator: x86 CPU support
Message-ID: <YGW9ZSo5RbeqDuVX@diablo.13thmonkey.org>
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-3-reinoud@NetBSD.org>
 <5afd10b1-bd32-2f06-b311-246815428bfc@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JZZO+Q2K4y9a3TS/"
Content-Disposition: inline
In-Reply-To: <5afd10b1-bd32-2f06-b311-246815428bfc@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JZZO+Q2K4y9a3TS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2021 at 10:35:40AM +0200, Paolo Bonzini wrote:
> On 31/03/21 22:07, Reinoud Zandijk wrote:
> > +void nvmm_vcpu_kick(CPUState *cpu);
> 
> Not defined anywhere.

Hmmm, indeed. I think its a leftover of the former patch. Good catch.

> > +{
> > +#if NVMM_USER_VERSION == 1
> > +    struct sigaction sigact;
> > +    sigset_t set;
> > +
> > +    /* Install the IPI handler. */
> > +    memset(&sigact, 0, sizeof(sigact));
> > +    sigact.sa_handler = nvmm_ipi_signal;
> > +    sigaction(SIG_IPI, &sigact, NULL);
> > +
> > +    /* Allow IPIs on the current thread. */
> > +    sigprocmask(SIG_BLOCK, NULL, &set);
> > +    sigdelset(&set, SIG_IPI);
> > +    pthread_sigmask(SIG_SETMASK, &set, NULL);
> > +#else
> > +    /*
> > +     * We use the nvmm_vcpu_stop() mechanism, and don't use signals.
> > +     * Nothing to do.
> > +     */
> > +#endif
> 
> Since nvmm_vcpu_stop is very similar to KVM's immediate_exit mechanism, I
> think you still need to have a dummy signal handler to kick the VM out of
> the run loop *if it is in the kernel*.  The signal handler however can just
> do nothing.

Are you worried the in-kernel thread will somehow get stuck or halt on exit of
Qemu and left as a zombie?

> Also, can you just drop support for NVMM_USER_VERSION == 1?

Now thats a good suggestion. We could add support for it in the pkgsrc
package. When 9.0 gets retired, we could then retire it there without the need
to patch Qemu again.

> > diff --git a/target/i386/nvmm/meson.build b/target/i386/nvmm/meson.build
> > new file mode 100644
> > index 0000000000..c154e78014
> > --- /dev/null
> > +++ b/target/i386/nvmm/meson.build
> > @@ -0,0 +1,4 @@
> > +i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: files(
> > +  'nvmm-all.c',
> > +  'nvmm-accel-ops.c',
> > +))
> 
> The nvmm library should be added here.

I am not sure what you mean by that. You provided a patch for the meson.build
file, will that not suffice?

With regards,
Reinoud


--JZZO+Q2K4y9a3TS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBlvWEACgkQgpw3AEPI
qmj7qggAjmVqNTa86IdJscBqLixvf3cHfmRb/2DPYBZihWQUFL/1A46VP3jhGHrs
j2CNBl1pEgPZnVL8TyhiEqJn19naJHe8xdNSoKjTGkvLjsOtcGYGNFC5UgHyF2Hh
j0Nb6tYd/U+N/irFAxkZu4AtRhzY9M1rnYUJBu6tur4KI6/AgYfoHmghqsnDft3D
Azqv4xIE/0dajgaCOr/z7CD57t2LqBoXaYhjMe9KsnZgHIYOdfcxsXnYi0xUcEf6
9UdbkoUWkCdlUZrnLCSH+lSYNsk2Z4YRuoluMU1fV6wMH0Oq5hQYd89C1Ryzp2Kz
3AaFnvWKOM3jzWJvVESbJgMr7yFFDw==
=fPky
-----END PGP SIGNATURE-----

--JZZO+Q2K4y9a3TS/--


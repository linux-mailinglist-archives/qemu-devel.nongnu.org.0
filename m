Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BB388A47
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 11:11:32 +0200 (CEST)
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljIEj-0005O8-AL
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 05:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljICN-00038T-O0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:09:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljICJ-0008Mr-Ut
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:09:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a4so13205812wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oh5gMrvLGp6YH8ISfeGB5Z1stcWLM+ZYnhtAU6g/EvA=;
 b=T5+LEQwRzBt862u/J7waANioeFg0UBC41oenDDdveU71ETOQZxBigSC+IMwYOXOMGR
 bCJQMnys0sdnbeksacL7xao+KwFtI1JAiuxVT4Wg4JySfb1IyD07jqDWtZd6laJcTbwm
 mlH8ZEmZs0c7jrhKTD/cvLTrA27e/yS/14sqFLHTg9yi4kKAPNdJRLLhz7pWl5IITjy4
 nb0c/h8TA7Gck8K5gSDJjXctni68sN0D8g7OFZLhzO7AosAEqicpsjMRYpIw903Eb17j
 eKGZufIHRLvuDfL7VMkDfGV0owXS1wZv5fPKDojMb6oCInqkthArCGYZUUndKFXwRbLz
 X+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oh5gMrvLGp6YH8ISfeGB5Z1stcWLM+ZYnhtAU6g/EvA=;
 b=Ik/6KAtYUhuMdaXXXo/0dCPG+opkOrfZSmUQYdleW2mfH6CVjUJsHDJOvvPKC03uMl
 EaraNABwM5O2pcgUr7U9a+y2oZh+Vj7yR5OzO4HhhRINesVacYwkiSS2G8APfxJBmwxA
 a1xZ61hQAkS+uWqSrneuAuRkXBUrAfdZ509mQGM46e/+EqxGMpF32DlMUs7gAqGSfY/t
 1VE4+WEhuHhVTIJO96C5zfjBBK2n3Dk9+/ybEH8p7DQfqVfAJVVtQwqJeDWDv5EPdn8D
 CMccUTZe+/k6K+SgHvszcy04SwYR4bzGMsRrzuXf3glDgxdKtzo4KUqWPM9o5JXAu32m
 CHsw==
X-Gm-Message-State: AOAM533rYeyLY8MSCBjmrYjRTLTHTMTD/hPi1jp2qzZl+4dV7/RUxuxH
 bKMvT5jgr8w9OMCRZfq7H9U=
X-Google-Smtp-Source: ABdhPJzywM146q1x852dbNquDTa8wOxy+39ZqDkRRZJWr7pRcEmHgC988eEKdYdBs/59qN4uXWfRdw==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr13247745wrw.166.1621415337667; 
 Wed, 19 May 2021 02:08:57 -0700 (PDT)
Received: from localhost (1.9.90.146.dyn.plus.net. [146.90.9.1])
 by smtp.gmail.com with ESMTPSA id x2sm1015959wmc.21.2021.05.19.02.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 02:08:56 -0700 (PDT)
Date: Wed, 19 May 2021 10:08:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 14/25] qemu/bswap: Introduce load/store for aligned
 pointer
Message-ID: <YKTVp6potto1UR9V@stefanha-x1.localdomain>
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-15-philmd@redhat.com>
 <CAFEAcA80dcBqEeuSyMPEAC50SvArwU4Ac_zTgM_im0W8x=KPHQ@mail.gmail.com>
 <82c66450-24de-89a2-71fb-79dcdebd1baa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="03cMw4Z6SZLRHRk5"
Content-Disposition: inline
In-Reply-To: <82c66450-24de-89a2-71fb-79dcdebd1baa@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--03cMw4Z6SZLRHRk5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 07:56:51AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 5/18/21 10:15 PM, Peter Maydell wrote:
> > On Tue, 18 May 2021 at 19:38, Philippe Mathieu-Daud=E9 <philmd@redhat.c=
om> wrote:
> >>
> >> When the pointer alignment is known to be safe, we can
> >> directly swap the data in place, without having to rely
> >> on the compiler builtin code.
> >>
> >> Load/store methods expecting aligned pointer use the 'a'
> >> infix. For example to read a 16-bit unsigned value stored
> >> in little endianess at an unaligned pointer:
> >>
> >>   val =3D lduw_le_p(&unaligned_ptr);
> >>
> >> then to store it in big endianess at an aligned pointer:
> >>
> >>   stw_be_ap(&aligned_ptr, val);
> >=20
> > It sounded from the bug report as if the desired effect
> > was "this access is atomic". Nothing in the documentation here
> > makes that guarantee of the implementation -- it merely imposes
> > an extra requirement on the caller that the pointer alignment
> > is "safe" (which term it does not define...) and a valid
> > implementation would be to implement the "aligned" versions
> > identically to the "unaligned" versions...
> >=20
> > Q: should the functions at the bottom of this stack of APIs
> > be using something from the atomic.h header? If not, why not?
> > Do we need any of the other atomic primitives ?
>=20
> I'll defer this question to Stefan/Paolo...

Stricly speaking qatomic_read() and qatomic_set() are necessary for
__ATOMIC_RELAXED semantics.

The comment in atomic.h mentions this generally has no effect on
generated code. That's probably because aligned 16/32/64-bit accesses
don't tear on modern CPUs so no special instructions are needed. This is
why not using atomic.h usually works.

Even qatomic_read()/qatomic_set() is too strong since the doc comment
mentions it prevents the compiler moving other loads/stores past the
atomic operation. The hw/virtio/ code already has explicit memory
barriers and doesn't need the additional compiler barrier.

For safety I suggest using qatomic_read()/qatomic_set().

Stefan

--03cMw4Z6SZLRHRk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCk1acACgkQnKSrs4Gr
c8ipsQf+O8ddNYp1BHBNf4hQSf9Tig02784dof/jOnD6rFSf6Iu9jJONlu42mbqW
cpR4+vQ0Zr+WkJp7d9Kd53aS/K986c2nSG7YfD97xCCrfB8IQwQZ9IRSb213VYZ4
OPfwmIeyNnQsWjYvYL2v4SGZeZS83liK6TjASKQyHTd8tBq/rrsLVthSWJmKlnXG
xGzhwk/DooxhG+smAlCki2VKee8/yVNkTVTf2zqX4uquZBek42z9BL7rTxroJ6My
UmxCSfYLERzX1/3GpTgjnfdab2Fk/SWnlOryYwMbIbX91R2xEFCsw6qmRSUurON9
BFdXyiKCEuodaLNI4qRYvP7CJ5rLJw==
=AM3m
-----END PGP SIGNATURE-----

--03cMw4Z6SZLRHRk5--


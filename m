Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D953320BB6
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:29:55 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrcI-0005T4-5g
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDrbC-0004xq-5E
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:28:46 -0500
Received: from relay64.bu.edu ([128.197.228.104]:51982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDrbA-0003AU-H4
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:28:45 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11LGRj8Q012037
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 21 Feb 2021 11:27:49 -0500
Date: Sun, 21 Feb 2021 11:27:45 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: fix --enable-fuzzing linker failures
Message-ID: <20210221162745.m3gtnkcgnt377c3v@mozz.bu.edu>
References: <20210221160044.28581-1-alxndr@bu.edu>
 <CAFEAcA__DGB0T==xLwUNmizHznnzoYVMUOSOG8wB43LFJWLcqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA__DGB0T==xLwUNmizHznnzoYVMUOSOG8wB43LFJWLcqg@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210221 1622, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 16:03, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
> > This should allow us to build non-fuzzer binaries using objects
> > instrumented for fuzzing. However, to do that, we also need to link with
> > -fsanitize=fuzzer-no-link. We were not doing that.
> >
> > Reported-by: Li Qiang <liq3ea@163.com>
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  configure | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/configure b/configure
> > index a79b3746d4..02aaea31c8 100755
> > --- a/configure
> > +++ b/configure
> > @@ -6097,6 +6097,7 @@ if test "$fuzzing" = "yes" ; then
> >    # needed CFLAGS have already been provided
> >    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> >      QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> > +    QEMU_LDFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> 
> Did you mean  ="$QEMU_LDFLAGS ... ?

Yes... It somehow passed my build-test. Should I send a v2?

> 
> >      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
> 
> -- PMM


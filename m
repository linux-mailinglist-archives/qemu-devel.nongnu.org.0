Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB03E4CB2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:07:20 +0200 (CEST)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAcJ-0007Zs-8s
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mDAbT-0006vZ-7j
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:06:27 -0400
Received: from relay64.bu.edu ([128.197.228.104]:57957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mDAbR-0008Th-Bv
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:06:26 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 179J64XB005184
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Aug 2021 15:06:08 -0400
Date: Mon, 9 Aug 2021 15:06:04 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
Message-ID: <20210809190559.rqo7253wbcrq7r36@mozz.bu.edu>
References: <20210809111621.54454-1-alxndr@bu.edu>
 <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210809 1925, Peter Maydell wrote:
> On Mon, 9 Aug 2021 at 12:18, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > On oss-fuzz, we build twice, to put together a build that is portable to
> > the runner containers. On gitlab ci, this is wasteful and contributes to
> > timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
> > the remote cost of potentially missing some cases that break oss-fuzz
> > builds.
> >
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >
> > From a couple test runs it looks like this can shave off 15-20 minutes.
> >
> >  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
> >  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> I tried a test run with this, but it still hit the 1 hour timeout:
> 
> https://gitlab.com/qemu-project/qemu/-/pipelines/350387482

It also timed out for me with a 120 minute timeout:
https://gitlab.com/a1xndr/qemu/-/jobs/1488160601

The log has almost exactly the same number of lines as yours, so I'm
guessing one of the qtests is timing out with --enable-sanitizers .

-Alex

> 
> -- PMM


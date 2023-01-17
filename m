Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FA266E346
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:19:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHogR-0006MP-W0; Tue, 17 Jan 2023 11:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHogC-0006HL-Fe
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHogA-0004gt-RA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtItVWKzild6jH493vlo4opTZuI50sw68RPYlf6mPL4=;
 b=bdhsXgRm/rycBWQLnih9ol0mmRaPyfzwoa9wEwFlw7P3VNwyyOvwaE6+8PywesHyp8MyQC
 sgvf/poA1QVvNMEH2lN3nIa0CajRbHMWna/b8SQJHyhbWQtxghMurmKxlLDF7AlXdPOmvi
 VSzdu4w1Ne5eirLz4mHt8J81pWnAWBQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-kiMQ25CdPsy0V3FG50JIaw-1; Tue, 17 Jan 2023 11:08:16 -0500
X-MC-Unique: kiMQ25CdPsy0V3FG50JIaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFC993C11C63;
 Tue, 17 Jan 2023 15:59:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FF39C15BA0;
 Tue, 17 Jan 2023 15:59:49 +0000 (UTC)
Date: Tue, 17 Jan 2023 16:59:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/3] configure: Enable -Wthread-safety if present
Message-ID: <Y8bF8yBAKFcd3jui@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-4-eesposit@redhat.com>
 <Y8aqii6iBsdd5rl6@redhat.com>
 <b24cbd41-6190-8642-4673-01a6c4b50659@redhat.com>
 <Y8a4MFiwtxmE8JI4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y8a4MFiwtxmE8JI4@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 17.01.2023 um 16:01 hat Daniel P. Berrang=E9 geschrieben:
> On Tue, Jan 17, 2023 at 03:41:29PM +0100, Emanuele Giuseppe Esposito wrot=
e:
> >=20
> >=20
> > Am 17/01/2023 um 15:02 schrieb Daniel P. Berrang=E9:
> > > On Tue, Jan 17, 2023 at 08:52:03AM -0500, Emanuele Giuseppe Esposito =
wrote:
> > >> From: Kevin Wolf <kwolf@redhat.com>
> > >>
> > >> This enables clang's thread safety analysis (TSA), which we'll use to
> > >> statically check the block graph locking.
> > >>
> > >> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > >> Message-Id: <20221207131838.239125-9-kwolf@redhat.com>
> > >> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > >> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > >> ---
> > >>  configure | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/configure b/configure
> > >> index 2281892657..14668e6269 100755
> > >> --- a/configure
> > >> +++ b/configure
> > >> @@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
> > >>  add_to warn_flags -Wendif-labels
> > >>  add_to warn_flags -Wexpansion-to-defined
> > >>  add_to warn_flags -Wimplicit-fallthrough=3D2
> > >> +add_to warn_flags -Wthread-safety
> > >=20
> > > Does this thread safety analysis have any kind of measurable
> > > impact on compilation speed ?
> > >=20
> > > Our CI jobs are quite sensitive to any increase in build
> > > time.
> >=20
> > From a quick run in my machine (Dell PowerEdge R440 with Intel(R)
> > Xeon(R) Gold 5120 CPU @ 2.20GHz, 28 cpus):
> >=20
> > without clang:
> > real    2m46.729s=0F
> > =03user    19m24.122s=0F
> > =03sys     2m58.643s=0F
> >=20
> > with clang:
> > real    2m45.204s
> > user    19m52.096s
> > sys     2m9.036s
> >=20
> > So there should be no significative impact.
> >=20
> > I also forgot to mention that this serie fixes the CI failure seen in:
> >=20
> > https://gitlab.com/qemu-project/qemu/-/jobs/3479763741
> > https://gitlab.com/qemu-project/qemu/-/jobs/3479763746
>=20
> Odd, that job already has  -Wthread-safety included in CFLAGS, which
> would seem to make this patch redundant, but I don't see where
> -Wthread-safety came from in that pipeline=20

This patch is what was already in the branch in which the above CI tests
ran. I dropped it from the pull request because of these build failures
on FreeBSD. (Their libc includes TSA annotations, which means that QEMU
functions have to be annotated as well when they call pthread locking
functions, before we can enable -Wthread-safety.)

So patches 1 and 2 fix the failure that you would otherwise see with
this patch.

Kevin



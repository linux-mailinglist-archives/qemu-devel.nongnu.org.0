Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C44702D9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:29:58 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvguK-0000PV-MS
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgqY-00071W-Ax
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgqW-0007a1-Ts
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639146360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/fQhL13kei0u+4oY8eNc3iHIMEdTc/fKmQ20E1aogA=;
 b=dErxGyxVQQI7+tE5IlfmF/B+ef83z04bhCS4G4hMWMTwuY9QpYm2oHuxH62SFcU+uquRW/
 KtVC7ON0+zSVtGtBQ0pWUGITfP1gfGbuJQQiYUJzhjpGkW1MahbNRQAvKg/io+6D1oaJcy
 Lh1CTTSFQ1uOMH9d1nQGICqjNo/0bAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-t3Ndz_UxOu2RwupyR8IpMA-1; Fri, 10 Dec 2021 09:25:57 -0500
X-MC-Unique: t3Ndz_UxOu2RwupyR8IpMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97183801962;
 Fri, 10 Dec 2021 14:25:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD1910016F5;
 Fri, 10 Dec 2021 14:25:54 +0000 (UTC)
Date: Fri, 10 Dec 2021 15:25:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
Message-ID: <YbNjcA3GVWbN1SHI@redhat.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-3-vsementsov@virtuozzo.com>
 <CAFn=p-aAB9TXcJkm_cNtAowz_AjWeTvFgyL8kZ7E4zyDqMxF_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aAB9TXcJkm_cNtAowz_AjWeTvFgyL8kZ7E4zyDqMxF_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: den@openvz.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.12.2021 um 18:59 hat John Snow geschrieben:
> On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
> vsementsov@virtuozzo.com> wrote:
> 
> > We are going to use do_run_test() in multiprocessing environment, where
> > we'll not be able to change original runner object.
> >
> > Happily, the only thing we change is that last_elapsed and it's simple
> > to do it in run_tests() instead. All other accesses to self in
> > do_runt_test() and in run_test() are read-only.
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >  tests/qemu-iotests/testrunner.py | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qemu-iotests/testrunner.py
> > b/tests/qemu-iotests/testrunner.py
> > index fa842252d3..a9f2feb58c 100644
> > --- a/tests/qemu-iotests/testrunner.py
> > +++ b/tests/qemu-iotests/testrunner.py
> > @@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
> >                                diff=diff, casenotrun=casenotrun)
> >          else:
> >              f_bad.unlink()
> > -            self.last_elapsed.update(test, elapsed)
> >              return TestResult(status='pass', elapsed=elapsed,
> >                                casenotrun=casenotrun)
> >
> > @@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
> >                      print('\n'.join(res.diff))
> >              elif res.status == 'not run':
> >                  notrun.append(name)
> > +            elif res.status == 'pass':
> > +                assert res.elapsed is not None
> > +                self.last_elapsed.update(t, res.elapsed)
> >
> >              sys.stdout.flush()
> >              if res.interrupted:
> > --
> > 2.31.1
> >
> >
> (I continue to be annoyed by the "None" problem in mypy, but I suppose it
> really can't be helped. Nothing for you to change with this patch or
> series. I just wish we didn't need so many assertions ...)

I'm inclined to say it's a None problem in our code, not in mypy.
Essentially it comes from the fact that we're abusing a string
(res.status) and None values to distinguish different types of results
that have a different set of valid attributes.

Of course, Python already provides a language feature to distinguish
different types of results that have a different set of attributes and
that wouldn't run into this problem: subclasses.

Kevin



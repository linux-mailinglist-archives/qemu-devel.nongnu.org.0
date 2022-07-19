Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2657954A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:34:30 +0200 (CEST)
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDigW-0004lA-Lg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDieZ-0003Hd-Rz
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDieU-00083m-Jn
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658219541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=u9lKDxTwon2+XaDnrXgdCuz9Gu1jdGtTlWsMOe/9h9Q=;
 b=T2r7DWBIr3W/e4iYEsT+39uuehazBIXUWmmjA5iEFvKCf3/YArk+aeU72d/u2aoHcSOp4w
 T9+tAC6dAYkCgGuOmxt9aY7Npe7QhZD4ZlvBe66dFS6PUfarnxUdI61JFbM/c1LII6qd6e
 RkQ9Pva0gDRQmqQwvwHM2eOVPloQ2Z8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-Q8qra2O6OaiWrY6ztgbYDw-1; Tue, 19 Jul 2022 04:32:08 -0400
X-MC-Unique: Q8qra2O6OaiWrY6ztgbYDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3277D85A584
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 08:32:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91937492CA4;
 Tue, 19 Jul 2022 08:32:06 +0000 (UTC)
Date: Tue, 19 Jul 2022 09:32:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <YtZsBFT2t1bt0hjR@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtWxHSjpORK31aLs@xz-m1.local>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 18, 2022 at 03:14:37PM -0400, Peter Xu wrote:
> Hi, Thomas,
> 
> On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
> > On 07/07/2022 20.46, Peter Xu wrote:
> > > We used to stop running all tests if uffd is not detected.  However
> > > logically that's only needed for postcopy not the rest of tests.
> > > 
> > > Keep running the rest when still possible.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >   tests/qtest/migration-test.c | 11 +++++------
> > >   1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > Did you test your patch in the gitlab-CI? I just added it to my testing-next
> > branch and the the test is failing reproducibly on macOS here:
> > 
> >  https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
> >  https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
> > 
> > (without your patch the whole test is skipped instead)
> 
> Thanks for reporting this.
> 
> Is it easy to figure out which test was failing on your side?  I cannot
> easily reproduce this here on a MacOS with M1.
> 
> Or any hint on how I could kick the same CI as you do would help too.  I
> remembered I used to kick the test after any push with .gitlab-ci.yml but
> it seems it's not triggering for some reason here.

It is now opt-in with gitlab,  'git push -o ci.variable=QEMU_CI=1' to
create the pipeline, then in the UI manually start the jobs you wish
to run. Or QEMU_CI=2 to auto-run everything.

Note for MacOS you'll need to configure Cirrus CI integration first
though, per .gitlab-ci.d/cirrus/README


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



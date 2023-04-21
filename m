Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DA6EB079
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:21:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuQg-0002Nq-Sk; Fri, 21 Apr 2023 13:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuQe-0002NW-L2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuQc-00011C-M8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682097608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wp2AZGlzQDlNpv5rZLbqYS2uf1vrENwJqARxY9V8jc0=;
 b=U1m+BXsWM+BXhGrqjFYRGfM0yAMBOWYSzhWHltVDi0arlJBA4hkRw4ukVOvMF4IkQgFyqa
 wDhgvx5/jpx8EfnwEib0doJdHAlRb0nbbjJQTiT0n2+yV1+ujlj2KdfLermEfQjsNQIs70
 WNa0P3B5n+hilisOHjUw5ZnvXV9Nkc8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-H_GaJohKPL-zhO9yw9GYow-1; Fri, 21 Apr 2023 13:20:06 -0400
X-MC-Unique: H_GaJohKPL-zhO9yw9GYow-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B2B2807D6C;
 Fri, 21 Apr 2023 17:20:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABDC492C13;
 Fri, 21 Apr 2023 17:20:05 +0000 (UTC)
Date: Fri, 21 Apr 2023 18:20:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios
 run non-live
Message-ID: <ZELFw4PybPB9xpBX@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-3-berrange@redhat.com>
 <87cz41ynlr.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz41ynlr.fsf@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 04:52:32PM -0300, Fabiano Rosas wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > There are 27 pre-copy live migration scenarios being tested. In all of
> > these we force non-convergance and run for one iteration, then let it
> > converge and wait for completion during the second (or following)
> > iterations. At 3 mbps bandwidth limit the first iteration takes a very
> > long time (~30 seconds).
> >
> > While it is important to test the migration passes and convergance
> > logic, it is overkill to do this for all 27 pre-copy scenarios. The
> > TLS migration scenarios in particular are merely exercising different
> > code paths during connection establishment.
> >
> > To optimize time taken, switch most of the test scenarios to run
> > non-live (ie guest CPUs paused) with no bandwidth limits. This gives
> > a massive speed up for most of the test scenarios.
> >
> > For test coverage the following scenarios are unchanged
> >
> >  * Precopy with UNIX sockets
> >  * Precopy with UNIX sockets and dirty ring tracking
> >  * Precopy with XBZRLE
> >  * Precopy with multifd
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> ...
> 
> > -        qtest_qmp_eventwait(to, "RESUME");
> > +        if (!args->live) {
> > +            qtest_qmp_discard_response(to, "{ 'execute' : 'cont'}");
> > +        }
> > +        if (!got_resume) {
> > +            qtest_qmp_eventwait(to, "RESUME");
> > +        }
> 
> Hi Daniel,
> 
> On an aarch64 host I'm sometimes (~30%) seeing a hang here on a TLS test:
> 
> ../configure --target-list=aarch64-softmmu --enable-gnutls
> 
> ... ./tests/qtest/migration-test --tap -k -p /aarch64/migration/precopy/tcp/tls/psk/match

I never came to a satisfactory understanding of why this problem hits
you. I've just sent out a new version of this series, which has quite
a few differences, so possibly I've fixed it by luck.

So if you have time, I'd appreciate any testing you can try on

  https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03688.html


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3A55E53B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:14:00 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ByZ-00032H-Cw
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Bvn-0000qA-Lj
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Bvm-0002Wi-0m
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425464;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEOS1jfz6mfncCma+iQyV0Dpt0e8OW33cdkV24tabtM=;
 b=dr+YAQelDJkLDBtYOiuAEQHzxOT4f19sGNkWzu/KkWi9vsxQgh86eegoYl+LbpO6t7cb5m
 GIuVk9tCKSShrcL9pfDAI1AfyN2pmtAljq8y2Ngept+UoRkaRs7ii8AyRSeO/Y9nJbEtjl
 iNUpCjVAoClVEapl20n+99xJIqviYzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-dql5is6NPAe-p68NvpW_6w-1; Tue, 28 Jun 2022 10:11:01 -0400
X-MC-Unique: dql5is6NPAe-p68NvpW_6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3EDF29DD9A2;
 Tue, 28 Jun 2022 14:11:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD8140D2853;
 Tue, 28 Jun 2022 14:10:59 +0000 (UTC)
Date: Tue, 28 Jun 2022 15:10:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 2/5] tests: wait for migration completion before looking
 for STOP event
Message-ID: <YrsL8AA4M4osiKbi@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-3-berrange@redhat.com>
 <YrsLXV0fX/uTDSBU@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrsLXV0fX/uTDSBU@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 28, 2022 at 03:08:29PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > When moving into the convergance phase, the precopy tests will first
> > look for a STOP event and once found will look for migration completion
> > status. If the test VM is not converging, the test suite will be waiting
> > for the STOP event forever. If we wait for the migration completion
> > status first, then we will trigger the previously added timeout and
> > prevent the test hanging forever.
> 
> Yeh OK, I guess we might end up with a similar time limit being added to
> qtest_qmp_eventwait.

Yeah, my first inclination was to modify that method, but it was
not so straightforward, since the wait is done by sitting in recv()
on a blocking socket and I didn't fancy getting into refactoring
that side of things.

> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index d33e8060f9..ac9e303b1f 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1232,6 +1232,10 @@ static void test_precopy_common(MigrateCommon *args)
> >  
> >          migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
> >  
> > +        /* We do this first, as it has a timeout to stop us
> > +         * hanging forever if migration didn't converge */
> > +        wait_for_migration_complete(from);
> > +
> >          if (!got_stop) {
> >              qtest_qmp_eventwait(from, "STOP");
> >          }
> > @@ -1239,7 +1243,6 @@ static void test_precopy_common(MigrateCommon *args)
> >          qtest_qmp_eventwait(to, "RESUME");
> >  
> >          wait_for_serial("dest_serial");
> > -        wait_for_migration_complete(from);
> >      }
> >  
> >      if (args->finish_hook) {
> > -- 
> > 2.36.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



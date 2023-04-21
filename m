Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0936EB083
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:23:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuSj-0003Th-6J; Fri, 21 Apr 2023 13:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuSi-0003TZ-0k
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuSg-00017l-4o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682097737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZnc+qFqit6zOLQq0jhBMSgPSYdKomBDCQ5qokLg7Z0=;
 b=Y1snsgZvjLl4wylBLFmeLCIAqnMsRF1C045f/tQryp1rKbZT+o4pfzlnhr3mbD0E02mvmj
 +V+TV3tkWwoyEhN8XXHRI8elyf5pX5J4ZN7/m4l+DUMFeeHy3sWO+CHnTj6gZ09pClO/S3
 Fa/I0z4GDKaeVvOfqBrsgjkFdxHlQKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-hfYB5FU9PACXJJRpmgVgtA-1; Fri, 21 Apr 2023 13:22:15 -0400
X-MC-Unique: hfYB5FU9PACXJJRpmgVgtA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69858884621
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 17:22:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9DB9492C14;
 Fri, 21 Apr 2023 17:22:14 +0000 (UTC)
Date: Fri, 21 Apr 2023 18:22:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] tests/migration: Make precopy fast
Message-ID: <ZELGRCwK4sy8qdmP@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
 <20230412142001.16501-2-quintela@redhat.com>
 <ZD6E0E6q/tKDl0k0@redhat.com> <87v8ht1iwk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8ht1iwk.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Apr 18, 2023 at 02:20:27PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Wed, Apr 12, 2023 at 04:20:00PM +0200, Juan Quintela wrote:
> >> Otherwise we do the 1st migration iteration at a too slow speed.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  tests/qtest/migration-test.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >> 
> >> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> >> index 3b615b0da9..7b05b0b7dd 100644
> >> --- a/tests/qtest/migration-test.c
> >> +++ b/tests/qtest/migration-test.c
> >> @@ -1348,6 +1348,7 @@ static void test_precopy_common(MigrateCommon *args)
> >>          migrate_qmp(from, args->connect_uri, "{}");
> >>      }
> >>  
> >> +    migrate_ensure_converge(from);
> >
> > This isn't right - it defeats the point of having the call to
> > migrate_ensure_non_converge() a few lines earlier.
> 
> Depends on what is the definiton or "right" O:-)
> 
> >>      if (args->result != MIG_TEST_SUCCEED) {
> >>          bool allow_active = args->result == MIG_TEST_FAIL;
> >> @@ -1365,8 +1366,6 @@ static void test_precopy_common(MigrateCommon *args)
> >>              wait_for_migration_pass(from);
> >>          }
> >>  
> >> -        migrate_ensure_converge(from);
> >> -
> >
> > The reason why we had it here was to ensure that we test more than
> > 1 iteration of migration. With this change, migrate will succeed
> > on the first pass IIUC, and so we won't be exercising the more
> > complex code path of repeated iterations.
> 
> Aha.
> 
> If that is the definition of "right", then I agree that my changes are
> wrong.
> 
> But then I think we should change how we do the test.  We should split
> this function (then same for postcopy, multifd, etc) to have to
> versions, one that want to have multiple rounds, and another that can
> finish as fast as possible.
> 
> This way we need to setup the 3MB/s only for the tests that we want to
> loop, and for the others put something faster.
> 
> 
> >
> > I do agree with the overall idea though. We have many many migration
> > test scenarios and we don't need all of them to be testing multiple
> > iterations - a couple would be sufficient.
> >
> > In fact we don't even need to be testing live migration for most
> > of the cases. All the TLS test cases could be run with guest CPUs
> > paused entirely removing any dirtying, since they're only interested
> > in the initial network handshake/setup process testnig.
> >
> > I had some patches I was finishing off just before I went on vacation
> > a few weeks ago which do this kind of optimization, which I can send
> > out shortly.
> 
> I will wait for your patches before I sent anything different.
> 
> I have local patches for doing something different, changing
> 
>       "-serial file:%s/src_serial "
> 
> and other friends to:
> 
>       "-serial file:%s/src_serial%pid "
> 
> So we are sure that two tests never "reuse" the socket, as it can create
> problems for example when doing the cancel and relaunching the
> destination.
> 
> But as said, will wait until you send your series to send anything.

I've just sent a new series which has some more differences and
improvements

https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03688.html


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



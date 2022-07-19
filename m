Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C557B5797CC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:39:49 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkdo-0003V2-FU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDkcB-00027f-7Q
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oDkc7-0003l7-Aj
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658227081;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6xuDqejGML/+13sJD1/aRTQrbEVWJ/Ii1kWzxB60GJs=;
 b=PG95VxwSVNSHv7pIs8hLlJ6bY8baqbT6ANy9NRZ5cuyd4BjjB+lRSa7lwerQJNi1lP1MCJ
 0jHa2jQrCjodUJivIyCNMDJotnn/euMH6ILXWfNrOKzNCTrX4ST8mFg3xCs6W5+4lIB1R5
 14n9F++ggmQW5gsgNKSw1hjGW9YBXx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-CFWb4AfWO7yOluNZjPS-Jg-1; Tue, 19 Jul 2022 06:37:59 -0400
X-MC-Unique: CFWb4AfWO7yOluNZjPS-Jg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4FCE80418F
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 10:37:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BFF540E80E0;
 Tue, 19 Jul 2022 10:37:57 +0000 (UTC)
Date: Tue, 19 Jul 2022 11:37:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <YtaJg0zU8Fo3p2NB@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Tue, Jul 19, 2022 at 12:28:24PM +0200, Thomas Huth wrote:
> On 18/07/2022 21.14, Peter Xu wrote:
> > Hi, Thomas,
> > 
> > On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
> > > On 07/07/2022 20.46, Peter Xu wrote:
> > > > We used to stop running all tests if uffd is not detected.  However
> > > > logically that's only needed for postcopy not the rest of tests.
> > > > 
> > > > Keep running the rest when still possible.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > ---
> > > >    tests/qtest/migration-test.c | 11 +++++------
> > > >    1 file changed, 5 insertions(+), 6 deletions(-)
> > > 
> > > Did you test your patch in the gitlab-CI? I just added it to my testing-next
> > > branch and the the test is failing reproducibly on macOS here:
> > > 
> > >   https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
> > >   https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
> > > 
> > > (without your patch the whole test is skipped instead)
> > 
> > Thanks for reporting this.
> > 
> > Is it easy to figure out which test was failing on your side?  I cannot
> > easily reproduce this here on a MacOS with M1.
> 
> I've modified the yml file to only run the migration test in verbose mode
> and got this:
> 
> ...
> ok 5 /x86_64/migration/validate_uuid_src_not_set
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> source,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-ef2fMr/src_serial -drive
> file=/tmp/migration-test-ef2fMr/bootsect,format=raw  -uuid
> 11111111-1111-1111-1111-111111111111 2>/dev/null -accel qtest
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> target,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> unix:/tmp/migration-test-ef2fMr/migsocket -drive
> file=/tmp/migration-test-ef2fMr/bootsect,format=raw   2>/dev/null -accel
> qtest
> ok 6 /x86_64/migration/validate_uuid_dst_not_set
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> source,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-ef2fMr/src_serial -drive
> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-58011.sock
> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-58011.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> target,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-ef2fMr/dest_serial -incoming
> unix:/tmp/migration-test-ef2fMr/migsocket -drive
> file=/tmp/migration-test-ef2fMr/bootsect,format=raw    -accel qtest
> **
> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> Bail out!
> ERROR:../tests/qtest/migration-helpers.c:181:wait_for_migration_status:
> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)

This is the safety net we put it to catch case where the test has
got stuck. It is set at 2 minutes.

There's a chance that is too short, so one first step might be to
increase to 10 minutes and see if the tests pass. If it still fails,
then its likely a genuine bug

> qemu-system-x86_64: failed to save SaveStateEntry with id(name): 2(ram): -5
> qemu-system-x86_64: Unable to write to socket: Broken pipe
> /var/folders/tn/f_9sf1xx5t14qm_6f83q3b840000gn/T/scripts81855ad8681d0d86d1e91e00167939cb.sh:
> line 9: 58011 Abort trap: 6           QTEST_QEMU_BINARY=./qemu-system-x86_64
> tests/qtest/migration-test
> 
> (see: https://cirrus-ci.com/task/5719789887815680?logs=build#L7205 )
> 
> So it seems like validate_uuid_dst_not_set was the last successful test, and
> it's likely failing with test_migrate_auto_converge ?

Agreed, looks like auto_converge test, which is the first test that
actually tries to run a migration to completion. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



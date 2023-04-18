Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D96E6799
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 16:55:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pomie-0000EF-3q; Tue, 18 Apr 2023 10:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pomic-0000Ds-Fg
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 10:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pomia-0000K2-DV
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 10:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681829643;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Te7ZL7RB9or60F5B4sreUzdGxKVT7SqQFuXvARgHbt0=;
 b=cil0oKGjs1BqENF/UCFXwzbmx66Lk6xPKWuwPoQ//JMF67Zr09uBdCzLVP73b8IaqsvHkl
 BVhO2Vd8wtH0audzmcbvjVCn9t7ORgquD/zs/TIBhmuMOcNtP+Qq/TvD1b51v7TrKXq8Xv
 6PFBTyjN7/NpL8aNwRVUWAy8pQPFKSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-a_s3VSiKM92isgsOEdvGFA-1; Tue, 18 Apr 2023 10:54:01 -0400
X-MC-Unique: a_s3VSiKM92isgsOEdvGFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90993858297
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 14:54:01 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B142166B26;
 Tue, 18 Apr 2023 14:54:00 +0000 (UTC)
Date: Tue, 18 Apr 2023 15:53:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
Message-ID: <ZD6vBs8Ua+uC6EEN@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
 <874jpd2z7s.fsf@secure.mitica>
 <44abaed4-465b-38c7-8d98-ed774b1dc478@redhat.com>
 <87r0sh1g62.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r0sh1g62.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Tue, Apr 18, 2023 at 03:19:33PM +0200, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
> > On 18/04/2023 13.42, Juan Quintela wrote:
> >> Thomas Huth <thuth@redhat.com> wrote:
> >>> On 12/04/2023 16.19, Juan Quintela wrote:
> >>>> Since commit:
> >>>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
> >>>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>> Date:   Mon Mar 6 15:26:12 2023 +0000
> >>>>       tests/migration: Tweek auto converge limits check
> >>>>       Thomas found an autoconverge test failure where the
> >>>>       migration completed before the autoconverge had kicked in.
> >>>>       [...]
> >>>> migration-test has become very slow.
> >>>> On my laptop, before that commit migration-test takes 2min10seconds
> >>>> After that commit, it takes around 11minutes
> >>>> We can't revert it because it fixes a real problem when the host
> >>>> machine is overloaded.  See the comment on test_migrate_auto_converge().
> >>>
> >>> Thanks, your patches decrease the time to run the migration-test from
> >>> 16 minutes down to 5 minutes on my system, that's a great improvement,
> >>> indeed!
> >>>
> >>> Tested-by: Thomas Huth <thuth@redhat.com>
> >> Thanks
> >> 
> >>> (though 5 minutes are still quite a lot for qtests ... maybe some
> >>> other parts could be moved to only run with g_test_slow() ?)
> >> Hi
> >> Could you gime the output of:
> >> time for i in $(./tests/qtest/migration-test -l | grep "^/"); do
> >> echo $i; time ./tests/qtest/migration-test -p $i; done
> >> To see what tests are taking so long on your system?
> >> On my system (i9900K processor, i.e. not the latest) and
> >> auto_converge
> >> moved to slow the total of the tests take a bit more than 1 minute.
> >
> > This is with both of your patches applied:
> 
> 
> > /x86_64/migration/postcopy/plain
> > /x86_64/migration/postcopy/plain: OK
> >
> > real	0m35,446s
> > user	0m47,208s
> > sys	0m11,828s
> 
> This is quite slower than on mine, basically almost all the code that
> does migration.

This is expected AFAIK.  The migrate_postcopy_prepare method
waits for 1 complete pre-copy pass to run at 3mbps, before
switching to pre-copy mode.

> 
> $ time ./tests/qtest/migration-test -p /x86_64/migration/postcopy/plain
> # random seed: R02S42809b71f513e8524bd24df5facd5768
> # Start of x86_64 tests
> # Start of migration tests
> # Start of postcopy tests
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-246853.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-246853.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 150M -serial file:/tmp/migration-test-1MGL31/src_serial -drive file=/tmp/migration-test-1MGL31/bootsect,format=raw    -accel qtest
> # starting QEMU: exec ./qemu-system-x86_64 -qtest unix:/tmp/qtest-246853.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-246853.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 150M -serial file:/tmp/migration-test-1MGL31/dest_serial -incoming unix:/tmp/migration-test-1MGL31/migsocket -drive file=/tmp/migration-test-1MGL31/bootsect,format=raw    -accel qtest
> ok 1 /x86_64/migration/postcopy/plain
> # End of postcopy tests
> # End of migration tests
> # End of x86_64 tests
> 1..1
> 
> real	0m1.104s
> user	0m0.697s
> sys	0m0.414s

That is surprisingly fast - it is like it is not doing the pre-copy
pass at all.


> > real	5m32,733s
> > user	7m24,380s
> > sys	1m50,801s
> 
> Ouch.
> 
> Can I ask:
> - what is your machine?  It is specially slow?
>   Otherwise I want to know why it is happening.

This matches what I see in my laptop - any test which runs a full
pre-copy pass gets 30 seconds time added for this phase


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



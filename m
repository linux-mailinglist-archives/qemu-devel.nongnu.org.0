Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79646E802A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:15:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBOQ-0007IL-BL; Wed, 19 Apr 2023 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppBOO-0007I6-Fz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppBOM-00064u-Ib
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681924489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHpAE5/54z24MEsjUi6G/6d5sBpleCqZWqu2BGUGRwo=;
 b=a2vOcTZ9gpIi9Qcwp5X5LDMcqJp1xC47xF6UYObIRs0i++cTKOKMnB2+hNPIXBkduzVxfW
 aKOzMOvaeTLLgqyyngM511DX+tj63PaDCx7lkOwTjI2a6ANIkJkAxVbcfFW2YFt7JDzDzo
 LiECeEMCnqD3+8heWIGnwwSPcxWkAcM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-35786d6uM2CItmEV3fw6pQ-1; Wed, 19 Apr 2023 13:14:46 -0400
X-MC-Unique: 35786d6uM2CItmEV3fw6pQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0936D1C09510;
 Wed, 19 Apr 2023 17:14:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E07492B05;
 Wed, 19 Apr 2023 17:14:45 +0000 (UTC)
Date: Wed, 19 Apr 2023 18:14:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios
 run non-live
Message-ID: <ZEAhg43rQZ9+otf0@redhat.com>
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
> 
> (gdb) bt
> #0  0x0000fffff7b33f8c in recv () from /lib64/libpthread.so.0
> #1  0x0000aaaaaaac8bf4 in recv (__flags=0, __n=1, __buf=0xffffffffe477, __fd=5) at /usr/include/bits/socket2.h:44
> #2  qmp_fd_receive (fd=5) at ../tests/qtest/libqmp.c:73
> #3  0x0000aaaaaaac6dbc in qtest_qmp_receive_dict (s=0xaaaaaaca7d10) at ../tests/qtest/libqtest.c:713
> #4  qtest_qmp_eventwait_ref (s=0xaaaaaaca7d10, event=0xaaaaaab26ce8 "RESUME") at ../tests/qtest/libqtest.c:837
> #5  0x0000aaaaaaac6e34 in qtest_qmp_eventwait (s=<optimized out>, event=<optimized out>) at ../tests/qtest/libqtest.c:850
> #6  0x0000aaaaaaabbd90 in test_precopy_common (args=0xffffffffe590, args@entry=0xffffffffe5a0) at ../tests/qtest/migration-test.c:1393
> #7  0x0000aaaaaaabc804 in test_precopy_tcp_tls_psk_match () at ../tests/qtest/migration-test.c:1564
> #8  0x0000fffff7c89630 in ?? () from //usr/lib64/libglib-2.0.so.0
> ...
> #15 0x0000fffff7c89a70 in g_test_run_suite () from //usr/lib64/libglib-2.0.so.0
> #16 0x0000fffff7c89ae4 in g_test_run () from //usr/lib64/libglib-2.0.so.0
> #17 0x0000aaaaaaab7fdc in main (argc=<optimized out>, argv=<optimized out>) at ../tests/qtest/migration-test.c:2642

Urgh, ok, there must be an unexpected race condition wrt events in my
change. Thanks for the stack trace, i'll investigate.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



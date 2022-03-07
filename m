Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C94CFC14
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:58:05 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB40-0008Q4-Sx
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRAKA-0007uB-2v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRAK8-00045k-3v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGnj2R6QsnmtvGBzY5CNGGKMbV4Sm6MPeXkmRtYpBMo=;
 b=aBpV3n6QT9/TQCe/WQtNjef8XW9MH5JQMm6CKTQ1oyEzmnp/U3Gh9ZFw0tEFq+aTPJIX9l
 I6Gh6ni6jJ2XIwhr7jNn1o30ZidzSU5/uGokV7/Aj4kkBEKDPRUdRAcIuIDxnSin6I/W2o
 FEzmphHZf4MQSG0Kf7EVBpuo1u34XDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-HMkn176XNg-lQUCdtW81Hw-1; Mon, 07 Mar 2022 05:10:36 -0500
X-MC-Unique: HMkn176XNg-lQUCdtW81Hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92CAB180FD72
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 10:10:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 739908306D;
 Mon,  7 Mar 2022 10:10:18 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:10:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 11/18] tests: expand the migration precopy helper to
 support failures
Message-ID: <YiXaBtRDTo8nwRQ8@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-12-berrange@redhat.com>
 <YiW2qjiy+QQHlR6o@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YiW2qjiy+QQHlR6o@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 03:39:22PM +0800, Peter Xu wrote:
> On Wed, Mar 02, 2022 at 05:49:25PM +0000, Daniel P. Berrangé wrote:
> > The migration precopy testing helper function always expects the
> > migration to run to a completion state. There will be test scenarios
> > for TLS where expect either the client or server to fail the migration.
> > This expands the helper to cope with these scenarios.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 47 +++++++++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 2082c58e8b..e40b408988 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -827,17 +827,32 @@ typedef void (*TestMigrateFinishHook)(QTestState *from,
> >   * @connect_uri: the URI for the src QEMU to connect to
> >   * @start_hook: (optional) callback to run at start to set migration parameters
> >   * @finish_hook: (optional) callback to run at finish to cleanup
> > + * @expect_fail: true if we expect migration to fail
> > + * @dst_quit: true if we expect the dst QEMU to quit with an
> > + *            abnormal exit status on failure
> 
> "dst_quit" sounds a bit confusing to me, as setting dst_quit=false seems to
> mean "dest qemu should not quit" but it's actually for checking an abnormal
> quit only.
> 
> Rename may work. Or, IMHO it's nicer if we could merge the two parameters:
> 
>   @expected_result: What is the expectation of this migration test
> 
>   typedef enum {
>     /* This test should succeed, the default */
>     MIG_TEST_SUCCEED = 0,
>     /* This test should fail, dest qemu should keep alive */
>     MIG_TEST_FAIL,
>     /* This test should fail, dest qemu should fail with abnormal status */
>     MIG_TEST_FAIL_DEST_QUIT_ERR,
>   };
> 
> Because fundamentally the two parameters are correlated, e.g. there is no
> combination of expect_fail==false && dst_quit==true.
> 
> No strong opinion, though.

Using enums is more clear to someone reading code, so a good idea.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



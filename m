Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EB4D4EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:21:34 +0100 (CET)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLXh-0007SH-F7
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSLW4-00069e-MA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:19:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSLW1-0002c3-FY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646929187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygiGEqD1oLUhFDSasiz/jS2ox2jyqTCrA262FBaf2sE=;
 b=R+l7ikyVuQhuN9zf8K6vk6OZckujijUwIhcWT+Oq1ZOV2PU65iSVqNfH8WVbx97E3u6RFE
 6yGKIfF5OAffLhdSUp6kon7DiMJF+rkwPcHsAiBpwFHnzFYMA7KmVv1KPoDFWYsaquw8eF
 qZaKJFE4g6hnTO3u3p3j5M+Ky2WBDac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-mq2d5hygPLepjE-5JnYyfg-1; Thu, 10 Mar 2022 11:19:28 -0500
X-MC-Unique: mq2d5hygPLepjE-5JnYyfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0A60824FAA
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 16:19:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3850E1077C8C;
 Thu, 10 Mar 2022 16:18:49 +0000 (UTC)
Date: Thu, 10 Mar 2022 16:18:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 11/18] tests: expand the migration precopy helper to
 support failures
Message-ID: <Yiok5lioBDtdHmXy@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-12-berrange@redhat.com>
 <YiW63O5qeye62I9M@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YiW63O5qeye62I9M@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, Mar 07, 2022 at 03:57:16PM +0800, Peter Xu wrote:
> On Wed, Mar 02, 2022 at 05:49:25PM +0000, Daniel P. Berrangé wrote:
> >  static void test_precopy_common(const char *listen_uri,
> >                                  const char *connect_uri,
> >                                  TestMigrateStartHook start_hook,
> >                                  TestMigrateFinishHook finish_hook,
> > +                                bool expect_fail,
> > +                                bool dst_quit,
> >                                  bool dirty_ring)
> >  {
> >      MigrateStart *args = migrate_start_new();
> > @@ -875,24 +890,32 @@ static void test_precopy_common(const char *listen_uri,
> >  
> >      migrate_qmp(from, connect_uri, "{}");
> >  
> > -    wait_for_migration_pass(from);
> > +    if (expect_fail) {
> > +        wait_for_migration_fail(from, !dst_quit);
> 
> Two more thoughts..
> 
> (1) Shall we move MigrateStart creation to be even upper?  Then we avoid
>     passing over these parameters but merge these new parameters into
>     MigrateStart too.  After all we used to have similar long lists of
>     params and we merged them into MigrateStart.

I don't to use MigrateStart as these new parameters are not common
to all migration tests. I have come up with an equivalent approach
though.

> (2) Shall we leverage MigrateStart.hide_stderr?  I saw a bunch of errors
>     dumped even if all things run as expected.

Yes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



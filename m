Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D33625652
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:13:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQ5J-00033W-03; Fri, 11 Nov 2022 04:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQ5G-00033H-FY
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQ5E-0003bh-Rf
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668157939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmKiiyPNACVXK+9ula0zeD8tcf3Ay7pnb4PwfelQ+Us=;
 b=V5bWuuWw7NHhFUTGxfcHb9ofcV+zpEL2iAdWcXvemUl4r+dYN/TyHxkllwAWtZop8PQ7+j
 n0zY8gXTSwmGHvfVz7uRHMGEk5N0B846vZMqR974KVhIa8R5FOjMJZOVJLZmjfoYNuW9/6
 L3pp1Ael4PgUM11aNBIekuB5kBUtxUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-TcI1_nj1ObaTebWXDlo5Vg-1; Fri, 11 Nov 2022 04:12:18 -0500
X-MC-Unique: TcI1_nj1ObaTebWXDlo5Vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D92C7800B23
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 09:12:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8988E40E9783;
 Fri, 11 Nov 2022 09:12:16 +0000 (UTC)
Date: Fri, 11 Nov 2022 09:12:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 13/18] tests: add migration tests of TLS with x509
 credentials
Message-ID: <Y24R7lzD+Lss10rx@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-14-berrange@redhat.com>
 <b3d98826-7727-fa12-a302-47194cd24f85@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3d98826-7727-fa12-a302-47194cd24f85@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 11, 2022 at 08:56:20AM +0100, Thomas Huth wrote:
> On 10/03/2022 18.18, Daniel P. Berrangé wrote:
> > This validates that we correctly handle migration success and failure
> > scenarios when using TLS with x509 certificates. There are quite a few
> > different scenarios that matter in relation to hostname validation.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> [...]
> > +static void
> > +test_migrate_tls_x509_finish(QTestState *from,
> > +                             QTestState *to,
> > +                             void *opaque)
> > +{
> > +    TestMigrateTLSX509Data *data = opaque;
> > +
> > +    test_tls_cleanup(data->keyfile);
> > +    unlink(data->cacert);
> > +    unlink(data->servercert);
> > +    unlink(data->serverkey);
> > +    unlink(data->clientcert);
> > +    unlink(data->clientkey);
> > +    rmdir(data->workdir);
> > +
> > +    g_free(data->workdir);
> > +    g_free(data->keyfile);
> > +    g_free(data);
> > +}
> 
>  Hi Daniel!
> 
> FYI, this seems to create a test failure with Clang 15 from Fedora 37:
> 
> https://gitlab.com/thuth/qemu/-/jobs/3304199277#L3761
> 
> Looks like data->clientcert has to be checked for NULL before unlink is
> called with it?

Yep, that's merely the clang santizers complaining, but we can fix
it anyway.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



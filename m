Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65014C8839
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:40:04 +0100 (CET)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyzD-000177-Tf
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:40:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOylt-0006aX-BZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOylo-0002o0-Ne
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LU5vcZ7LhqZh7488hjLYtrtl4fWM8ABk8Gxa/oJFy7Y=;
 b=f6rHHORDbbF5eRlNzCgW83I9Pve0KfF8vw6tGietfu2meITYuZ2QQVW5pnPXv59p9xQpqW
 yj7R972Am3//bWa1+Ul0JXnuf3NBg4/rcFkc3aYGjNFgwWYaz9obwoWYmBAZAPcK97sx35
 0WiditdrLZainV2+MbXTU8Gs+G8TTtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-OH5aCWVnPYGiuzgqB-D71Q-1; Tue, 01 Mar 2022 04:26:06 -0500
X-MC-Unique: OH5aCWVnPYGiuzgqB-D71Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895961854E21
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 09:26:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA4D67E7F;
 Tue,  1 Mar 2022 09:25:58 +0000 (UTC)
Date: Tue, 1 Mar 2022 09:25:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh3mo5VFQ3gT1Gd7@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:39:00PM +0800, Peter Xu wrote:
> This is v2 of postcopy preempt series.  It can also be found here:
> 
>   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> 
> RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> 
> v1->v2 changelog:
> - Picked up more r-bs from Dave
> - Rename both fault threads to drop "qemu/" prefix [Dave]
> - Further rework on postcopy recovery, to be able to detect qemufile errors
>   from either main channel or postcopy one [Dave]
> - shutdown() qemufile before close on src postcopy channel when postcopy is
>   paused [Dave]
> - In postcopy_preempt_new_channel(), explicitly set the new channel in
>   blocking state, even if it's the default [Dave]
> - Make RAMState.postcopy_channel unsigned int [Dave]
> - Added patches:
>   - "migration: Create the postcopy preempt channel asynchronously"
>   - "migration: Parameter x-postcopy-preempt-break-huge"
>   - "migration: Add helpers to detect TLS capability"
>   - "migration: Fail postcopy preempt with TLS"
>   - "tests: Pass in MigrateStart** into test_migrate_start()"
> 
> Abstract
> ========
> 
> This series added a new migration capability called "postcopy-preempt".  It can
> be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
> postcopy page requests handling process.

Is there no way we can just automatically enable this new feature, rather
than requiring apps to specify yet another new flag ?

> TODO List
> =========
> 
> TLS support
> -----------
> 
> I only noticed its missing very recently.  Since soft freeze is coming, and
> obviously I'm still growing this series, so I tend to have the existing
> material discussed. Let's see if it can still catch the train for QEMU 7.0
> release (soft freeze on 2022-03-08)..

I don't like the idea of shipping something that is only half finished.
It means that when apps probe for the feature, they'll see preempt
capability present, but have no idea whether they're using a QEMU that
is broken when combined with TLS or not. We shouldn't merge something
just to meet the soft freeze deadline if we know key features are broken.

> Multi-channel for preemption threads
> ------------------------------------
> 
> Currently the postcopy preempt feature use only one extra channel and one
> extra thread on dest (no new thread on src QEMU).  It should be mostly good
> enough for major use cases, but when the postcopy queue is long enough
> (e.g. hundreds of vCPUs faulted on different pages) logically we could
> still observe more delays in average.  Whether growing threads/channels can
> solve it is debatable, but sounds worthwhile a try.  That's yet another
> thing we can think about after this patchset lands.

If we don't think about it upfront, then we'll possibly end up with
yet another tunable flag that apps have to worry about. It also
could make migration code even more complex if we have to support
two different scenarios. If we think multiple threads are goign to
be a benefit lets check that and if so, design it into the exposed
application facing interface from the start rather than retrofitting
afterwards.

> Logically the design provides space for that - the receiving postcopy
> preempt thread can understand all ram-layer migration protocol, and for
> multi channel and multi threads we could simply grow that into multile
> threads handling the same protocol (with multiple PostcopyTmpPage).  The
> source needs more thoughts on synchronizations, though, but it shouldn't
> affect the whole protocol layer, so should be easy to keep compatible.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



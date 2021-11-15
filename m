Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDA450959
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:14:00 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmecK-0008UG-21
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmean-0006XD-Ez
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmeah-0001eO-VK
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636992737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0JBvV6ZhdXJbqX8QeSfNdLvTf7rvWzKVn7ViiwPPPQ=;
 b=FIeV9UW6o/VysnuF90aa37Qe0XdEGgF1+kjv+c2/CYTpdM9ojsiOMOeDKWVxfEw9qbWLyO
 akVLgPsipT5VIvEZHJnnsX/H/JAXrSpEQWZmJKQ8xH99LVkqzirbrp2iN5ihjTb4ICbD7c
 8TvEcjue7uBcQ2780YszFCJ061X0HQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-6nmRlTH8ND2fYb4BM3nyXA-1; Mon, 15 Nov 2021 11:12:08 -0500
X-MC-Unique: 6nmRlTH8ND2fYb4BM3nyXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4E4D10247A6;
 Mon, 15 Nov 2021 16:12:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47BD619D9F;
 Mon, 15 Nov 2021 16:11:18 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:11:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
Message-ID: <YZKGo1ZwkaE+zNRT@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 05:03:28PM +0100, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> > Currently, block layer APIs like block-backend.h contain a mix of
> > functions that are either running in the main loop and under the
> > BQL, or are thread-safe functions and run in iothreads performing I/O.
> > The functions running under BQL also take care of modifying the
> > block graph, by using drain and/or aio_context_acquire/release.
> > This makes it very confusing to understand where each function
> > runs, and what assumptions it provided with regards to thread
> > safety.
> > 
> > We call the functions running under BQL "global state (GS) API", and
> > distinguish them from the thread-safe "I/O API".
> > 
> > The aim of this series is to split the relevant block headers in
> > global state and I/O sub-headers.
> 
> Despite leaving quite some comments, the series and the split seem
> reasonable to me overall.  (This is a pretty big series, after all, so those
> “some comments” stack up against a majority of changes that seem OK to me.
> :))
> 
> One thing I noticed while reviewing is that it’s really hard to verify that
> no I/O function calls a GS function.  What would be wonderful is some
> function marker like coroutine_fn that marks GS functions (or I/O functions)
> and that we could then verify the call paths.  But AFAIU we’ve always wanted
> precisely that for coroutine_fn and still don’t have it, so this seems like
> extremely wishful thinking... :(

Even if we don't programmatically verify these rules, it would be a major
step forward if we simply adopted a standard naming convention for the
APIs that was essentally self-describing. eg block_io_XXX for all I/O
stuff and block_state_XXXX for all global state ,and block_common if
we have stuff applicable to both use cases.

I wouldn't suggest doing it as part of this series, but I think it'd
be worthwhile in general for the medium-long term, despite the code
churn in updating all usage in the short term.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



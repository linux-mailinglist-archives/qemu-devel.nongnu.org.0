Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22792648904
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 20:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3j8w-0007VF-K7; Fri, 09 Dec 2022 14:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p3j8a-0007Tv-1f
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 14:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p3j8W-0006K3-6r
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 14:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670614459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICAusMAU8pUwN5ZmnkpRgzbfXOfOt7P1NKK2B1riGDs=;
 b=CglCLKMj2WTA6RE7GzuhB8O3/gHIc/FQBTT7MB/AYvlXErAqkq8de5OXG5ulAhWhKgfsB8
 5/YZBDfgXYk5f0V+L2Xs+5zFUKuMnCOOZAfiwP6R/jQM48MK0xxitFTzkcMWFhdhLac+ca
 cfvoIwkh2oXdMSlC8hSTGq21OjCRnss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-5-KYotDXPf2_p3c4eGtyfg-1; Fri, 09 Dec 2022 14:34:16 -0500
X-MC-Unique: 5-KYotDXPf2_p3c4eGtyfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A15101A528;
 Fri,  9 Dec 2022 19:34:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 325891121339;
 Fri,  9 Dec 2022 19:34:15 +0000 (UTC)
Date: Fri, 9 Dec 2022 20:34:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Message-ID: <Y5ONs/ten9EnMedv@redhat.com>
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
 <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
 <Y43roVjI2RrU1PXq@redhat.com>
 <51d4cb33-7ae9-8c5b-b2ae-b5c6b71b09a8@redhat.com>
 <e361e255-83ff-5628-eebf-50bf624742c4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e361e255-83ff-5628-eebf-50bf624742c4@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.12.2022 um 13:20 hat Emanuele Giuseppe Esposito geschrieben:
> Am 09/12/2022 um 13:18 schrieb Emanuele Giuseppe Esposito:
> > Am 05/12/2022 um 14:01 schrieb Kevin Wolf:
> >> I wonder if we need a more general solution for this because this test
> >> is not the only place that calls this kind of functions in a coroutine.
> >> The one I'm aware of in particular is all the .bdrv_co_create
> >> implementations, but I'm almost sure there are more.
> >>
> >> Can we use a yield_to_drain()-like mechanism for these functions? Maybe
> >> even something like the opposite of co_wrapper, a no_co_wrapper that
> >> generates a foo_co() variant that drops out of coroutine context before
> >> calling foo()?
> > 
> > I implemented something like yield_to_drain as you suggested, but when
> > thinking about it aren't we making a fix that will cost us even more
> > work in the future? If we use a yield_to_drain-like function, we are
> > doing something similar to g_c_w, and losing track of whether the caller
> > is a coroutine or not.

That's not what I had in mind. I really meant a no_co_wrapper, not a
no_co_wrapper_mixed.

> > And the function could then be used potentially everywhere. Then we
> > will realize "oh we need to get rid of this and split the functions
> > differentiating the coroutine context" and eventually go through ALL
> > the callers again to figure what is doing what, and implement the
> > same fix of this patch or my series once again.
> > 
> > Instead, even though this is just a test, we have a clear separation
> > and one less case to worry about in the future.

I'm not suggesting not fixing the root cause (which is calling functions
in coroutines that aren't supposed to be called in coroutines), but just
wondering if generated functions to drop out of coroutine would be a
nice tool to keep the fixes simple.

We already have bdrv_co_drained_begin/end that use an open-coded version
of this. We would want a bdrv_co_open() that can be used by the
.bdrv_co_create implementations and a bdrv_co_new_open_driver() and
blk_co_insert_bs() that could be used by this test case. All of these
are functions that are normally forbidden to be called from a coroutine,
but when you first drop out of the coroutine, they are fine.

The alternative solution is not just merging this test case patch, but
we still need to fix all of the .bdrv_co_create implementations, even if
we decide to write the code manually instead of generating it.

> At least the above is valid if the change you are proposing is the
> following (tested already, works)

bdrv_replace_child_noperm() is the wrong place to do things like this,
it's way too deep down the call chain. Callers really want things to be
atomic there, and involving a BH would make that impossible.

Kevin



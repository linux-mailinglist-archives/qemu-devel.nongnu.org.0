Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729F4F3AF7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:07:15 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkm2-0003zl-3i
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbkjZ-0002eE-8g
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbkjW-0000Gt-RV
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649171077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNg/8uxrXw+ea7GVVLrVExsSzlGwbJrbJPijvI6Vvkc=;
 b=Mr3p6r0QorJbUYqb0IeOCy4SURU/bzudefJHe4aVb/ZS58GozANot383an70RaqUjRZFLM
 fMt7yJWJJxS1yi0U5TvI0zxjk0p1GkgIh74aS8cuCkRgnZgi+6TXj2P+JGpmO35VRjw2Mc
 LYqp0umGE5An+6xEK6geioAhyUFBxfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-hCDG5pW3O2Ohn59NCrdDUQ-1; Tue, 05 Apr 2022 11:04:36 -0400
X-MC-Unique: hCDG5pW3O2Ohn59NCrdDUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 151B6899EC1;
 Tue,  5 Apr 2022 15:04:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D81D1415129;
 Tue,  5 Apr 2022 15:04:34 +0000 (UTC)
Date: Tue, 5 Apr 2022 17:04:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
Message-ID: <YkxagL00suVaVipU@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <87fb6a17-c1e8-cb50-5f0f-3979b8cc5ca6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fb6a17-c1e8-cb50-5f0f-3979b8cc5ca6@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.04.2022 um 15:09 hat Emanuele Giuseppe Esposito geschrieben:
> Am 05/04/2022 um 12:14 schrieb Kevin Wolf:
> > I think all of this is really relevant for Emanuele's work, which
> > involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
> > fully expect that we would see very similar problems, and just stacking
> > drain sections over drain sections that might happen to usually fix
> > things, but aren't guaranteed to, doesn't look like a good solution.
> 
> Yes, I think at this point we all agreed to drop subtree_drain as
> replacement for AioContext.
> 
> The alternative is what Paolo proposed in the other thread " Removal of
> AioContext lock, bs->parents and ->children: proof of concept"
> I am not sure which thread you replied first :)

This one, I think. :-)

> I think that proposal is not far from your idea, and it avoids to
> introduce or even use drains at all.
> Not sure why you called it a "step backwards even from AioContext locks".

I was only referring to the lock locality there. AioContext locks are
really coarse, but still a finer granularity than a single global lock.

In the big picture, it's still be better than the AioContext lock, but
that's because it's a different type of lock, not because it has better
locality.

So I was just wondering if we can't have the different type of lock and
make it local to the BDS, too.

Kevin



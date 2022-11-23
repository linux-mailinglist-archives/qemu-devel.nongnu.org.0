Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699E63662B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:50:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsww-0002YF-7U; Wed, 23 Nov 2022 11:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxswb-0002Ug-IU
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxswW-0005Oz-WE
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669222186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KYsIIwgH4JInARFeaOpymd7EFsjcL3xcFzo+dZ36ac=;
 b=MA8YytpFBju6VkdVLGnTZR17EX4TnlsI06+JlkJvzh7MOkClwUpwpiQxriygSfAA1pP8T1
 QTDW4uF2AL1DHWl47+j30YQ4dEQUwMVRYA3w+kPuxHUgqg9mfMRhZVJq04dMt1NrnP93zL
 4Qi/XmAwRiWXVL+qKPg8nUi5hIH1DoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-r3qhBBw3PB6Yv26PIFECFQ-1; Wed, 23 Nov 2022 11:49:43 -0500
X-MC-Unique: r3qhBBw3PB6Yv26PIFECFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAAFE811E81;
 Wed, 23 Nov 2022 16:49:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFAF49BB62;
 Wed, 23 Nov 2022 16:49:40 +0000 (UTC)
Date: Wed, 23 Nov 2022 17:49:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [PATCH v5 07/15] block: introduce QEMU_IN_COROUTINE macro
Message-ID: <Y35PIciCujuPvD04@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123114227.85757-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 23.11.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
> This macro will be used to mark all coroutine_fn functions.
> Right now, it will be used for the newly introduced coroutine_fn, since
> we know the callers.
> 
> As a TODO, in the future we might want to add this macro to all
> corotuine_fn functions, to be sure that they are only called in

s/corotuine_fn/coroutine_fn/

> coroutines context.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I already asked about other opinions on this in patch 1.

These assertions are runtime checks and I don't feel they are the right
tool to verify coroutine_fn consistency. Asserting in tricky places
makes sense to me, especially as long as we can't rely on static
analysis, but adding it everywhere feels over the top to me.

Kevin



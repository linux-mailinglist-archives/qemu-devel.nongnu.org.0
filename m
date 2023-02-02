Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4526881CA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbRE-0006yb-8u; Thu, 02 Feb 2023 10:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNbRC-0006xs-4I
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNbR9-0003be-Vu
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675351423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZMf7nVTslOGR2DtaJwqyU54sVbRBvxuI4JirV/WFrao=;
 b=PA2mk7BHsomLKsNZbev2+kmsz8AQ8xOJi5qVvFyDrHTO3RFTR26tYd8bLDUIpLD8CSgTzd
 juJObJMb8MSKdJ7Er+4Ta7fWAljv8fhnNxsamZ906KLEmv77/vsAfazYCkq285303QrvEp
 oZ4L09ftTs5D70YnLt0oqTzv0ieXP28=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-KdkbphMwM4a977Lw5y7dHQ-1; Thu, 02 Feb 2023 10:23:39 -0500
X-MC-Unique: KdkbphMwM4a977Lw5y7dHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCDCA3C22746;
 Thu,  2 Feb 2023 15:23:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D486492C3E;
 Thu,  2 Feb 2023 15:23:37 +0000 (UTC)
Date: Thu, 2 Feb 2023 16:23:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, t.lamprecht@proxmox.com, jsnow@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Message-ID: <Y9vVd8unUeZmsmmX@redhat.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <Y9uf1wlXQd4EIwxO@redhat.com>
 <40969191-9a16-0550-e999-bc44584d81fb@proxmox.com>
 <67fdadb1-672f-776a-2ce6-631cba19171c@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fdadb1-672f-776a-2ce6-631cba19171c@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 02.02.2023 um 14:35 hat Denis V. Lunev geschrieben:
> On 2/2/23 14:27, Fiona Ebner wrote:
> > Am 02.02.23 um 12:34 schrieb Kevin Wolf:
> > > Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
> > > > Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
> > > > > Frankly speaking I would say that this switch could be considered
> > > > > NOT QEMU job and we should just send a notification (event) for the
> > > > > completion of the each iteration and management software should
> > > > > take a decision to switch from async mode to the sync one.
> > > My first thought was very similar. We should provide a building block
> > > that just switches between the two modes and then the management tool
> > > can decide what the right policy is.
> > > 
> > > Adding a new event when the first iteration is done (I'm not sure if
> > > there is much value in having it for later iterations) makes sense to
> > > me if someone wants to use it. If we add it, let's not forget that
> > > events can be lost and clients must be able to query the same
> > > information, so we'd have to add it to query-jobs, too - which in turn
> > > requires adding a job type specific struct to JobInfo first.
> > > 
> > Well, Denis said 2 iterations might be better. But I'm fine with
> > initially adding an event just for the first iteration, further ones can
> > still be added later. Returning the number of completed iterations as
> > part of the mirror-specific job info would anticipate that.
> 
> May be it would be better to have an event on each iteration + make
> available iteration count over block status query.

In the ready phase, each iteration can be very short. Basically if the
guest writes to one block and then the mirror catches up, that's a whole
iteration. So if the guest is doing I/O at a moderate rate so that the
host can keep up with it, you might end up with one QMP event per I/O
request.

Kevin



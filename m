Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA1687C68
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXsR-0007Xi-77; Thu, 02 Feb 2023 06:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNXsF-0007Uk-0k
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNXs1-0003F1-O0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675337694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvxTN3trYxSfe/9JJxqMQUAxIg2gv0zTibLSbxBq2Ko=;
 b=aN53tjij+BlhmBv+27vSVph2AOL8QS44hoNxYDk9FxMBwBDOlEpGQufGmSWgAxSClHqUQi
 KuLs84p1aAmiZvfkpn7y9S3Tditmw08tEKUwctTBEZI4bnUqnxjnBxJDGzrjKEq88yTHGE
 eNqfAlO3CoLdCeRTylQCJM/2iHiGD30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-GH-7Kjk1NWmjQCGoBV27Dw-1; Thu, 02 Feb 2023 06:34:51 -0500
X-MC-Unique: GH-7Kjk1NWmjQCGoBV27Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8209A85D066;
 Thu,  2 Feb 2023 11:34:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C950A112132C;
 Thu,  2 Feb 2023 11:34:48 +0000 (UTC)
Date: Thu, 2 Feb 2023 12:34:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: "Denis V. Lunev" <den@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, t.lamprecht@proxmox.com, jsnow@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Message-ID: <Y9uf1wlXQd4EIwxO@redhat.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Am 02.02.2023 um 11:19 hat Fiona Ebner geschrieben:
> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
> > Frankly speaking I would say that this switch could be considered
> > NOT QEMU job and we should just send a notification (event) for the
> > completion of the each iteration and management software should
> > take a decision to switch from async mode to the sync one.

My first thought was very similar. We should provide a building block
that just switches between the two modes and then the management tool
can decide what the right policy is.

Adding a new event when the first iteration is done (I'm not sure if
there is much value in having it for later iterations) makes sense to
me if someone wants to use it. If we add it, let's not forget that
events can be lost and clients must be able to query the same
information, so we'd have to add it to query-jobs, too - which in turn
requires adding a job type specific struct to JobInfo first.

Once we have this generic infrastructure with low-level building block,
I wouldn't necessarily be opposed to having an option build on top where
QEMU automatically does what we consider most useful for most users.
auto-finalize/dismiss already do something similar.

> Unfortunately, our management software is a bit limited in that regard
> currently and making listening for events available in the necessary
> place would take a bit of work. Having the switch command would nearly
> be enough for us (we'd just switch after READY). But we'd also need
> that when the switch happens after READY, that all remaining
> asynchronous operations are finished by the command. Otherwise, the
> original issue with inactivating block drives while mirror still has
> work remains. Do those semantics for the switch sound acceptable?

Completing the remaining asynchronous operations can take a while, so I
don't think it's something to be done in a synchronous QMP command.
Do we need an event that tells you that the switch has completed?

But having to switch the mirror job to sync mode just to avoid doing I/O
on an inactive device sounds wrong to me. It doesn't fix the root cause
of that problem, but just papers over it.

Why does your management tool not complete the mirror job before it
does the migration switchover that inactivates images?

Kevin



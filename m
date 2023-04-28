Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F786F17A6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:24:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psN7t-0001m7-1k; Fri, 28 Apr 2023 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1psN7p-0001li-Pt
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1psN7n-0005VG-Tg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682684574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ew+Zdz0/rQP1RcftuUA7Z49tOEEO+yaUxVnO2qtnyb4=;
 b=EaLRcTeUbeDgafhMY9ySWxiLPKP/ZaRZ4e50d9kDap0iKcw5XUjmIlVG65EWLz13f7jEMP
 R2/wCBYXnMLGwfpmEzcLmDa6RcqiQ8vM681gBQoJGAkrKBj4KA6P49CE9IEzEQPDsKjm4y
 GebQFydfkcT+UZXqIgF9XFXVWRxf6lc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-1a3kU4wKPbO0Dhh0kX7UWg-1; Fri, 28 Apr 2023 08:22:48 -0400
X-MC-Unique: 1a3kU4wKPbO0Dhh0kX7UWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED7D185A79C;
 Fri, 28 Apr 2023 12:22:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66707440BC;
 Fri, 28 Apr 2023 12:22:46 +0000 (UTC)
Date: Fri, 28 Apr 2023 14:22:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Message-ID: <ZEu6lVDVUh8AC6Af@redhat.com>
References: <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica> <ZEuEIhe86udi38kx@redhat.com>
 <87354kbdvc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87354kbdvc.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
> Kevin Wolf <kwolf@redhat.com> wrote:
> >> I am perhaps a bit ingenuous here, but it is there a way to convince
> >> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
> >
> > I believe we're talking about a technicality here. I asked another more
> > fundamental question that nobody has answered yet:
> >
> > Why do you think that it's ok to call bdrv_writev_vmstate() without
> > holding the BQL?
> 
> I will say this function starts by bdrv_ (i.e. block layer people) and
> endes with _vmstate (i.e. migration people).
> 
> To be honest, I don't know.  That is why I _supposed_ you have an idea.

My idea is that bdrv_*() can only be called when you hold the BQL, or
for BlockDriverStates in an iothread the AioContext lock.

Apparently dropping the BQL in migration code was introduced in Paolo's
commit 9b095037527. I'm not sure what this was supposed to improve in
the case of snapshots because the VM is stopped anyway.

Would anything bad happen if we removed the BQL unlock/lock section in
qemu_savevm_state() again?

Kevin



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E93BDA2A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:27:30 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0myv-0007Lg-Lb
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0mx3-0004XY-3p
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0mwy-0008S6-UY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625585127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHzOvqsTfSsMfjcOvx+WBcz9q3soKJ67tYEu/6SxolQ=;
 b=TDN9aS+fcl27Ni6WnwdUDIMBq+qSGj0scMc+4EFK7AsYh96B3XmKuTibyLv4l1q3pdoYJC
 seAm8LiG1HtXEsZhGZwuXcsFB/DvAu7CP+W64MFYNsd6P+uqS7DDtASsoSIf/9DHuILq6p
 h5B7KdMscxwmwh4wCFuqYMtO7Lf4Yqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-pstpX2-bPHGi5O_yoJEmnQ-1; Tue, 06 Jul 2021 11:25:25 -0400
X-MC-Unique: pstpX2-bPHGi5O_yoJEmnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC84100C661;
 Tue,  6 Jul 2021 15:25:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB0660E3A;
 Tue,  6 Jul 2021 15:25:21 +0000 (UTC)
Date: Tue, 6 Jul 2021 17:25:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Message-ID: <YOR14GzLqr3EKzcm@redhat.com>
References: <YORYaF3tWDoNOqIw@redhat.com>
 <2F1CA650-9CE2-4AD9-BAF0-AD07829973B7@kamp.de>
MIME-Version: 1.0
In-Reply-To: <2F1CA650-9CE2-4AD9-BAF0-AD07829973B7@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
> > Am 06.07.2021 um 15:19 schrieb Kevin Wolf <kwolf@redhat.com>:
> > 
> > ﻿Am 02.07.2021 um 19:23 hat Ilya Dryomov geschrieben:
> >> This series migrates the qemu rbd driver from the old aio emulation
> >> to native coroutines and adds write zeroes support which is important
> >> for block operations.
> >> 
> >> To achieve this we first bump the librbd requirement to the already
> >> outdated luminous release of ceph to get rid of some wrappers and
> >> ifdef'ry in the code.
> > 
> > Thanks, applied to the block branch.
> > 
> > I've only had a very quick look at the patches, but I think there is one
> > suggestion for a cleanup I can make: The qemu_rbd_finish_bh()
> > indirection is probably unnecessary now because aio_co_wake() is thread
> > safe.
> 
> But this is new, isn’t it?

Not sure in what sense you mean. aio_co_wake() has always been thread
safe, as far as I know.

Obviously, the old code didn't use aio_co_wake(), but directly called
some callbacks, so the part that is new is your coroutine conversion
that enables getting rid of the BH.

> We also have this indirection in iscsi and nfs drivers I think.

Indeed, the resulting codes look the same. In iscsi and nfs it doesn't
come from an incomplete converstion to coroutines, but they both used
qemu_coroutine_enter() originally, which resumes the coroutine in the
current thread...

> Does it matter that the completion callback is called from an librbd
> thread? Will the coroutine continue to run in the right thread?

...whereas aio_co_wake() resumes the coroutine in the thread where it
was running before.

(Before commit 5f50be9b5, this would have been buggy from an librbd
thread, but now it should work correctly even for threads that are
neither iothreads nor vcpu threads.)

> I will have a decent look after my vacation.

Sounds good, thanks. Enjoy your vacation!

Kevin



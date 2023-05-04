Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BE6F69B4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:19:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWzJ-0006ZK-1I; Thu, 04 May 2023 07:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWzH-0006Yy-Nz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWzG-0001QA-AO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683199140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rkmXd+F7dsAhXsV0bMtdFTNn0blox1UoNitKGZ/OddY=;
 b=cEJTkXrU4Z7+D07OyFz/hQK42Gnd+eI0Yph+qdOfGH9+VJYJhEaULhQYirEAu4uDDs0ows
 scneLtluZsC4kbFreAVW8nNDsvTsIYmae8Fm7cWta8kNSCecwmQJPNk85RtDtkGRSMerT8
 5T3N5qq7X6taEyUfQq7EVkYxBr3RoSs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-UMSuDEqnNeKwtUNBKs70TA-1; Thu, 04 May 2023 07:18:56 -0400
X-MC-Unique: UMSuDEqnNeKwtUNBKs70TA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D6EF2A59568;
 Thu,  4 May 2023 11:18:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0D52166B30;
 Thu,  4 May 2023 11:18:54 +0000 (UTC)
Date: Thu, 4 May 2023 13:18:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
Message-ID: <ZFOUndq9rejgbYK4@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
 <CABgObfbOD+cpEdP0JE6Os1-vYvrp1zMvCFOST0YrBw3H0s9noQ@mail.gmail.com>
 <ZEqqLnWqFi4WH1yq@redhat.com>
 <CABgObfb1CuAEe53SiMbjSDZNvA+Hp4DB_HFZb-dxHg94vdJNDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfb1CuAEe53SiMbjSDZNvA+Hp4DB_HFZb-dxHg94vdJNDQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.04.2023 um 22:49 hat Paolo Bonzini geschrieben:
> Il gio 27 apr 2023, 19:00 Kevin Wolf <kwolf@redhat.com> ha scritto:
> 
> > By the way, and slightly unrelated, can vrc somehow help with finding
> > places that call coroutine wrappers without holding the AioContext lock?
> > (This results in an abort() when AIO_WAIT_WHILE() tries to unlock the
> > AioContext.) This is one of the classes of bugs we're seeing in 8.0.
> >
> 
> Seems more like a task for TSA.
> 
> Even though C TSA doesn't let you check that the *right* AioContext lock is
> taken, it can check statically that *one* such lock is taken, and in
> general I would guess it's rare for the wrong AioContext to be locked.

The problem with TSA is that you need to add annotations everywhere, it
doesn't look at the full call graph. It would be almost the same effort
as for adding the graph lock annotation. I don't think we want to do
this for a lock that we want to remove relatively soon anyway.

I'd really prefer a tool where I don't need to modify the source code,
at least not more than saying "aio_context_acquire() takes the lock",
"aio_context_release() releases the lock" and "you must have the lock in
AIO_WAIT_WHILE()".

I guess the other option is manual auditing.

Kevin



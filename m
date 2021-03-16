Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180A833D919
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:22:26 +0100 (CET)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCSe-0003D6-Uf
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCAA-0002x2-9m; Tue, 16 Mar 2021 12:03:18 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCA4-0001lJ-EQ; Tue, 16 Mar 2021 12:03:16 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 804482E16AF;
 Tue, 16 Mar 2021 19:03:07 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 7fYlrdh54Z-370SmmNo; Tue, 16 Mar 2021 19:03:07 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615910587; bh=tni0+WzXIoav7jovEH2YM24GZZS1aITZMrNacspzW50=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=sm8ePCOfBeQFhF8H9BWDIp8nz530njc2FRcVj/B88j5ybtj5aHIfc6QdF1a4CyIXH
 i1hhINJ50/hXiolBeslk5YB5qHpWIwDyevF3LYDVmsVBLgq1zIto3Y234EtY4xU8Ss
 KeztrErDbzcvaQ0mw2JlNLDCETg+oEFWK7M7d1PY=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8817::1:e])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 y4meC3gN8c-36nOUZI7; Tue, 16 Mar 2021 19:03:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 16 Mar 2021 19:03:04 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 6/7] block/nbd: decouple reconnect from drain
Message-ID: <YFDWuJ48WU3f6feI@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-7-rvkagan@yandex-team.ru>
 <995a9667-b7ae-3e00-caa5-6c80fc0962f3@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995a9667-b7ae-3e00-caa5-6c80fc0962f3@virtuozzo.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 11:10:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
> > The reconnection logic doesn't need to stop while in a drained section.
> > Moreover it has to be active during the drained section, as the requests
> > that were caught in-flight with the connection to the server broken can
> > only usefully get drained if the connection is restored.  Otherwise such
> > requests can only either stall resulting in a deadlock (before
> > 8c517de24a), or be aborted defeating the purpose of the reconnection
> > machinery (after 8c517de24a).
> > 
> > Since the pieces of the reconnection logic are now properly migrated
> > from one aio_context to another, it appears safe to just stop messing
> > with the drained section in the reconnection code.
> > 
> > Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> 
> I'd not think that it "fixes" it. Behavior changes.. But 5ad81b4946
> didn't introduce any bugs.

I guess you're right.

In fact I did reproduce the situation when the drain made no progress
exactly becase the only in-flight reference was taken by the
connection_co, but it may be due to some intermediate stage of the patch
development so I need to do a more thorough analysis to tell if it was
triggerable with the original code.

> > Fixes: 8c517de24a ("block/nbd: fix drain dead-lock because of nbd reconnect-delay")
> 
> And here..
> 
> 1. There is an existing problem (unrelated to nbd) in Qemu that long
> io request which we have to wait for at drained_begin may trigger a
> dead lock
> (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html)
> 
> 2. So, when we have nbd reconnect (and therefore long io requests) we
> simply trigger this deadlock.. That's why I decided to cancel the
> requests (assuming they will most probably fail anyway).
> 
> I agree that nbd driver is wrong place for fixing the problem
> described in
> (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html),
> but if you just revert 8c517de24a, you'll see the deadlock again..

I may have misunderstood that thread, but isn't that deadlock exactly
due to the requests being unable to ever drain because the
reconnection process is suspended while the drain is in progress?

Thanks,
Roman.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C904B33D95B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:27:04 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCX9-00077b-QY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCHT-0000VV-RJ; Tue, 16 Mar 2021 12:10:51 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:50042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCHR-0005l9-TX; Tue, 16 Mar 2021 12:10:51 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id DB4642E15E7;
 Tue, 16 Mar 2021 19:10:46 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZLppzn47k5-Ak0edHW4; Tue, 16 Mar 2021 19:10:46 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615911046; bh=eA6M8+BWqOefK7wl4H5AQrdM7D1HRmHCWaG/4LYrWq4=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=K+nfQS1Divbr43Cj5/0V2FbuVHgp5B+1EJwCTLwrOlwwX+3w7ux1XmlC6KsihG+j7
 RIVZdKqL15l+UxIQku8ORxMujDJ4gVCz5cxF+Lu7JuJN6vBUWncYhVNnhIx8Q1yaIK
 xLPDjrs9blQrHhsxkxqrhwLf6MMoN+01qP5S5NVY=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8817::1:e])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 MaD4mDwPQu-AknibPB5; Tue, 16 Mar 2021 19:10:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 16 Mar 2021 19:10:43 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
Message-ID: <YFDYg7AMeTu6Ea3e@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <d6417ccf-04f3-be97-14a8-3aceda1e1e28@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6417ccf-04f3-be97-14a8-3aceda1e1e28@redhat.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 09:41:36AM -0500, Eric Blake wrote:
> On 3/15/21 1:06 AM, Roman Kagan wrote:
> > The reconnection logic doesn't need to stop while in a drained section.
> > Moreover it has to be active during the drained section, as the requests
> > that were caught in-flight with the connection to the server broken can
> > only usefully get drained if the connection is restored.  Otherwise such
> > requests can only either stall resulting in a deadlock (before
> > 8c517de24a), or be aborted defeating the purpose of the reconnection
> > machinery (after 8c517de24a).
> > 
> > This series aims to just stop messing with the drained section in the
> > reconnection code.
> > 
> > While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
> > connection_co reentrance"); as I've missed the point of that commit I'd
> > appreciate more scrutiny in this area.
> 
> Soft freeze is today.  I'm leaning towards declaring this series as a
> bug fix (and so give it some more soak time to get right, but still okay
> for -rc1) rather than a feature addition (and therefore would need to be
> in a pull request today).  Speak up now if this characterization is off
> base.

Yes I'd consider it a bug fix, too.  I'll do my best beating it into
shape before -rc2.

Thanks,
Roman.


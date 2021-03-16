Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D133D776
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:31:29 +0100 (CET)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBfM-0003yB-7F
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMBdV-0003JE-Na; Tue, 16 Mar 2021 11:29:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:36910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMBdR-0007E2-B2; Tue, 16 Mar 2021 11:29:31 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3B5F42E1597;
 Tue, 16 Mar 2021 18:29:22 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 sXuzSCk1u2-TL0eVdIE; Tue, 16 Mar 2021 18:29:22 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615908562; bh=3985rbco7Z6UpHgBnb+/terYFvNUkYJddwnMx5bBz2A=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=HqTqWjv1kWxe4zI2cWY10/KIGFzpBvUwI5pachdxr3mr8QIN0vFuOP6LDX5YwvUbt
 mtZzRAohfucSbayKJJGsNucjh/GoMdDqn9sH0dw4FsouqfnDN6YsIGeN2SFYvnM96j
 5+FjHishaTf7+SpuAWOctBfOC/rW+mVuFkQR81lg=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8817::1:e])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 iZjDbWz9KV-TLnaQaRY; Tue, 16 Mar 2021 18:29:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 16 Mar 2021 18:29:18 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/7] block/nbd: avoid touching freed connect_thread
Message-ID: <YFDOzrmp4Hi+cyMJ@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-2-rvkagan@yandex-team.ru>
 <b551f5f1-fc80-db3c-57a8-627195048bf4@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b551f5f1-fc80-db3c-57a8-627195048bf4@virtuozzo.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
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

On Mon, Mar 15, 2021 at 06:40:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
> > When the NBD connection is being torn down, the connection thread gets
> > canceled and "detached", meaning it is about to get freed.
> > 
> > If this happens while the connection coroutine yielded waiting for the
> > connection thread to complete, when it resumes it may access the
> > invalidated connection thread data.
> > 
> > To prevent this, revalidate the ->connect_thread pointer in
> > nbd_co_establish_connection_cancel before using after the the yield.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> 
> Seems possible. Do you have a reproducer? Would be great to make an iotest.

It triggered on me in iotest 277, but seems to be timing-dependent.
I'll see if I can do it reliable.

Thanks,
Roman.


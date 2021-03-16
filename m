Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49C33D8F6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:18:52 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCPD-0007to-8l
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCFD-0006ff-Gq; Tue, 16 Mar 2021 12:08:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:57518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMCF7-0004Cb-G1; Tue, 16 Mar 2021 12:08:29 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3D2A62E1631;
 Tue, 16 Mar 2021 19:08:19 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XIQteJaG60-8F0SDKNp; Tue, 16 Mar 2021 19:08:19 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615910899; bh=ceqrQ/RafpeRjEmwXtioHLb1J1XT++0JQqci/qcboR0=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=uK2LTj76Q3PS/Oolhp0kYC7hDWbB7e+EbhKurIy5mbObPY1rilnvvj0qS/bnuu4Aq
 D3NmfVs6PSxR3w2VWOwTk5za3e06kEcgF081Ne2ofI8551GT34697ewIZeoxrvSSj+
 qizthkznZc+5xbpBu0KPLsfj2gJCGpnb261/GZ54=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8817::1:e])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 xtUhbkAfI5-8Fni9DZE; Tue, 16 Mar 2021 19:08:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 16 Mar 2021 19:08:13 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 7/7] block/nbd: stop manipulating in_flight counter
Message-ID: <YFDX7aZngRCZF9Ew@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-8-rvkagan@yandex-team.ru>
 <de4fd61f-ccd3-125b-b636-aa06efe5823a@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4fd61f-ccd3-125b-b636-aa06efe5823a@virtuozzo.com>
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

On Mon, Mar 15, 2021 at 11:15:44PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
> > As the reconnect logic no longer interferes with drained sections, it
> > appears unnecessary to explicitly manipulate the in_flight counter.
> > 
> > Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> 
> And here you actually allow qemu_aio_coroutine_enter() call in
> nbd_client_attach_aio_context_bh() to enter connection_co in any yield
> point which is possible during drained section. The analysis should be
> done to be sure that all these yield points are safe for reentering by
> external qemu_aio_coroutine_enter(). (By external I mean not by the
> actual enter() we are waiting for at the yield() point. For example
> qemu_channel_yield() supports reentering.. And therefore (as I
> understand after fast looking through) nbd_read() should support
> reentering too..

I'll do a more thorough analysis of how safe it is.

FWIW this hasn't triggered any test failures yet, but that assert in
patch 3 didn't ever go off either so I'm not sure I can trust the tests
on this.

Thanks,
Roman.


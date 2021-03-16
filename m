Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8833D869
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:57:19 +0100 (CET)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMC4M-0005ya-01
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMC0F-0002rW-WB; Tue, 16 Mar 2021 11:53:04 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lMC0B-0004WX-Fn; Tue, 16 Mar 2021 11:53:01 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9E68D2E1617;
 Tue, 16 Mar 2021 18:52:54 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 kAxjFCbh1d-qs0GW45I; Tue, 16 Mar 2021 18:52:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615909974; bh=oUguTP24PuSfcYwe/PIxBvfEky2rFMDAgw+n1GNH42A=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=D6a1DtemIbwNIKc5EU6FCcsMvZ5zveNXe2llTYVEKfOSNp/ZTxMAxuJuE0iqmmm2N
 YIk/nfw7ESr9mTuZGcpWYKJS6XcCp8r6cufRIXcAjKaZZQOtCNHbGUUbfJHPuyXxvY
 BZM+Op0VlN++CuCQvYmu6ZHzfXn4y8PKwzUiPXME=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8817::1:e])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 zacFvtKbBI-qsn03sL0; Tue, 16 Mar 2021 18:52:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 16 Mar 2021 18:52:51 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
Message-ID: <YFDUU2zyJR17qkkr@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <2f261dca-d478-67e8-1cf2-49b5ed2f4356@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f261dca-d478-67e8-1cf2-49b5ed2f4356@virtuozzo.com>
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

On Mon, Mar 15, 2021 at 10:45:39PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
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
> 
> The actual point is:
> 
> connection_co (together with all functions called from it) has a lot of yield points. And we can't just enter the coroutine in any of the when we want, as it may break some BH which is actually waited for in this yield point..
> 
> Still, we should care only about yield points possible during drained section, so we don't need to care about direct qemu_coroutine_yield() inside nbd_connection_entry().
> 
> Many things changed since 5ad81b4946.. So probably, now all the (possible during drained section) yield points in nbd_connection_entry support reentering. But some analysis of possible yield points should be done.

Thanks for the explanation.  Will do this analysis.

Roman.


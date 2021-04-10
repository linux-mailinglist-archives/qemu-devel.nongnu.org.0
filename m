Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3835AD3B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 14:22:37 +0200 (CEST)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVCdI-00006d-IU
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 08:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lVCbq-00081R-7Q; Sat, 10 Apr 2021 08:21:06 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:43518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lVCbm-000631-5u; Sat, 10 Apr 2021 08:21:04 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 855A62E1475;
 Sat, 10 Apr 2021 15:20:55 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 0jUR6SKc9y-Kt0C5118; Sat, 10 Apr 2021 15:20:55 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1618057255; bh=f30ItKP9abM2Mih8nKe0Hkwc6euEvPSzVntybV5rOi0=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=yDvK3acizxuz25InY40BAgt/W9DW0YYRvp+slBsiVw7v070q2xzS4P7XVABgA1IHq
 es3CsawKEl0SADeQFth0SFtxif4lnGzavS/TW+i8zJc9mVYfZbA186eT45Yo69ghOu
 YON2fHANlqM9siYE4jLnycqFn3SlBO4zgGG81KTI=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:7401::1:13])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 R1axsYhrg5-KtpSGcft; Sat, 10 Apr 2021 15:20:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Sat, 10 Apr 2021 15:20:51 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH for-6.0 2/2] block/nbd: ensure ->connection_thread is
 always valid
Message-ID: <YHGYI4LgDWm1Wgmq@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
 <20210409160406.1800272-3-rvkagan@yandex-team.ru>
 <fa2034b1-137e-017a-90df-6d5014b85a72@virtuozzo.com>
 <0d115e55-1727-31b8-0aff-b1ca5e8e49ff@virtuozzo.com>
 <e8d7f32d-5e51-5b12-3b39-71acbe29cdf3@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8d7f32d-5e51-5b12-3b39-71acbe29cdf3@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 10, 2021 at 12:56:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 10.04.2021 11:38, Vladimir Sementsov-Ogievskiy wrote:
> > 10.04.2021 11:06, Vladimir Sementsov-Ogievskiy wrote:
> > > 09.04.2021 19:04, Roman Kagan wrote:
> > > > Simplify lifetime management of BDRVNBDState->connection_thread by
> > > > delaying the possible cleanup of it until the BDRVNBDState itself goes
> > > > away.
> > > > 
> > > > This also fixes possible use-after-free in nbd_co_establish_connection
> > > > when it races with nbd_co_establish_connection_cancel.
> > > > 
> > > > Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>
> > > 
> > > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > > 
> > 
> > Ha stop, it crashes iotest 51, as nbd_clear_bdrvstate is called also from nbd_process_options.
> > 
> > And this shows that we also do wrong thing when simply return from two ifs pre-patch (and one after-patch). Yes, after successful nbd_process options we should call nbd_clear_bdrvstate() on failure path.

The test didn't crash at me somehow but you're right there's bug here.

> And also it shows that patch is more difficult than it seems. I still think that for 6.0 we should take a simple use-after-free-only fix, and don't care about anything else.

I agree it turned out more complex than apporpriate for 6.0.  Let's
proceed with the one you've posted.

Thanks,
Roman.


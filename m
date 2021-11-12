Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F244EDA9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 21:00:58 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlcjD-0007WZ-Ja
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 15:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlchv-0006g0-Gm; Fri, 12 Nov 2021 14:59:32 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:39360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlchn-0002du-AQ; Fri, 12 Nov 2021 14:59:28 -0500
Received: from sas1-4cbebe29391b.qloud-c.yandex.net
 (sas1-4cbebe29391b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:789:0:640:4cbe:be29])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 41FA32E1273;
 Fri, 12 Nov 2021 22:59:18 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by sas1-4cbebe29391b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 rhOtb5Vzff-xGsaqB15; Fri, 12 Nov 2021 22:59:18 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636747158; bh=EyVHS8E4c2j7QyDfgjw3yvYNlFMalNlDirV6vad05Dg=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=bZEBb9t6jiXNVs08HIiKYysfVCgtawF9IsHuDHvRwjc0pd/yjvrwfZJ2cte3fOye5
 x9dlLcCAMJWwa0vnhldq8JzWhmZPuaD4mE/qcgkHPUX7me8gS7V7gqhXh/X8IdDCK3
 Xt9/Q7egF3IXh1fHhKyyGGp8mmp+/1iyfI0swCtI=
Authentication-Results: sas1-4cbebe29391b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1206::1:19])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 sDrSepsqEf-xGxaQYeL; Fri, 12 Nov 2021 22:59:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 22:59:14 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Message-ID: <YY7Hkl0uftx8TPZS@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-2-rvkagan@yandex-team.ru>
 <YY1YXrCPgt+Fcb2+@redhat.com> <YY4aGok6e8Z6BRQu@rvkaganb.lan>
 <YY5SF0uPkoEvX9qM@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY5SF0uPkoEvX9qM@redhat.com>
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
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 12:37:59PM +0100, Kevin Wolf wrote:
> Am 12.11.2021 um 08:39 hat Roman Kagan geschrieben:
> > On Thu, Nov 11, 2021 at 06:52:30PM +0100, Kevin Wolf wrote:
> > > Am 11.11.2021 um 16:33 hat Roman Kagan geschrieben:
> > > > vhost-user-blk realize only attempts to reconnect if the previous
> > > > connection attempt failed on "a problem with the connection and not an
> > > > error related to the content (which would fail again the same way in the
> > > > next attempt)".
> > > > 
> > > > However this distinction is very subtle, and may be inadvertently broken
> > > > if the code changes somewhere deep down the stack and a new error gets
> > > > propagated up to here.
> > > > 
> > > > OTOH now that the number of reconnection attempts is limited it seems
> > > > harmless to try reconnecting on any error.
> > > > 
> > > > So relax the condition of whether to retry connecting to check for any
> > > > error.
> > > > 
> > > > This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
> > > > during realize".
> > > > 
> > > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > > 
> > > It results in less than perfect error messages. With a modified export
> > > that just crashes qemu-storage-daemon during get_features, I get:
> > > 
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to read msg header. Read 0 instead of 12. Original request 1.
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: vhost_backend_init failed: Protocol error
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
> > > qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to connect to '/tmp/vsock': Connection refused
> > 
> > This patch doesn't change any error messages.  Which ones specifically
> > became less than perfect as a result of this patch?
> 
> But it adds error messages (for each retry), which are different from
> the first error message. As I said this is not the end of the world, but
> maybe a bit more confusing.

Ah, now I see what you mean: it adds reconnection attempts where there
used to be immediate failure return, so now every failed attempt logs
its own message.

> > > I guess this might be tolerable. On the other hand, the patch doesn't
> > > really fix anything either, but just gets rid of possible subtleties.
> > 
> > The remaining patches in the series make other errors beside -EPROTO
> > propagate up to this point, and some (most) of them are retryable.  This
> > was the reason to include this patch at the beginning of the series (I
> > guess I should've mentioned that in the patch log).
> 
> I see. I hadn't looked at the rest of the series yet because I ran out
> of time, but now that I'm skimming them, I see quite a few places that
> use non-EPROTO, but I wonder which of them actually should be
> reconnected. So far all I saw were presumably persistent errors where a
> retry won't help. Can you give me some examples?

E.g. the particular case you mention earlier, -ECONNREFUSED, is not
unlikely to happen due to the vhost-user server restart for maintenance;
in this case retying looks like a reasonable thing to do, doesn't it?

Thanks,
Roman.


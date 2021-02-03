Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54230D7FE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:55:47 +0100 (CET)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Fp4-0006EF-HB
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l7Fmk-0004bv-L4; Wed, 03 Feb 2021 05:53:22 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:45414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l7Fmf-0002xu-48; Wed, 03 Feb 2021 05:53:20 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CF91B2E1475;
 Wed,  3 Feb 2021 13:53:10 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VpBHn8rAiZ-r90O7maO; Wed, 03 Feb 2021 13:53:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1612349590; bh=mhpZq6Q2N0eS3ipkvWpiOah4lJ/C5M2qgBZkRtpgjpY=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=DFLNAje2taLKtI30ZuayR7iRv+XBSoO/slkCKTsWgMD/5qS+oqYhPnO3SV4mNmWfT
 sab2VWgtEwFrK8285dWsjZ2g29m4V5/LQp+xMzRqSRhhIfxTtYnuzu3u/2Jr7+i/FB
 PF32favuC04nUFFrEiqPI7aD1C1cO02CPAC3VNdE=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:316::1:11])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 grwCickN7u-r9oqi9gK; Wed, 03 Feb 2021 13:53:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 3 Feb 2021 13:53:05 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/4] block/nbd: fix drain dead-lock because of nbd
 reconnect-delay
Message-ID: <20210203105305.GA113539@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20200903190301.367620-1-vsementsov@virtuozzo.com>
 <20200903190301.367620-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903190301.367620-2-vsementsov@virtuozzo.com>
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
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 03, 2020 at 10:02:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We pause reconnect process during drained section. So, if we have some
> requests, waiting for reconnect we should cancel them, otherwise they
> deadlock the drained section.
> 
> How to reproduce:
> 
> 1. Create an image:
>    qemu-img create -f qcow2 xx 100M
> 
> 2. Start NBD server:
>    qemu-nbd xx
> 
> 3. Start vm with second nbd disk on node2, like this:
> 
>   ./build/x86_64-softmmu/qemu-system-x86_64 -nodefaults -drive \
>      file=/work/images/cent7.qcow2 -drive \
>      driver=nbd,server.type=inet,server.host=192.168.100.5,server.port=10809,reconnect-delay=60 \
>      -vnc :0 -m 2G -enable-kvm -vga std
> 
> 4. Access the vm through vnc (or some other way?), and check that NBD
>    drive works:
> 
>    dd if=/dev/sdb of=/dev/null bs=1M count=10
> 
>    - the command should succeed.
> 
> 5. Now, kill the nbd server, and run dd in the guest again:
> 
>    dd if=/dev/sdb of=/dev/null bs=1M count=10
> 
> Now Qemu is trying to reconnect, and dd-generated requests are waiting
> for the connection (they will wait up to 60 seconds (see
> reconnect-delay option above) and than fail). But suddenly, vm may
> totally hang in the deadlock. You may need to increase reconnect-delay
> period to catch the dead-lock.
> 
> VM doesn't respond because drain dead-lock happens in cpu thread with
> global mutex taken. That's not good thing by itself and is not fixed
> by this commit (true way is using iothreads). Still this commit fixes
> drain dead-lock itself.
> 
> Note: probably, we can instead continue to reconnect during drained
> section. To achieve this, we may move negotiation to the connect thread
> to make it independent of bs aio context. But expanding drained section
> doesn't seem good anyway. So, let's now fix the bug the simplest way.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 9daf003bea..912ea27be7 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -242,6 +242,11 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
>      }
>  
>      nbd_co_establish_connection_cancel(bs, false);
> +
> +    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
> +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> +        qemu_co_queue_restart_all(&s->free_sema);
> +    }
>  }
>  
>  static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)

This basically defeats the whole purpose of reconnect: if the nbd client
is trying to reconnect, drain effectively cancels that and makes all
in-flight requests to complete with an error.

I'm not suggesting to revert this patch (it's now in the tree as commit
8c517de24a), because the deadlock is no better, but I'm afraid the only
real fix is to implement reconnect during the drain section.  I'm still
trying to get my head around it so no patch yet, but I just wanted to
bring this up in case anybody beats me to it.

Thanks,
Roman.


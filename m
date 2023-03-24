Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEF6C84D5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 19:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfm1k-0001uh-QW; Fri, 24 Mar 2023 14:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pfm1i-0001ns-D1; Fri, 24 Mar 2023 14:20:34 -0400
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pfm1f-00011U-JC; Fri, 24 Mar 2023 14:20:33 -0400
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@strlen.de>)
 id 1pfm1R-0003Ic-Ln; Fri, 24 Mar 2023 19:20:17 +0100
Date: Fri, 24 Mar 2023 19:20:17 +0100
From: Florian Westphal <fw@strlen.de>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Florian Westphal <fw@strlen.de>, qemu-block@nongnu.org,
 eblake@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] nbd/server: push pending frames after sending reply
Message-ID: <20230324182017.GB1871@breakpoint.cc>
References: <20230324104720.2498-1-fw@strlen.de> <ZB3b4gw6FZHWvNz9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB3b4gw6FZHWvNz9@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a0a:51c0:0:237:300::1; envelope-from=fw@strlen.de;
 helo=Chamillionaire.breakpoint.cc
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Kevin Wolf <kwolf@redhat.com> wrote:
> Am 24.03.2023 um 11:47 hat Florian Westphal geschrieben:
> > +    qio_channel_set_cork(client->ioc, true);
> > +
> >      if (ret < 0) {
> >          /* It wasn't -EIO, so, according to nbd_co_receive_request()
> >           * semantics, we should return the error to the client. */
> > @@ -2692,6 +2694,7 @@ static coroutine_fn void nbd_trip(void *opaque)
> >          goto disconnect;
> >      }
> >  
> > +    qio_channel_set_cork(client->ioc, false);
> >  done:
> >      nbd_request_put(req);
> >      nbd_client_put(client);
> 
> In the error paths, we never call set_cork(false) again. I suppose the
> reason that this is okay is because the next thing is actually that we
> close the socket?

Yes, no need to uncork before close.

